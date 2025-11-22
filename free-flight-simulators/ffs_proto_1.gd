extends RigidBody3D

# 温和参数 - 需要滑跑加速才能起飞
var engine_thrust = 15.0      # 较小推力
var lift_force = 3.0          # 较小升力系数

func _physics_process(_delta):
	var thrust = Input.is_key_pressed(KEY_SPACE)
	
	if thrust:
		# 只提供向前的推力，没有自动升力
		apply_central_force(-transform.basis.z * engine_thrust)
