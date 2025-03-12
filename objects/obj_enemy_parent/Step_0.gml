/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 09B6A990
/// @DnDComment : I would be pressing right$(13_10)-I would be pressing left$(13_10)0 would be no input
/// @DnDDisabled : 1
/// @DnDArgument : "expr" "keyboard_check(vk_right)- keyboard_check(vk_left)"
/// @DnDArgument : "var" "move_x"


/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
/// @DnDVersion : 1
/// @DnDHash : 7C92E544
/// @DnDArgument : "msg" "move_x"
show_debug_message(string(move_x));

/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 68268AF4
/// @DnDComment : If on ground
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "2"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "collision_tilemap"
var l68268AF4_0 = instance_place(x + 0, y + 2, [collision_tilemap]);
if ((l68268AF4_0 > 0))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 72979797
	/// @DnDComment : Reset the falling speed$(13_10)on movement Y when you$(13_10)landed on the ground
	/// @DnDParent : 68268AF4
	/// @DnDArgument : "var" "move_y"
	move_y = 0;

	/// @DnDAction : YoYo Games.Collisions.If_Object_At
	/// @DnDVersion : 1.1
	/// @DnDHash : 2398DE83
	/// @DnDComment : is there a wall?
	/// @DnDParent : 68268AF4
	/// @DnDArgument : "x" "x+(25*sign(move_x))"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "object" "collision_tilemap"
	var l2398DE83_0 = instance_place(x+(25*sign(move_x)), y + 0, [collision_tilemap]);
	if ((l2398DE83_0 > 0))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 20B97CBF
		/// @DnDComment : Jump
		/// @DnDParent : 2398DE83
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;
	}

	/// @DnDAction : YoYo Games.Collisions.If_Object_At
	/// @DnDVersion : 1.1
	/// @DnDHash : 19A71200
	/// @DnDComment : is there a gap in$(13_10)the floor?
	/// @DnDParent : 68268AF4
	/// @DnDArgument : "x" "x+(30*sign(move_x))"
	/// @DnDArgument : "y" "y+50"
	/// @DnDArgument : "object" "collision_tilemap"
	/// @DnDArgument : "not" "1"
	var l19A71200_0 = instance_place(x+(30*sign(move_x)), y+50, [collision_tilemap]);
	if (!(l19A71200_0 > 0))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 36BAAC2F
		/// @DnDParent : 19A71200
		/// @DnDArgument : "expr" "move_x*-1"
		/// @DnDArgument : "var" "move_x"
		move_x = move_x*-1;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1C9D1EA8
		/// @DnDComment : jump
		/// @DnDParent : 19A71200
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;
	}

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
	/// @DnDVersion : 1
	/// @DnDHash : 30BED836
	/// @DnDDisabled : 1
	/// @DnDParent : 68268AF4
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 6572C53E
/// @DnDComment : If you're not on the ground
else
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 18DFC7DD
	/// @DnDComment : If we are falling after a jump
	/// @DnDParent : 6572C53E
	/// @DnDArgument : "var" "move_y"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "10"
	if(move_y < 10)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 12B3F302
		/// @DnDComment : Add gravity
		/// @DnDParent : 18DFC7DD
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "move_y"
		move_y += 1;
	}
}

/// @DnDAction : YoYo Games.Movement.move_and_collide
/// @DnDVersion : 1
/// @DnDHash : 51FF0358
/// @DnDComment : 1st object is the$(13_10)object to avoid
/// @DnDApplyTo : {obj_player}
/// @DnDArgument : "xvel" "move_x"
/// @DnDArgument : "yvel" "move_y"
/// @DnDArgument : "maxxmove" "walk_speed"
/// @DnDArgument : "maxymove" "jump_speed"
/// @DnDArgument : "object" "collision_tilemap"
move_and_collide(move_x, move_y, collision_tilemap,4,0,0,walk_speed,jump_speed);