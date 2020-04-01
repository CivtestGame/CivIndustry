
--------------------------------------------------------------------------------
--
-- Burner
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "burner_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 50,
   }
)

simplecrafting_lib.register(
   "burner_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "burner_fuel",
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
   "burner",
   {
      input = {
         ["default:limestone_dust"] = 2
      },
      output = "default:quicklime 1",
      cooktime = 5
})

simplecrafting_lib.register(
   "burner",
   {
      input = {
         ["default:coral_skeleton"] = 1
      },
      output = "default:quicklime 1",
      cooktime = 5
})

simplecrafting_lib.register(
   "burner",
   {
      input = {
         ["default:coal_lump"] = 2
      },
      output = "default:coke 1",
      cooktime = 5
})

simplecrafting_lib.register(
   "burner",
   {
      input = {
         ["group:wood"] = 5
      },
      output = "default:charcoal 2",
      cooktime = 3
})

simplecrafting_lib.register(
   "burner",
   {
      input = {
         ["group:tree"] = 1
      },
      output = "default:charcoal 3",
      cooktime = 2
})

local burner_fns = simplecrafting_lib.generate_multifurnace_functions("burner", "burner_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Burner",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:burner_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

minetest.register_node("civindustry:burner", {
	description = "Burner",
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png", "civindustry_burner_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = burner_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = burner_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = burner_fns.allow_metadata_inventory_take,
        can_dig = burner_fns.can_dig,
        on_construct = burner_fns.on_construct,
        on_metadata_inventory_move = burner_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = burner_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = burner_fns.on_metadata_inventory_take,
        on_receive_fields = burner_fns.on_receive_fields,
        on_timer = burner_fns.on_timer
})

minetest.register_node("civindustry:burner_active", {
	description = "Burner",
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png", "default_burner_front_active.png"
		-- {
		-- 	image = "default_furnace_front_active.png",
		-- 	backface_culling = false,
		-- 	animation = {
		-- 		type = "vertical_frames",
		-- 		aspect_w = 16,
		-- 		aspect_h = 16,
		-- 		length = 1.5
		-- 	},
		-- }
	},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "civindustry:burner",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = burner_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = burner_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = burner_fns.allow_metadata_inventory_take,
        can_dig = burner_fns.can_dig,
        on_construct = burner_fns.on_construct,
        on_metadata_inventory_move = burner_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = burner_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = burner_fns.on_metadata_inventory_take,
        on_receive_fields = burner_fns.on_receive_fields,
        on_timer = burner_fns.on_timer
})

minetest.register_craft({
	output = 'civindustry:burner',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'group:stone', 'default:torch', 'group:stone'},
		{'group:stone', 'group:stone', 'group:stone'},
	}
})
