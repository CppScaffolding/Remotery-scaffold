-- scaffold geniefile for Remotery

Remotery_script = path.getabsolute(path.getdirectory(_SCRIPT))
Remotery_root = path.join(Remotery_script, "Remotery")

Remotery_includedirs = {
	path.join(Remotery_script, "config"),
	Remotery_root,
}

Remotery_libdirs = {}
Remotery_links = {}
Remotery_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { Remotery_includedirs }
	end,

	_add_defines = function()
		defines { Remotery_defines }
	end,

	_add_libdirs = function()
		libdirs { Remotery_libdirs }
	end,

	_add_external_links = function()
		links { Remotery_links }
	end,

	_add_self_links = function()
		links { "Remotery" }
	end,

	_create_projects = function()

project "Remotery"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		Remotery_includedirs,
	}

	defines {}

	files {
		path.join(Remotery_script, "config", "**.h"),
		path.join(Remotery_root, "**.h"),
		path.join(Remotery_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
