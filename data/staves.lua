local Stats = require "engine.interface.ActorStats"
local Talents = require "engine.interface.ActorTalents"
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
	wielder = {
		combat_spellcrit = resolvers.mbonus_material(5, 5),
		combat_critical_power = resolvers.mbonus_material(5, 5),
	},
}

newEntity{
	power_source = {arcane=true},
	name = "earthen short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {earthen=true},
	level_range = {1, 50},
	rarity = 5,
	cost = 10,
	wielder = {
		combat_armor = resolvers.mbonus_material(5, 2),
		combat_armor_hardiness = resolvers.mbonus_material(5, 2),
		combat_physresist = resolvers.mbonus_material(5, 2),
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
		dam = resolvers.mbonus_material(5, 2),
	},
	wielder = {
		combat_spellpower = resolvers.mbonus_material(3, 2),
	},
	resolvers.command_staff(),
}

newEntity{
	power_source = {arcane=true},
	name = "shimmering short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {shimmering=true},
	level_range = {1, 50},
	rarity = 3,
	cost = 8,
	wielder = {
		max_mana = resolvers.mbonus_material(50, 30),
		mana_regen = resolvers.mbonus_material(20, 10, function(e, v) v=v/100 return 0, v end),
	},
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
	wielder = {
		spellsurge_on_crit = resolvers.mbonus_material(5, 2),
	},
}

newEntity{
	power_source = {arcane=true},
	name = "blighted short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {blight=true},
	level_range = {20, 50},
	greater_ego = 1,
	rarity = 30,
	cost = 40,
	wielder = {
		vim_on_crit = resolvers.mbonus_material(5, 1),
		max_vim =  resolvers.mbonus_material(15, 10),
		combat_spellpower = resolvers.mbonus_material(5, 2),
		combat_spellcrit = resolvers.mbonus_material(5, 5),
	},
}

newEntity{
	power_source = {arcane=true},
	name = "ethereal short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {ethereal=true},
	level_range = {20, 50},
	greater_ego = 1,
	rarity = 30,
	cost = 40,
	wielder = {
		combat_spellpower = resolvers.mbonus_material(5, 3),
		combat_def = resolvers.mbonus_material(10, 10),
		damage_shield_penetrate = resolvers.mbonus_material(10, 10),
		shield_factor=resolvers.mbonus_material(10, 5),
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
	combat = {is_greater = true,},
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
	wielder = {
		combat_spellpower = resolvers.mbonus_material(7, 3),
		life_regen = resolvers.mbonus_material(10, 5, function(e, v) v=v/10 return 0, v end),
		healing_factor = resolvers.mbonus_material(10, 10, function(e, v) v=v/100 return 0, v end),
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
	name = "magelord's short ", prefix=true, instant_resolve=true, dual_wieldable = true,
	slot_forbid = false,
	twohanded = false,
	keywords = {magelord=true},
	level_range = {20, 50},
	greater_ego = 1,
	rarity = 30,
	cost = 60,
	wielder = {
		combat_physcrit = resolvers.mbonus_material(4, 6),
		max_mana = resolvers.mbonus_material(50, 20),
		combat_spellpower = resolvers.mbonus_material(5, 5),
		melee_project = {
			[DamageType.ARCANE] = resolvers.mbonus_material(15, 15),
		},
	},
}
