extends Control


func _ready():
	var gradient = Gradient.new()
	gradient.offsets = PoolRealArray([0, 0.1, 1])
	gradient.colors = PoolColorArray([Color(0, 0, 0, 1), Color(0, 0, 0, 1), Color(0.6, 0.6, 0.6, 1)])
	
	var gradientTexture = GradientTexture.new()
	gradientTexture.set_gradient(gradient)
	
	var textureRect = TextureRect.new()
	textureRect.set_texture(gradientTexture)
	textureRect.set_expand(true)
	textureRect._set_size(Vector2(720, 1280))
	textureRect.set_rotation_degrees(90)
	textureRect.set_scale(Vector2(1, -1))
	
	add_child(textureRect)
	move_child(textureRect, 0)
	
	
	var gridContainer = GridContainer.new()
	gridContainer.columns = 10
	gridContainer.anchor_right = 1
	gridContainer.anchor_bottom = 0.25
	
	for _i in range(200):
		var gridTextureRect = TextureRect.new()
		gridTextureRect.texture = load("res://star.png")
		
		var rand = rand_range(0.1, 0.25)
		gridTextureRect.rect_scale = Vector2(rand, rand)
		gridTextureRect.rect_position = Vector2(rand_range(0, 64), rand_range(0, 64))
		var cont = Container.new()
		cont.set_h_size_flags(3)
		cont.set_v_size_flags(3)
		cont.add_child(gridTextureRect)
		gridContainer.add_child(cont)
	
	add_child(gridContainer)
	move_child(gridContainer, 1)
