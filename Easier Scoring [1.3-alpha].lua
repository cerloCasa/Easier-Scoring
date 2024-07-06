--- STEAMODDED HEADER
--- MOD_NAME: Easier Scoring
--- MOD_ID: EasierScoring
--- MOD_AUTHOR: [Cerlo]
--- MOD_DESCRIPTION: This mod adds functions for easier Joker calculations
--- BADGE_COLOR: 4285F4
--- PREFIX: EzSc
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 1.3-alpha

SMODS.Atlas { -- modicon
    key = 'modicon',
    px = 34,
    py = 34,
    path = 'modicon.png',
}

EzSc_Effects = nil

load(NFS.read(SMODS.current_mod.path .. 'game_changes/EzSc_card_eval_status_text.lua'))()
load(NFS.read(SMODS.current_mod.path .. 'game_changes/StateEvents.lua'))()
load(NFS.read(SMODS.current_mod.path .. 'game_changes/ButtonCallbacks.lua'))()

function aChips(amt,card,context,dontJuiceUp)
    if context.individual and context.cardarea == G.play then
        EzSc_Effects.chips = amt
    elseif context.individual and context.cardarea == G.hand then
        EzSc_Effects.chips = amt
    elseif context.joker_main then
        EzSc_Effects.chips = amt
    elseif context.other_joker then
        EzSc_Effects.chips = amt
    else
        sendErrorMessage('Context not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
    if dontJuiceUp then
        EzSc_Effects.card = nil
    else
        EzSc_Effects.card = card
    end
end

function xChips(amt,card,context,dontJuiceUp)
    if context.individual and context.cardarea == G.play then
        EzSc_Effects.x_chips = amt
    elseif context.individual and context.cardarea == G.hand then
        EzSc_Effects.x_chips = amt
    elseif context.joker_main then
        EzSc_Effects.x_chips = amt
    elseif context.other_joker then
        EzSc_Effects.x_chips = amt
    else
        sendErrorMessage('Context not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
    if dontJuiceUp then
        EzSc_Effects.card = nil
    else
        EzSc_Effects.card = card
    end
end

function aMult(amt,card,context,dontJuiceUp)
    if context.individual and context.cardarea == G.play then
        EzSc_Effects.mult = amt
    elseif context.individual and context.cardarea == G.hand then
        EzSc_Effects.mult = amt
    elseif context.joker_main then
        EzSc_Effects.mult = amt
    elseif context.other_joker then
        EzSc_Effects.mult = amt
    else
        sendErrorMessage('Context not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
    if dontJuiceUp then
        EzSc_Effects.card = nil
    else
        EzSc_Effects.card = card
    end
end

function xMult(amt,card,context,dontJuiceUp)
    if context.individual and context.cardarea == G.play then
        EzSc_Effects.x_mult = amt
    elseif context.individual and context.cardarea == G.hand then
        EzSc_Effects.x_mult = amt
    elseif context.joker_main then
        EzSc_Effects.x_mult = amt
    elseif context.other_joker then
        EzSc_Effects.x_mult = amt
    else
        sendErrorMessage('Context not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
    if dontJuiceUp then
        EzSc_Effects.card = nil
    else
        EzSc_Effects.card = card
    end
end

function addMoney(amt,card,context,dontJuiceUp)
    if context.selling_card then
        EzSc_Effects.dollars = amt
    elseif context.reroll_shop then
        EzSc_Effects.dollars = amt
    elseif context.skip_blind then
        EzSc_Effects.dollars = amt
    elseif context.skipping_booster then
        EzSc_Effects.dollars = amt
    elseif context.setting_blind then
        EzSc_Effects.dollars = amt
    elseif context.using_consumeable then
        EzSc_Effects.dollars = amt
    elseif context.discard then
        EzSc_Effects.dollars = amt
    elseif context.end_of_round then
        EzSc_Effects.dollars = amt
    elseif context.individual then
        EzSc_Effects.dollars = amt
        EzSc_Effects.target = context.other_card
    elseif context.other_joker then
        EzSc_Effects.dollars = amt
        EzSc_Effects.target = context.other_joker
    elseif context.before then
        EzSc_Effects.dollars = amt
    elseif context.joker_main then
        EzSc_Effects.dollars = amt
    end
    if dontJuiceUp then
        EzSc_Effects.card = nil
    else
        EzSc_Effects.card = card
    end
end

function retriggerCard(amt,card,context,dontJuiceUp)
    if context.repetition and cardarea == G.play then
        EzSc_Effects.repetitions = amt
    elseif context.repetition and cardarea == G.hand then
        EzSc_Effects.repetitions = amt
    else
        sendErrorMessage('Context not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
    if dontJuiceUp then
        EzSc_Effects.card = nil
    else
        EzSc_Effects.card = card
    end
end

function levelUpHand(amt,card,context,dontJuiceUp)
    if context.before then
        EzSc_Effects.level_up = amt
    elseif context.after then
        EzSc_Effects.level_up = amt
    else
        sendErrorMessage('Context not supported, check the mod\'s Wiki','Easier-Scoring')
        return
    end
    if dontJuiceUp then
        EzSc_Effects.card = nil
    else
        EzSc_Effects.card = card
    end
end