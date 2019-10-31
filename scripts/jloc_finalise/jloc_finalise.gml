/// @func jloc_finalise()
/// @desc Finalise the JLoc library, releasing any and all resources it is using.

if (variable_global_exists("__jloc_initalised") == false)
	return;

// destroy the data map (if it exists)
if (variable_global_exists("__jloc_data")) {
	ds_map_destroy(global.__jloc_data);
}

global.__jloc_initalised = false;