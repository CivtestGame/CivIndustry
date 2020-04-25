
--------------------------------------------------------------------------------
--
-- Exceptional Smelter
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "exceptional_smelter_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 40,
   }
)

simplecrafting_lib.register(
   "exceptional_smelter_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 5,
   }
)

simplecrafting_lib.register(
   "exceptional_smelter_fuel",
   {
      input = { ["default:coal"] = 1 },
      burntime = 5,
   }
)

simplecrafting_lib.register(
   "exceptional_smelter",
   {
      input = {
         ["default:stone_with_copper"] = 10
      },
      output = "default:copper_lump 12",
	  returns = {
        ["default:elem_zinc"] = 2,
		["default:elem_chromium"] = 1,
      },
      cooktime = 20
})

simplecrafting_lib.register(
   "exceptional_smelter",
   {
      input = {
         ["default:stone_with_tin"] = 10
      },
      output = "default:tin_lump 12",
	  returns = {
        ["default:elem_nickel"] = 1,
		["default:lead"] = 1,
		["default:elem_manganese"] = 1,
      },
      cooktime = 20
})

simplecrafting_lib.register(
   "exceptional_smelter",
   {
      input = {
         ["default:stone_with_iron"] = 10,
      },
      output = "default:iron_lump 12",
	  returns = {
        ["default:elem_manganese"] = 2,
		["default:elem_nickel"] = 1,
      },
      cooktime = 20
})

simplecrafting_lib.register(
   "exceptional_smelter",
   {
      input = {
         ["default:stone_with_gold"] = 10
      },
      output = "default:gold_lump 12",
	  returns = {
		["default:lead"] = 2,
		["default:elem_chromium"] = 1,
      },
      cooktime = 20
})

simplecrafting_lib.register(
   "exceptional_smelter",
   {
      input = {
         ["default:iron_lump"] = 1
      },
      output = "default:iron_ingot 1",
      cooktime = 2
})

simplecrafting_lib.register(
   "exceptional_smelter",
   {
      input = {
         ["default:gold_lump"] = 1
      },
      output = "default:gold_ingot 1",
      cooktime = 2
})

simplecrafting_lib.register(
   "exceptional_smelter",
   {
      input = {
         ["default:copper_lump"] = 1
      },
      output = "default:copper_ingot 1",
      cooktime = 1
})

simplecrafting_lib.register(
   "exceptional_smelter",
   {
      input = {
         ["default:tin_lump"] = 1
      },
      output = "default:tin_ingot 1",
      cooktime = 1
})

local exceptional_smelter_fns = simplecrafting_lib.generate_multifurnace_functions("exceptional_smelter", "exceptional_smelter_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Blast Furnace",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:exceptional_smelter_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Exceptional Smelter Recipe

local exceptional_smelter_recipe = {
   ["default:bronze_ingot"] = 297,
   ["default:iron_ingot"] = 297,
}

simplecrafting_lib.register(
   "advanced_smelter",
   {
      input = exceptional_smelter_recipe,
      output = "civindustry:exceptional_smelter 1",
      cooktime = 30
})

exceptional_smelter_fns.drop = {
   max_items = 1,
   items = {
      { items = civindustry.factory_drops_from_recipe(exceptional_smelter_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:exceptional_smelter", {
	description = "Blast Furnace",
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png", "civindustry_exceptional_smelter_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=1, level=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = exceptional_smelter_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = exceptional_smelter_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = exceptional_smelter_fns.allow_metadata_inventory_take,
        can_dig = exceptional_smelter_fns.can_dig,
        on_construct = exceptional_smelter_fns.on_construct,
        on_metadata_inventory_move = exceptional_smelter_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = exceptional_smelter_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = exceptional_smelter_fns.on_metadata_inventory_take,
        on_receive_fields = exceptional_smelter_fns.on_receive_fields,
        on_timer = exceptional_smelter_fns.on_timer,
        drop = exceptional_smelter_fns.drop
})

minetest.register_node("civindustry:exceptional_smelter_active", {
	description = "Blast Furnace",
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png",
		{
			image = "civindustry_exceptional_smelter_front_active.png",
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
	drop = "civindustry:exceptional_smelter",
	groups = {cracky=1, level=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = exceptional_smelter_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = exceptional_smelter_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = exceptional_smelter_fns.allow_metadata_inventory_take,
        can_dig = exceptional_smelter_fns.can_dig,
        on_construct = exceptional_smelter_fns.on_construct,
        on_metadata_inventory_move = exceptional_smelter_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = exceptional_smelter_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = exceptional_smelter_fns.on_metadata_inventory_take,
        on_receive_fields = exceptional_smelter_fns.on_receive_fields,
        on_timer = exceptional_smelter_fns.on_timer,
        drop = exceptional_smelter_fns.drop
})
