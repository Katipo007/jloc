/// @func jloc_set_directory(localisation_directory)
/// @desc Change the directory JLoc looks in for localisation files
/// @param {string} localisation_directory The folder that localisation files are stored in.

global.__jloc_directory = argument0;
global.__jloc_last_error = JLOC_e_error.no_error;