--- STEAMODDED HEADER
--- MOD_NAME: Easier Scoring
--- MOD_ID: EasierScoring
--- MOD_AUTHOR: [Cerlo]
--- MOD_DESCRIPTION: This mod adds functions for increasing Mult and Chips without putting them in the return brackets
--- BADGE_COLOR: 4285F4
--- PREFIX: EzSc
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 1.1

-- HOW TO USE
-- if context.joker_main then
--     xChips(2,card) -- does x2 Chips
-- end
-- if context.individual and context.cardarea == G.play then
--     xChips(3,context.other_card) -- each scoring card does x3 Chips
-- end

local function EzSc_card_eval_status_text(card, eval_type, amt, percent, dir, extra)
    percent = percent or (0.9 + 0.2*math.random())
    if dir == 'down' then 
        percent = 1-percent
    end

    if extra and extra.focus then card = extra.focus end

    local text = ''
    local sound = nil
    local volume = 1
    local card_aligned = 'bm'
    local y_off = 0.15*G.CARD_H
    if card.area == G.jokers or card.area == G.consumeables then
        y_off = 0.05*card.T.h
    elseif card.area == G.hand then
        y_off = -0.05*G.CARD_H
        card_aligned = 'tm'
    elseif card.area == G.play then
        y_off = -0.05*G.CARD_H
        card_aligned = 'tm'
    elseif card.jimbo  then
        y_off = -0.05*G.CARD_H
        card_aligned = 'tm'
    end
    local config = {}
    local delay = 0.65
    local colour = config.colour or (extra and extra.colour) or ( G.C.FILTER )
    local extrafunc = nil

    if eval_type == 'debuff' then 
        sound = 'cancel'
        amt = 1
        colour = G.C.RED
        config.scale = 0.6
        text = localize('k_debuffed')
    elseif eval_type == 'chips' then 
        sound = 'chips1'
        amt = amt
        colour = G.C.CHIPS
        text = localize{type='variable',key='a_chips',vars={amt}}
        delay = 0.6
    elseif eval_type == 'mult' then 
        sound = 'multhit1'--'other1'
        amt = amt
        text = localize{type='variable',key='a_mult',vars={amt}}
        colour = G.C.MULT
        config.type = 'fade'
        config.scale = 0.7
    elseif (eval_type == 'x_mult') or (eval_type == 'h_x_mult') then 
        sound = 'multhit2'
        volume = 0.7
        amt = amt
        text = localize{type='variable',key='a_xmult',vars={amt}}
        colour = G.C.XMULT
        config.type = 'fade'
        config.scale = 0.7
    elseif eval_type == 'h_mult' then 
        sound = 'multhit1'
        amt = amt
        text = localize{type='variable',key='a_mult',vars={amt}}
        colour = G.C.MULT
        config.type = 'fade'
        config.scale = 0.7
    elseif eval_type == 'a_chips' then
        sound = 'chips1'
        amt = amt
        text = "+" .. amt .. " Chips"
        colour = G.C.CHIPS
        config.type = 'fade'
        config.scale = 0.7
    elseif eval_type == 'a_xchips' then
        sound = 'chips1'
        amt = amt
        text = "X" .. amt .. " Chips"
        colour = G.C.CHIPS
        config.type = 'fade'
        config.scale = 0.7
    elseif eval_type == 'dollars' then 
        sound = 'coin3'
        amt = amt
        text = (amt <-0.01 and '-' or '')..localize("$")..tostring(math.abs(amt))
        colour = amt <-0.01 and G.C.RED or G.C.MONEY
    elseif eval_type == 'swap' then 
        sound = 'generic1'
        amt = amt
        text = localize('k_swapped_ex')
        colour = G.C.PURPLE
    elseif eval_type == 'extra' or eval_type == 'jokers' then 
        sound = extra.edition and 'foil2' or extra.mult_mod and 'multhit1' or extra.Xmult_mod and 'multhit2' or 'generic1'
        if extra.edition then 
            colour = G.C.DARK_EDITION
        end
        volume = extra.edition and 0.3 or sound == 'multhit2' and 0.7 or 1
        delay = extra.delay or 0.75
        amt = 1
        text = extra.message or text
        if not extra.edition and (extra.mult_mod or extra.Xmult_mod)  then
            colour = G.C.MULT
        end
        if extra.chip_mod then
            config.type = 'fall'
            colour = G.C.CHIPS
            config.scale = 0.7
        elseif extra.swap then
            config.type = 'fall'
            colour = G.C.PURPLE
            config.scale = 0.7
        else
            config.type = 'fall'
            config.scale = 0.7
        end
    end
    delay = delay*1.25

    if amt > 0 or amt < 0 then
        if extra and extra.instant then
            if extrafunc then extrafunc() end
            attention_text({
                text = text,
                scale = config.scale or 1, 
                hold = delay - 0.2,
                backdrop_colour = colour,
                align = card_aligned,
                major = card,
                offset = {x = 0, y = y_off}
            })
            play_sound(sound, 0.8+percent*0.2, volume)
            if not extra or not extra.no_juice then
                card:juice_up(0.6, 0.1)
                G.ROOM.jiggle = G.ROOM.jiggle + 0.7
            end
        else
            G.E_MANAGER:add_event(Event({ --Add bonus chips from this card
                    trigger = 'before',
                    delay = delay,
                    func = function()
                    if extrafunc then extrafunc() end
                    attention_text({
                        text = text,
                        scale = config.scale or 1, 
                        hold = delay - 0.2,
                        backdrop_colour = colour,
                        align = card_aligned,
                        major = card,
                        offset = {x = 0, y = y_off}
                    })
                    play_sound(sound, 0.8+percent*0.2, volume)
                    if not extra or not extra.no_juice then
                        card:juice_up(0.6, 0.1)
                        G.ROOM.jiggle = G.ROOM.jiggle + 0.7
                    end
                    return true
                    end
            }))
        end
    end
    if extra and extra.playing_cards_created then 
        playing_card_joker_effects(extra.playing_cards_created)
    end
end

function aChips(amt,card)
    hand_chips = mod_chips(hand_chips + (amt or 0))
    update_hand_text(
        {delay = 0},
        {chips = hand_chips}
    )
    EzSc_card_eval_status_text(card, 'a_chips', amt, percent)
end

function xChips(amt,card)
    hand_chips = mod_chips(hand_chips * (amt or 1))
    update_hand_text(
        {delay = 0},
        {chips = hand_chips}
    )
    EzSc_card_eval_status_text(card, 'a_xchips', amt, percent)
end

function aMult(amt,card)
    mult = mod_mult(mult + (amt or 0))
    update_hand_text(
        {delay = 0},
        {mult = mult}
    )
    EzSc_card_eval_status_text(card, 'mult', amt, percent)
end

function xMult(amt,card)
    mult = mod_mult(mult * (amt or 1))
    update_hand_text(
        {delay = 0},
        {mult = mult}
    )
    EzSc_card_eval_status_text(card, 'x_mult', amt, percent)
end