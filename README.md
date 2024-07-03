![img](https://raw.githubusercontent.com/cerloCasa/Easier-Scoring/main/assets/2x/modicon.png)
# Easier Scoring
This [mod](https://github.com/cerloCasa/Easier-Scoring/releases/tag/v1.1-EasierScoring) implements easy functions to put in your Jokers `calculate` functions, so you can perform modifications at the Chips and Mult values instead of putting them inside the `return{}` brackets.
## Commands
- `aChips(amt,card)` adds *amt* to the ![CHIPS](https://placehold.co/40x20/009dff/FFFFFF.png?text=Chips) amount;
- `xChips(amt,card)` multiplies the ![CHIPS](https://placehold.co/40x20/009dff/FFFFFF.png?text=Chips) amount by *amt*;
- `aMult(amt,card)` adds *amt* to the ![MULT](https://placehold.co/40x20/FE5F55/FFFFFF.png?text=Mult) amount;
- `xMult(amt,card)` multiplies the ![MULT](https://placehold.co/40x20/FE5F55/FFFFFF.png?text=Mult) amount by *amt*;
## Examples
In order to use it, put this code in your Joker's calculate function
```lua
if context.joker_main then
  aMult(20,card) -- does +20 Mult
end
```
other versions to multiply Chips *(like for each scoring card)* are made like this
```lua
if context.individual and context.cardarea == G.play then
  xChips(3,context.other_card) -- each scoring card does x3 Chips
end
```
## Compatibility
This mod is fully compatible with all mods that don't implement these functions:
- `aChips()`
- `xChips()`
- `aMult()`
- `xMult()`
