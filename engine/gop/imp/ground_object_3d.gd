@tool
extends Node3D
class_name GroundObject3D


# ints are used for the objects scale since it is tile based.
## the length of the object (Z)
@export var size_w : int = 1
## The width of the object (X)
@export var size_l : int = 1
## The height of the objecy (Y)
@export var size_h : int = 1
## If true, a collision shape will not be generated
@export var no_collide : bool = false

@export_group("Visuals")
@export var mesh_type : int
@export var mesh_type_override : MeshLibrary
@export var texture : Texture

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Engine.is_editor_hint():
		#_build_mesh(false)
	pass


func build_mesh(build_collision : bool):
	@warning_ignore("integer_division") var parts = [
		{ ## Top
			"mesh_id": 0,
			"scale": Vector3(size_l, 1.0, size_w),
			"rot": Vector3.ZERO,
			"pos": Vector3.ZERO
		},
			#==============================================================================================
		{ ## Front
			"mesh_id": 1,
			"scale": Vector3(size_l, 1.0, 1.0),
			"rot": Vector3.ZERO,
			"pos": Vector3(0.0, 0.0, size_w / 2 + (0.0 if size_w % 2 == 0 else 0.5))
		},
		{ ## Front Corner
			"mesh_id": 2,
			"scale": Vector3.ONE,
			"rot": Vector3.ZERO,
			"pos": Vector3(-size_l / 2 - (0.0 if size_l % 2 == 0 else 0.5), 0.0, size_w / 2 + (0.0 if size_w % 2 == 0 else 0.5))
		},
		{ ## Front Side
			"mesh_id": 4,
			"scale": Vector3(size_l, size_h, 1.0),
			"rot": Vector3.ZERO,
			"pos": Vector3(0.0,  -size_h + (size_h - 1 if size_h != 1 else 0), size_w / 2 + (0.0 if size_w % 2 == 0 else 0.5))
		},
		{ ## Front Side Corner
			"mesh_id": 3,
			"scale": Vector3(1.0, size_h, 1.0),
			"rot": Vector3.ZERO,
			"pos": Vector3(-size_l / 2 - (0.0 if size_l % 2 == 0 else 0.5), -size_h + (size_h - 1 if size_h != 1 else 0), size_w / 2 + (0.0 if size_w % 2 == 0 else 0.5))
		},
		#==============================================================================================
		{ ## Back
			"mesh_id": 1,
			"scale": Vector3(size_l, 1.0, 1.0),
			"rot": Vector3(0.0, PI, 0.0),
			"pos": Vector3(0.0, 0.0, -size_w / 2 - (0.0 if size_w % 2 == 0 else 0.5))
		},
		{ ## Back Corner
			"mesh_id": 2,
			"scale": Vector3.ONE,
			"rot": Vector3(0.0, PI, 0.0),
			"pos": Vector3(size_l / 2 + (0.0 if size_l % 2 == 0 else 0.5), 0.0, -size_w / 2 - (0.0 if size_w % 2 == 0 else 0.5))
		},
		## Some of these are left out since these faces won't normally be visible.
		#{ ## Back
			#"mesh_id": 4,
			#"scale": Vector3(size_l, size_h, 1.0),
			#"rot": Vector3(0.0, PI, 0.0),
			#"pos": Vector3(0.0,  -size_h + (size_h - 1 if size_h != 1 else 0), -size_w / 2 - (0.0 if size_w % 2 == 0 else 0.5))
		#},
		#{ ## Back Side Corner
			#"mesh_id": 3,
			#"scale": Vector3(1.0, size_h, 1.0),
			#"rot": Vector3(0.0, PI, 0.0),
			#"pos": Vector3(size_w / 2 + (0.0 if size_w % 2 == 0 else 0.5),  -size_h + (size_h - 1 if size_h != 1 else 0), -size_w / 2 - (0.0 if size_w % 2 == 0 else 0.5))
		#},
			#==============================================================================================
		{ ## Left
			"mesh_id": 1,
			"scale": Vector3(size_w, 1.0, 1.0),
			"rot": Vector3(0.0, -PI/2, 0.0),
			"pos": Vector3(-size_l / 2 - (0.0 if size_l % 2 == 0 else 0.5), 0.0, 0.0)
		},
		{ ## Left Corner
			"mesh_id": 2,
			"scale": Vector3.ONE,
			"rot": Vector3(0.0, -PI/2, 0.0),
			"pos": Vector3(-size_l / 2 - (0.0 if size_l % 2 == 0 else 0.5), 0.0, -size_w / 2 - (0.0 if size_w % 2 == 0 else 0.5))
		},
		{ ## Left Side
			"mesh_id": 4,
			"scale": Vector3(size_w, size_h, 1.0),
			"rot": Vector3(0.0, -PI/2, 0.0),
			"pos": Vector3(-size_l / 2 - (0.0 if size_l % 2 == 0 else 0.5), -size_h + (size_h - 1 if size_h != 1 else 0), 0.0)
		},
		{ ## Left Side Corner
			"mesh_id": 3,
			"scale": Vector3(1.0, size_h, 1.0),
			"rot": Vector3(0.0, -PI/2, 0.0),
			"pos": Vector3(-size_l / 2 - (0.0 if size_l % 2 == 0 else 0.5), -size_h + (size_h - 1 if size_h != 1 else 0), -size_w / 2 - (0.0 if size_w % 2 == 0 else 0.5))
		},
			#==============================================================================================
		{ ## Right
			"mesh_id": 1,
			"scale": Vector3(size_w, 1.0, 1.0),
			"rot": Vector3(0.0, PI/2, 0.0),
			"pos": Vector3(size_l / 2 + (0.0 if size_l % 2 == 0 else 0.5), 0.0, 0.0)
		},
		{ ## Right Corner
			"mesh_id": 2,
			"scale": Vector3.ONE,
			"rot": Vector3(0.0, PI/2, 0.0),
			"pos": Vector3(size_l / 2 + (0.0 if size_l % 2 == 0 else 0.5), 0.0, size_w / 2 + (0.0 if size_w % 2 == 0 else 0.5))
		},
		#{ ## Right Side
			#"mesh_id": 4,
			#"scale": Vector3(size_w, size_h, 1.0),
			#"rot": Vector3(0.0, PI/2, 0.0),
			#"pos": Vector3(size_l / 2 + (0.0 if size_l % 2 == 0 else 0.5), -size_h + (size_h - 1 if size_h != 1 else 0), 0.0)
		#},
		{ ## Right Side Corner
			"mesh_id": 3,
			"scale": Vector3(1.0, size_h, 1.0),
			"rot": Vector3(0.0, PI/2, 0.0),
			"pos": Vector3(size_l / 2 + (0.0 if size_l % 2 == 0 else 0.5), -size_h + (size_h - 1 if size_h != 1 else 0), size_w / 2 + (0.0 if size_w % 2 == 0 else 0.5))
		},
	]
	
	# Remove any pre-existing meshes
	for c in self.get_children():
		self.remove_child(c)
	
	for p in parts:
		_make_part(
			mesh_type_override.get_item_mesh(p.mesh_id),
			p.scale,
			p.pos,
			p.rot
		)
		print("Mesh #" + str(p.mesh_id) + " created.")
	

func _make_part(mesh : Mesh, scale_override := Vector3.ONE, pos_override := Vector3.ZERO, rot_override := Vector3.ZERO) -> MeshInstance3D:
	var m := MeshInstance3D.new()
	m.mesh = mesh
	m.scale = scale_override
	m.position = pos_override
	m.rotation = rot_override
	var mat = StandardMaterial3D.new()
	mat.albedo_texture = texture
	mat.uv1_scale = scale_override
	m.material_override = mat
	add_child(m)
	return m
