
--------------------------------------------------------------------------------
--
-- Component Factory
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "component_factory_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 60,
   }
)

simplecrafting_lib.register(
   "component_factory_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "component_factory_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "component_factory_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9*30,
   }
)

simplecrafting_lib.register(
   "component_factory",
   {
      input = {
         ["default:flint"] = 20,
		 ["default:gravel"] = 20,
		 ["default:obsidian_shard"] = 10
      },
      output = "default:comp_sharp 50",
      cooktime = 180
})

simplecrafting_lib.register(
   "component_factory",
   {
      input = {
         ["default:flint"] = 20,
		 ["default:gravel"] = 20,
		 ["default:obsidian_shard"] = 10,
		 ["default:sand"] = 10,
		 ["default:steel_ingot"] = 2
      },
      output = "default:comp_sharp_adv 50",
      cooktime = 180
})

simplecrafting_lib.register(
   "component_factory",
   {
      input = {
         ["default:bronze_ingot"] = 20,
		 ["default:copper_ingot"] = 15,
		 ["default:iron_ingot"] = 15
      },
      output = "default:comp_hammer 50",
      cooktime = 180
})

simplecrafting_lib.register(
   "component_factory",
   {
      input = {
         ["default:bronze_ingot"] = 20,
		 ["default:steel_ingot"] = 10,
		 ["default:wrought_iron_ingot"] = 15
      },
      output = "default:comp_hammer_adv 50",
      cooktime = 180
})

simplecrafting_lib.register(
   "component_factory",
   {
      input = {
         ["farming:string"] = 80,
		 ["group:wool"] = 20,
      },
      output = "default:comp_fabric 20",
      cooktime = 60
})

simplecrafting_lib.register(
   "component_factory",
   {
      input = {
         ["default:flint"] = 4,
		 ["default:gravel"] = 4,
		 ["default:obsidian_shard"] = 4
      },
      output = "default:comp_sharp 10",
      cooktime = 60
})

simplecrafting_lib.register(
   "component_factory",
   {
      input = {
         ["default:flint"] = 4,
		 ["default:gravel"] = 4,
		 ["default:obsidian_shard"] = 4,
		 ["default:sand"] = 4,
		 ["default:steel_ingot"] = 1
      },
      output = "default:comp_sharp_adv 10",
      cooktime = 60
})

simplecrafting_lib.register(
   "component_factory",
   {
      input = {
         ["default:bronze_ingot"] = 4,
		 ["default:copper_ingot"] = 3,
		 ["default:iron_ingot"] = 3
      },
      output = "default:comp_hammer 10",
      cooktime = 60
})

simplecrafting_lib.register(
   "component_factory",
   {
      input = {
         ["default:bronze_ingot"] = 4,
		 ["default:steel_ingot"] = 3,
		 ["default:wrought_iron_ingot"] = 3
      },
      output = "default:comp_hammer_adv 10",
      cooktime = 60
})

simplecrafting_lib.register(
   "component_factory",
   {
      input = {
         ["farming:string"] = 4,
		 ["group:wool"] = 1,
      },
      output = "default:comp_fabric 1",
      cooktime = 5
})

local component_factory_fns = simplecrafting_lib.generate_multifurnace_functions("component_factory", "component_factory_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Component Factory",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:component_factory_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

component_factory_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:component_factory"),
      { items = civindustry.factory_drops_from_recipe(civindustry.component_factory_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:component_factory", {
	description = "Component Factory",
	tiles = {
		"civindustry_component_factory_top.png", "civindustry_component_factory_top.png",
		"civindustry_component_factory_side.png", "civindustry_component_factory_side.png",
		"civindustry_component_factory_side.png", "civindustry_component_factory_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = component_factory_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = component_factory_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = component_factory_fns.allow_metadata_inventory_take,
        can_dig = component_factory_fns.can_dig,
        on_construct = component_factory_fns.on_construct,
        on_metadata_inventory_move = component_factory_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = component_factory_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = component_factory_fns.on_metadata_inventory_take,
        on_receive_fields = component_factory_fns.on_receive_fields,
        on_timer = component_factory_fns.on_timer,
        drop = component_factory_fns.drop
})

minetest.register_node("civindustry:component_factory_active", {
	description = "Component Factory",
	tiles = {
		"civindustry_component_factory_top.png", "civindustry_component_factory_top.png",
		"civindustry_component_factory_side.png", "civindustry_component_factory_side.png",
		"civindustry_component_factory_side.png",
		{
			image = "civindustry_component_factory_active.png",
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

        allow_metadata_inventory_move = component_factory_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = component_factory_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = component_factory_fns.allow_metadata_inventory_take,
        can_dig = component_factory_fns.can_dig,
        on_construct = component_factory_fns.on_construct,
        on_metadata_inventory_move = component_factory_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = component_factory_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = component_factory_fns.on_metadata_inventory_take,
        on_receive_fields = component_factory_fns.on_receive_fields,
        on_timer = component_factory_fns.on_timer,
        drop = component_factory_fns.drop
})
