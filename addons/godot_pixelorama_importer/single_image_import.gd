tool
extends EditorImportPlugin


func get_importer_name():
	return "com.technohacker.pixelorama"


func get_visible_name():
	return "Single Image"


func get_recognized_extensions():
	return ["pxo"]


# We save directly to stex because ImageTexture doesn't work for some reason
func get_save_extension():
	return "stex"


func get_resource_type():
	return "StreamTexture"


func get_import_options(_preset):
	return []


func get_option_visibility(_option, _options):
	return true


func get_preset_count():
	return 0


func import(source_file, save_path, _options, _r_platform_variants, _r_gen_files):
	"""
	Main import function. Reads the Pixelorama project and extracts the PNG image from it
	"""

	# Open the project
	var load_res = preload("./util/read_pxo_file.gd").read_pxo_file(source_file, save_path)
	return load_res.error
