extends RayCast2D

@onready var casting_particles: CPUParticles2D = $CastingParticles
@onready var collision_particles_2: CPUParticles2D = $CollisionParticles
@onready var beam_particle_2d: CPUParticles2D = $BeamParticles
@export var damage: float = 50

var is_casting: bool = false :
	set(value): 
		is_casting = value
		
		beam_particle_2d.emitting = is_casting
		casting_particles.emitting = is_casting
		
		if is_casting:
			appear()
		else:
			collision_particles_2.emitting = false
			disapear()
		set_physics_process(is_casting)

func _ready():
	is_casting = false

func _physics_process(delta: float) -> void:
	var cast_point := target_position
	force_raycast_update()
	
	collision_particles_2.emitting = is_colliding()
	
	if is_colliding():
		cast_point = to_local(get_collision_point())
		collision_particles_2.global_rotation = get_collision_normal().angle()
		collision_particles_2.position = cast_point
		
		var obj = get_collider()
		if obj.has_node("HealthComponent"):
			obj.get_node("HealthComponent").damage(damage * delta);
			
	
	$Line2D.points[1] = cast_point
	beam_particle_2d.position = cast_point * 0.5
	beam_particle_2d.emission_rect_extents.x = cast_point.length() * 0.5
	

		
func appear() -> void:
	var tween = create_tween()
	tween.tween_property($Line2D, "width", 3.0, 0.2)


func disapear() -> void:
	var tween = create_tween()
	tween.tween_property($Line2D, "width", 0, 0.1)
