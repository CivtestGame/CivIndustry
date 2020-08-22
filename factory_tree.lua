
-- Burner Tree

simplecrafting_lib.register(
   "burner",
   {
      input = smelter_recipe,
      output = "civindustry:smelter 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "burner",
   {
      input = bakery_recipe,
      output = "civindustry:bakery 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "burner",
   {
      input = stone_smelter_recipe,
      output = "civindustry:stone_smelter 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "burner",
   {
      input = carpenter_recipe,
      output = "civindustry:carpenter 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "burner",
   {
      input = charcoal_oven_recipe,
      output = "civindustry:charcoal_oven 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "burner",
   {
      input = coke_oven_recipe,
      output = "civindustry:coke_oven 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "burner",
   {
      input = kiln_recipe,
      output = "civindustry:kiln 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "burner",
   {
      input = smoker_recipe,
      output = "civindustry:smoker 1",
      cooktime = 30
})

-- Component Factory Tree

simplecrafting_lib.register(
   "component_factory",
   {
      input = munitions_factory_recipe,
      output = "civindustry:munitions_factory 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "component_factory",
   {
      input = chemical_processor_recipe,
      output = "civindustry:chemical_processor 1",
      cooktime = 30
})

-- Assembler Tree

simplecrafting_lib.register(
   "assembler",
   {
      input = foundry_recipe,
      output = "civindustry:foundry 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "assembler",
   {
      input = component_factory_recipe,
      output = "civindustry:component_factory 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "assembler",
   {
      input = {
         ["default:comp_fabric"] = 50,
         ["mobs:leather"] = 50
      },
      output = "civindustry:factory_tape",
      cooktime = 20
})

simplecrafting_lib.register(
   "assembler",
   {
      input = grindstone_recipe,
      output = "civindustry:grindstone 1",
      cooktime = 30
})

-- (Advanced) Smelter Tree

simplecrafting_lib.register(
   "smelter",
   {
      input = advanced_smelter_recipe,
      output = "civindustry:advanced_smelter 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "advanced_smelter",
   {
      input = open_hearth_recipe,
      output = "civindustry:open_hearth 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "advanced_smelter",
   {
      input = exceptional_smelter_recipe,
      output = "civindustry:exceptional_smelter 1",
      cooktime = 30
})

simplecrafting_lib.register(
   "advanced_smelter",
   {
      input = alloy_smelter_recipe,
      output = "civindustry:alloy_smelter 1",
      cooktime = 30
})

-- Stone Smelter Tree

simplecrafting_lib.register(
   "stone_smelter",
   {
      input = lime_kiln_recipe,
      output = "civindustry:lime_kiln 1",
      cooktime = 30
})

-- Open Hearth Tree

simplecrafting_lib.register(
   "open_hearth",
   {
      input = basic_oxy_furn_recipe,
      output = "civindustry:basic_oxy_furn 1",
      cooktime = 30
})
