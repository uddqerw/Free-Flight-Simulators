extends RigidBody3D

# 温和参数 - 需要滑跑加速才能起飞
var engine_thrust = 25.0      # 较小推力
var lift_force = 8.0          # 较小升力系数
var takeoff_speed = 15.0      # 起飞所需的最小速度

func _physics_process(_delta):
	var thrust = Input.is_key_pressed(KEY_SPACE)
	
	if thrust:
		# 只提供向前的推力，没有自动升力
		apply_central_force(-transform.basis.z * engine_thrust)
		
		# 检查是否达到起飞速度
		var forward_speed = -linear_velocity.dot(transform.basis.z)
		if forward_speed > takeoff_speed:
			# 达到起飞速度才提供升力
			apply_central_force(transform.basis.y * (forward_speed - takeoff_speed) * lift_force)
			if forward_speed > takeoff_speed + 2.0:
				print("🛫 达到起飞速度，开始离地！")
