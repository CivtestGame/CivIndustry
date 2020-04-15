
--------------------------------------------------------------------------------
--
-- Alloy Smelter
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "alloy_smelter_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 80,
   }
)

simplecrafting_lib.register(
   "alloy_smelter_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 10,
   }
)

simplecrafting_lib.register(
   "alloy_smelter_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 10,
   }
)

simplecrafting_lib.register(
   "alloy_smelter",
   {
      input = {
         ["default:copper_lump"] = 4,
		 ["default:tin_lump"] = 1
      },
      output = "default:bronze_ingot 5",
      cooktime = 20
})

simplecrafting_lib.register(
   "alloy_smelter",
   {
      input = {
         ["default:copper_ingot"] = 4,
		 ["default:tin_ingot"] = 1
      },
      output = "default:bronze_ingot 5",
      cooktime = 20
})


simplecrafting_lib.register(
   "alloy_smelter",
   {
      input = {
         ["default:copper_lump"] = 6,
		 ["default:tin_lump"] = 1,
		 ["default:elem_zinc"] = 3
      },
      output = "default:brass_ingot 10",
      cooktime = 40
})

simplecrafting_lib.register(
   "alloy_smelter",
   {
      input = {
		 ["default:tin_lump"] = 8,
		 ["default:elem_lead"] = 2
      },
      output = "default:elem_pewter 10",
      cooktime = 40
})

simplecrafting_lib.register(
   "alloy_smelter",
   {
      input = {
         ["default:aluminium_ingot"] = 4,
		 ["default:copper_lump"] = 5,
		 ["default:elem_zinc"] = 1
      },
      output = "default:alubronze_ingot 10",
      cooktime = 40
})


local alloy_smelter_fns = simplecrafting_lib.generate_multifurnace_functions("alloy_smelter", "alloy_smelter_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Alloy Smelter",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:alloy_smelter_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Alloy Smelter Recipe

local alloy_smelter_recipe = {
   ["default:bronze_ingot"] = 297,
   ["default:wrought_iron_ingot"] = 99,
}

simplecrafting_lib.register(
   "advanced_smelter",
   {
      input = alloy_smelter_recipe,
      output = "civindustry:alloy_smelter 1",
      cooktime = 30
})

alloy_smelter_fns.drop = {
   max_items = 1,
   items = {
      { items = civindustry.factory_drops_from_recipe(alloy_smelter_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:alloy_smelter", {
	description = "Alloy Smelter",
	tiles = {
		"civindustry_alloy_smelter_top.png", "civindustry_alloy_smelter_top.png",
		"civindustry_alloy_smelter_side.png", "civindustry_alloy_smelter_side.png",
		"civindustry_alloy_smelter_side.png", "civindustry_alloy_smelter_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=1, level=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = alloy_smelter_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = alloy_smelter_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = alloy_smelter_fns.allow_metadata_inventory_take,
        can_dig = alloy_smelter_fns.can_dig,
        on_construct = alloy_smelter_fns.on_construct,
        on_metadata_inventory_move = alloy_smelter_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = alloy_smelter_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = alloy_smelter_fns.on_metadata_inventory_take,
        on_receive_fields = alloy_smelter_fns.on_receive_fields,
        on_timer = alloy_smelter_fns.on_timer,
        drop = alloy_smelter_fns.drop
})

minetest.register_node("civindustry:alloy_smelter_active", {
	description = "Alloy Smelter",
	tiles = {
		"civindustry_alloy_smelter_top.png", "civindustry_alloy_smelter_top.png",
		"civindustry_alloy_smelter_side.png", "civindustry_alloy_smelter_side.png",
		"civindustry_alloy_smelter_side.png",
		{
			image = "civindustry_alloy_smelter_active.png",
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
	drop = "civindustry:alloy_smelter",
	groups = {cracky=1, level=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = alloy_smelter_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = alloy_smelter_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = alloy_smelter_fns.allow_metadata_inventory_take,
        can_dig = alloy_smelter_fns.can_dig,
        on_construct = alloy_smelter_fns.on_construct,
        on_metadata_inventory_move = alloy_smelter_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = alloy_smelter_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = alloy_smelter_fns.on_metadata_inventory_take,
        on_receive_fields = alloy_smelter_fns.on_receive_fields,
        on_timer = alloy_smelter_fns.on_timer,
        drop = alloy_smelter_fns.drop
})
