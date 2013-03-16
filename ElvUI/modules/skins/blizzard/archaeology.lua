local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.archaeology ~= true then return end
	ArchaeologyFrame:StripTextures()
	ArchaeologyFrameInset:StripTextures()
	ArchaeologyFrame:CreateBackdrop("Transparent")
	ArchaeologyFrame.backdrop:SetAllPoints()
	ArchaeologyFrame.portrait:SetAlpha(0)
	ArchaeologyFrameInset:CreateBackdrop('Default')
	ArchaeologyFrameInset.backdrop:SetPoint('TOPLEFT')
	ArchaeologyFrameInset.backdrop:SetPoint('BOTTOMRIGHT', -3, -1)
	
	S:HandleButton(ArchaeologyFrameArtifactPageSolveFrameSolveButton, true)
	S:HandleButton(ArchaeologyFrameArtifactPageBackButton, true)
	ArchaeologyFrameRaceFilter:SetFrameLevel(ArchaeologyFrameRaceFilter:GetFrameLevel() + 2)
	S:HandleDropDownBox(ArchaeologyFrameRaceFilter, 125)
	
	S:HandleNextPrevButton(ArchaeologyFrameCompletedPageNextPageButton)
	S:HandleNextPrevButton(ArchaeologyFrameCompletedPagePrevPageButton)
	
	ArchaeologyFrameRankBar:StripTextures()
	ArchaeologyFrameRankBar:SetStatusBarTexture(E["media"].normTex)
	ArchaeologyFrameRankBar:SetFrameLevel(ArchaeologyFrameRankBar:GetFrameLevel() + 2)
	ArchaeologyFrameRankBar:CreateBackdrop("Default")
	
	ArchaeologyFrameArtifactPageSolveFrameStatusBar:StripTextures()
	ArchaeologyFrameArtifactPageSolveFrameStatusBar:SetStatusBarTexture(E["media"].normTex)
	ArchaeologyFrameArtifactPageSolveFrameStatusBar:SetStatusBarColor(0.7, 0.2, 0)
	ArchaeologyFrameArtifactPageSolveFrameStatusBar:SetFrameLevel(ArchaeologyFrameArtifactPageSolveFrameStatusBar:GetFrameLevel() + 2)
	ArchaeologyFrameArtifactPageSolveFrameStatusBar:CreateBackdrop("Default")
	
	for i=1, ARCHAEOLOGY_MAX_COMPLETED_SHOWN do
		local artifact = _G["ArchaeologyFrameCompletedPageArtifact"..i]
		
		if artifact then
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Border"]:Kill()
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Bg"]:Kill()
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"]:SetTexCoord(unpack(E.TexCoords))
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop = CreateFrame("Frame", nil, artifact)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop:SetTemplate("Default")
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop:SetOutside(_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"])
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop:SetFrameLevel(artifact:GetFrameLevel() - 2)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"]:SetDrawLayer("OVERLAY")
		end
	end

	ArchaeologyFrameArtifactPageIcon:SetTexCoord(unpack(E.TexCoords))
	ArchaeologyFrameArtifactPageIcon.backdrop = CreateFrame("Frame", nil, ArchaeologyFrameArtifactPage)
	ArchaeologyFrameArtifactPageIcon.backdrop:SetTemplate("Default")
	ArchaeologyFrameArtifactPageIcon.backdrop:SetOutside(ArchaeologyFrameArtifactPageIcon)
	ArchaeologyFrameArtifactPageIcon.backdrop:SetFrameLevel(ArchaeologyFrameArtifactPage:GetFrameLevel())
	ArchaeologyFrameArtifactPageIcon:SetParent(ArchaeologyFrameArtifactPageIcon.backdrop)
	ArchaeologyFrameArtifactPageIcon:SetDrawLayer("OVERLAY")	

	S:HandleCloseButton(ArchaeologyFrameCloseButton)
end

S:RegisterSkin("Blizzard_ArchaeologyUI", LoadSkin)