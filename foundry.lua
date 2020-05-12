
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

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:steel_lump"] = 12,
		 ["default:comp_hammer"] = 1,
		 ["default:sand"] = 5
      },
      output = "default:comp_steel_axehead 5",
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
      output = "default:comp_fine_steel_axehead 5",
      cooktime = 60
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:steel_lump"] = 4,
		 ["default:comp_hammer"] = 1,
		 ["default:sand"] = 5
      },
      output = "default:comp_steel_shovelhead 5",
      cooktime = 60
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:fine_steel_lump"] = 4,
		 ["default:comp_hammer_adv"] = 1,
		 ["default:sand"] = 5
      },
      output = "default:comp_fine_steel_shovelhead 5",
      cooktime = 60
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:steel_lump"] = 8,
		 ["default:comp_hammer"] = 1,
		 ["default:sand"] = 5
      },
      output = "default:comp_steel_swordhead 5",
      cooktime = 60
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:fine_steel_lump"] = 8,
		 ["default:comp_hammer_adv"] = 1,
		 ["default:sand"] = 5
      },
      output = "default:comp_fine_steel_swordhead 5",
      cooktime = 60
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:iron_ingot"] = 5,
		 ["default:sand"] = 1
      },
      output = "default:comp_iron_chain 10",
      cooktime = 20
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:iron_ingot"] = 6,
		 ["default:comp_hammer"] = 1,
		 ["default:sand"] = 1
      },
      output = "default:comp_iron_scale 10",
      cooktime = 20
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:iron_ingot"] = 8,
		 ["default:comp_hammer"] = 1,
		 ["default:sand"] = 1
      },
      output = "default:comp_iron_plate 10",
      cooktime = 20
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:steel_ingot"] = 5,
		 ["default:sand"] = 1
      },
      output = "default:comp_steel_chain 10",
      cooktime = 20
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:steel_ingot"] = 6,
		 ["default:comp_hammer"] = 1,
		 ["default:sand"] = 1
      },
      output = "default:comp_steel_scale 10",
      cooktime = 20
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:steel_ingot"] = 8,
		 ["default:comp_hammer"] = 1,
		 ["default:sand"] = 1
      },
      output = "default:comp_steel_plate 10",
      cooktime = 20
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:fine_steel_ingot"] = 5,
		 ["default:sand"] = 1
      },
      output = "default:comp_fine_steel_chain 10",
      cooktime = 20
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:fine_steel_ingot"] = 6,
		 ["default:comp_hammer_adv"] = 1,
		 ["default:sand"] = 1
      },
      output = "default:comp_fine_steel_scale 10",
      cooktime = 20
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:fine_steel_ingot"] = 8,
		 ["default:comp_hammer_adv"] = 1,
		 ["default:sand"] = 1
      },
      output = "default:comp_fine_steel_plate 10",
      cooktime = 20
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:bronze_ingot"] = 5
      },
      output = "citadella:reinf_rebar_bronze 20",
      cooktime = 5
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:wrought_iron_ingot"] = 5
      },
      output = "citadella:reinf_rebar_wrought_iron 20",
      cooktime = 10
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:fine_steel_ingot"] = 5
      },
      output = "citadella:reinf_rebar_fine_steel 20",
      cooktime = 20
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:tin_ingot"] = 20,
		 ["default:comp_hammer"] = 1
      },
      output = "citadella:reinf_plating_tin 10",
      cooktime = 5
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:brass_ingot"] = 20,
		 ["default:comp_hammer_adv"] = 1
      },
      output = "citadella:reinf_plating_brass 10",
      cooktime = 10
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["default:alubronze_ingot"] = 20,
		 ["default:comp_hammer_adv"] = 1
      },
      output = "citadella:reinf_plating_alubronze 10",
      cooktime = 20
})

simplecrafting_lib.register(
   "foundry",
   {
      input = {
         ["group:ferrous_ingot"] = 4,
		 ["default:steel_ingot"] = 4,
		 ["group:tree"] = 2
      },
      output = "civarsenal:handcannon",
      cooktime = 20
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
	groups = {cracky=1},
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
	groups = {cracky=1, not_in_creative_inventory=1},
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
