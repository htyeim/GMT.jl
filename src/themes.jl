function theme(name; kwargs...)
	reset_defaults(API)
	d = KW(kwargs)
	font = ((val = find_in_dict(d, [:font])[1]) !== nothing) ? string(val) : ""
	bg_color = ((val = find_in_dict(d, [:bg_color])[1]) !== nothing) ? string(val) : ""
	color = ((val = find_in_dict(d, [:fg_color])[1]) !== nothing) ? string(val) : ""
	if (name == :dark || name == "dark")
		if (font == "")  fonts = ["AvantGarde-Book", "AvantGarde-Demi", "Helvetica"]	# The GMT settings
		else             fonts = [font, font, font]
		end
		if (color == "") colors = ["gray92", "gray86"]		# The GMT settings
		else             colors = [color, color]
		end
		(bg_color == "") && (bg_color = "5/5/35")

		gmtlib_setparameter(API, "FONT_ANNOT_PRIMARY", "12p,$(fonts[1]),$(color[1])")
		gmtlib_setparameter(API, "FONT_ANNOT_SECONDARY", "14p,$(fonts[1]),$(color[])")
		gmtlib_setparameter(API, "FONT_HEADING", "32p,$(fonts[2]),$(color[1])")
		gmtlib_setparameter(API, "FONT_LABEL", "16p,$(fonts[1]),black")
		gmtlib_setparameter(API, "FONT_LOGO", "8p,$(fonts[3]),$(color[1])")
		gmtlib_setparameter(API, "FONT_TAG", "20p,$(fonts[1]),$(color[1])")
		gmtlib_setparameter(API, "FONT_TITLE", "24p,$(fonts[2]),$(color[1])")

		gmtlib_setparameter(API, "MAP_DEFAULT_PEN", "default,$(color[1])")
		gmtlib_setparameter(API, "MAP_FRAME_PEN", "thicker,$(color[1])")
		gmtlib_setparameter(API, "MAP_GRID_PEN_PRIMARY", "default,$(color[1])")
		gmtlib_setparameter(API, "MAP_GRID_PEN_SECONDARY", "thinner,$(color[2])")
		gmtlib_setparameter(API, "MAP_TICK_PEN_PRIMARY", "thinner,$(color[1])")
		gmtlib_setparameter(API, "MAP_TICK_PEN_SECONDARY", "thinner,$(color[2])")
		gmtlib_setparameter(API, "PS_PAGE_COLOR", "$bg_color")
		ThemeIsOn[1] = true
	elseif (name == :modern || name == "modern")
		if (font == "")  fonts = ["AvantGarde-Book", "AvantGarde-Demi", "Helvetica"]	# The GMT settings
		else             fonts = [font, font, font]
		end
		(color == "") && (color = "black")
		(bg_color == "") && (bg_color = "white")

		gmtlib_setparameter(API, "FONT_ANNOT_PRIMARY", "auto,$(font[1]),$color")
		gmtlib_setparameter(API, "FONT_ANNOT_SECONDARY", "14p,$(font[1]),$color")
		gmtlib_setparameter(API, "FONT_HEADING", "auto,$(font[2]),$color")
		gmtlib_setparameter(API, "FONT_LABEL", "auto,$(font[1]),$color")
		gmtlib_setparameter(API, "FONT_LOGO", "auto,$(font[3]),$color")
		gmtlib_setparameter(API, "FONT_TAG", "auto,$(font[1]),$color")
		gmtlib_setparameter(API, "FONT_TITLE", "auto,$(font[2]),$color")
		gmtlib_setparameter(API, "FORMAT_GEO_MAP", "ddd:mm:ssF")
		gmtlib_setparameter(API, "MAP_FRAME_AXES", "WrStZ")
		gmtlib_setparameter(API, "MAP_ANNOT_MIN_SPACING", "auto")
		gmtlib_setparameter(API, "MAP_ANNOT_OFFSET_PRIMARY", "auto")
		gmtlib_setparameter(API, "MAP_ANNOT_OFFSET_SECONDARY", "auto")
		gmtlib_setparameter(API, "MAP_FRAME_TYPE", "plain")
		gmtlib_setparameter(API, "MAP_FRAME_WIDTH", "auto")
		gmtlib_setparameter(API, "MAP_HEADING_OFFSET", "auto")
		gmtlib_setparameter(API, "MAP_LABEL_OFFSET", "auto")
		gmtlib_setparameter(API, "MAP_TICK_LENGTH_PRIMARY", "auto")
		gmtlib_setparameter(API, "MAP_TICK_LENGTH_SECONDARY", "auto")
		gmtlib_setparameter(API, "MAP_TITLE_OFFSET", "auto")
		gmtlib_setparameter(API, "MAP_VECTOR_SHAPE", "auto")
		gmtlib_setparameter(API, "PS_PAGE_COLOR", "$bg_color")
		ThemeIsOn[1] = true
	else
		ThemeIsOn[1] = false			# Because we called reset_defaults() above
	end
	return nothing
end