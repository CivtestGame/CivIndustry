
--------------------------------------------------------------------------------
--
-- Kiln
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "kiln_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 60,
   }
)

simplecrafting_lib.register(
   "kiln_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "kiln_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "kiln_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9*30,
   }
)

simplecrafting_lib.register(
   "kiln",
   {
      input = {
         ["group:sand"] = 40
      },
      output = "default:glass 50",
      cooktime = 60
})


simplecrafting_lib.register(
   "kiln",
   {
      input = {
         ["default:sand"] = 1
      },
      output = "default:glass 1",
      cooktime = 2
})

simplecrafting_lib.register(
   "kiln",
   {
      input = {
         ["default:desert_sand"] = 2
      },
      output = "default:glass 1",
      cooktime = 2
})

simplecrafting_lib.register(
   "kiln",
   {
      input = {
         ["default:silver_sand"] = 2
      },
      output = "default:glass 1",
      cooktime = 2
})

simplecrafting_lib.register(
   "kiln",
   {
      input = {
         ["default:sand"] = 1,
		 ["default:gravel"] = 1,
		 ["default:silver_sand"] = 1,
		 ["default:clay_lump"] = 4
      },
      output = "default:shingle_red 4",
      cooktime = 10
})

simplecrafting_lib.register(
   "kiln",
   {
      input = {
         ["default:sand"] = 1,
		 ["default:gravel"] = 1,
		 ["default:silver_sand"] = 1,
		 ["default:stone"] = 1
      },
      output = "default:shingle_slate 4",
      cooktime = 10
})

simplecrafting_lib.register(
   "kiln",
   {
      input = {
         ["default:sand"] = 1,
		 ["default:gravel"] = 1,
		 ["default:silver_sand"] = 1,
		 ["default:copper_lump"] = 1
      },
      output = "default:shingle_copper 4",
      cooktime = 10
})

simplecrafting_lib.register(
   "kiln",
   {
      input = {
         ["default:sand"] = 1,
		 ["default:gravel"] = 1,
		 ["default:silver_sand"] = 1,
		 ["default:dirt"] = 1
      },
      output = "default:shingle_mud 4",
      cooktime = 10
})

local kiln_fns = simplecrafting_lib.generate_multifurnace_functions("kiln", "kiln_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Kiln",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:kiln_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

kiln_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:kiln"),
      { items = civindustry.factory_drops_from_recipe(civindustry.kiln_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:kiln", {
	description = "Kiln",
	tiles = {
		"civindustry_kiln_top.png", "civindustry_kiln_top.png",
		"civindustry_kiln_side.png", "civindustry_kiln_side.png",
		"civindustry_kiln_side.png", "civindustry_kiln_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = kiln_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = kiln_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = kiln_fns.allow_metadata_inventory_take,
        can_dig = kiln_fns.can_dig,
        on_construct = kiln_fns.on_construct,
        on_metadata_inventory_move = kiln_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = kiln_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = kiln_fns.on_metadata_inventory_take,
        on_receive_fields = kiln_fns.on_receive_fields,
        on_timer = kiln_fns.on_timer,
        drop = kiln_fns.drop
})

minetest.register_node("civindustry:kiln_active", {
	description = "Kiln",
	tiles = {
		"civindustry_kiln_top.png", "civindustry_kiln_top.png",
		"civindustry_kiln_side.png", "civindustry_kiln_side.png",
		"civindustry_kiln_side.png",
		{
			image = "civindustry_kiln_active.png",
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

        allow_metadata_inventory_move = kiln_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = kiln_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = kiln_fns.allow_metadata_inventory_take,
        can_dig = kiln_fns.can_dig,
        on_construct = kiln_fns.on_construct,
        on_metadata_inventory_move = kiln_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = kiln_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = kiln_fns.on_metadata_inventory_take,
        on_receive_fields = kiln_fns.on_receive_fields,
        on_timer = kiln_fns.on_timer,
        drop = kiln_fns.drop
})
