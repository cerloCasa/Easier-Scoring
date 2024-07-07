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
            text = {'$30 before'},
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
        print("Joker's calc")
        if context.before then
            addMoney(30,card,context)
        end
    end,
}