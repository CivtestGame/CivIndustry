
--------------------------------------------------------------------------------
--
-- Basic Oxygen Furnace
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "basic_oxy_furn_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 20,
   }
)


simplecrafting_lib.register(
   "basic_oxy_furn",
   {
      input = {
         ["default:iron_lump"] = 50,
		 ["default:quicklime"] = 80
      },
      output = "default:fine_steel_lump 60",
	  returns = {
		["default:slag"] = 40,
      },
      cooktime = 60
})

simplecrafting_lib.register(
   "basic_oxy_furn",
   {
      input = {
         ["default:fine_steel_lump"] = 10
      },
      output = "default:fine_steel_ingot 10",
      cooktime = 10
})

simplecrafting_lib.register(
   "basic_oxy_furn",
   {
      input = {
         ["default:iron_lump"] = 4,
		 ["default:quicklime"] = 8
      },
      output = "default:fine_steel_lump 5",
	  returns = {
		["default:slag"] = 2,
      },
      cooktime = 20
})

simplecrafting_lib.register(
   "basic_oxy_furn",
   {
      input = {
         ["default:fine_steel_lump"] = 1
      },
      output = "default:fine_steel_ingot 1",
      cooktime = 2
})

local basic_oxy_furn_fns = simplecrafting_lib.generate_multifurnace_functions("basic_oxy_furn", "basic_oxy_furn_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Basic Oxygen Furnace",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:basic_oxy_furn_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Basic Oxygen Furnace Recipe

local basic_oxy_furn_recipe = {
   ["default:steel_ingot"] = 198,
   ["default:bronze_ingot"] = 99,
   ["default:wrought_iron_ingot"] = 99,
}

basic_oxy_furn_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:basic_oxy_furn"),
      { items = civindustry.factory_drops_from_recipe(basic_oxy_furn_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:basic_oxy_furn", {
	description = "Basic Oxygen Furnace",
	tiles = {
		"civindustry_basic_oxy_furn_top.png", "civindustry_basic_oxy_furn_top.png",
		"civindustry_basic_oxy_furn_side.png", "civindustry_basic_oxy_furn_side.png",
		"civindustry_basic_oxy_furn_side.png", "civindustry_basic_oxy_furn_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=1, level=3, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = basic_oxy_furn_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = basic_oxy_furn_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = basic_oxy_furn_fns.allow_metadata_inventory_take,
        can_dig = basic_oxy_furn_fns.can_dig,
        on_construct = basic_oxy_furn_fns.on_construct,
        on_metadata_inventory_move = basic_oxy_furn_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = basic_oxy_furn_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = basic_oxy_furn_fns.on_metadata_inventory_take,
        on_receive_fields = basic_oxy_furn_fns.on_receive_fields,
        on_timer = basic_oxy_furn_fns.on_timer,
        drop = basic_oxy_furn_fns.drop
})

minetest.register_node("civindustry:basic_oxy_furn_active", {
	description = "Basic Oxygen Furnace",
	tiles = {
		"civindustry_basic_oxy_furn_top.png", "civindustry_basic_oxy_furn_top.png",
		"civindustry_basic_oxy_furn_side.png", "civindustry_basic_oxy_furn_side.png",
		"civindustry_basic_oxy_furn_side.png",
		{
			image = "civindustry_basic_oxy_furn_active.png",
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
	groups = {cracky=1, level=3, not_in_creative_inventory=1, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = basic_oxy_furn_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = basic_oxy_furn_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = basic_oxy_furn_fns.allow_metadata_inventory_take,
        can_dig = basic_oxy_furn_fns.can_dig,
        on_construct = basic_oxy_furn_fns.on_construct,
        on_metadata_inventory_move = basic_oxy_furn_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = basic_oxy_furn_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = basic_oxy_furn_fns.on_metadata_inventory_take,
        on_receive_fields = basic_oxy_furn_fns.on_receive_fields,
        on_timer = basic_oxy_furn_fns.on_timer,
        drop = basic_oxy_furn_fns.drop
})
