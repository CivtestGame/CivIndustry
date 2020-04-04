
--------------------------------------------------------------------------------
--
-- Smoker
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "smoker_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 40,
   }
)

simplecrafting_lib.register(
   "smoker_fuel",
   {
      input = { ["default:tree"] = 1 },
      burntime = 20,
   }
)

simplecrafting_lib.register(
   "smoker_fuel",
   {
      input = { ["default:pine_tree"] = 1 },
      burntime = 20,
   }
)

simplecrafting_lib.register(
   "smoker",
   {
      input = {
         ["mobs:chicken_raw"] = 1
      },
      output = "mobs:chicken_cooked 1",
      cooktime = 40
})

simplecrafting_lib.register(
   "smoker",
   {
      input = {
         ["mobs:meat_raw"] = 1
      },
      output = "mobs:meat 1",
      cooktime = 40
})

simplecrafting_lib.register(
   "smoker",
   {
      input = {
         ["mobs:meat_raw"] = 4,
		 ["default:tree"] = 8
      },
      output = "default:bacon 4",
      cooktime = 80
})

local smoker_fns = simplecrafting_lib.generate_multifurnace_functions("smoker", "smoker_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Smoker",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:smoker_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Smoker Recipe

local smoker_recipe = {
   ["default:stone"] = 99,
   ["default:charcoal"] = 396
}

simplecrafting_lib.register(
   "burner",
   {
      input = smoker_recipe,
      output = "civindustry:smoker 1",
      cooktime = 30
})

smoker_fns.drop = {
   max_items = 1,
   items = {
      { items = civindustry.factory_drops_from_recipe(smoker_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:smoker", {
    description = "Smoker",
    tiles = {
        "civindustry_smoker_top.png", "civindustry_smoker_top.png",
        "civindustry_smoker_side.png", "civindustry_smoker_side.png",
        "civindustry_smoker_side.png", "civindustry_smoker_front.png"
    },
    paramtype2 = "facedir",
    groups = {cracky=2},
    legacy_facedir_simple = true,
    is_ground_content = false,
    sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = smoker_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = smoker_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = smoker_fns.allow_metadata_inventory_take,
        can_dig = smoker_fns.can_dig,
        on_construct = smoker_fns.on_construct,
        on_metadata_inventory_move = smoker_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = smoker_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = smoker_fns.on_metadata_inventory_take,
        on_receive_fields = smoker_fns.on_receive_fields,
        on_timer = smoker_fns.on_timer,
        drop = smoker_fns.drop
})

minetest.register_node("civindustry:smoker_active", {
    description = "Smoker",
    tiles = {
        "civindustry_smoker_top.png", "civindustry_smoker_top.png",
        "civindustry_smoker_side.png", "civindustry_smoker_side.png",
        "civindustry_smoker_side.png",
        {
            image = "civindustry_smoker_active.png",
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
    drop = "civindustry:smoker",
    groups = {cracky=2, not_in_creative_inventory=1},
    legacy_facedir_simple = true,
    is_ground_content = false,
    sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = smoker_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = smoker_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = smoker_fns.allow_metadata_inventory_take,
        can_dig = smoker_fns.can_dig,
        on_construct = smoker_fns.on_construct,
        on_metadata_inventory_move = smoker_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = smoker_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = smoker_fns.on_metadata_inventory_take,
        on_receive_fields = smoker_fns.on_receive_fields,
        on_timer = smoker_fns.on_timer,
        drop = smoker_fns.drop
})
