function love.conf(t)
	t.identity = nil
	t.version  = "0.10.1"
	t.console  = false

	t.window.title          = "두더지 잡기 게임"
	t.window.icon           = nil
	t.window.width          = 800
	t.window.height         = 600
	t.window.borderless     = false
	t.window.resizable      = true
	t.window.minwidth       = 640
	t.window.minheight      = 480
	t.window.fullscreen     = false
	t.window.fullscreentype = "desktop"
	t.window.vsync          = true
	t.window.fsaa           = 0
	t.window.display        = 1
	t.window.highdpi        = false
   t.window.srgb           = false

	t.modules.audio    = true
	t.modules.event    = true
	t.modules.graphics = true
	t.modules.image    = true
	t.modules.joystick = true
	t.modules.keyboard = true
	t.modules.math     = true
	t.modules.mouse    = true
	t.modules.physics  = true
	t.modules.sound    = true
	t.modules.system   = true
	t.modules.timer    = true
	t.modules.window   = true

	io.stdout:setvbuf("no")
end
