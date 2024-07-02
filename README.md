![modicon](https://raw.githubusercontent.com/cerloCasa/xChips/main/assets/2x/modicon.png)
# xChips
This mod implements the `xChips(amt,card)` function, so you can multiply your Chips score instead of your Mult.
## Examples
In order to use it, put this code in your Joker's calculate function
```lua
if context.joker_main then
  xChips(2,card) -- does x2 Chips
end
```
other versions to multiply Chips *(like for each scoring card)* are made like this
```lua
if context.individual and context.cardarea == G.play then
  xChips(3,context.other_card) -- each scoring card does x3 Chips
end
```
## Warning
This mod modifies the behaviour of `function card_eval_status_text()`, so it might collide with other mods that do the same.
