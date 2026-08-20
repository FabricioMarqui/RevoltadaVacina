extends Node2D

var patosnatela
var pato = preload("res://scenes/patient.tscn")
var flyaway = 0
var capturado = 0

func _ready() -> void:
	$gerapato.start()


func _process(delta: float) -> void:
	$Target.position.x = get_local_mouse_position().x
	$Target.position.y = get_local_mouse_position().y

func nasce():
	var novop = pato.instantiate()
	add_child(novop)
	novop.position.x = randf_range(50,700)
	novop.position.y = 700
	
	
func _on_timer_timeout():
	patosnatela = int(randf_range(1,6))
	for n in patosnatela:
		nasce()


func _on_espera_timeout() -> void:
	$gerapato.start()


func _on_topo_body_entered(body: Node2D) -> void:
	flyaway = 1
	patosnatela -= 1
	atualizaturno()
	
func _on_chao_body_entered(body: Node2D) -> void:
	capturado += 1
	patosnatela -= 1
	atualizaturno()

func atualizaturno():
	if(patosnatela==0):
		$espera.start()
		if flyaway == 1:
			$cao.play("rindo")
			flyaway = 0
		else:
			$cao.play("captura")
