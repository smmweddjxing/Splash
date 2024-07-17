extends Node
const save_path="user://save.ini"
const pwd="94E8A92F3B0BA4BE6DC980391C906261F4A6434A95FE589B"
var life=3

var is_hurting=false
var coin=0
var max_life=3
var combo=0
var stars=0
var stars_get:Array=[]
var flags_pointed:Array=[]
var relive=Vector2(-30,9.81)
func init():
	coin=0
	max_life=3
	combo=0
	stars=0
	stars_get=[]
	flags_pointed=[]
	relive=Vector2(42,-6.81)

func should_free(starname)->bool:
	if starname in stars_get:
		return 0
	else :return 1
func save():
	var data={
		"coin":coin,
		"maxlife":max_life,
		"star":stars,
		"starget":stars_get,
		"fgpt":flags_pointed,
		"rp":relive
	}
	var config = ConfigFile.new()
	config.set_value("player","data",data)
	#config.save(save_path)
	config.save_encrypted_pass(save_path,pwd)
func read():
	var config = ConfigFile.new()
	var data_loaded={}
	# Load data from a file.
	#var err=config.load(save_path)
	var err=config.load_encrypted_pass(save_path,pwd)
	if err!=OK:
		return
		
	data_loaded=config.get_value("player","data")
	settings.coin=data_loaded["coin"]
	settings.max_life=data_loaded["maxlife"]
	settings.stars=data_loaded["star"]
	settings.stars_get=data_loaded["starget"]
	settings.flags_pointed=data_loaded["fgpt"]
	settings.relive=data_loaded["rp"]


