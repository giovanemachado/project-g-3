extends Node

# Data persistence between levels and gameplays
export var resource : Resource

func _ready():
	assert(resource != GameData, "Resource is not a class extended from GameData")

func save():
	ResourceSaver.save(resource.resource_path, resource)
