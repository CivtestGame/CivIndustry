
--------------------------------------------------------------------------------
--
-- Bakery
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "bakery_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "bakery",
   {
      input = {
         ["farming:flour"] = 30
      },
      output = "farming:bread 20",
      cooktime = 120
})

simplecrafting_lib.register(
   "bakery",
   {
      input = {
         ["farming:flour"] = 10,
         ["default:apple"] = 2,
         ["default:bacon"] = 4
      },
      output = "default:pie_meat 4",
      cooktime = 60
})

simplecrafting_lib.register(
   "bakery",
   {
      input = {
         ["farming:flour"] = 10,
         ["default:blueberries"] = 6
      },
      output = "default:pie_berry 4",
      cooktime = 60
})

simplecrafting_lib.register(
   "bakery",
   {
      input = {
         ["farming:flour"] = 10,
         ["flowers:mushroom_brown"] = 4
      },
      output = "default:pie_mushroom 4",
      cooktime = 60
})

simplecrafting_lib.register(
   "bakery",
   {
      input = {
         ["farming:flour"] = 10,
         ["flowers:mushroom_red"] = 4
      },
      output = "default:pie_mushroom 4",
      cooktime = 60
})

local bakery_fns = simplecrafting_lib.generate_multifurnace_functions("bakery", "bakery_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Bakery",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:bakery_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

-- Bakery Recipe

local bakery_recipe = {
   ["default:stone"] = 99,
   ["default:charcoal"] = 198,
   ["default:clay_brick"] = 99
}

simplecrafting_lib.register(
   "burner",
   {
      input = bakery_recipe,
      output = "civindustry:bakery 1",
      cooktime = 30
})

bakery_fns.drop = {
   max_items = 1,
   items = {
      { items = civindustry.factory_drops_from_recipe(bakery_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:bakery", {
    description = "Bakery",
    tiles = {
        "civindustry_bakery_top.png", "civindustry_bakery_top.png",
        "civindustry_bakery_side.png", "civindustry_bakery_side.png",
        "civindustry_bakery_side.png", "civindustry_bakery_front.png"
    },
    paramtype2 = "facedir",
    groups = {cracky=2},
    legacy_facedir_simple = true,
    is_ground_content = false,
    sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = bakery_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = bakery_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = bakery_fns.allow_metadata_inventory_take,
        can_dig = bakery_fns.can_dig,
        on_construct = bakery_fns.on_construct,
        on_metadata_inventory_move = bakery_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = bakery_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = bakery_fns.on_metadata_inventory_take,
        on_receive_fields = bakery_fns.on_receive_fields,
        on_timer = bakery_fns.on_timer,
        drop = bakery_fns.drop
})

minetest.register_node("civindustry:bakery_active", {
    description = "Bakery",
    tiles = {
        "civindustry_bakery_top.png", "civindustry_bakery_top.png",
        "civindustry_bakery_side.png", "civindustry_bakery_side.png",
        "civindustry_bakery_side.png",
        {
            image = "civindustry_bakery_active.png",
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
    drop = "civindustry:bakery",
    groups = {cracky=2, not_in_creative_inventory=1},
    legacy_facedir_simple = true,
    is_ground_content = false,
    sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = bakery_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = bakery_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = bakery_fns.allow_metadata_inventory_take,
        can_dig = bakery_fns.can_dig,
        on_construct = bakery_fns.on_construct,
        on_metadata_inventory_move = bakery_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = bakery_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = bakery_fns.on_metadata_inventory_take,
        on_receive_fields = bakery_fns.on_receive_fields,
        on_timer = bakery_fns.on_timer,
        drop = bakery_fns.drop
})
