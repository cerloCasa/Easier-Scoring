--- STEAMODDED HEADER
--- MOD_NAME: xChips
--- MOD_ID: xChips
--- MOD_AUTHOR: [Cerlo]
--- MOD_DESCRIPTION: This mod adds the possibility for other modders to return x_chips in their Jokers, like x_mult
--- BADGE_COLOR: 4285F4
--- PREFIX: xC
--- PRIORITY: -10000000
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 1.0

function xChips(amt)
    hand_chips = mod_chips(hand_chips * (amt or 1))
    update_hand_text(
        {delay = 0},
        {chips = hand_chips}
    )
end