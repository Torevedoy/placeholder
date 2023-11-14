extends Node2D
class_name Checkpoint

@export var spawnpoint = false

var activated = false

# In Checkpoint script
func activate():
	if !activated:
		print('Checkpoint activated')
		GameManager.current_checkpoint = self
		activated = true

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player && !activated:
		print('Player entered checkpoint area')
		activate()

# In GameManager script (or wherever GameManager.current_checkpoint is used)


