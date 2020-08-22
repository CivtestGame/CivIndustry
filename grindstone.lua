
--------------------------------------------------------------------------------
--
-- Grindstone
--
--------------------------------------------------------------------------------

simplecrafting_lib.register(
   "grindstone_fuel",
   {
      input = { ["default:coke"] = 1 },
      burntime = 60,
   }
)

simplecrafting_lib.register(
   "grindstone_fuel",
   {
      input = { ["default:charcoal"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "grindstone_fuel",
   {
      input = { ["default:coal_lump"] = 1 },
      burntime = 30,
   }
)

simplecrafting_lib.register(
   "grindstone_fuel",
   {
      input = { ["default:coalblock"] = 1 },
      burntime = 9*30,
   }
)

simplecrafting_lib.register(
   "grindstone",
   {
      input = {
         ["default:comp_wrought_iron_pickhead"] = 1,
		 ["default:comp_sharp"] = 1
      },
      output = "default:comp_wrought_iron_pickhead_sharp 1",
      cooktime = 60
})

simplecrafting_lib.register(
   "grindstone",
   {
      input = {
         ["default:comp_steel_pickhead"] = 1,
		 ["default:comp_sharp"] = 1
      },
      output = "default:comp_steel_pickhead_sharp 1",
      cooktime = 60
})

simplecrafting_lib.register(
   "grindstone",
   {
      input = {
         ["default:comp_fine_steel_pickhead"] = 1,
		 ["default:comp_sharp_adv"] = 1
      },
      output = "default:comp_fine_steel_pickhead_sharp 1",
      cooktime = 60
})

simplecrafting_lib.register(
   "grindstone",
   {
      input = {
         ["default:comp_steel_axehead"] = 1,
		 ["default:comp_sharp"] = 1
      },
      output = "default:comp_steel_axehead_sharp 1",
      cooktime = 60
})

simplecrafting_lib.register(
   "grindstone",
   {
      input = {
         ["default:comp_fine_steel_axehead"] = 1,
		 ["default:comp_sharp_adv"] = 1
      },
      output = "default:comp_fine_steel_axehead_sharp 1",
      cooktime = 60
})

simplecrafting_lib.register(
   "grindstone",
   {
      input = {
         ["default:comp_steel_shovelhead"] = 1,
		 ["default:comp_sharp"] = 1
      },
      output = "default:comp_steel_shovelhead_sharp 1",
      cooktime = 60
})

simplecrafting_lib.register(
   "grindstone",
   {
      input = {
         ["default:comp_fine_steel_shovelhead"] = 1,
		 ["default:comp_sharp_adv"] = 1
      },
      output = "default:comp_fine_steel_shovelhead_sharp 1",
      cooktime = 60
})

simplecrafting_lib.register(
   "grindstone",
   {
      input = {
         ["default:comp_steel_swordhead"] = 1,
		 ["default:comp_sharp"] = 1
      },
      output = "default:comp_steel_swordhead_sharp 1",
      cooktime = 60
})

simplecrafting_lib.register(
   "grindstone",
   {
      input = {
         ["default:comp_fine_steel_swordhead"] = 1,
		 ["default:comp_sharp_adv"] = 1
      },
      output = "default:comp_fine_steel_swordhead_sharp 1",
      cooktime = 60
})

simplecrafting_lib.register(
   "grindstone",
   {
      input = {
         ["default:gravel"] = 4,
		 ["group:sand"] = 4,
		 ["default:clay"] = 1,
		 ["default:limestone"] = 1,
		 ["default:comp_sharp"] = 1
      },
      output = "citadella:reinf_cement 20",
      cooktime = 20
})

minetest.register_craftitem("civindustry:slag_output", {
   description = "Random Slag Grinding Output",
   inventory_image =
           "[combine:32x32"
           .. ":4,4=default_gravel.png"
           .. ":8,8=default_clay.png"
           .. ":12,12=default_obsidian_shard.png"
})

simplecrafting_lib.register(
   "grindstone",
   {
      input = {
         ["default:slag"] = 1
      },
      output = "civindustry:slag_output 1",
      random_returns = {
         { rarity = 2, items = {"default:gravel 1"} },
		 { rarity = 4, items = {"default:obsidian_shard 1"} },
		 { rarity = 4, items = {"default:clay 1"} },
		 { rarity = 4, items = {"default:limestone 1"} },
		 { rarity = 8, items = {"civfoundations:gneiss 1"} },
		 { rarity = 8, items = {"civfoundations:schist 1"} },
		 { rarity = 8, items = {"civfoundations:slate 1"} },
		 { rarity = 8, items = {"civfoundations:slate_green 1"} },
		 { rarity = 8, items = {"default:sand 1"} },
		 { rarity = 8, items = {"default:silver_sand 1"} },
		 { rarity = 8, items = {"default:desert_sand 1"} },
		 { rarity = 25, items = {"default:tin_lump 1"} },
		 { rarity = 25, items = {"default:copper_lump 1"} },
		 { rarity = 25, items = {"default:obsidian 1"} },
		 { rarity = 25, items = {"default:basalt 1"} },
		 { rarity = 25, items = {"default:granite 1"} },
		 { rarity = 100, items = {"default:gold_lump 1"} },
      },
      cooktime = 1
})

local grindstone_fns = simplecrafting_lib.generate_multifurnace_functions("grindstone", "grindstone_fuel", {
      show_guides = true,
      alphabetize_items = true,
      description = "Grindstone",
      protect_inventory = true,
--      crafting_time_multiplier = function(pos, recipe),
         active_node = "civindustry:grindstone_active",
         lock_in_mode = "endless", -- "count"
         -- append_to_formspec = "string",
})

grindstone_fns.drop = {
   max_items = 1,
   items = {
      civindustry.factory_drops_with_tape("civindustry:grindstone"),
      { items = civindustry.factory_drops_from_recipe(civindustry.grindstone_recipe, 0.5) }
   }
}

--

minetest.register_node("civindustry:grindstone", {
	description = "Grindstone",
	tiles = {
		"civindustry_grindstone_top.png", "civindustry_grindstone_top.png",
		"civindustry_grindstone_side.png", "civindustry_grindstone_side.png",
		"civindustry_grindstone_side.png", "civindustry_grindstone_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, factory=3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

        allow_metadata_inventory_move = grindstone_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = grindstone_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = grindstone_fns.allow_metadata_inventory_take,
        can_dig = grindstone_fns.can_dig,
        on_construct = grindstone_fns.on_construct,
        on_metadata_inventory_move = grindstone_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = grindstone_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = grindstone_fns.on_metadata_inventory_take,
        on_receive_fields = grindstone_fns.on_receive_fields,
        on_timer = grindstone_fns.on_timer,
        drop = grindstone_fns.drop
})

minetest.register_node("civindustry:grindstone_active", {
	description = "Grindstone",
	tiles = {
		"civindustry_grindstone_top.png", "civindustry_grindstone_top.png",
		"civindustry_grindstone_side.png", "civindustry_grindstone_side.png",
		"civindustry_grindstone_side.png",
		{
			image = "civindustry_grindstone_active.png",
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

        allow_metadata_inventory_move = grindstone_fns.allow_metadata_inventory_move,
        allow_metadata_inventory_put = grindstone_fns.allow_metadata_inventory_put,
        allow_metadata_inventory_take = grindstone_fns.allow_metadata_inventory_take,
        can_dig = grindstone_fns.can_dig,
        on_construct = grindstone_fns.on_construct,
        on_metadata_inventory_move = grindstone_fns.on_metadata_inventory_move,
        on_metadata_inventory_put = grindstone_fns.on_metadata_inventory_put,
        on_metadata_inventory_take = grindstone_fns.on_metadata_inventory_take,
        on_receive_fields = grindstone_fns.on_receive_fields,
        on_timer = grindstone_fns.on_timer,
        drop = grindstone_fns.drop
})
