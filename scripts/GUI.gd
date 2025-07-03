extends Control

@onready var debug_text: RichTextLabel = $DebugText
@onready var pause_menu: Control = $PauseMenu

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(_delta: float) -> void:
	if (!OS.is_debug_build()): return
	debug_text.text = ""
	debug_text.text += "FPS: " + str(Engine.get_frames_per_second()) + "\n"
	debug_text.text += "Nuggets: " + str(PlayerVariables.nuggets)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		print("paused")
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			pause_menu.visible = true
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			pause_menu.visible = false
