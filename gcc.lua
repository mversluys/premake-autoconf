---
-- Autoconfiguration.
-- Copyright (c) 2016 Blizzard Entertainment
---
local p = premake
local gcc = p.tools.gcc

function gcc.try_compile(cfg, text)
	-- write the text to a temporary file.
	local cppFile = path.join(cfg.objdir, "temp.cpp")
	if not io.writefile(cppFile, text) then
		return nil
	end

	local outFile = path.join(cfg.objdir, "temp.out")

	-- compile that text file.
	if os.execute('gcc "' .. cppFile .. '" -o "' .. outFile ..'"') then
		return outFile
	else
		return nil
	end
end