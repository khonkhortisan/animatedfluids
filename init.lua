--desynchronize_mapblock_texture_animation = false
--lava is now animated by default.
fluid_types = {'source', 'flowing'}
speeds = {'3', '2'}

for fluid_type=1,#fluid_types do
	name = 'water'..'_'..fluid_types[fluid_type]
	fluid = minetest.registered_nodes['default:'..name]

	tile = {name='default_'..name..'_animated.png', animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=speeds[fluid_type]}}
	fluid.tiles = {tile}

	tile1 = tile
	tile2 = tile
	tile1.backface_culling=false
	tile2.backface_culling=true
	fluid.special_tiles = {tile1,tile2}

	minetest.register_node(':default:'..name, fluid)
end
