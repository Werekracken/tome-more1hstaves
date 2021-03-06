long_name = "More 1H Staves"
short_name = "more1hstaves"
for_module = "tome"
version = {1,7,2}
addon_version = {1,0,7}
weight = 2000
author = {"Werekracken"}
tags = {"staff", "Staff", "1h", "1H", "staves", "Staves"}
homepage = "https://te4.org/user/102798/addons"
description = [[Adds more 1H staves with more variety to the game.

1H staves are so hard to find because in the base game there are only 2 egos that make a staff 1H.
This addon adds more 1H staff egos that are based on some of the existing 2H staff egos, but with some of the bonuses toned down.
Also slightly expands the number of staves available in staff stores to account for the wider variety.

https://github.com/Werekracken/tome-more1hstaves

---Changelog
- v1.0.0 Initial release
- v1.0.1 Changed the new 1H staves proc bonus from 2.5 (which is normal for 2H staves) to 1.2 (which is normal for 1H staves).
- v1.0.2 Took a few egos out because when the higher level/rarity staves are created they randomly get egos and if any ego is a 1H then the staff is 1H, meaning that too many of the higher level/rarity staves were 1H. Fewer 1H egos means lower chances of a 1H ego so it should be more balanced now.
- v1.0.3 Took out some blah 1H staff egos and added a few that are a bit more related to bonking, like crippling. Total 1H ego count went down by 1.
- v1.0.4 Toned down the bonuses on the new egos a little to be consistent and logical.
- v1.0.5 Fixed accuracy scaling on the new egos from 1.0.3.
- v1.0.6 Reduced the weight of the 1H staves from 5 to 3, but only in these egos in the addon. This does not apply to the 1H staff egos already in the game: prefix = "short ", and prefix = "magewarrior's short ".
- v1.0.7 Added the the "short" keyword to all 1h staves in this addon (the magewarrior's short staff in the basegame still doesn't have the keyword).Made short staves added by this addon look like short staves on the character when equipped, just like the "magewarrior's short" and "short" staves in the basegame look.
]]
overload = false
superload = false
hooks = true
data = true
