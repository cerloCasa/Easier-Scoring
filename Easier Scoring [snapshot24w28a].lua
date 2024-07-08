--- STEAMODDED HEADER
--- MOD_NAME: Easier Scoring
--- MOD_ID: EasierScoring
--- MOD_AUTHOR: [Cerlo]
--- MOD_DESCRIPTION: This mod adds functions for easier Joker calculations
--- BADGE_COLOR: 4285F4
--- PREFIX: EzSc
--- PRIORITY: -10000000000000
--- LOADER_VERSION_GEQ: 1.0.0-ALPHA-0706a-STEAMODDED
--- VERSION: snapshot24w28a

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
    if context.individual and context.cardarea == G.play then 
        card.EzSc.card = card
        card.EzSc.aChips = amt
    elseif context.individual and context.cardarea == G.hand then 
        card.EzSc.card = card
        card.EzSc.aChips = amt
    elseif context.joker_main then 
        card.EzSc.card = card
        card.EzSc.aChips = amt
    elseif context.other_joker then 
        card.EzSc.card = card
        card.EzSc.aChips = amt
    else
        sendErrorMessage('Context for aChips not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
end

function xChips(amt,card,context)
    initializeEzSc(card)
    if context.individual and context.cardarea == G.play then 
        card.EzSc.card = card
        card.EzSc.xChips = amt
    elseif context.individual and context.cardarea == G.hand then 
        card.EzSc.card = card
        card.EzSc.xChips = amt
    elseif context.joker_main then 
        card.EzSc.card = card
        card.EzSc.xChips = amt
    elseif context.other_joker then 
        card.EzSc.card = card
        card.EzSc.xChips = amt
    else
        sendErrorMessage('Context for xChips not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
end

function aMult(amt,card,context)
    initializeEzSc(card)
    if context.individual and context.cardarea == G.play then 
        card.EzSc.card = card
        card.EzSc.aMult = amt
    elseif context.individual and context.cardarea == G.hand then 
        card.EzSc.card = card
        card.EzSc.aMult = amt
    elseif context.joker_main then 
        card.EzSc.card = card
        card.EzSc.aMult = amt
    elseif context.other_joker then 
        card.EzSc.card = card
        card.EzSc.aMult = amt
    else
        sendErrorMessage('Context for aMult not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
end

function xMult(amt,card,context)
    initializeEzSc(card)
    if context.individual and context.cardarea == G.play then 
        card.EzSc.card = card
        card.EzSc.xMult = amt
    elseif context.individual and context.cardarea == G.hand then 
        card.EzSc.card = card
        card.EzSc.xMult = amt
    elseif context.joker_main then 
        card.EzSc.card = card
        card.EzSc.xMult = amt
    elseif context.other_joker then 
        card.EzSc.card = card
        card.EzSc.xMult = amt
    else
        sendErrorMessage('Context for xMult not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
end

function addMoney(amt,card,context)
    initializeEzSc(card)
    if context.selling_card then 
        card.EzSc.card = card
        card.EzSc.dollars = amt
    elseif context.reroll_shop then 
        card.EzSc.card = card
        card.EzSc.dollars = amt
    elseif context.skip_blind then
        card.EzSc.card = card
        card.EzSc.dollars = amt
    elseif context.skipping_booster then
        card.EzSc.card = card
        card.EzSc.dollars = amt
    elseif context.setting_blind then
        card.EzSc.card = card
        card.EzSc.dollars = amt
    elseif context.using_consumeable then
        card.EzSc.card = card
        card.EzSc.dollars = amt
    elseif context.discard then
        card.EzSc.card = card
        card.EzSc.dollars = amt
    elseif context.end_of_round and not (context.individual or context.blueprint) then
        card.EzSc.card = card
        card.EzSc.dollars = amt
    elseif context.individual then
        card.EzSc.card = card
        card.EzSc.dollars = amt
    elseif context.other_joker then 
        card.EzSc.card = card
        card.EzSc.dollars = amt
    elseif context.before then
        card.EzSc.card = card
        card.EzSc.dollars = amt
    elseif context.joker_main then 
        card.EzSc.card = card
        card.EzSc.dollars = amt
    else
        sendErrorMessage('Context for addMoney not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
end
