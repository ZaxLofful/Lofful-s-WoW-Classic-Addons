--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local guideCache
local guideInfoLookup
local SetupHierarchicalReferences

function SetupHierarchicalReferences(node, root, parent)
    root = root or node
    parent = parent or root
    if (type(node) == "table") then
        if (node ~= root) then
            node.root = root
        end
        if (node ~= parent) then
            node.parent = parent
        end
        for _, child in ipairs(node) do
            if (child ~= root and child ~= parent) then
                SetupHierarchicalReferences(child, root, node)
            end
        end
    end
end

GuideService = { }

function GuideService.Init()
    guideCache = { }
end

function GuideService.GetGuide(guideID)
    local guide = guideCache[guideID]
    if (not guide) then
        GuideModules.Reload()
        if (not guideInfoLookup) then
            guideInfoLookup = { }
            for _, guideInfo in ipairs(GuideInfos) do
                guideInfoLookup[guideInfo.guideID] = guideInfo
            end
        end
        local guideInfo = guideInfoLookup[guideID]
        if (not guideInfo) then
            guideID = "B" .. string.sub(guideID,2)
            guideInfo = guideInfoLookup[guideID]
            if (not guideInfo) then
                return
            end
        end
        local guideTemplate = ("%s-%s"):format(addonName, guideID)
        local guideHTML = CreateFrame("SimpleHTML", nil, nil, guideTemplate)
        local regions = { guideHTML:GetRegions() }
        if (not (regions and #regions > 0)) then return end
        local dataParts = { }
        for _, region in ipairs(regions) do
            table.insert(dataParts, RemoveSpaces(region:GetText()))
        end
        local f = loadstring(Base64.decode(table.concat(dataParts)))
        setfenv(f, MERCHANT_TYPE)
        guide = f()
        assert(guide, ("Error extracting guide data: %s"):format(guideID))
        guide.info = guideInfo
        assert(guide.info, ("GuideInfo is not present: %s"):format(guideID))
        guide.id = guideID
        LocationsInitService.InitGuide(guide)
        ButtonGenerationService.GenerateButtons(guide)
        guide.stepLUT = { }
        for stepIdx, step in ipairs(guide) do
            step.idx = stepIdx
            guide.stepLUT[step.id] = step
            for taskGroupIdx, taskGroup in ipairs(step) do
                taskGroup.idx = taskGroupIdx
                for i, task in ipairs(taskGroup) do
                    if (type(task) == "string") then
                        task = {
                            text = task
                        }
                        taskGroup[i] = task
                    end
                    local multitext = true
                    for key in pairs(task) do
                        if (not (MULTITEXT_IGNORED_KEYS[key] or type(key) == "number")) then
                            multitext = nil
                        end
                    end
                    if (multitext) then
                        task.text = "multitext"
                    end
                    task.taskType = GetTaskType(task)
                end
                if (taskGroup.buttons) then
                    for _, buttonRef in ipairs(taskGroup.buttons) do
                        buttonRef.parent = taskGroup
                        buttonRef.root = step
                    end
                end
            end
            SetupHierarchicalReferences(step)
            for _, taskGroup in ipairs(step) do
                for _, task in ipairs(taskGroup) do
                    task.taskType:Setup(task)
                end
            end
        end
        guideCache[guideID] = guide
        local moduleInfo = GuideModules.GetModule(guide.info.moduleID)
        if (moduleInfo and moduleInfo.installed and moduleInfo.compatible) then
            guide.moduleInfo = moduleInfo
            guide.bookmark = State.GetBookmark(guideID)
            if (State.IsDebugEnabled()) then
                ValidateGuide()
            end
        else
            guide = nil
        end
    end
    return guide
end
