extends RigidBody2D


func hit() -> void:
	GameManager.add_points(1)
	$CPUParticles2D.emitting = true
	$Sprite2D.visible = false
	$CollisionShape2D.disabled = true
	
	var bricks_left = get_tree().get_nodes_in_group("brick")
	if bricks_left.size() == 1:
		get_parent().get_node("Ball").is_active = false
		await get_tree().create_timer(1).timeout
		GameManager.level += 1
		get_tree().reload_current_scene()
	else:
		await get_tree().create_timer(1).timeout
		queue_free()
