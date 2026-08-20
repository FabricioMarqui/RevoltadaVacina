extends CharacterBody2D

var lado = 1
var vel = Vector2()
var speed = 100
var queda = 1

func _ready() -> void:
	randomize()
	$movimento.wait_time = randf_range(0.4, 2)
	$anima.wait_time = randf_range(0.6, 1)
	
func _process(delta):
	#movimentação horizontal com a direção determinada pelo lado(1 ou -1)
	position.x += speed*lado*delta
	#movimentação vertical com a direção determinada pela queda(1 ou -1)
	position.y -= 140*queda*delta
	
	#espelhamento da animação
	if lado < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false


func _on_movimento_timeout() -> void:
	lado = lado*(-1)
	
func _on_anima_timeout() -> void:
	if $AnimatedSprite2D.animation == "cima":
		$AnimatedSprite2D.animation = "lado"
	elif $AnimatedSprite2D.animation == "lado":
		$AnimatedSprite2D.animation = "cima"
		
func mata():
	$AnimatedSprite2D.animation == "susto"
	$morte.start()
	
func _on_morte_timeout():
	$AnimatedSprite2D.animation = "morte"
	queda = -1
	lado = 0
