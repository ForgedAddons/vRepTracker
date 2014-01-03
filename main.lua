local event = CreateFrame("Frame")
event:SetScript("OnEvent", function(self, event, ...) self[event](self, event, ...) end)
event:RegisterEvent"COMBAT_TEXT_UPDATE"

event.COMBAT_TEXT_UPDATE = function(self, event, ...)
	local mType, newFaction = ...;
	if mType ~= "FACTION" then return end
	local curFaction = GetWatchedFactionInfo()
	if(newFaction ~= curFaction) then
		for i = 1, GetNumFactions() do
			if IsFactionInactive(i) then break end;
			local name,_,_,_,_,_,_,_,isHeader,_,hasRep = GetFactionInfo(i)
			if name == newFaction then
				if (isHeader and hasRep) or not isHeader then
					SetWatchedFactionIndex(i)
					print("Reputation bar set to "..newFaction)
				end
				break;
			end
		end		
	end
end
