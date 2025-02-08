#region KEYS
var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"))
var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"))
var key_up = keyboard_check(vk_up) || keyboard_check(ord("W"))
var key_down = keyboard_check(vk_down) || keyboard_check(ord("S"))

var key_shoot = mouse_check_button_pressed(0)
#endregion

#region MOVEMENT
var move_vertical = key_down - key_up
var move_horizontal = key_right - key_left

if move_horizontal != 0 and move_vertical != 0 {
	var l = sqrt(move_horizontal * move_horizontal + move_vertical * move_vertical)
	move_horizontal /= l
	move_vertical /= l
}

hspd = move_horizontal * wspd
vspd = move_vertical * wspd

if place_meeting(x, y + vspd, o_Collision) {
	while !place_meeting(x, y + sign(vspd), o_Collision) {
		y += sign(vspd)
	}
	vspd = 0
}
y += vspd

if place_meeting(x + hspd, y, o_Collision) {
	while !place_meeting(x + sign(hspd), y, o_Collision) {
		x += sign(hspd)
	}
	hspd = 0
}
x += hspd
#endregion

direction = point_direction(x, y, mouse_x, mouse_y)

if key_shoot {
	
}