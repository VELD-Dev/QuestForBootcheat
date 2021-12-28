# wtf is that ?
a fucking trainer to "cheat" with the Smuggler until the end of the game for now

## Where is the code of the cheat ?

Talk me calmfully, it's in `game/built/levels/npc_island/scripts/scene_smuggler.lua`.
* You have to know that the code works only BEFORE the ship-in-bay battle, it means that when Smug is in the lil' ship, the cheat-menu is not accessible anymore.  
What you have to do is just open Smuggler (strange) when he has nothing techincally to say you (like before the story of the crank-bolt, or after) and you it should open you a kind of dialog-menu.

## Why some folder are empty ?

Simply because these file are useless, or just non-exploitable.

# CONTRIBUTION

### **WHEN YOU CONTRIBUTE, PLEASE DO NOT MODIFY THESE FILES**
- `.gitignore`
- `.gitattributes` (if there's one)
- `README.md`
- `game/built/levels/npc_island/cheat_menu.lua` (It's a file I'm working on because like... I'm working on the file handler)

### *Contribution rules*

First, do not commit an empty commit.  
**When you want to commit, create a __FOLDER WITH YOUR NICKNAME IN YOUR BRANCH__! Create pull request and I *(V E L D)* will clean, verify that and try it. If you already tried it, please join the [Game Fuckery Inc.](about:blank) server (when it is opened)**  
Do not steal codes, etc...  
I make the release myself after trying the mods, these are available in release category. Normally, the name of the modder is in the release.  

### Why should I create a new folder PLUS a new branch ?

That make the pull work easier, and it doesn't modify the main script. In your folder, create just the environment and place the modified lua into. e.g.: If VELD-Dev modified Smug, it could look like this : `veld-dev/game/built/npc_island/scripts/scene_smuggler.lua`. If I modified weapon.csv, it may looks like this: `veld-dev/game/data/configs/weapon.csv`  
__**Please, really respect that, or your pull request won't be accepted.**__