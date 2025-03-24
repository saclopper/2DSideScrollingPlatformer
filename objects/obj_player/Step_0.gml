/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 09B6A990
/// @DnDComment : I would be pressing right$(13_10)-I would be pressing left$(13_10)0 would be no input
/// @DnDDisabled : 1
/// @DnDArgument : "expr" "keyboard_check(vk_right)- keyboard_check(vk_left)"
/// @DnDArgument : "var" "move_x"


/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 09E02DFA
/// @DnDArgument : "expr" "keyboard_check(vk_left)||gamepad_button_check(0,gp_padl)||(gamepad_axis_value(0,gp_axislh)<-0.2)"
/// @DnDArgument : "var" "controls_input_left"
controls_input_left = keyboard_check(vk_left)||gamepad_button_check(0,gp_padl)||(gamepad_axis_value(0,gp_axislh)<-0.2);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7E27FF1A
/// @DnDArgument : "expr" "keyboard_check(vk_right)||gamepad_button_check(0,gp_padr)||(gamepad_axis_value(0,gp_axislh)>0.2)"
/// @DnDArgument : "var" "controls_input_right"
controls_input_right = keyboard_check(vk_right)||gamepad_button_check(0,gp_padr)||(gamepad_axis_value(0,gp_axislh)>0.2);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3923A59E
/// @DnDArgument : "expr" "controls_input_right-controls_input_left"
/// @DnDArgument : "var" "move_x"
move_x = controls_input_right-controls_input_left;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 02997360
/// @DnDArgument : "expr" "move_x*walk_speed"
/// @DnDArgument : "var" "move_x"
move_x = move_x*walk_speed;

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

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
	/// @DnDVersion : 1
	/// @DnDHash : 30BED836
	/// @DnDParent : 68268AF4
	var l30BED836_0;
	l30BED836_0 = keyboard_check_pressed(vk_space);
	if (l30BED836_0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 20B97CBF
		/// @DnDComment : Jump
		/// @DnDParent : 30BED836
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 2B8FA08A
		/// @DnDParent : 30BED836
		/// @DnDArgument : "soundid" "sound_jump"
		/// @DnDSaveInfo : "soundid" "sound_jump"
		audio_play_sound(sound_jump, 0, 0, 1.0, undefined, 1.0);
	}

	/// @DnDAction : YoYo Games.Gamepad.If_Gamepad_Button_Pressed
	/// @DnDVersion : 1.1
	/// @DnDHash : 5C5B47A6
	/// @DnDParent : 68268AF4
	/// @DnDArgument : "btn" "gp_face1"
	var l5C5B47A6_0 = 0;
	var l5C5B47A6_1 = gp_face1;
	if(gamepad_is_connected(l5C5B47A6_0) && gamepad_button_check_pressed(l5C5B47A6_0, l5C5B47A6_1))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0CC27137
		/// @DnDComment : Jump
		/// @DnDParent : 5C5B47A6
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 08B3EE96
		/// @DnDParent : 5C5B47A6
		/// @DnDArgument : "soundid" "sound_jump"
		/// @DnDSaveInfo : "soundid" "sound_jump"
		audio_play_sound(sound_jump, 0, 0, 1.0, undefined, 1.0);
	}
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