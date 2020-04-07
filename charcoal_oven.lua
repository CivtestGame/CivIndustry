
--------------------------------------------------------------------------------
--
-- Charcoal Oven
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "charcoal_oven_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "charcoal_oven_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "charcoal_oven_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9*30,
   }
)

simplecrafting_lib.register(
   "charcoal_oven",
   {
      input = {
         ["default:tree"] = 4,
		 ["default:wood"] = 3,
		 ["default:stick"] = 4
      },
      output = "default:charcoal 11",
      cooktime = 15
})

simplecrafting_lib.register(
   "charcoal_oven",
   {
      input = {
         ["default:acacia_tree"] = 4,
		 ["default:acacia_wood"] = 3,
		 ["default:stick"] = 4
      },
      output = "default:charcoal 11",
      cooktime = 15
})

simplecrafting_lib.register(
   "charcoal_oven",
   {
      input = {
         ["default:aspen_tree"] = 4,
		 ["default:aspen_wood"] = 3,
		 ["default:stick"] = 4
      },
      output = "default:charcoal 11",
      cooktime = 15
})


simplecrafting_lib.register(
   "charcoal_oven",
   {
      input = {
         ["default:pine_tree"] = 4,
		 ["default:pine_wood"] = 3,
		 ["default:stick"] = 4
      },
      output = "default:charcoal 11",
      cooktime = 15
})

simplecrafting_lib.register(
   "charcoal_oven",
   {
      input = {
         ["default:jungletree"] = 4,
		 ["default:junglewood"] = 3,
		 ["default:stick"] = 4
      },
      output = "default:charcoal 11",
      cooktime = 15
})

local charcoal_oven_fns = simplecrafting_lib.generate_multifurnace_functions("charcoal_oven", "charcoal_oven_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Charcoal Oven",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:charcoal_oven_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Charcoal Oven Recipe

local charcoal_oven_recipe = {
   ["default:tree"] = 198,
   ["default:stone"] = 99,
   ["default:charcoal"] = 198
}

simplecrafting_lib.register(
   "burner",
   {
      input = charcoal_oven_recipe,
      output = "civindustry:charcoal_oven 1",
      cooktime = 30
})

charcoal_oven_fns.drop = {
   max_items = 1,
   items = {
      { items = civindustry.factory_drops_from_recipe(charcoal_oven_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:charcoal_oven", {
	description = "Charcoal Oven",
	tiles = {
		"civindustry_charcoal_oven_top.png", "civindustry_charcoal_oven_top.png",
		"civindustry_charcoal_oven_side.png", "civindustry_charcoal_oven_side.png",
		"civindustry_charcoal_oven_side.png", "civindustry_charcoal_oven_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = charcoal_oven_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = charcoal_oven_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = charcoal_oven_fns.allow_metadata_inventory_take,
        can_dig = charcoal_oven_fns.can_dig,
        on_construct = charcoal_oven_fns.on_construct,
        on_metadata_inventory_move = charcoal_oven_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = charcoal_oven_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = charcoal_oven_fns.on_metadata_inventory_take,
        on_receive_fields = charcoal_oven_fns.on_receive_fields,
        on_timer = charcoal_oven_fns.on_timer,
        drop = charcoal_oven_fns.drop
})

minetest.register_node("civindustry:charcoal_oven_active", {
	description = "Charcoal Oven",
	tiles = {
		"civindustry_charcoal_oven_top.png", "civindustry_charcoal_oven_top.png",
		"civindustry_charcoal_oven_side.png", "civindustry_charcoal_oven_side.png",
		"civindustry_charcoal_oven_side.png",
		{
			image = "civindustry_charcoal_oven_active.png",
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
	drop = "civindustry:charcoal_oven",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = charcoal_oven_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = charcoal_oven_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = charcoal_oven_fns.allow_metadata_inventory_take,
        can_dig = charcoal_oven_fns.can_dig,
        on_construct = charcoal_oven_fns.on_construct,
        on_metadata_inventory_move = charcoal_oven_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = charcoal_oven_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = charcoal_oven_fns.on_metadata_inventory_take,
        on_receive_fields = charcoal_oven_fns.on_receive_fields,
        on_timer = charcoal_oven_fns.on_timer,
        drop = charcoal_oven_fns.drop
})