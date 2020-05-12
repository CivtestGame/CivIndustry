
--------------------------------------------------------------------------------
--
-- Assembler
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "assembler_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 40,
   }
)

simplecrafting_lib.register(
   "assembler_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 40,
   }
)

simplecrafting_lib.register(
   "smelter_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9*40,
   }
)

simplecrafting_lib.register(
   "assembler",
   {
      input = {
         ["default:bronze_ingot"] = 1,
		 ["farming:string"] = 4
      },
      output = "default:comp_toolrod 1",
      cooktime = 20
})

simplecrafting_lib.register(
   "assembler",
   {
      input = {
         ["default:steel_ingot"] = 1,
		 ["farming:string"] = 8
      },
      output = "default:comp_toolrod_strong 1",
      cooktime = 20
})

simplecrafting_lib.register(
   "assembler",
   {
      input = {
         ["default:paper"] = 2,
		 ["default:torch"] = 1
      },
      output = "default:hanging_paper_lantern 1",
      cooktime = 20
})

simplecrafting_lib.register(
   "assembler",
   {
      input = {
         ["default:copper_ingot"] = 2,
		 ["default:torch"] = 2,
		 ["default:glass"] = 1
      },
      output = "default:copper_lantern_square 2",
      cooktime = 20
})


simplecrafting_lib.register(
   "assembler",
   {
      input = {
         ["default:bronze_ingot"] = 2,
		 ["default:torch"] = 2,
		 ["default:glass"] = 1
      },
      output = "default:bronze_lantern_square 2",
      cooktime = 20
})

simplecrafting_lib.register(
   "assembler",
   {
      input = {
         ["default:wrought_iron_ingot"] = 2,
		 ["default:torch"] = 2,
		 ["default:glass"] = 1
      },
      output = "default:iron_lantern_square 2",
      cooktime = 20
})

simplecrafting_lib.register(
   "assembler",
   {
      input = {
         ["default:steel_ingot"] = 2,
		 ["default:torch"] = 2,
		 ["default:glass"] = 1
      },
      output = "default:steel_lantern_square 2",
      cooktime = 20
})

simplecrafting_lib.register(
   "assembler",
   {
      input = {
         ["group:tree"] = 4,
		 ["farming:string"] = 6
      },
      output = "civarsenal:bow_wood_long",
      cooktime = 20
})

simplecrafting_lib.register(
   "assembler",
   {
      input = {
         ["default:comp_toolrod_strong"] = 2,
		 ["farming:string"] = 8
      },
      output = "civarsenal:bow_composite",
      cooktime = 20
})

simplecrafting_lib.register(
   "assembler",
   {
      input = {
         ["default:comp_fabric"] = 4,
		 ["mobs:leather"] = 2
      },
      output = "civindustry:factory_tape",
      cooktime = 20
})


local assembler_fns = simplecrafting_lib.generate_multifurnace_functions("assembler", "assembler_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Assembler",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:assembler_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

minetest.register_node("civindustry:assembler", {
	description = "Assembler",
	tiles = {
		"civindustry_assembler_top.png", "civindustry_assembler_top.png",
		"civindustry_assembler_side.png", "civindustry_assembler_side.png",
		"civindustry_assembler_side.png", "civindustry_assembler_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = assembler_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = assembler_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = assembler_fns.allow_metadata_inventory_take,
        can_dig = assembler_fns.can_dig,
        on_construct = assembler_fns.on_construct,
        on_metadata_inventory_move = assembler_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = assembler_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = assembler_fns.on_metadata_inventory_take,
        on_receive_fields = assembler_fns.on_receive_fields,
        on_timer = assembler_fns.on_timer
})

minetest.register_node("civindustry:assembler_active", {
	description = "Assembler",
	tiles = {
		"civindustry_assembler_top.png", "civindustry_assembler_top.png",
		"civindustry_assembler_side.png", "civindustry_assembler_side.png",
		"civindustry_assembler_side.png",
		{
			image = "civindustry_assembler_active.png",
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
	drop = "civindustry:assembler",
	groups = {cracky=2, not_in_creative_inventory=1, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = assembler_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = assembler_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = assembler_fns.allow_metadata_inventory_take,
        can_dig = assembler_fns.can_dig,
        on_construct = assembler_fns.on_construct,
        on_metadata_inventory_move = assembler_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = assembler_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = assembler_fns.on_metadata_inventory_take,
        on_receive_fields = assembler_fns.on_receive_fields,
        on_timer = assembler_fns.on_timer
})

minetest.register_craft({
	output = 'civindustry:assembler',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'group:stone', 'default:stick', 'group:stone'},
		{'group:stone', 'group:stone', 'group:stone'},
	}
})
