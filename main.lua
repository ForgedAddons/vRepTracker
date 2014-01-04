local addon, ns = ...
ns.RegisterEvent("COMBAT_TEXT_UPDATE", function(event, ...)
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
					ns.Print("Reputation bar set to "..newFaction)
				end
				break;
			end
		end		
	end
end)
