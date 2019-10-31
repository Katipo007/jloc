/// @func jloc_is_initialised()
/// @desc Check whether the library is initialised
/// @return true if initialised, false otherwise

if (variable_global_exists("__jloc_initalised") == false)
	return false;

return global.__jloc_initalised;