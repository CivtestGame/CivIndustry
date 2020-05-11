
--------------------------------------------------------------------------------
--
-- Smelter
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "smelter_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 50,
   }
)

simplecrafting_lib.register(
   "smelter_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "smelter_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "smelter_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9*30,
   }
)

simplecrafting_lib.register(
   "smelter",
   {
      input = {
         ["default:stone_with_copper"] = 1
      },
      output = "default:copper_lump 1",
      cooktime = 15
})

simplecrafting_lib.register(
   "smelter",
   {
      input = {
         ["default:copper_lump"] = 1
      },
      output = "default:copper_ingot 1",
      cooktime = 5
})

simplecrafting_lib.register(
   "smelter",
   {
      input = {
         ["default:stone_with_tin"] = 1
      },
      output = "default:tin_lump 1",
      cooktime = 15
})

simplecrafting_lib.register(
   "smelter",
   {
      input = {
         ["default:tin_lump"] = 1
      },
      output = "default:tin_ingot 1",
      cooktime = 5
})

simplecrafting_lib.register(
   "smelter",
   {
      input = {
         ["default:tin_lump"] = 1,
         ["default:copper_lump"] = 3,
      },
      output = "default:bronze_ingot 4",
      cooktime = 10
})

simplecrafting_lib.register(
   "smelter",
   {
      input = {
         ["default:tin_ingot"] = 1,
         ["default:copper_ingot"] = 3,
      },
      output = "default:bronze_ingot 4",
      cooktime = 30
})

local smelter_fns = simplecrafting_lib.generate_multifurnace_functions("smelter", "smelter_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Smelter",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:smelter_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Smelter Recipe

local smelter_recipe = {
   ["default:quicklime"] = 99,
   ["default:charcoal"] = 99,
   ["default:coke"] = 99
}

simplecrafting_lib.register(
   "burner",
   {
      input = smelter_recipe,
      output = "civindustry:smelter 1",
      cooktime = 30
})

smelter_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:smelter"),
      { items = civindustry.factory_drops_from_recipe(smelter_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:smelter", {
	description = "Smelter",
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png", "civindustry_smelter_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = smelter_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = smelter_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = smelter_fns.allow_metadata_inventory_take,
        can_dig = smelter_fns.can_dig,
        on_construct = smelter_fns.on_construct,
        on_metadata_inventory_move = smelter_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = smelter_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = smelter_fns.on_metadata_inventory_take,
        on_receive_fields = smelter_fns.on_receive_fields,
        on_timer = smelter_fns.on_timer,
        drop = smelter_fns.drop
})

minetest.register_node("civindustry:smelter_active", {
	description = "Smelter",
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png",
		{
			image = "civindustry_smelter_front_active.png",
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

        allow_metadata_inventory_move = smelter_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = smelter_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = smelter_fns.allow_metadata_inventory_take,
        can_dig = smelter_fns.can_dig,
        on_construct = smelter_fns.on_construct,
        on_metadata_inventory_move = smelter_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = smelter_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = smelter_fns.on_metadata_inventory_take,
        on_receive_fields = smelter_fns.on_receive_fields,
        on_timer = smelter_fns.on_timer,
        drop = smelter_fns.drop
})
