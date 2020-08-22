
--------------------------------------------------------------------------------
--
-- Chemical Processor
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "chemical_processor_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "chemical_processor_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "chemical_processor_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 60,
   }
)

simplecrafting_lib.register(
   "chemical_processor_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9*30,
   }
)

simplecrafting_lib.register(
   "chemical_processor",
   {
      input = {
         ["default:silver_sand"] = 16,
		 ["default:quicklime"] = 4
      },
      output = "default:elem_niter 8",
	  returns = {
		["default:slag"] = 4,
      },
      cooktime = 10
})

simplecrafting_lib.register(
   "chemical_processor",
   {
      input = {
         ["default:elem_niter"] = 8,
		 ["default:elem_sulphur"] = 16,
		 ["default:flint"] = 1,
		 ["default:charcoal"] = 4,
      },
      output = "civindustry:black_powder 40",
      cooktime = 30
})

local chemical_processor_fns = simplecrafting_lib.generate_multifurnace_functions("chemical_processor", "chemical_processor_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Chemical Processor",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:chemical_processor_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Chemical Processor Recipe

local chemical_processor_recipe = {
   ["default:elem_pewter"] = 99,
   ["group:metal_ingot"] = 298
}

chemical_processor_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:chemical_processor"),
      { items = civindustry.factory_drops_from_recipe(chemical_processor_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:chemical_processor", {
	description = "Chemical Processor",
	tiles = {
		"civindustry_chemical_processor_top.png", "civindustry_chemical_processor_top.png",
		"civindustry_chemical_processor_side.png", "civindustry_chemical_processor_side.png",
		"civindustry_chemical_processor_side.png", "civindustry_chemical_processor_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = chemical_processor_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = chemical_processor_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = chemical_processor_fns.allow_metadata_inventory_take,
        can_dig = chemical_processor_fns.can_dig,
        on_construct = chemical_processor_fns.on_construct,
        on_metadata_inventory_move = chemical_processor_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = chemical_processor_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = chemical_processor_fns.on_metadata_inventory_take,
        on_receive_fields = chemical_processor_fns.on_receive_fields,
        on_timer = chemical_processor_fns.on_timer,
        drop = chemical_processor_fns.drop
})

minetest.register_node("civindustry:chemical_processor_active", {
	description = "Chemical Processor",
	tiles = {
		"civindustry_chemical_processor_top.png", "civindustry_chemical_processor_top.png",
		"civindustry_chemical_processor_side.png", "civindustry_chemical_processor_side.png",
		"civindustry_chemical_processor_side.png",
		{
			image = "civindustry_chemical_processor_active.png",
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

        allow_metadata_inventory_move = chemical_processor_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = chemical_processor_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = chemical_processor_fns.allow_metadata_inventory_take,
        can_dig = chemical_processor_fns.can_dig,
        on_construct = chemical_processor_fns.on_construct,
        on_metadata_inventory_move = chemical_processor_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = chemical_processor_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = chemical_processor_fns.on_metadata_inventory_take,
        on_receive_fields = chemical_processor_fns.on_receive_fields,
        on_timer = chemical_processor_fns.on_timer,
        drop = chemical_processor_fns.drop
})
