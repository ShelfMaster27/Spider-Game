extends Node2D

func Is_Within_Sight(Raycasts: Object,Neighbor: Object):#returns true if node can be seen and false otherwise
	var Cast = get_node("RayCast2D")
	Cast.set_global_position(Raycasts.get_global_position())
	var CastAngle = Raycasts.global_position.angle_to_point(Neighbor.global_position)  * (180/PI)# converts radians to degrees
	Cast.rotation_degrees = CastAngle - 90 * -1#adjusts for +90 degree misalignment. Dont know why is flipped. doesnt matter however


