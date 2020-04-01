civindustry = {}

local modpath = minetest.get_modpath(minetest.get_current_modname())

local MAXSTACK_SIZE = 99

-- A function to created penalised factory drops.
function civindustry.factory_drops_from_recipe(recipe, drop_reduction)
   -- Essentially, converts a simplecrafting_lib recipe to something suitable
   -- for use in a NodeDef's `drop` table. Multiplies the number of drops by
   -- `drop_reduction` to apply a resource penalty to factory breakage.
   local items = {}
   for k, v in pairs(recipe) do
      local maxstack_adjusted = math.floor(v / MAXSTACK_SIZE)
      local maxstack_remainder = v % (maxstack_adjusted * MAXSTACK_SIZE)

      for i = 1, maxstack_adjusted, 1 do
         items[#items + 1] = k .. " "
            .. tostring(math.floor(MAXSTACK_SIZE * drop_reduction))
      end
      if maxstack_remainder > 0 then
         items[#items + 1] = k .. " "
            .. tostring(math.floor(maxstack_remainder * drop_reduction))
      end
   end

   return items
end

dofile(modpath .. "/burner.lua")

dofile(modpath .. "/smelter.lua")
dofile(modpath .. "/advanced_smelter.lua")
dofile(modpath .. "/exceptional_smelter.lua")

dofile(modpath .. "/stone_smelter.lua")

--------------------------------------------------------------------------------
--
-- Convert factory-mod factories to CivIndustry ones
--
--------------------------------------------------------------------------------

local old_factory_lookup = {
   ["factory_mod:burner"] = true,
   ["factory_mod:smelter"] = true,
   ["factory_mod:advanced_smelter"] = true,
   ["factory_mod:exceptional_smelter"] = true,
   ["factory_mod:stone_smelter"] = true
}

local function convert_old_factory(pos, node)
   local factory_name = (node.name):split(":")[2]
   local new_node_name = "civindustry:" .. factory_name

   local meta = minetest.get_meta(pos)
   meta:set_string("inactive_node", new_node_name)

   minetest.log(dump(meta:to_table()))

   minetest.log("Converted "..node.name.." to "..new_node_name)
   minetest.swap_node(
      pos, { name = new_node_name,
             param1 = node.param1,
             param2 = node.param2 }
   )
end

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
      if old_factory_lookup[node.name] then
         convert_old_factory(pos, node)
      end
end)

local old_factory_nodes = {}
for k,_ in pairs(old_factory_lookup) do
   minetest.log(k)
   old_factory_nodes[#old_factory_nodes + 1] = k
end

minetest.register_lbm({
      label = "Update factories",
      name = "civindustry:update_factories",
      nodenames = old_factory_nodes,
      run_at_every_load = true,
      action = convert_old_factory
})

--------------------------------------------------------------------------------

minetest.log("[CivIndustry] Initialised.")

return civindustry
