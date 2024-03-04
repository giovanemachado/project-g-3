extends Node

# To declare:
signal game_over

# To connect:
# Globals.connect("game_over", self, "_on_game_over")

# To emit:
# Globals.emit_signal("game_over")

const SCENES = {
	GAME = "res://gameplay/GameplayScene.tscn",
	CREDITS = 'MenuScene',
}

# enum ExampleEnum {A, B}
# const EXAMPLE_CONST = 'const value'
# const EXAMPLE_CONST_OBJECT = { 
#		PROPERTY1 = 'preperty 1', 
#		PROPERTY2 = 'property 2',
# }

# To use:
# Globals.EXAMPLE_CONST
