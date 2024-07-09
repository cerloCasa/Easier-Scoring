--- STEAMODDED HEADER
--- MOD_NAME: Easier xChips
--- MOD_ID: EasierxChips
--- MOD_AUTHOR: [Cerlo]
--- MOD_DESCRIPTION: This is a support mod that adds the xChips functions
--- BADGE_COLOR: 4285F4
--- PREFIX: EzxC
--- VERSION: snapshot24w28d
--- DEPENDENCIES: [EasierScoring]

SMODS.Atlas { -- modicon
    key = 'modicon',
    px = 34,
    py = 34,
    path = 'modicon.png',
} 

function xChips(amt,card,context)
    initializeEzSc(card)
    local isContextSupported = (
        (context.individual and not context.end_of_round) or
        (context.joker_main) or
        (context.other_joker)
    )
    if isContextSupported then
        card.EzSc.card = card
        card.EzSc.xChips = amt
    else
        sendErrorMessage('Context for xChips not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
end