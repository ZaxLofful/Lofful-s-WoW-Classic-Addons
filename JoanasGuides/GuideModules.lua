select(2, ...).SetupGlobalFacade()

local AddonVersion = "3.02.05"
local GuideVersion = "3.02.05"

GuideModules = { }

local modules

local GuideModulesBase = {
	Starter = {
		name = "Starter",
	},
	Era = {
		name = "Classic Era",
	},
	TBC = {
		name = "The Burning Crusade",
	},
	Wrath = {
		name = "Wrath of the Lich King",
	}
}

local major, minor, _ = GuideVersion:match("(%d+)%.(%d+)%.(%d+)")

for _, v in pairs(GuideModulesBase) do
	v.latest = GuideVersion
	v.minimum = ("%s.%s.%s"):format(major, minor, "01")
end
-- Module properties
-- version: the version of the guide module
-- latest: latest known version of the guide module as of this addon's release
-- minimum: minimum version of the guide module that is compatible with this version of the addon
-- maximum: maximum version of the
-- requires: minimum version of the addon that the guide module requires in order to function
-- preferred: latest known version of the addon available at the time of the guide module's release
-- installed: (boolean or nil) determines that the guide was able to be loaded, but not necessarily that it is compatible
-- compatible: (boolean or nil) determines that the guide is compatible with the addon

local LatestAddonVersion = AddonVersion

function GuideModules.GetAddonVersion()
	if (GuideModules.IsBeta()) then
		return AddonVersion .. "-beta"
	end
	return AddonVersion
end

function GuideModules.GetModule(moduleID)
	return modules[moduleID]
end

function GuideModules.IsBeta()
	return false
end

function GuideModules.Reload()
	modules = { }
	local warnings = { }
	local incompatible
	-- Jan 9 2024 12:00 AM EDT
	local expiration = 1704776400
	local expired = time() > expiration
	local expiringSoon = time() > expiration - (60 * 60 * 24 * 7)

	for moduleName, moduleInfoBase in pairs(GuideModulesBase) do
		modules[moduleName] = {
			latest = moduleInfoBase.latest,
			minimum = moduleInfoBase.minimum,
			name = moduleInfoBase.name,
		}
		local moduleInfo = modules[moduleName]
		local metadataHTML = CreateFrame("SimpleHTML", nil, nil, ("JoanasGuides-%s-metadata"):format(moduleName))
		local regions = { metadataHTML:GetRegions() }
		if (#regions > 0) then
			local dataParts = { }
			for _, region in ipairs(regions) do
				table.insert(dataParts, RemoveSpaces(region:GetText()))
			end
			local metadata = loadstring(Base64.decode(table.concat(dataParts)))()
			moduleInfo.version = metadata.version
			moduleInfo.requires = metadata.requires
			moduleInfo.installed = true
			moduleInfo.preferred = metadata.preferred
		end
		if (expired) then
			moduleInfo.compatible = false
		elseif (moduleInfo.installed) then
			moduleInfo.compatible = (AddonVersion >= moduleInfo.requires and moduleInfo.version >= moduleInfo.minimum)
			moduleInfo.current = (moduleInfo.version >= moduleInfo.latest)
			LatestAddonVersion = (moduleInfo.preferred > LatestAddonVersion) and moduleInfo.preferred or LatestAddonVersion
			if (not moduleInfo.current) then
				table.insert(warnings, ("Guide: %s"):format(moduleInfo.name))
			end
			if (not moduleInfo.compatible) then
				incompatible = true
			end
		end
	end
	if (LatestAddonVersion > AddonVersion) then
		table.insert(warnings, 1, "Addon: Joana's Guides")
	end
	if (expired) then
		table.insert(warnings, 1, "Time to update, adventurer!\n\nYour Joana's Guides version has expired. Get back into action by grabbing the latest update from our website. Install it, then type /reload to keep enjoying Joana's Guides!")
		CompatibilityWarnings.SetWarnings(warnings)
	elseif (expiringSoon) then
		table.insert(warnings, 1, "Attention, fellow explorer!\n\nJust a heads-up: Your Joana's Guides addon is set to expire on November 1st. Fear not, an update is ready! Visit our website, grab the latest addon and guide versions, and keep your adventure alive. Don't let the expiration date catch you off guard.")
		CompatibilityWarnings.SetWarnings(warnings)
	elseif (#warnings > 0) then
		if (incompatible) then
			table.insert(warnings, 1, " ")
			table.insert(warnings, 1, "Oops! It looks like the addon version and one or more guides aren't quite in sync. To get things back on track, just update those components to the latest versions. Afterward, a quick /reload will do the trick!");
		else
			table.insert(warnings, 1, " ")
			table.insert(warnings, 1, "Hey there! Exciting news – newer versions are here! You can stick with the current version or go for the latest by updating. No need to log out, just install and type /reload.")
		end
		CompatibilityWarnings.SetWarnings(warnings)
	else
		CompatibilityWarnings.SetWarnings(nil)
	end
	UI.MarkDirty()
	Condition_ResetGuides()
end
