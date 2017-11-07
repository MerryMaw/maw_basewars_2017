
-- Integer to Roman converter
local Ints = {1000, 900, 500, 400, 100,90, 50, 40, 10, 9, 5, 4, 1}
local Nums = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"}

function math.IntToRoman(int)
	if (int == 0) then return "0" end
	
	local Txt = ""
	
	if (int < 0) then Txt = "-" int = math.abs(int) end
	
	for i = 1, 13 do
		while (int >= Ints[i]) do
			int = int-Ints[i]
			Txt = Txt..Nums[i]
		end
	end
	
	return Txt
end


-- Shortens the number with prefixes instead
local NumberPrefix = {"K","M","B","T","Q"}

function math.NiceInt(num)
	local Prefix = ""
	
	for k,v in pairs(NumberPrefix) do
		if (num >= 1000) then 
			Prefix = v
			num = math.ceil(num/10)/100
		else
			break
		end
	end
	
	return string.Comma(num).." "..Prefix,num,Prefix
end