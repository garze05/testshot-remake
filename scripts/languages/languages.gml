function InitTranslations()
{
	global.localeData = load_csv("languages.csv")
	
	var _hh = ds_grid_height(global.localeData)
	var _translations = ds_map_create()
	
	for (var i = 0; i < _hh; i++)
	{
		// This gets the keys, because we are looking just for the values of the 0 rows
		ds_map_add(_translations, global.localeData[# 0, i], i)
	}
	
	global.keys = _translations
}

/// @desc Retrieve a text from the "languages.csv" file using a given key
/// @param {string} key key string to search
/// @param {any*} argument[1] optional value to be replaced in all languages
/// @returns {string} the retrieved text for the key provided, in the correct language
function Text(key)
{
	var _text = ""
	
	// If the key exists
	if global.keys[? key] != undefined
	{
		_text = global.localeData[# 1 + global.locale, global.keys[? key]]
		// This is so we dont need to replace values of stats in all translations for example
			var _a = argument_count > 1 ? argument[1] : ""
			_text = string_replace_all(_text, "{a}", _a)
	} else
	{
		// If we dont find the key, made the text the key so we know there is an error
		_text = key
	}
	return _text
}