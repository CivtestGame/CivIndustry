
--------------------------------------------------------------------------------
--
-- Munitions Factory
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "munitions_factory_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "munitions_factory_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "munitions_factory_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 60,
   }
)

simplecrafting_lib.register(
   "munitions_factory_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9*30,
   }
)

simplecrafting_lib.register(
   "munitions_factory",
   {
      input = {
         ["civindustry:black_powder"] = 20,
		 ["default:lead"] = 5,
		 ["default:brass_ingot"] = 2
      },
      output = "civarsenal:inv_shot_piercing 20",
      cooktime = 30
})

simplecrafting_lib.register(
   "munitions_factory",
   {
      input = {
         ["civindustry:black_powder"] = 40,
		 ["default:lead"] = 2,
		 ["default:brass_ingot"] = 2
      },
      output = "civarsenal:inv_shot_fragmentation 20",
      cooktime = 30
})

simplecrafting_lib.register(
   "munitions_factory",
   {
      input = {
         ["civindustry:black_powder"] = 5,
		 ["default:wrought_iron_ingot"] = 1
      },
      output = "civarsenal:cannonball_explosive 1",
      cooktime = 6
})

simplecrafting_lib.register(
   "munitions_factory",
   {
      input = {
         ["civindustry:black_powder"] = 60,
		 ["default:brass_ingot"] = 5
      },
      output = "civarsenal:shaped_charge 40",
      cooktime = 30
})

simplecrafting_lib.register(
   "munitions_factory",
   {
      input = {
         ["civindustry:black_powder"] = 40,
		 ["default:brass_ingot"] = 5
      },
      output = "civarsenal:large_explosive 5",
      cooktime = 30
})

local munitions_factory_fns = simplecrafting_lib.generate_multifurnace_functions("munitions_factory", "munitions_factory_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Munitions Factory",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:munitions_factory_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Munitions Factory Recipe

local munitions_factory_recipe = {
   ["default:lead"] = 198,
   ["default:brass_ingot"] = 99,
   ["civindustry:black_powder"] = 80
}

munitions_factory_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:munitions_factory"),
      { items = civindustry.factory_drops_from_recipe(munitions_factory_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:munitions_factory", {
	description = "Munitions Factory",
	tiles = {
		"civindustry_munitions_factory_top.png", "civindustry_munitions_factory_top.png",
		"civindustry_munitions_factory_side.png", "civindustry_munitions_factory_side.png",
		"civindustry_munitions_factory_side.png", "civindustry_munitions_factory_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = munitions_factory_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = munitions_factory_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = munitions_factory_fns.allow_metadata_inventory_take,
        can_dig = munitions_factory_fns.can_dig,
        on_construct = munitions_factory_fns.on_construct,
        on_metadata_inventory_move = munitions_factory_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = munitions_factory_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = munitions_factory_fns.on_metadata_inventory_take,
        on_receive_fields = munitions_factory_fns.on_receive_fields,
        on_timer = munitions_factory_fns.on_timer,
        drop = munitions_factory_fns.drop
})

minetest.register_node("civindustry:munitions_factory_active", {
	description = "Munitions Factory",
	tiles = {
		"civindustry_munitions_factory_top.png", "civindustry_munitions_factory_top.png",
		"civindustry_munitions_factory_side.png", "civindustry_munitions_factory_side.png",
		"civindustry_munitions_factory_side.png",
		{
			image = "civindustry_munitions_factory_active.png",
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

        allow_metadata_inventory_move = munitions_factory_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = munitions_factory_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = munitions_factory_fns.allow_metadata_inventory_take,
        can_dig = munitions_factory_fns.can_dig,
        on_construct = munitions_factory_fns.on_construct,
        on_metadata_inventory_move = munitions_factory_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = munitions_factory_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = munitions_factory_fns.on_metadata_inventory_take,
        on_receive_fields = munitions_factory_fns.on_receive_fields,
        on_timer = munitions_factory_fns.on_timer,
        drop = munitions_factory_fns.drop
})
