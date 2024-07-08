--- STEAMODDED HEADER
--- MOD_NAME: Easier Scoring
--- MOD_ID: EasierScoring
--- MOD_AUTHOR: [Cerlo]
--- MOD_DESCRIPTION: This mod adds functions for easier Joker calculations
--- BADGE_COLOR: 4285F4
--- PREFIX: EzSc
--- PRIORITY: -10000000000000
--- LOADER_VERSION_GEQ: 1.0.0-ALPHA-0706a-STEAMODDED
--- VERSION: snapshot24w28b

SMODS.Atlas { -- modicon
    key = 'modicon',
    px = 34,
    py = 34,
    path = 'modicon.png',
} 

load(NFS.read(SMODS.current_mod.path .. 'util/EzSc_card_eval_status_text.lua'))()
load(NFS.read(SMODS.current_mod.path .. 'util/EzSc_calculate_joker.lua'))()

function initializeEzSc(card)
    if not card.EzSc then
        card.EzSc = {}
    end
end

function aChips(amt,card,context)
    initializeEzSc(card)
    local isContextSupported = (
        (context.individual and not context.end_of_round) or
        (context.joker_main) or
        (context.other_joker)
    )
    if isContextSupported then
        card.EzSc.card = card
        card.EzSc.aChips = amt
    else
        sendErrorMessage('Context for aChips not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
end

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

function aMult(amt,card,context)
    initializeEzSc(card)
    local isContextSupported = (
        (context.individual and not context.end_of_round) or
        (context.joker_main) or
        (context.other_joker)
    )
    if isContextSupported then
        card.EzSc.card = card
        card.EzSc.aMult = amt
    else
        sendErrorMessage('Context for aMult not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
end

function xMult(amt,card,context)
    initializeEzSc(card)
    local isContextSupported = (
        (context.individual and not context.end_of_round) or
        (context.joker_main) or
        (context.other_joker)
    )
    if isContextSupported then 
        card.EzSc.card = card
        card.EzSc.xMult = amt
    else
        sendErrorMessage('Context for xMult not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
end

function addMoney(amt,card,context)
    initializeEzSc(card)
    local isContextSupported = (
        (context.before) or
        (context.discard) or
        (context.end_of_round and not context.repetition) or
        (context.individual) or
        (context.joker_main) or
        (context.other_joker) or
        (context.reroll_shop) or
        (context.selling_card) or
        (context.setting_blind) or
        (context.skip_blind) or
        (context.skipping_booster) or
        (context.using_consumeable)
    )
    if isContextSupported then 
        card.EzSc.card = card
        card.EzSc.dollars = amt
    else
        sendErrorMessage('Context for addMoney not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
end
