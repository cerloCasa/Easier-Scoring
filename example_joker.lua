--- STEAMODDED HEADER
--- MOD_NAME: Example Jokers
--- MOD_ID: ExampleJokers
--- MOD_AUTHOR: [Cerlo]
--- MOD_DESCRIPTION: This mod adds Jokers for testing the Easier Scoring Mod
--- BADGE_COLOR: 4285F4
--- PREFIX: ExJo
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 1.0

SMODS.Joker { -- Test 01
    key = 'Test01',
    loc_txt = {
        ['default'] = {
            name = 'Test 01',
            text = {'context.individual and cardarea == G.hand','+30 Chips','X2 Chips','+8 Mult','X1.5 Mult','+10$'},
        },
    },
    config = {extra = {}},
    rarity = 1, -- 1 common, 2 uncommon, 3 rare, 4 legendary
    pos = {x = 0, y = 0},
    cost = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self,card,context)
        if context.repetition and context.cardarea == G.play then
            retriggerCard(1,card,context)
        end
    end,
}