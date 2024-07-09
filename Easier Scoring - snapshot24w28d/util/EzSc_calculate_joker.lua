local function dollarsEvent(self,context,money)
    G.E_MANAGER:add_event(Event({
        func = function()
            ease_dollars(money or self.EzSc.dollars)
            card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('$')..(money or self.EzSc.dollars),colour = G.C.MONEY, delay = 0.45})
            return true
        end}))
end

local function juiceUpOtherJoker(context)
    G.E_MANAGER:add_event(Event({
        func = function()
            context.other_joker:juice_up(0.5, 0.5)
            return true
        end
    })) 
end

function EzSc_calculate_joker(self,context)
    if not self.EzSc then
        return
    end
    local RET = {}
    if context.selling_card then
        if self.EzSc.dollars then
            dollarsEvent(self,context)
        end
    elseif context.reroll_shop then
        if self.EzSc.dollars then
            dollarsEvent(self,context)
        end
    elseif context.skip_blind then
        if self.EzSc.dollars then
            dollarsEvent(self,context)
        end
    elseif context.skipping_booster then
        if self.EzSc.dollars then
            dollarsEvent(self,context)
        end
    elseif context.setting_blind then
        if self.EzSc.dollars then
            dollarsEvent(self,context)
        end
    elseif context.using_consumeable then
        if self.EzSc.dollars then
            dollarsEvent(self,context)
        end
    elseif context.discard then
        if self.EzSc.dollars then
            ease_dollars(self.EzSc.dollars)
            RET.message = localize('$')..self.EzSc.dollars
            RET.colour = G.C.MONEY
            RET.card = self.EzSc.card
        end
    elseif context.end_of_round and not context.repetition then
        if self.EzSc.dollars then
            dollarsEvent(self,context)
        end
    elseif context.individual and context.cardarea == G.play then
        if self.EzSc.aChips then
            RET.chips = self.EzSc.aChips
            RET.card = self
        end
        if self.EzSc.xChips then
            RET.xChips = self.EzSc.xChips
            RET.card = self
        end
        if self.EzSc.aMult then
            RET.mult = self.EzSc.aMult
            RET.card = self
        end
        if self.EzSc.xMult then
            RET.x_mult = self.EzSc.xMult
            RET.card = self
        end
        if self.EzSc.dollars then
            RET.dollars = self.EzSc.dollars
            RET.card = self
        end
    elseif context.individual and context.cardarea == G.hand then
        if self.EzSc.aChips then
            RET.aChips = self.EzSc.aChips
            RET.card = self
        end
        if self.EzSc.xChips then
            RET.xChips = self.EzSc.xChips
            RET.card = self
        end
        if self.EzSc.aMult then
            RET.aMult = self.EzSc.aMult
            RET.card = self
        end
        if self.EzSc.xMult then
            RET.xMult = self.EzSc.xMult
            RET.card = self
        end
        if self.EzSc.dollars then
            RET.dollars = self.EzSc.dollars
            RET.card = self
        end
    elseif context.other_joker and self ~= context.other_joker then
        if self.EzSc.aChips then
            juiceUpOtherJoker(context)
            hand_chips = mod_chips(hand_chips + self.EzSc.aChips)
            update_hand_text({delay = 0}, {chips = hand_chips})
            EzSc_card_eval_status_text(self.EzSc.card,'aChips',self.EzSc.aChips)
        end
        if self.EzSc.xChips then
            juiceUpOtherJoker(context)
            hand_chips = mod_chips(hand_chips * self.EzSc.xChips)
            update_hand_text({delay = 0}, {chips = hand_chips})
            EzSc_card_eval_status_text(self.EzSc.card,'xChips',self.EzSc.xChips)
        end
        if self.EzSc.aMult then
            juiceUpOtherJoker(context)
            mult = mod_mult(mult + self.EzSc.aMult)
            update_hand_text({delay = 0}, {mult = mult})
            EzSc_card_eval_status_text(self.EzSc.card,'aMult',self.EzSc.aMult)
        end
        if self.EzSc.xMult then
            juiceUpOtherJoker(context)
            mult = mod_mult(mult * self.EzSc.xMult)
            update_hand_text({delay = 0}, {mult = mult})
            EzSc_card_eval_status_text(self.EzSc.card,'xMult',self.EzSc.xMult)
        end
        if self.EzSc.dollars then
            local MONEY = self.EzSc.dollars
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_dollars(MONEY)
                    EzSc_card_eval_status_text(context.blueprint or self, 'dollars', MONEY,nil,nil,{delay = 0.45})
                    return true
                end}))
        end
    elseif context.before then
        if self.EzSc.dollars then
            ease_dollars(self.EzSc.dollars)
            RET.message = localize('$')..self.EzSc.dollars
            RET.colour = G.C.MONEY
            RET.card = self.EzSc.card
        end
    elseif context.joker_main then
        if self.EzSc.aChips then
            hand_chips = mod_chips(hand_chips + self.EzSc.aChips)
            update_hand_text({delay = 0}, {chips = hand_chips})
            EzSc_card_eval_status_text(self.EzSc.card,'aChips',self.EzSc.aChips)
        end
        if self.EzSc.xChips then
            hand_chips = mod_chips(hand_chips * self.EzSc.xChips)
            update_hand_text({delay = 0}, {chips = hand_chips})
            EzSc_card_eval_status_text(self.EzSc.card,'xChips',self.EzSc.xChips)
        end
        if self.EzSc.aMult then
            mult = mod_mult(mult + self.EzSc.aMult)
            update_hand_text({delay = 0}, {mult = mult})
            EzSc_card_eval_status_text(self.EzSc.card,'aMult',self.EzSc.aMult)
        end
        if self.EzSc.xMult then
            mult = mod_mult(mult * self.EzSc.xMult)
            update_hand_text({delay = 0}, {mult = mult})
            EzSc_card_eval_status_text(self.EzSc.card,'xMult',self.EzSc.xMult)
        end
        if self.EzSc.dollars then
            local MONEY = self.EzSc.dollars
            dollarsEvent(self,context,MONEY)
        end
    end
    if next(RET) then
        return RET
    end
end