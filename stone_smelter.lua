
--------------------------------------------------------------------------------
--
-- Stone Smelter
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "stone_smelter_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 80,
   }
)

simplecrafting_lib.register(
   "stone_smelter_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 40,
   }
)

simplecrafting_lib.register(
   "stone_smelter_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 40,
   }
)

simplecrafting_lib.register(
   "stone_smelter_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9 * 40,
   }
)

simplecrafting_lib.register(
   "stone_smelter",
   {
      input = {
         ["default:cobble"] = 10
      },
      output = "default:stone 12",
      cooktime = 5
})

simplecrafting_lib.register(
   "stone_smelter",
   {
      input = {
         ["default:desert_sand"] = 10
      },
      output = "default:desert_sandstone 12",
      cooktime = 5
})

simplecrafting_lib.register(
   "stone_smelter",
   {
      input = {
         ["default:sand"] = 10
      },
      output = "default:sandstone 12",
      cooktime = 5
})

simplecrafting_lib.register(
   "stone_smelter",
   {
      input = {
         ["default:silver_sand"] = 10
      },
      output = "default:silver_sandstone 12",
      cooktime = 5
})

simplecrafting_lib.register(
   "stone_smelter",
   {
      input = {
         ["default:limestone_dust"] = 5
      },
      output = "default:quicklime 3",
      cooktime = 8
})

simplecrafting_lib.register(
   "stone_smelter",
   {
      input = {
         ["default:coral_skeleton"] = 4
      },
      output = "default:quicklime 5",
      cooktime = 8
})

local stone_smelter_fns = simplecrafting_lib.generate_multifurnace_functions("stone_smelter", "stone_smelter_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Stone Smelter",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:stone_smelter_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Stone Smelter Recipe

local stone_smelter_recipe = {
   ["default:stone"] = 297,
   ["default:sandstone"] = 99,
   ["default:silver_sandstone"] = 99,
   ["default:desert_sandstone"] = 99,
   ["default:coal_lump"] = 198
}

simplecrafting_lib.register(
   "burner",
   {
      input = stone_smelter_recipe,
      output = "civindustry:stone_smelter 1",
      cooktime = 30
})

stone_smelter_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:stone_smelter"),
      { items = civindustry.factory_drops_from_recipe(stone_smelter_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:stone_smelter", {
	description = "Stone Smelter",
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png", "civindustry_stone_smelter_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = stone_smelter_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = stone_smelter_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = stone_smelter_fns.allow_metadata_inventory_take,
        can_dig = stone_smelter_fns.can_dig,
        on_construct = stone_smelter_fns.on_construct,
        on_metadata_inventory_move = stone_smelter_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = stone_smelter_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = stone_smelter_fns.on_metadata_inventory_take,
        on_receive_fields = stone_smelter_fns.on_receive_fields,
        on_timer = stone_smelter_fns.on_timer,
        drop = stone_smelter_fns.drop
})

minetest.register_node("civindustry:stone_smelter_active", {
	description = "Stone Smelter",
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png",
		{
			image = "civindustry_stone_smelter_front_active.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		}
	},
	paramtype2 = "facedir",
	light_source = 8,
	groups = {cracky=2, not_in_creative_inventory=1, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = stone_smelter_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = stone_smelter_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = stone_smelter_fns.allow_metadata_inventory_take,
        can_dig = stone_smelter_fns.can_dig,
        on_construct = stone_smelter_fns.on_construct,
        on_metadata_inventory_move = stone_smelter_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = stone_smelter_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = stone_smelter_fns.on_metadata_inventory_take,
        on_receive_fields = stone_smelter_fns.on_receive_fields,
        on_timer = stone_smelter_fns.on_timer,
        drop = stone_smelter_fns.drop
})
