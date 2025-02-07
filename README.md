![img](https://github.com/cerloCasa/Easier-Scoring/blob/main/Easier%20Scoring%20-%20snapshot24w28d/assets/2x/modicon.png?raw=true)
# Easier Scoring: Snapshot 24w28d
This [mod](https://github.com/cerloCasa/Easier-Scoring/releases/tag/v1.1-EasierScoring) implements easy functions to put in your Jokers `calculate` functions, so you can focus on what your Joker does instead of thinking about what to put into the `return{}` brackets.
## Commands
- `aChips(amt,card,context)` adds *amt* to the ![CHIPS](https://placehold.co/40x20/009dff/FFFFFF.png?text=Chips) amount;
- `xChips(amt,card,context)` multiplies the ![CHIPS](https://placehold.co/40x20/009dff/FFFFFF.png?text=Chips) amount by *amt*;
- `aMult(amt,card,context)` adds *amt* to the ![MULT](https://placehold.co/40x20/FE5F55/FFFFFF.png?text=Mult) amount;
- `xMult(amt,card,context)` multiplies the ![MULT](https://placehold.co/40x20/FE5F55/FFFFFF.png?text=Mult) amount by *amt*;
- `addMoney(amt,card,context)` adds *amt* to the ![MONEY](https://placehold.co/45x20/f2d035/FFFFFF.webp?text=$&font=Montserrat) amount;
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
**NOTE:** `xChips` is not available by default, you'll need to add the [Easier xChips](https://github.com/cerloCasa/Easier-Scoring/tree/f4d4834897162c13b573b231070f512dceb7cebc/Easier%20xChips%20-%20snapshot%2024w28d) mod too.
## Compatibility
This mod is fully compatible with all mods that don't implement these functions:
- `aChips()`
- `addMoney()`
- `aMult()`
- `xChips()`
- `xMult()`

This mod's file [`lovely.toml`](https://github.com/cerloCasa/Easier-Scoring/blob/f4d4834897162c13b573b231070f512dceb7cebc/Easier%20Scoring%20-%20snapshot24w28d/lovely.toml) modifies the behaviour of the `calculate_joker(context)` function in `card.lua`, this is the change:
```lua
function Card:calculate_joker(context)
for k, v in pairs(SMODS.Stickers) do
    if self.ability[v.key] then
        if v.calculate and type(v.calculate) == 'function' then
            v:calculate(self, context)
        end
    end
end
    if self.debuff then return nil end
    local obj = self.config.center
    if obj.calculate and type(obj.calculate) == 'function' then
        local o = obj:calculate(self, context)
		-- START
        if self.EzSc then
            local RET = EzSc_calculate_joker(self,context)
            self.EzSc = nil
            return RET
        end
        -- END
        if o then return o end
    end
...
```
Also, *Easier xChips* modifies the behaviour of the `state_events.lua` file, to support `xChips()`.
## Testing
Developing this mod, I found that many are the different contexts and commands I have to test and I unfortunately don't have the time right now to try them all. If you are reading this, please help me in testing these contexts:
- `context.selling_card`: `addMoney`;
- `context.reroll_shop`: `addMoney`;
- `context.skip_blind`: `addMoney`;
- `context.skipping_booster`: `addMoney`;
- `context.setting_blind`: `addMoney`;
- `context.using_consumeable`: `addMoney`;
- `context.discard`: `addMoney`;
- `context.end_of_round and not context.repetition`: `addMoney`;
- `context.before`: `addMoney`.

If a context isn't listed here, while being supported by the mod, then it has already been tested. Thank you for your support.
