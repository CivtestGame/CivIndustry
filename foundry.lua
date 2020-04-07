
--------------------------------------------------------------------------------
--
-- Foundry
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "foundry_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 60,
   }
)

simplecrafting_lib.register(
   "foundry_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "foundry_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "foundry_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9*30,
   }
)

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:iron_lump"] = 5,
		 ["bucket:bucket_water"] = 1,
      },
      output = "default:wrought_iron_lump 5",
    -- Items which the crafting recipe produces, but is not
    -- formally used to make.
      returns = {
         ["bucket:bucket_empty"] = 1,
      },
      cooktime = 10
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:wrought_iron_lump"] = 1
      },
      output = "default:wrought_iron_ingot 1",
      cooktime = 5
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:wrought_iron_lump"] = 12,
		 ["default:comp_hammer"] = 1,
		 ["default:sand"] = 5
      },
      output = "default:comp_wrought_iron_pickhead 5",
      cooktime = 60
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:steel_lump"] = 12,
		 ["default:comp_hammer"] = 1,
		 ["default:sand"] = 5
      },
      output = "default:comp_steel_pickhead 5",
      cooktime = 60
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:fine_steel_lump"] = 12,
		 ["default:comp_hammer_adv"] = 1,
		 ["default:sand"] = 5
      },
      output = "default:comp_fine_steel_pickhead 5",
      cooktime = 60
})

local foundry_fns = simplecrafting_lib.generate_multifurnace_functions("foundry", "foundry_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Foundry",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:foundry_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Foundry Recipe

local foundry_recipe = {
   ["default:stone"] = 99,
   ["default:sand"] = 99,
   ["default:iron_ingot"] = 99,
   ["default:tin_ingot"] = 99
}

simplecrafting_lib.register(
   "assembler",
   {
      input = foundry_recipe,
      output = "civindustry:foundry 1",
      cooktime = 30
})

foundry_fns.drop = {
   max_items = 1,
   items = {
      { items = civindustry.factory_drops_from_recipe(foundry_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:foundry", {
	description = "Foundry",
	tiles = {
		"civindustry_foundry_top.png", "civindustry_foundry_top.png",
		"civindustry_foundry_side.png", "civindustry_foundry_side.png",
		"civindustry_foundry_side.png", "civindustry_foundry_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = foundry_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = foundry_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = foundry_fns.allow_metadata_inventory_take,
        can_dig = foundry_fns.can_dig,
        on_construct = foundry_fns.on_construct,
        on_metadata_inventory_move = foundry_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = foundry_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = foundry_fns.on_metadata_inventory_take,
        on_receive_fields = foundry_fns.on_receive_fields,
        on_timer = foundry_fns.on_timer,
        drop = foundry_fns.drop
})

minetest.register_node("civindustry:foundry_active", {
	description = "Foundry",
	tiles = {
		"civindustry_foundry_top.png", "civindustry_foundry_top.png",
		"civindustry_foundry_side.png", "civindustry_foundry_side.png",
		"civindustry_foundry_side.png",
		{
			image = "civindustry_foundry_active.png",
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
	drop = "civindustry:foundry",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = foundry_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = foundry_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = foundry_fns.allow_metadata_inventory_take,
        can_dig = foundry_fns.can_dig,
        on_construct = foundry_fns.on_construct,
        on_metadata_inventory_move = foundry_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = foundry_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = foundry_fns.on_metadata_inventory_take,
        on_receive_fields = foundry_fns.on_receive_fields,
        on_timer = foundry_fns.on_timer,
        drop = foundry_fns.drop
})