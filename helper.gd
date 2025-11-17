@tool
extends Node


func is_even(value : int, even_output, odd_output):
	if value % 2 == 0:
		return even_output
	else:
		return odd_output
	
