all: build create-script-folder modularize-script minify-script theme modules

include ../../build/modules.mk

UI_DEPS_JS = 
UI_DEPS_CSS = 

MODULE = ui
MODULARIZE_OPTIONS = -jq -d "${UI_DEPS_JS}" -css "${UI_DEPS_CSS}"

SOURCE_SCRIPT_FOLDER = dist/jquery-ui-1.10.0pre/ui

SOURCE_STYLE_FOLDER      = dist/jquery-ui-1.10.0pre/themes/base
SOURCE_STYLE_FILE_PREFIX = jquery.ui.
SOURCE_STYLE_FILES       = base theme

TARGET_STYLE_LESS_CONVERTER = ${USE_FOUNDRY_URI} | \
	${USE_LESS_IMPORT} | \
	${STRIP_EXTENSION_FROM_LESS_IMPORT_DIRECTIVE}

USE_FOUNDRY_URI = sed 's/url(images/url(@{foundry_uri}\/ui\/images/g'
USE_LESS_IMPORT = sed 's/url(\"jquery.ui./\"ui\//g'
STRIP_EXTENSION_FROM_LESS_IMPORT_DIRECTIVE = sed 's/.css\")/\"/g' 

SOURCE_ASSET_FILES = *.*
TARGET_ASSET_FOLDER_NAME = images

build:
	grunt release
	$(eval SOURCE_SCRIPT_FILE = ${SOURCE_SCRIPT_FOLDER}/jquery-ui.js)

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
		${SOURCE_SCRIPT_FOLDER}/i18n/jquery-ui-i18n.js)	
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

pre-ui/spinner: copy-style minify-style lessify-style
	$(eval UI_DEPS_JS  = ui/core,ui/mouse,ui/widget)
	$(eval UI_DEPS_CSS = ui/spinner)

.PHONY: build post-ui/datepicker post-ui/effect
