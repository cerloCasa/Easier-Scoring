![img](https://raw.githubusercontent.com/cerloCasa/Easier-Scoring/main/assets/2x/modicon.png)
# Easier Scoring
This [mod](https://github.com/cerloCasa/Easier-Scoring/releases/tag/v1.1-EasierScoring) implements easy functions to put in your Jokers `calculate` functions, so you can focus on what your Joker does instead of thinking about what to put into the `return{}` brackets.
## Commands
- `aChips(amt,card,context)` adds *amt* to the ![CHIPS](https://placehold.co/40x20/009dff/FFFFFF.png?text=Chips) amount;
- `xChips(amt,card,context)` multiplies the ![CHIPS](https://placehold.co/40x20/009dff/FFFFFF.png?text=Chips) amount by *amt*;
- `aMult(amt,card,context)` adds *amt* to the ![MULT](https://placehold.co/40x20/FE5F55/FFFFFF.png?text=Mult) amount;
- `xMult(amt,card,context)` multiplies the ![MULT](https://placehold.co/40x20/FE5F55/FFFFFF.png?text=Mult) amount by *amt*;
- `addMoney(amt,card,context)` adds *amt* to the ![MONEY](https://placehold.co/45x20/f2d035/FFFFFF.webp?text=$&font=Montserrat) amount;
- `retriggerCard(amt,card,context)` retriggers a card *amt* times.
## Examples
In order to use it, put this code in your Joker's calculate function
```lua
if context.joker_main then
  aMult(20,card,context) -- does +20 Mult
end
```
other versions to multiply Chips *(like for each scoring card)* are made like this
```lua
if context.individual and context.cardarea == G.play then
  xChips(3,card,context) -- each scoring card does x3 Chips
end
```
## Compatibility
This mod is fully compatible with all mods that don't implement these functions:
- `aChips()`
- `addMoney()`
- `aMult()`
- `calculate_joker()`
- `retriggerCard()`
- `xChips()`
- `xMult()`
