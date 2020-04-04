
--------------------------------------------------------------------------------
--
-- Open Hearth Furnace
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "open_hearth_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 80,
   }
)

simplecrafting_lib.register(
   "open_hearth_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 10,
   }
)

simplecrafting_lib.register(
   "open_hearth_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 10,
   }
)

simplecrafting_lib.register(
   "open_hearth",
   {
      input = {
         ["default:iron_lump"] = 2,
		 ["default:stone_with_iron"] = 2,
		 ["default:quicklime"] = 5
      },
      output = "default:steel_lump 5",
      cooktime = 20
})

simplecrafting_lib.register(
   "open_hearth",
   {
      input = {
         ["default:steel_lump"] = 1
      },
      output = "default:steel_ingot 1",
      cooktime = 5
})

local open_hearth_fns = simplecrafting_lib.generate_multifurnace_functions("open_hearth", "open_hearth_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Open Hearth Furnace",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:open_hearth_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Open Hearth Furnace Recipe

local open_hearth_recipe = {
   ["default:bronze_ingot"] = 99,
   ["default:iron_ingot"] = 99,
   ["default:wrought_iron_ingot"] = 198,
}

simplecrafting_lib.register(
   "advanced_smelter",
   {
      input = open_hearth_recipe,
      output = "civindustry:open_hearth 1",
      cooktime = 30
})

open_hearth_fns.drop = {
   max_items = 1,
   items = {
      { items = civindustry.factory_drops_from_recipe(open_hearth_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:open_hearth", {
	description = "Open Hearth Furnace",
	tiles = {
		"civindustry_open_hearth_top.png", "civindustry_open_hearth_top.png",
		"civindustry_open_hearth_side.png", "civindustry_open_hearth_side.png",
		"civindustry_open_hearth_side.png", "civindustry_open_hearth_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = open_hearth_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = open_hearth_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = open_hearth_fns.allow_metadata_inventory_take,
        can_dig = open_hearth_fns.can_dig,
        on_construct = open_hearth_fns.on_construct,
        on_metadata_inventory_move = open_hearth_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = open_hearth_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = open_hearth_fns.on_metadata_inventory_take,
        on_receive_fields = open_hearth_fns.on_receive_fields,
        on_timer = open_hearth_fns.on_timer,
        drop = open_hearth_fns.drop
})

minetest.register_node("civindustry:open_hearth_active", {
	description = "Open Hearth Furnace",
	tiles = {
		"civindustry_open_hearth_top.png", "civindustry_open_hearth_top.png",
		"civindustry_open_hearth_side.png", "civindustry_open_hearth_side.png",
		"civindustry_open_hearth_side.png",
		{
			image = "civindustry_open_hearth_active.png",
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
	drop = "civindustry:open_hearth",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = open_hearth_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = open_hearth_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = open_hearth_fns.allow_metadata_inventory_take,
        can_dig = open_hearth_fns.can_dig,
        on_construct = open_hearth_fns.on_construct,
        on_metadata_inventory_move = open_hearth_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = open_hearth_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = open_hearth_fns.on_metadata_inventory_take,
        on_receive_fields = open_hearth_fns.on_receive_fields,
        on_timer = open_hearth_fns.on_timer,
        drop = open_hearth_fns.drop
})
