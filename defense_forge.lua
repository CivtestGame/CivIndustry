
--------------------------------------------------------------------------------
--
-- Defense Forge
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "defense_forge_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "defense_forge_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "defense_forge_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 60,
   }
)

simplecrafting_lib.register(
   "defense_forge_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9*30,
   }
)

simplecrafting_lib.register(
   "defense_forge",
   {
      input = {
         ["default:bronze_ingot"] = 10
      },
      output = "citadella:reinf_rebar_bronze 50",
      cooktime = 5
})

simplecrafting_lib.register(
   "defense_forge",
   {
      input = {
         ["default:wrought_iron_ingot"] = 10
      },
      output = "citadella:reinf_rebar_wrought_iron 50",
      cooktime = 10
})

simplecrafting_lib.register(
   "defense_forge",
   {
      input = {
         ["default:fine_steel_ingot"] = 10
      },
      output = "citadella:reinf_rebar_fine_steel 50",
      cooktime = 20
})

simplecrafting_lib.register(
   "defense_forge",
   {
      input = {
         ["default:tin_ingot"] = 30,
		 ["default:comp_hammer"] = 2
      },
      output = "citadella:reinf_plating_tin 20",
      cooktime = 5
})

simplecrafting_lib.register(
   "defense_forge",
   {
      input = {
         ["default:brass_ingot"] = 30,
		 ["default:comp_hammer_adv"] = 2
      },
      output = "citadella:reinf_plating_brass 20",
      cooktime = 10
})

simplecrafting_lib.register(
   "defense_forge",
   {
      input = {
         ["default:alubronze_ingot"] = 30,
		 ["default:comp_hammer_adv"] = 2
      },
      output = "citadella:reinf_plating_alubronze 20",
      cooktime = 20
})

simplecrafting_lib.register(
   "defense_forge",
   {
      input = {
         ["default:obsidian"] = 20,
		 ["default:tin_ingot"] = 20,
		 ["default:steel_ingot"] = 20,
		 ["default:comp_hammer_adv"] = 1
      },
      output = "default:stronghold_bricks 10",
      cooktime = 10
})

simplecrafting_lib.register(
   "defense_forge",
   {
      input = {
         ["default:obsidian"] = 20,
		 ["default:tin_ingot"] = 20,
		 ["default:fine_steel_ingot"] = 10,
		 ["default:comp_hammer_adv"] = 1
      },
      output = "default:fortress_bricks 10",
      cooktime = 10
})

doors.register("civindustry:door_vault", {
		tiles = {{name = "doors_door_steel.png", backface_culling = true}},
		description = "Vault Door",
		inventory_image = "doors_item_steel.png",
		protected = true,
		groups = {cracky = 1, level = 3},
		sounds = default.node_sound_metal_defaults(),
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
})

doors.register_trapdoor("civindustry:trapdoor_vault", {
	description = "Vault Trapdoor",
	inventory_image = "doors_trapdoor_steel.png",
	wield_image = "doors_trapdoor_steel.png",
	tile_front = "doors_trapdoor_steel.png",
	tile_side = "doors_trapdoor_steel_side.png",
	protected = true,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	groups = {cracky = 1, level = 3, door = 1},
})

simplecrafting_lib.register(
   "defense_forge",
   {
      input = {
		 ["default:fine_steel_ingot"] = 10,
		 ["default:comp_hammer_adv"] = 1
      },
      output = "civindustry:door_vault 1",
      cooktime = 2
})

simplecrafting_lib.register(
   "defense_forge",
   {
      input = {
		 ["default:fine_steel_ingot"] = 5,
		 ["default:comp_hammer_adv"] = 1
      },
      output = "civindustry:trapdoor_vault 1",
      cooktime = 2
})

local defense_forge_fns = simplecrafting_lib.generate_multifurnace_functions("defense_forge", "defense_forge_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Defense Forge",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:defense_forge_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

defense_forge_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:defense_forge"),
      { items = civindustry.factory_drops_from_recipe(civindustry.defense_forge_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:defense_forge", {
	description = "Defense Forge",
	tiles = {
		"civindustry_defense_forge_top.png", "civindustry_defense_forge_top.png",
		"civindustry_defense_forge_side.png", "civindustry_defense_forge_side.png",
		"civindustry_defense_forge_side.png", "civindustry_defense_forge_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = defense_forge_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = defense_forge_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = defense_forge_fns.allow_metadata_inventory_take,
        can_dig = defense_forge_fns.can_dig,
        on_construct = defense_forge_fns.on_construct,
        on_metadata_inventory_move = defense_forge_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = defense_forge_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = defense_forge_fns.on_metadata_inventory_take,
        on_receive_fields = defense_forge_fns.on_receive_fields,
        on_timer = defense_forge_fns.on_timer,
        drop = defense_forge_fns.drop
})

minetest.register_node("civindustry:defense_forge_active", {
	description = "Defense Forge",
	tiles = {
		"civindustry_defense_forge_top.png", "civindustry_defense_forge_top.png",
		"civindustry_defense_forge_side.png", "civindustry_defense_forge_side.png",
		"civindustry_defense_forge_side.png",
		{
			image = "civindustry_defense_forge_active.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5
			},
		}
	},
	paramtype2 = "facedir",
	light_source = 8,
	groups = {cracky=2, not_in_creative_inventory=1, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = defense_forge_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = defense_forge_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = defense_forge_fns.allow_metadata_inventory_take,
        can_dig = defense_forge_fns.can_dig,
        on_construct = defense_forge_fns.on_construct,
        on_metadata_inventory_move = defense_forge_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = defense_forge_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = defense_forge_fns.on_metadata_inventory_take,
        on_receive_fields = defense_forge_fns.on_receive_fields,
        on_timer = defense_forge_fns.on_timer,
        drop = defense_forge_fns.drop
})
