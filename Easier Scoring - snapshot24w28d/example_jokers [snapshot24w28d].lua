--- STEAMODDED HEADER
--- MOD_NAME: Example Jokers
--- MOD_ID: ExampleJokers
--- MOD_AUTHOR: [Cerlo]
--- MOD_DESCRIPTION: This is a template mod for testing the Easier Scoring Mod
--- BADGE_COLOR: 4285F4
--- PREFIX: ExJo
--- VERSION: snapshot24w28d
--- DEPENDENCIES: [EasierScoring]

SMODS.Atlas { -- Example Joker
    key = 'exampleJoker',
    px = 71,
    py = 95,
    path = 'exampleJoker.png',
}

SMODS.Joker {
    key = 'ExampleJoker',
    loc_txt = {
        ['default'] = {
            name = 'Example Joker',
            text = {'This is an','{C:attention}Example{} Joker'},
        },
    },
    config = {extra = {}},
    rarity = 1, -- 1 common, 2 uncommon, 3 rare, 4 legendary
    atlas = 'exampleJoker',
    pos = {x = 0, y = 0},
    cost = 0,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self,card,context)
        if context.other_joker and self ~= context.other_joker then
            aChips(1,card,context)
            aMult(3,card,context)
            xMult(4,card,context)
        end
    end,
}
