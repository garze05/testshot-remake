// Language
    enum LOCALE { EN, ES, PT, DE }
    global.locale = LOCALE.EN
    InitTranslations()

// MACROS
// Colours
    #macro WHITE $f5ffe8

// INIT GLOBALS
global.trueKey = true
global.showDebugInfo = false
// TODO: This would be asked once before playing, and then retrieved with a .ini file
    global.name = "Player" // For testing
// Array to save all the writing sounds to cycle between them when drawing text
global.typeSFX = [snd_defaultWrite]

// Init default draw settings
draw_set_color(WHITE)
draw_set_font(fnt_8bit)