extends Node2D

var patoatual

func _ready():
	pass

	
func _input(event):
	if Input.is_action_just_pressed("Shoot"):
		$AudioStreamPlayer2D.play()
		if patoatual == null:
			print("No ducks!")
		else:
			patoatual.mata()


func _on_body_entered(body: Node2D) -> void:
		patoatual = body
