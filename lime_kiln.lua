
--------------------------------------------------------------------------------
--
-- Stone Smelter
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "lime_kiln_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 80,
   }
)

simplecrafting_lib.register(
   "lime_kiln_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 40,
   }
)

simplecrafting_lib.register(
   "lime_kiln_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 40,
   }
)

simplecrafting_lib.register(
   "lime_kiln_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 360,
   }
)

simplecrafting_lib.register(
   "lime_kiln",
   {
      input = {
         ["default:limestone_dust"] = 60
      },
      output = "default:quicklime 40",
	  returns = {
		["default:slag"] = 10,
      },
      cooktime = 160
})

simplecrafting_lib.register(
   "lime_kiln",
   {
      input = {
         ["default:coral_skeleton"] = 40
      },
      output = "default:quicklime 40",
	  returns = {
		["default:slag"] = 10,
      },
      cooktime = 160
})

local lime_kiln_fns = simplecrafting_lib.generate_multifurnace_functions("lime_kiln", "lime_kiln_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Lime Kiln",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:lime_kiln_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Lime Kiln Recipe

local lime_kiln_recipe = {
   ["default:stone"] = 99,
   ["default:clay_brick"] = 198,
   ["default:brass_ingot"] = 99
}

lime_kiln_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:lime_kiln"),
      { items = civindustry.factory_drops_from_recipe(lime_kiln_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:lime_kiln", {
	description = "Lime Kiln",
	tiles = {
		"civindustry_lime_kiln_top.png", "civindustry_lime_kiln_side.png",
		"civindustry_lime_kiln_side.png", "civindustry_lime_kiln_side.png",
		"civindustry_lime_kiln_side.png", "civindustry_lime_kiln_side.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = lime_kiln_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = lime_kiln_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = lime_kiln_fns.allow_metadata_inventory_take,
        can_dig = lime_kiln_fns.can_dig,
        on_construct = lime_kiln_fns.on_construct,
        on_metadata_inventory_move = lime_kiln_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = lime_kiln_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = lime_kiln_fns.on_metadata_inventory_take,
        on_receive_fields = lime_kiln_fns.on_receive_fields,
        on_timer = lime_kiln_fns.on_timer,
        drop = lime_kiln_fns.drop
})

minetest.register_node("civindustry:lime_kiln_active", {
	description = "Lime Kiln",
	tiles = {
		{
			image = "civindustry_lime_kiln_top_active.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		}, "civindustry_lime_kiln_side.png",
		"civindustry_lime_kiln_side.png", "civindustry_lime_kiln_side.png",
		"civindustry_lime_kiln_side.png", "civindustry_lime_kiln_side.png"

	},
	paramtype2 = "facedir",
	light_source = 8,
	groups = {cracky=2, not_in_creative_inventory=1, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = lime_kiln_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = lime_kiln_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = lime_kiln_fns.allow_metadata_inventory_take,
        can_dig = lime_kiln_fns.can_dig,
        on_construct = lime_kiln_fns.on_construct,
        on_metadata_inventory_move = lime_kiln_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = lime_kiln_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = lime_kiln_fns.on_metadata_inventory_take,
        on_receive_fields = lime_kiln_fns.on_receive_fields,
        on_timer = lime_kiln_fns.on_timer,
        drop = lime_kiln_fns.drop
})
