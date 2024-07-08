--- STEAMODDED HEADER
--- MOD_NAME: Example Jokers
--- MOD_ID: ExampleJokers
--- MOD_AUTHOR: [Cerlo]
--- MOD_DESCRIPTION: This mod adds Jokers for testing the Easier Scoring Mod
--- BADGE_COLOR: 4285F4
--- PREFIX: ExJo
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 1.3

SMODS.Joker {
    key = 'ExampleJoker',
    loc_txt = {
        ['default'] = {
            name = 'Example Joker',
            text = {'This is an {C:attention}example Joker'},
        },
    },
    config = {extra = {}},
    rarity = 1, -- 1 common, 2 uncommon, 3 rare, 4 legendary
    atlas = 'exampleJoker',
    pos = {x = 0, y = 0},
    cost = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self,card,context)
        if context.joker_main then
            xChips(3,card,context)
        end
    end,
}

SMODS.Atlas { -- Example Joker
    key = 'exampleJoker',
    px = 71,
    py = 95,
    path = 'exampleJoker.png',
}