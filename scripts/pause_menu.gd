extends Control

func show_menu():
	show()
func hide_menu():
	hide()

func _on_visibility_changed():
	get_tree().paused=not get_tree().paused
	


func _on_button_pressed():
	hide_menu()
