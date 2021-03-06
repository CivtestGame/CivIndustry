
--------------------------------------------------------------------------------
--
-- Advanced Smelter
--
--------------------------------------------------------------------------------


simplecrafting_lib.register(
   "advanced_smelter_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 60,
   }
)

simplecrafting_lib.register(
   "advanced_smelter_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 20,
   }
)

simplecrafting_lib.register(
   "advanced_smelter_fuel",
   {
      input = { ["default:coal"] = 1 },
      burntime = 20,
   }
)

simplecrafting_lib.register(
   "advanced_smelter",
   {
      input = {
         ["default:stone_with_iron"] = 5
      },
      output = "default:iron_lump 5",
      cooktime = 30
})

simplecrafting_lib.register(
   "advanced_smelter",
   {
      input = {
         ["default:iron_lump"] = 5,
      },
      output = "default:iron_ingot 5",
      cooktime = 30
})

local advanced_smelter_fns = simplecrafting_lib.generate_multifurnace_functions("advanced_smelter", "advanced_smelter_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Advanced Smelter",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:advanced_smelter_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

advanced_smelter_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:advanced_smelter"),
      { items = civindustry.factory_drops_from_recipe(civindustry.advanced_smelter_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:advanced_smelter", {
	description = "Advanced Smelter",
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png", "civindustry_advanced_smelter_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, level=2, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = advanced_smelter_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = advanced_smelter_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = advanced_smelter_fns.allow_metadata_inventory_take,
        can_dig = advanced_smelter_fns.can_dig,
        on_construct = advanced_smelter_fns.on_construct,
        on_metadata_inventory_move = advanced_smelter_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = advanced_smelter_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = advanced_smelter_fns.on_metadata_inventory_take,
        on_receive_fields = advanced_smelter_fns.on_receive_fields,
        on_timer = advanced_smelter_fns.on_timer,
        drop = advanced_smelter_fns.drop
})

minetest.register_node("civindustry:advanced_smelter_active", {
	description = "Advanced Smelter",
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png",
		{
			image = "civindustry_advanced_smelter_front_active.png",
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
	groups = {cracky=2, level=2, not_in_creative_inventory=1, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = advanced_smelter_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = advanced_smelter_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = advanced_smelter_fns.allow_metadata_inventory_take,
        can_dig = advanced_smelter_fns.can_dig,
        on_construct = advanced_smelter_fns.on_construct,
        on_metadata_inventory_move = advanced_smelter_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = advanced_smelter_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = advanced_smelter_fns.on_metadata_inventory_take,
        on_receive_fields = advanced_smelter_fns.on_receive_fields,
        on_timer = advanced_smelter_fns.on_timer,
        drop = advanced_smelter_fns.drop
})
