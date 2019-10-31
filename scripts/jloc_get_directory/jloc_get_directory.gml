/// @func jloc_get_directory()
/// @desc Get the directory currently marked as containing the localisation files
/// @return Filepath to the localisation directory or `undefined` if the library is not initialised.

__JLOC_INITIALISED_GUARD;

global.__jloc_last_error = JLOC_e_error.no_error;
return global.__jloc_directory;