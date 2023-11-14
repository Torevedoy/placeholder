extends Node2D

var current_checkpoint : Checkpoint

var player : Player

var has_just_respawned = false

func respawn_player():
	if has_just_respawned:
		return
	if current_checkpoint != null:
		print("Respawning player at checkpoint:", current_checkpoint.global_position)
		player.position = current_checkpoint.global_position
		print(has_just_respawned)
		has_just_respawned = true
	else:
		print("No valid checkpoint found for respawn.")
		
		
#func respawn_player():
#	if current_checkpoint != null:
#		print("Respawning player at checkpoint:", current_checkpoint.global_position)
#		player.position = current_checkpoint.global_position
#		# Set current_checkpoint to null after respawn to avoid continuous respawn
#		current_checkpoint = null
#	else:
#		print("No valid checkpoint found for respawn.")
#		print('Current checkpoint:', GameManager.current_checkpoint)

