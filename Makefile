all: build create-script-folder theme modules join-script-files resolve-submodules modularize-script minify-script

include ../../build/modules.mk

UI_DEPS_JS =
UI_DEPS_CSS =

MODULE = ui
MODULARIZE_OPTIONS = -jq -d "${UI_DEPS_JS}" -css "${UI_DEPS_CSS}"

SOURCE_SCRIPT_FOLDER = dist/jquery-ui-1.10.4pre/ui

SOURCE_STYLE_FOLDER      = dist/jquery-ui-1.10.4pre/themes/base
SOURCE_STYLE_FILE_PREFIX = jquery.ui.
SOURCE_STYLE_FILES       = \
	accordion \
	all \
	autocomplete \
	base \
	button \
	core \
	datepicker \
	dialog \
	menu \
	progressbar \
	resizable \
	selectable \
	slider \
	spinner \
	tabs \
	theme \
	tooltip

TARGET_STYLE_LESS_CONVERTER = ${USE_FOUNDRY_URI} | \
	${USE_LESS_IMPORT} | \
	${STRIP_EXTENSION_FROM_LESS_IMPORT_DIRECTIVE}

USE_FOUNDRY_URI = sed 's/url(images/url(@{global_uri}\/ui\/images/g'
USE_LESS_IMPORT = sed 's/url(\"jquery.ui./\"ui\//g'
STRIP_EXTENSION_FROM_LESS_IMPORT_DIRECTIVE = sed 's/.css\")/\"/g'

SOURCE_ASSET_FILES = ${SOURCE_STYLE_FOLDER}/images/*
TARGET_ASSET_FOLDER_NAME = images

SOURCE_SCRIPT_FILES = \
	${TARGET_SCRIPT_FOLDER}/core.js \
	${TARGET_SCRIPT_FOLDER}/widget.js \
	${TARGET_SCRIPT_FOLDER}/accordion.js \
	${TARGET_SCRIPT_FOLDER}/autocomplete.js \
	${TARGET_SCRIPT_FOLDER}/datepicker.js \
	${TARGET_SCRIPT_FOLDER}/draggable.js \
	${TARGET_SCRIPT_FOLDER}/droppable.js \
	${TARGET_SCRIPT_FOLDER}/effect.js \
	${TARGET_SCRIPT_FOLDER}/menu.js \
	${TARGET_SCRIPT_FOLDER}/mouse.js \
	${TARGET_SCRIPT_FOLDER}/position.js \
	${TARGET_SCRIPT_FOLDER}/resizable.js \
	${TARGET_SCRIPT_FOLDER}/selectable.js \
	${TARGET_SCRIPT_FOLDER}/sortable.js \
	${TARGET_SCRIPT_FOLDER}/spinner.js

build:
	grunt release
	# $(eval SOURCE_SCRIPT_FILE = ${SOURCE_SCRIPT_FOLDER}/jquery-ui.js)

resolve-submodules:
	echo '$$.module(["ui/core","ui/widget","ui/accordion","ui/autocomplete","ui/datepicker","ui/draggable","ui/droppable","ui/effect","ui/menu","ui/mouse","ui/position","ui/resizable","ui/selectable","ui/sortable","ui/spinner"]);' | cat - ${TARGET_SCRIPT_UNCOMPRESSED} > temp && mv temp ${TARGET_SCRIPT_UNCOMPRESSED}

theme: copy-styles minify-styles lessify-styles copy-assets
	make style

style: .style copy-style minify-style lessify-style

.style:
	$(eval SOURCE_STYLE_FILE = ${SOURCE_STYLE_FOLDER}/jquery-ui.css)
	$(eval TARGET_STYLE_FILE_NAME = all)

modules:
	make ui/core
	make ui/widget
	make ui/accordion
	make ui/autocomplete
	make ui/datepicker
	make ui/draggable
	make ui/droppable
	make ui/effect
	make ui/menu
	make ui/mouse
	make ui/position
	make ui/resizable
	make ui/selectable
	make ui/sortable
	make ui/spinner
	make ui/slider

ui/%:
	make init-ui/$* pre-ui/$* post-ui/$*

init-ui/%:
	$(eval MODULE = ui/$*)
	$(eval SOURCE_SCRIPT_FILE_NAME = ui.$*)
	$(eval SOURCE_STYLE_FILE_NAME  = $*)
	$(eval TARGET_STYLE_FOLDER     = ${FOUNDRY_STYLES_FOLDER}/ui)
	$(eval TARGET_STYLE_FILE_NAME  = $*)
	@@echo

pre-ui/%:
	@@echo

post-ui/%: modularize-script minify-script
	@@echo

pre-ui/accordion: copy-style minify-style lessify-style
	$(eval UI_DEPS_JS  = ui/core,ui/widget)
	$(eval UI_DEPS_CSS = ui/accordion)

pre-ui/autocomplete: copy-style minify-style lessify-style
	$(eval UI_DEPS_JS  = ui/core,ui/widget,ui/position,ui/menu)
	$(eval UI_DEPS_CSS = ui/autocomplete)

pre-ui/core: copy-style minify-style lessify-style
	@@echo

pre-ui/datepicker:
	$(eval UI_DEPS_JS  = ui/core)
	$(eval SOURCE_SCRIPT_FILES = \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.datepicker.js \
		${SOURCE_SCRIPT_FOLDER}/i18n/jquery-ui-i18n.js \
		reset.js)
	$(eval UI_DEPS_CSS = ui/datepicker)

post-ui/datepicker: join-script-files modularize-script minify-script copy-style minify-style lessify-style

pre-ui/draggable:
	$(eval UI_DEPS_JS  = ui/core,ui/mouse,ui/widget)

pre-ui/droppable:
	$(eval UI_DEPS_JS  = ui/draggable)

pre-ui/effect:
	$(eval SOURCE_SCRIPT_FILES = \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-blind.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-explode.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-pulsate.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-transfer.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-bounce.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-fade.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-scale.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-clip.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-fold.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-shake.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-drop.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-highlight.js \
		${SOURCE_SCRIPT_FOLDER}/jquery.ui.effect-slide.js)

post-ui/effect: join-script-files modularize-script minify-script

pre-ui/menu: copy-style minify-style lessify-style
	$(eval UI_DEPS_JS  = ui/widget)

pre-ui/mouse:
	$(eval UI_DEPS_JS  = ui/widget)

pre-ui/resizable: copy-style minify-style lessify-style
	$(eval UI_DEPS_JS  = ui/core,ui/mouse,ui/widget)
	$(eval UI_DEPS_CSS = ui/resizable)

pre-ui/selectable: copy-style minify-style lessify-style
	$(eval UI_DEPS_JS  = ui/core,ui/mouse,ui/widget)
	$(eval UI_DEPS_CSS = ui/selectable)

pre-ui/sortable:
	$(eval UI_DEPS_JS  = ui/core,ui/mouse,ui/widget)

pre-ui/slider:
	$(eval UI_DEPS_JS  = ui/core,ui/mouse,ui/widget)

pre-ui/spinner: copy-style minify-style lessify-style
	$(eval UI_DEPS_JS  = ui/core,ui/mouse,ui/widget)
	$(eval UI_DEPS_CSS = ui/spinner)

.PHONY: build post-ui/datepicker post-ui/effect
