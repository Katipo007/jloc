/// @func jloc_language_exists(language_filename)
/// @desc
/// @param {string} language_filename Filename of the language file WITHOUT extension
/// @return true if the localisation file was found to exist, false otherwise
__JLOC_INITIALISED_GUARD;

var v = file_exists(global.__jloc_directory + "/" + argument0);
global.__jloc_last_error = v ? JLOC_e_error.no_error : JLOC_e_error.file_not_found;
return v;