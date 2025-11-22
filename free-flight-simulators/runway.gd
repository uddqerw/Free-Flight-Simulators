# 新建 Runway.gd 脚本
extends StaticBody3D

func _ready():
	# 跑道材质（黑白棋盘格）
	var material = StandardMaterial3D.new()
	material.albedo_color = Color(0.2, 0.2, 0.2)  # 深灰色
	$MeshInstance3D.material_override = material

# 检测飞机是否在跑道上
func _on_area_3d_body_entered(body):
	if body.name == "FFS_Proto1":
		print("🛬 飞机进入跑道 - 可以起降！")
		body.is_on_runway = true
