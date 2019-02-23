extends Spatial

var Distance = 0

var Dist_01 = 10
var Dist_02 = 20

func _ready():
	get_tree().get_root().get_node("Main").LOD_Number += 1
	
	$"00".visible = true
	$"01".visible = false
	$"02".visible = false
	
	set_physics_process(true)
	get_tree().get_root().get_node("Main").LOD_Process_Active = true

func _physics_process(delta):
	Distance = self.global_transform.origin.distance_to( get_tree().get_root().get_node("Main/Player").get_global_transform().origin )

	if Distance > Dist_01 and Distance < Dist_02:
		$"00".visible = false
		$"01".visible = true
		$"02".visible = false
	elif Distance > Dist_02:
		$"00".visible = false
		$"01".visible = false
		$"02".visible = true
	else:
		$"00".visible = true
		$"01".visible = false
		$"02".visible = false