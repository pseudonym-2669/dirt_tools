dirtools = {}

local S

if minetest.get_translator ~= nil then
    S = minetest.get_translator(minetest.get_current_modname())
else
    S = function(str)
        return(str)
    end
end



--
-- Crafitems
--

minetest.register_craftitem("dirt_tools:ingot", {
    description = S("Dirt Ingot"),
    inventory_image = "ingot.png",
    
})

minetest.register_craft({
    type = "shapeless",
    output = "dirt_tools:ingot",
    recipe = {"default:dirt", "default:dirt","default:dirt"},
             {"default:dirt",   "default:dirt", "default:dirt"}
})

--
-- Tools
--

minetest.register_tool("dirt_tools:sword", {
    description = S("Dirt Sword"),
    inventory_image = "sword.png",
    
    tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level = 1,
		groupcaps = {
			snappy = {
				times = {2, 2, 2},
				uses = 90,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 3, burns = 0},
    },
})




    minetest.register_tool("dirt_tools:pick", {
        description = S("Dirt Pickaxe"),
        inventory_image = "pick.png",
       
        tool_capabilities = {

            full_punch_interval = 1.5,
            max_drop_level = 3,
            groupcaps={
                cracky = {
                    times = {[1] = 2, [2] = 2, [3] = 2},
                    uses = 90,
                    maxlevel = 3
                },
            },
            damage_groups = {fleshy = 6, burns = 0},
        },
    })






minetest.register_tool("dirt_tools:shovel", {
    description = S("Dirt Shovel"),
    inventory_image = "shovel.png",
    wield_image = "shovel.png",

    tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=1.10, [3]=1.10}, uses=90, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
    on_place = dirtools.tool_fire_func,
    sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("dirt_tools:axe", {
    description = S("Dirt Axe"),
    inventory_image = "axe.png",

    tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				times = {[1] = 2.00, [2] = 2.00, [3] = 2.00},
				uses = 90,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 7, burns = 0},
	},

})
--
-- Tool Crafts
--

minetest.register_craft({
    output = "dirt_tools:sword",
    recipe = {
        {"dirt_tools:ingot"},
        {"dirt_tools:ingot"},
        {"default:dirt"},
    }
})

minetest.register_craft({
    output = "dirt_tools:pick",
    recipe = {
        {"dirt_tools:ingot", "dirt_tools:ingot", "dirt_tools:ingot"},
        {"", "default:dirt", ""},
        {"", "default:dirt", ""},
    }
})

minetest.register_craft({
    output = "dirt_tools:shovel",
    recipe = {
        {"dirt_tools:ingot"},
        {"default:dirt"},
        {"default:dirt"},
    }
})

minetest.register_craft({
    output = "dirt_tools:axe",
    recipe = {
        {"dirt_tools:ingot", "dirt_tools:ingot", ""},
        {"dirt_tools:ingot", "default:dirt", ""},
        {"", "default:dirt", ""},
    }
})

