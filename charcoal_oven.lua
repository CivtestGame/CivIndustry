
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
         ["group:tree"] = 99,
      },
      output = "default:charcoal 401",
      cooktime = 300
})

simplecrafting_lib.register(
   "charcoal_oven",
   {
      input = {
         ["group:tree"] = 12,
      },
      output = "default:charcoal 41",
      cooktime = 30
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
   ["group:tree"] = 198,
   ["default:stone"] = 99,
   ["default:charcoal"] = 198
}

charcoal_oven_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:charcoal_oven"),
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
	groups = {cracky=2, factory=3},
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
	groups = {cracky=2, not_in_creative_inventory=1, factory=3},
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
