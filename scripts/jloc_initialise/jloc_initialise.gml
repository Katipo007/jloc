/// @func jloc_initialise([localisation_directory])
/// @desc Initialse the JLoc library
/// @param {string} localisation_directory The folder that localisation files are stored in.

#macro __JLOC_INITIALISED_GUARD {if (jloc_is_initialised() == false) {global.__jloc_last_error = JLOC_e_error.not_initialised; return undefined;}}

// error codes returned by some functions
enum JLOC_e_error {
	// no error occured, everything is fine
	no_error = 0,
	
	// The library is not initialised or has been closed
	not_initialised = -1,
	
	// failed to find the file the library was instructed to load
	file_not_found = -2,
	
	// error reading file, check the output log for more details
	file_read_error = -3,
	
	// failed to parse the json file
	json_parse_error = -4,
}

global.__jloc_last_error = JLOC_e_error.no_error;
global.__jloc_initalised = true;
global.__jloc_active = "";
global.__jloc_active_path = "";
global.__jloc_data = ds_map_create();
global.__jloc_directory = working_directory + "localisation";