/// @func jloc_get_last_error()
/// @desc Get the last error returned by the library
/// @return {JLOC_e_error.*}

if (jloc_is_initialised() == false)
	global.__jloc_last_error = JLOC_e_error.not_initialised;

return global.__jloc_last_error;