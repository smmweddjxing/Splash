extends Control

func show_menu():
	show()
func hide_menu():
	hide()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_tree().paused:
		show_menu()


func _on_visibility_changed():
	get_tree().paused=visible


func _on_button_pressed():
	hide_menu()
