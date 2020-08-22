
--------------------------------------------------------------------------------
--
-- Carpenter
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "carpenter_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "carpenter_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "carpenter_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9*30,
   }
)

simplecrafting_lib.register(
   "carpenter",
   {
      input = {
         ["group:tree"] = 10,
		 ["farming:string"] = 8,
		 ["group:wool"] = 2,
		 ["default:quicklime"] = 2,
		 ["default:clay_lump"] = 2
      },
      output = "default:paper 20",
      cooktime = 30
})

local carpenter_fns = simplecrafting_lib.generate_multifurnace_functions("carpenter", "carpenter_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Carpenter",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:carpenter_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

carpenter_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:carpenter"),
      { items = civindustry.factory_drops_from_recipe(civindustry.carpenter_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:carpenter", {
	description = "Carpenter",
	tiles = {
		"civindustry_carpenter_top.png", "civindustry_carpenter_top.png",
		"civindustry_carpenter_side.png", "civindustry_carpenter_side.png",
		"civindustry_carpenter_side.png", "civindustry_carpenter_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = carpenter_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = carpenter_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = carpenter_fns.allow_metadata_inventory_take,
        can_dig = carpenter_fns.can_dig,
        on_construct = carpenter_fns.on_construct,
        on_metadata_inventory_move = carpenter_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = carpenter_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = carpenter_fns.on_metadata_inventory_take,
        on_receive_fields = carpenter_fns.on_receive_fields,
        on_timer = carpenter_fns.on_timer,
        drop = carpenter_fns.drop
})

minetest.register_node("civindustry:carpenter_active", {
	description = "Carpenter",
	tiles = {
		"civindustry_carpenter_top.png", "civindustry_carpenter_top.png",
		"civindustry_carpenter_side.png", "civindustry_carpenter_side.png",
		"civindustry_carpenter_side.png",
		{
			image = "civindustry_carpenter_active.png",
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

        allow_metadata_inventory_move = carpenter_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = carpenter_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = carpenter_fns.allow_metadata_inventory_take,
        can_dig = carpenter_fns.can_dig,
        on_construct = carpenter_fns.on_construct,
        on_metadata_inventory_move = carpenter_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = carpenter_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = carpenter_fns.on_metadata_inventory_take,
        on_receive_fields = carpenter_fns.on_receive_fields,
        on_timer = carpenter_fns.on_timer,
        drop = carpenter_fns.drop
})
