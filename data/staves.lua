local Stats = require "engine.interface.ActorStats"
local DamageType = require "engine.DamageType"

newEntity{
	power_source = {technique=true},
	name = "cruel short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {cruel=true},
	level_range = {1, 50},
	rarity = 3,
	cost = 4,
	combat = {
		accuracy_effect_scale = 0.5,
	},
	wielder = {
		combat_spellcrit = resolvers.mbonus_material(5, 5),
		combat_critical_power = resolvers.mbonus_material(5, 5),
	},
}

newEntity{
	power_source = {arcane=true},
	name = "potent short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {potent=true},
	level_range = {1, 50},
	rarity = 3,
	cost = 5,
	combat = {
		accuracy_effect_scale = 0.5,
		dam = resolvers.mbonus_material(5, 2),
	},
	wielder = {
		combat_spellpower = resolvers.mbonus_material(3, 2),
	},
	resolvers.command_staff(),
}

newEntity{
	power_source = {arcane=true},
	name = "surging short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {surging=true},
	level_range = {1, 50},
	rarity = 5,
	cost = 10,
	combat = {
		accuracy_effect_scale = 0.5,
	},
	wielder = {
		spellsurge_on_crit = resolvers.mbonus_material(5, 2),
	},
}

newEntity{
	power_source = {arcane=true},
	name = "greater short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {greater=true},
	level_range = {20, 50},
	greater_ego = 1,
	rarity = 30,
	cost = 45,
	combat = {
		accuracy_effect_scale = 0.5,
		is_greater = true,
	},
	wielder = {
		combat_spellpower = resolvers.mbonus_material(5, 3),
	},
	resolvers.command_staff(),
}

newEntity{
	power_source = {nature=true},
	name = "lifebinding short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {lifebinding=true},
	level_range = {20, 50},
	greater_ego = 1,
	rarity = 16,
	cost = 35,
	combat = {
		accuracy_effect_scale = 0.5,
	},
	wielder = {
		combat_spellpower = resolvers.mbonus_material(7, 3),
		life_regen = resolvers.mbonus_material(10, 5, function(e, v) v=v/10 return 0, v end), -- luacheck: ignore 212
		healing_factor = resolvers.mbonus_material(10, 10, function(e, v) v=v/100 return 0, v end), -- luacheck: ignore 212
		inc_stats = {
			[Stats.STAT_CON] = resolvers.mbonus_material(4, 3),
			},
	},
}

newEntity{
	power_source = {arcane=true},
	name = "infernal short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {infernal=true},
	level_range = {20, 50},
	greater_ego = 1,
	rarity = 16,
	cost = 35,
	combat = {
		accuracy_effect_scale = 0.5,
	},
	wielder = {
		combat_spellpower = resolvers.mbonus_material(7, 3),
		combat_critical_power = resolvers.mbonus_material(15, 15),
		see_invisible = resolvers.mbonus_material(15, 5),
		melee_project = {
			[DamageType.FIRE] = resolvers.mbonus_material(10, 15),
		},
	},
}

newEntity{
	power_source = {arcane=true},
	name = "bloodlich's short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {bloodlich=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 40,
	cost = 90,
	combat = {
		accuracy_effect_scale = 0.5,
	},
	wielder = {
		inc_stats = {
			[Stats.STAT_CUN] = resolvers.mbonus_material(5, 1),
			[Stats.STAT_CON] = resolvers.mbonus_material(5, 1),
			[Stats.STAT_MAG] = resolvers.mbonus_material(5, 1),
		},
		combat_critical_power = resolvers.mbonus_material(10, 10),
		vim_on_crit = resolvers.mbonus_material(5, 3),
		max_vim =  resolvers.mbonus_material(15, 20),
		max_negative =  resolvers.mbonus_material(15, 20),
		negative_regen = 0.2
	},
}

newEntity{
	power_source = {arcane=true},
	name = "arcing short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {arcing=true},
	level_range = {1, 50},
	unique_ego = 1,
	rarity = 5,
	cost = 10,
	combat = {
		special_on_hit = {
			desc=function(self, who, special)
				local dam = special.arc(who)
				return ("#LIGHT_GREEN#25%%#LAST# chance for lightning to strike from the target to a second target dealing #VIOLET#%d#LAST# damage"):tformat(dam)
			end,
			arc=function(who)
				local dam = math.max(15, math.floor(who:combatStatScale(who:combatSpellpower(), 1, 150)))
				return dam
			end,
			on_kill=1,
			fct=function(combat, who, target, dam, special)
				if not rng.percent(25) then return end
				local tgts = {}
				local x, y = target.x, target.y
				local grids = core.fov.circle_grids(x, y, 10, true)
				local tg = {type="beam", range=10, friendlyfire=false, x=target.x, y=target.y}
				for x, yy in pairs(grids) do for y, _ in pairs(grids[x]) do
					local a = game.level.map(x, y, engine.Map.ACTOR)
					if a and a ~= target and who:reactionToward(a) < 0 and who:canProject(tg, x, y) then
						tgts[#tgts+1] = a
					end
				end end

				-- Randomly take targets
				local target2 = (#tgts >= 0) and rng.table(tgts) or target
				local dam = who:spellCrit(special.arc(who))

				if target2 ~= target then who:project({type="hit"}, target.x, target.y, engine.DamageType.LIGHTNING, dam) end
				who:project(tg, target2.x, target2.y, engine.DamageType.LIGHTNING, dam)
				game.level.map:particleEmitter(x, y, math.max(math.abs(target2.x-x), math.abs(target2.y-y)), "lightning", {tx=target2.x-x, ty=target2.y-y})
				game:playSoundNear(who, "talents/lightning")
			end
		},
	},
}

newEntity{
	power_source = {technique=true},
	name = "crippling short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {crippling=true},
	level_range = {1, 50},
	rarity = 15,
	greater_ego = 1,
	unique_ego = 1,
	cost = 40,
	wielder = {
		combat_physcrit = resolvers.mbonus_material(10, 5),
	},
	combat = {
		special_on_crit = {desc=_t"Cripple the target reducing mind, spell, and combat action speeds by 30%", fct=function(combat, who, target)
			target:setEffect(target.EFF_CRIPPLE, 4, {src=who, apply_power=who:combatAttack(combat)})
		end},
	},
}

newEntity{
	power_source = {technique=true},
	name = "crushing short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {shearing=true},
	level_range = {20, 50},
	greater_ego = 1,
	rarity = 20,
	cost = 40,
	wielder = {
		combat_atk = resolvers.mbonus_material(20, 5),
		combat_apr = resolvers.mbonus_material(10, 5),
		resists_pen = {
			['all'] = resolvers.mbonus_material(10, 5),
		},
	},
}