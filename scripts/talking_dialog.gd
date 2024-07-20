extends Control
var s=["test","2","3","4"]
# Called when the node enters the scene tree for the first time.
func _ready():
	show_dialog(s)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_dialog(Dialogs:Array)->bool:
	print("hey!")
	for i in Dialogs:
		$ColorRect/RichTextLabel.text=i
		while get_input()==true:
			print("Wating!")
	hide()
	return true
func get_input():
	return Input.is_key_label_pressed(KEY_ENTER)
