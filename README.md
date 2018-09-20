[![Build Status](https://travis-ci.org/iskolbin/lryb.svg?branch=master)](https://travis-ci.org/iskolbin/lryb)
[![license](https://img.shields.io/badge/license-public%20domain-blue.svg)](http://unlicense.org/)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

RYB
===

RYB/RGB color conversion functions for Lua. Inspired by question on [math.stackexchange](https://math.stackexchange.com/questions/305395/ryb-and-rgb-color-space-conversion).

ryb.ryb2rgb( r, y, b[, convertTable ])
--------------------------------------

Converts RYB to RGB color scheme, returns triplet. Optional `convertTable` can
be passed, by default uses `ryb.IRISSON_RYB_TO_RGB` table, alternatively
`ryb.GOSSET_RYB_TO_RGB` can be used. All colors are assumed to be normalized to 1.

ryb.rgb2ryb( r, g, b[, convertTable ])
--------------------------------------

Converts RGB to RYB color scheme, returns triplet. Optional `convertTable` can
be passed, by default uses `ryb.IRISSON_RGB_TO_RYB` table. All colors are
assumed to be normalized to 1.
