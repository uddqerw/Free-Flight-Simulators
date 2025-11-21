extends Area3D

func _ready():
	# 连接信号（Godot 4 方式）
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# 检查进入的是不是我们的飞机
	if body.is_in_group("player") or body.name == "FFS_Proto1":
		print("🔥 轰！！！")
		print("💥 飞机坠毁！重置位置...")
		# 重置飞机位置和速度
		body.global_transform.origin = Vector3(0, 3, 0)
		body.linear_velocity = Vector3.ZERO
		body.angular_velocity = Vector3.ZERO
