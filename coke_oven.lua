
--------------------------------------------------------------------------------
--
-- Coke Oven
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "coke_oven_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 60,
   }
)

simplecrafting_lib.register(
   "coke_oven_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "coke_oven_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "coke_oven_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9*30,
   }
)

simplecrafting_lib.register(
   "coke_oven",
   {
      input = {
         ["default:coal_lump"] = 8
      },
      output = "default:coke 5",
      cooktime = 15
})

local coke_oven_fns = simplecrafting_lib.generate_multifurnace_functions("coke_oven", "coke_oven_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Coke Oven",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:coke_oven_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Coke Oven Recipe

local coke_oven_recipe = {
   ["default:stone"] = 198,
   ["default:coke"] = 198
}

simplecrafting_lib.register(
   "burner",
   {
      input = coke_oven_recipe,
      output = "civindustry:coke_oven 1",
      cooktime = 30
})

coke_oven_fns.drop = {
   max_items = 1,
   items = {
      { items = civindustry.factory_drops_from_recipe(coke_oven_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:coke_oven", {
	description = "Coke Oven",
	tiles = {
		"civindustry_coke_oven_top.png", "civindustry_coke_oven_top.png",
		"civindustry_coke_oven_side.png", "civindustry_coke_oven_side.png",
		"civindustry_coke_oven_side.png", "civindustry_coke_oven_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = coke_oven_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = coke_oven_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = coke_oven_fns.allow_metadata_inventory_take,
        can_dig = coke_oven_fns.can_dig,
        on_construct = coke_oven_fns.on_construct,
        on_metadata_inventory_move = coke_oven_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = coke_oven_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = coke_oven_fns.on_metadata_inventory_take,
        on_receive_fields = coke_oven_fns.on_receive_fields,
        on_timer = coke_oven_fns.on_timer,
        drop = coke_oven_fns.drop
})

minetest.register_node("civindustry:coke_oven_active", {
	description = "Coke Oven",
	tiles = {
		"civindustry_coke_oven_top.png", "civindustry_coke_oven_top.png",
		"civindustry_coke_oven_side.png", "civindustry_coke_oven_side.png",
		"civindustry_coke_oven_side.png",
		{
			image = "civindustry_coke_oven_active.png",
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
	drop = "civindustry:coke_oven",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = coke_oven_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = coke_oven_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = coke_oven_fns.allow_metadata_inventory_take,
        can_dig = coke_oven_fns.can_dig,
        on_construct = coke_oven_fns.on_construct,
        on_metadata_inventory_move = coke_oven_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = coke_oven_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = coke_oven_fns.on_metadata_inventory_take,
        on_receive_fields = coke_oven_fns.on_receive_fields,
        on_timer = coke_oven_fns.on_timer,
        drop = coke_oven_fns.drop
})
