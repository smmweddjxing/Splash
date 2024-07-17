extends Node

var life=3

var is_hurting=false
var coin=0
var max_life=3
var combo=0
var stars=0

func save():
	var config = ConfigFile.new()
	config.set_value("Player1", "COIN", coin)
	config.set_value("Player1", "MAX_LIFE", max_life)
	config.set_value("Player1", "STAR", stars)
	config.set_value("Player1", "LIFE", life)
	config.save("C:/save.ini")
func read():
	var config = ConfigFile.new()

	# Load data from a file.
	config.load("user://save.ini")
	# Iterate over all sections.
	for player in config.get_sections():
		# Fetch the data for each section.
		coin = config.get_value(player, "COIN")
		max_life = config.get_value(player, "MAX_LIFE")
		stars = config.get_value(player, "STAR")
		life = config.get_value(player, "LIFE")
		




