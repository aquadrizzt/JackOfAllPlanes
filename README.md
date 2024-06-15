Jack of All Planes (JoAP) is a mod for Planescape: Torment - Enhanced Edition. 

This mod has basically one feature: it reworks The Nameless One's progression to work as a multiclass Fighter/Mage/Thief. He can wield any weapon, use thief skills, and cast arcane spells, all without having to swap his class at one of the class trainers. 

**Languages**: English, Simplified Chinese (thanks to @MephistoSatanDevil) 

## Implementation
The Nameless One begins the game as a level 0/0/0 Fighter/Mage/Thief. You will need to level him up immediately upon the game starting in order to get his proper thief skills, mage spell slots, and hit points.  

**Weapon Proficiencies**: Weapon proficiency points work identically to how they work in the vanilla game (although I have extended the progression up to level 30, which is almost certainly overkill). The UI showing how many unspent points you have is slightly different and is moved to the bottom of your Proficiencies section. 

**Character Progression**: Character points from level advancement and specialization are handled via an item (the Manual of the Planes, better name pending) which will be waiting patiently in your inventory at the start of the game. Much like in vanilla Planescape, you get one character point whenever you reach a new maximum level, and you unlock option to select your first and second specializations at 7th and 12th level.

**Thieving**: In order to allow the Nameless One to use his thief skills, I have made a small UI patch that changes the Dialog button to pull up a Thief hotbar, which gives access to the Talk, Detect Traps, Thievery, and Stealth buttons. These will all behave exactly as you'd expect. Annah is also affected by this change. 

**Learning Spells**: Although the Nameless One will begin the game with spell slots and the ability to gain XP in the Mage class, he will still need to be trained in how to read magic before he can scribe or use scrolls. I felt this was a narratively important enough quest to not render obsolete. (I have not placed such a restriction on Thief skills, although it could be trivially implemented.)

The item flag for "unusable by Fighter/Mage/Thief" overlaps with the item flag for "unusable by Indeps". As the Nameless One is not able to become an Indep, I have simply changed all items that are unusable by Indeps to be unusable by Annah instead. This should have no effect on gameplay. I have made no other changes to item usability. 

In order to avoid getting bogged down with dialog and script patches, I have done a pass over scripts and dialogs to have class checks on the F/M/T Nameless One all evaluate to True (more specifically, instead of checking for Fighter, it now checks for Fighter_All, etc.) and I have also removed all instances of the effect that changes the Nameless One's class during dialog. Some dialogs (such as Porphiron's initial training dialog and Many-as-One's Kyton dream) might be a bit odd as a result, but nothing should catastrophically break and this mod should be able to handle other mod-added dialog as a result. 

## Possible Futures 
This mod lays a lot of groundwork that could easily be adapted to allow other classes to be implemented as playable characters in Planescape. As far as I can tell, the game engine can support Bards, Paladins, Rangers, Druids, and all multiclasses. If you don't need the character points or specializations book, this is all pretty seamless.  

Although I wound up not using this functionality in this mod, I have also changed the Special Abilities button to no longer be hardcoded. This would allow you to give the Nameless One and his companions new abilities beyond the handful of vanilla ones (Morte's Litany and Skull Mob, TNO's Raise Dead and optional Sensory Touch, Grace's Kiss and Sensory Touch). 

This mod might interact a bit strangely with Items of the Planes (which should be installed before this mod). The flattening of weapon proficiencies might result in some weapons having incorrect behavior when it comes to whether they can backstab or not. 

I am quite positive there is a cleaner way to implement all of the UI changes I've done here. I suspect it might even be possible to restore the character point level up menu for the Nameless One. I am unfortunately not experienced enough at LUA to know how to do this properly, but if you are and want to help shoot me a message. 


## Credits 
This mod was put together in response to a few questions from MephistoSatanDevil (on the Beamdog forums) about the feasibility of making The Nameless One a Fighter/Mage/Thief. 

As with many of my Planescape mods, shout out to Argent77 and kjeron whose code, insight, and modding techniques have undoubtedly turned up somewhere in this mod. 
