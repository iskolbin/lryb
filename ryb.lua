--[[

 ryb -- v0.1.0 public domain Lua RYB/RGB color conversion functions
 no warranty implied; use at your own risk

 author: Ilya Kolbin (iskolbin@gmail.com)
 url: github.com/iskolbin/lryb

 Inspired by https://math.stackexchange.com/questions/305395/ryb-and-rgb-color-space-conversion.
 Provides 2 functions: for RYB->RGB and RGB->RYB conversions. Includes Gosset et al. RYB->RGB
 conversion table and conversion tables evaluated by Jean Oliver Irisson, which are used by default.
 All color components are assumed to be normalized to 1.0.

 COMPATIBILITY

 Lua 5.1+, LuaJIT

 LICENSE

 See end of file for license information.

--]]

local Ryb = {
	-- Taken from http://vis.computer.org/vis2004/DVD/infovis/papers/gossett.pdf
	GOSSET_RYB_TO_RGB = {
		{1.0, 1.0, 1.0},
		{1.0, 0.0, 0.0},
		{1.0, 1.0, 0.0},
		{0.163, 0.373, 0.6},
		{0.5, 0.0, 0.5},
		{0.0, 0.66, 0.2},
		{1.0, 0.5, 0.0},
		{0.2, 0.094, 0.0}
	},

	-- evaluated by Jean Oliver Irisson https://math.stackexchange.com/users/561007/jean-olivier-irisson
	IRISSON_RYB_TO_RGB = {
		{1.0, 1.0, 1.0},
		{1.0, 0.0, 0.0},
		{1.0, 1.0, 0.0},
		{0.163, 0.373, 0.6},
		{0.5, 0.0, 0.5},
		{0.0, 0.66, 0.2},
		{1.0, 0.5, 0.0},
		{0.0, 0.0, 0.0}
	},

	IRRISON_RGB_TO_RYB = {
		{1.0, 1.0, 1.0},
		{1.0, 0.0, 0.0},
		{0.0, 1.0, 0.483},
		{0.0, 1.0, 0.0},
		{0.0, 0.0, 1.0},
		{0.309, 0.0, 0.469},
		{0.0, 0.053, 0.210},
		{0.0, 0.0, 0.0}
	}
}

function Ryb.ryb2rgb( r, y, b, convertTable )
	local c = convertTable or Ryb.IRISSON_RYB_TO_RGB
	local f000, f001, f010, f011 = c[1], c[2], c[3], c[4]
	local f100, f101, f110, f111 = c[5], c[6], c[7], c[8]
	local _r, _y, _b = 1.0 - r, 1.0 - y, 1.0 - b
	local c000, c001, c010, c011 = _r * _y * _b, _r * _y * b, _r * y  * _b, r * _y * _b
	local c100, c101, c110, c111 = _r * y * b,   r * _y * b,  r * y * _b,   r * y * b
	return
		c000*f000[1] + c001*f001[1] + c010*f010[1] + c011*f011[1] + c100*f100[1] + c101*f101[1] + c110*f110[1] + c111*f111[1],
		c000*f000[2] + c001*f001[2] + c010*f010[2] + c011*f011[2] + c100*f100[2] + c101*f101[2] + c110*f110[2] + c111*f111[2],
		c000*f000[3] + c001*f001[3] + c010*f010[3] + c011*f011[3] + c100*f100[3] + c101*f101[3] + c110*f110[3] + c111*f111[3]
end

function Ryb.rgb2ryb( r, g, b, convertTable )
	return Ryb.ryb2rgb( r, g, b, convertTable or Ryb.IRRISON_RGB_TO_RYB )
end

return Ryb

--[[
------------------------------------------------------------------------------
This software is available under 2 licenses -- choose whichever you prefer.
------------------------------------------------------------------------------
ALTERNATIVE A - MIT License
Copyright (c) 2018 Ilya Kolbin
Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
------------------------------------------------------------------------------
ALTERNATIVE B - Public Domain (www.unlicense.org)
This is free and unencumbered software released into the public domain.
Anyone is free to copy, modify, publish, use, compile, sell, or distribute this
software, either in source code form or as a compiled binary, for any purpose,
commercial or non-commercial, and by any means.
In jurisdictions that recognize copyright laws, the author or authors of this
software dedicate any and all copyright interest in the software to the public
domain. We make this dedication for the benefit of the public at large and to
the detriment of our heirs and successors. We intend this dedication to be an
overt act of relinquishment in perpetuity of all present and future rights to
this software under copyright law.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
------------------------------------------------------------------------------
--]]
