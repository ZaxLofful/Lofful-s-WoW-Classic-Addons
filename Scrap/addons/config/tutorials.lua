--[[
<<<<<<< HEAD
Copyright 2008-2021 João Cardoso
Scrap is distributed under the terms of the GNU General Public License (Version 3).
As a special exception, the copyright holders of this addon do not give permission to
redistribute and/or modify it.

This addon is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the addon. If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.

This file is part of Scrap.
=======
Copyright 2008-2023 João Cardoso
All Rights Reserved
>>>>>>> classic_hardcore
--]]

local Tutorials = Scrap:NewModule('Tutorials', 'CustomTutorials-2.1')
local L = LibStub('AceLocale-3.0'):GetLocale('Scrap')

<<<<<<< HEAD
function Tutorials:Start()
	self:Load()
	self:TriggerTutorial(5)
end

function Tutorials:Reset()
	self:Load()
	self:ResetTutorials()
	self:TriggerTutorial(5)
end

function Tutorials:Load()
=======
function Tutorials:OnEnable()
>>>>>>> classic_hardcore
	self:RegisterTutorials {
		savedvariable = Scrap.sets,
		key = 'tutorial',
		title = 'Scrap',

		{
			text = L.Tutorial_Welcome,
<<<<<<< HEAD
			image = 'Interface\\Addons\\Scrap\\art\\enabled-icon',
			point = 'CENTER',
			height = 150,
		},
		{
			text = L.Tutorial_Button,
			image = 'Interface\\Addons\\Scrap\\art\\tutorial-button',
=======
			image = 'Interface/Addons/Scrap/art/scrap-enabled',
			imageW = 128, imageH = 128,
			point = 'CENTER',
		},
		{
			text = L.Tutorial_Button,
			image = 'Interface/Addons/Scrap/art/tutorial-button',
>>>>>>> classic_hardcore
			point = 'TOPLEFT', relPoint = 'TOPRIGHT',
			shineTop = 5, shineBottom = -5,
			shineRight = 5, shineLeft = -5,
			shine = Scrap.Merchant,
			anchor = MerchantFrame,
			y = -16,
		},
		{
			text = L.Tutorial_Drag,
<<<<<<< HEAD
			image = 'Interface\\Addons\\Scrap\\art\\tutorial-drag',
=======
			image = 'Interface/Addons/Scrap/art/tutorial-drag',
>>>>>>> classic_hardcore
			point = 'BOTTOMRIGHT', relPoint = 'BOTTOMRIGHT',
			anchor = MainMenuBarBackpackButton,
			shine = MainMenuBarBackpackButton,
			shineTop = 6, shineBottom = -6,
			shineRight = 6, shineLeft = -6,
			x = -150, y = 45,
		},
		{
			text = L.Tutorial_Visualizer,
<<<<<<< HEAD
			image = 'Interface\\Addons\\Scrap\\art\\tutorial-visualizer',
			shineRight = -2, shineLeft = 2, shineTop = 6,
			point = 'TOPLEFT', relPoint = 'TOPRIGHT',
			shine = Scrap.Visualizer.tab,
=======
			image = 'Interface/Addons/Scrap/art/tutorial-visualizer',
			shineRight = -2, shineLeft = 2, shineTop = 6,
			point = 'TOPLEFT', relPoint = 'TOPRIGHT',
			shine = Scrap.Visualizer.ParentTab,
>>>>>>> classic_hardcore
			anchor = MerchantFrame,
			y = -16,
		},
		{
			text = L.Tutorial_Bye,
<<<<<<< HEAD
			image = 'Interface\\Addons\\Scrap\\art\\enabled-icon',
			point = 'CENTER',
			height = 150,
		},
	}
end
=======
			image = 'Interface/Addons/Scrap/art/scrap-enabled',
			imageW = 128, imageH = 128,
			point = 'CENTER',
		},
	}

	self:TriggerTutorial(1)
end

function Tutorials:Start()
	self:TriggerTutorial(5)
end

function Tutorials:Restart()
	self:ResetTutorials()
	self:TriggerTutorial(1)
end
>>>>>>> classic_hardcore
