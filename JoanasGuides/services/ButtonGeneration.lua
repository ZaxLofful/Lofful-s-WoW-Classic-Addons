--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

ButtonGenerationService = { }

function ButtonGenerationService.GenerateButtons(guide)
    for _, step in ipairs(guide) do
        for _, taskGroup in ipairs(step) do
            local npcsFound
            for _, task in ipairs(taskGroup) do
                local npcID = task.npc or task.fromnpc
                if (npcID) then
                    taskGroup.buttons = taskGroup.buttons or { }
                    if (not npcsFound) then
                        npcsFound = { }
                        for _, button in ipairs(taskGroup.buttons) do
                            if (button.target) then
                                npcsFound[button.target] = true
                            elseif (button.targets) then
                                for _, target in ipairs(button.targets) do
                                    npcsFound[target] = true
                                end
                            end
                        end
                    end
                    if (not npcsFound[npcID]) then
                        table.insert(taskGroup.buttons, {
                            target = npcID,
                            condition = task.condition
                        })
                    end
                end
            end
        end
    end
end
