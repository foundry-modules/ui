include ../../build/modules.mk

SOURCE_DIR = dist/jquery-ui-1.10.0pre
UI = ${SOURCE_DIR}/ui
THEMES = ${SOURCE_DIR}/themes/base

all: clean premake grunt ui-all ui-all-min ui_ ui-min css-all css-all-min css css-min effect effect-min

premake:
	mkdir -p ${DEVELOPMENT_DIR}/ui
	mkdir -p ${PRODUCTION_DIR}/ui
	mkdir -p ${DEVELOPMENT_DIR}/ui/images
	mkdir -p ${PRODUCTION_DIR}/ui/images

grunt:
	grunt release

effect:
	${MODULARIZE} -jq -n "ui/effect" ${UI}/jquery.ui.effect.js > ${DEVELOPMENT_DIR}/ui/effect.js
	${MODULARIZE} -jq -n "ui/effect-blind"     -d "ui/effect" ${UI}/jquery.ui.effect-blind.js      > ${DEVELOPMENT_DIR}/ui/effect-blind.js
	${MODULARIZE} -jq -n "ui/effect-bounce"    -d "ui/effect" ${UI}/jquery.ui.effect-bounce.js     > ${DEVELOPMENT_DIR}/ui/effect-bounce.js
	${MODULARIZE} -jq -n "ui/effect-clip"      -d "ui/effect" ${UI}/jquery.ui.effect-clip.js       > ${DEVELOPMENT_DIR}/ui/effect-clip.js
	${MODULARIZE} -jq -n "ui/effect-drop"      -d "ui/effect" ${UI}/jquery.ui.effect-drop.js       > ${DEVELOPMENT_DIR}/ui/effect-drop.js
	${MODULARIZE} -jq -n "ui/effect-explode"   -d "ui/effect" ${UI}/jquery.ui.effect-explode.js    > ${DEVELOPMENT_DIR}/ui/effect-explode.js
	${MODULARIZE} -jq -n "ui/effect-fade"      -d "ui/effect" ${UI}/jquery.ui.effect-fade.js       > ${DEVELOPMENT_DIR}/ui/effect-fade.js
	${MODULARIZE} -jq -n "ui/effect-fold"      -d "ui/effect" ${UI}/jquery.ui.effect-fold.js       > ${DEVELOPMENT_DIR}/ui/effect-fold.js
	${MODULARIZE} -jq -n "ui/effect-highlight" -d "ui/effect" ${UI}/jquery.ui.effect-highlight.js  > ${DEVELOPMENT_DIR}/ui/effect-highlight.js
	${MODULARIZE} -jq -n "ui/effect-pulsate"   -d "ui/effect" ${UI}/jquery.ui.effect-pulsate.js    > ${DEVELOPMENT_DIR}/ui/effect-pulsate.js
	${MODULARIZE} -jq -n "ui/effect-scale"     -d "ui/effect" ${UI}/jquery.ui.effect-scale.js      > ${DEVELOPMENT_DIR}/ui/effect-scale.js
	${MODULARIZE} -jq -n "ui/effect-shake"     -d "ui/effect" ${UI}/jquery.ui.effect-shake.js      > ${DEVELOPMENT_DIR}/ui/effect-shake.js
	${MODULARIZE} -jq -n "ui/effect-slide"     -d "ui/effect" ${UI}/jquery.ui.effect-slide.js      > ${DEVELOPMENT_DIR}/ui/effect-slide.js
	${MODULARIZE} -jq -n "ui/effect-transfer"  -d "ui/effect" ${UI}/jquery.ui.effect-transfer.js   > ${DEVELOPMENT_DIR}/ui/effect-transfer.js

effect-min:
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect.js > ${PRODUCTION_DIR}/ui/effect.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-blind.js     > ${PRODUCTION_DIR}/ui/effect-blind.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-bounce.js    > ${PRODUCTION_DIR}/ui/effect-bounce.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-clip.js      > ${PRODUCTION_DIR}/ui/effect-clip.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-drop.js      > ${PRODUCTION_DIR}/ui/effect-drop.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-explode.js   > ${PRODUCTION_DIR}/ui/effect-explode.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-fade.js      > ${PRODUCTION_DIR}/ui/effect-fade.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-fold.js      > ${PRODUCTION_DIR}/ui/effect-fold.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-highlight.js > ${PRODUCTION_DIR}/ui/effect-highlight.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-pulsate.js   > ${PRODUCTION_DIR}/ui/effect-pulsate.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-scale.js     > ${PRODUCTION_DIR}/ui/effect-scale.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-shake.js     > ${PRODUCTION_DIR}/ui/effect-shake.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-slide.js     > ${PRODUCTION_DIR}/ui/effect-slide.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/effect-transfer.js  > ${PRODUCTION_DIR}/ui/effect-transfer.js

ui-all:
	${MODULARIZE} -jq -n "ui" \
		-css "ui/all" \
			${UI}/jquery-ui.js > ${DEVELOPMENT_DIR}/ui.js

ui-all-min:
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui.js > ${PRODUCTION_DIR}/ui.js

ui_:
	${MODULARIZE} -jq -n "ui/core" \
		-css "ui/core,ui/theme" \
			${UI}/jquery.ui.core.js > ${DEVELOPMENT_DIR}/ui/core.js


	${MODULARIZE} -jq -n "ui/widget" \
			${UI}/jquery.ui.widget.js > ${DEVELOPMENT_DIR}/ui/widget.js


	${MODULARIZE} -jq -n "ui/accordion" \
		-d   "ui/core,ui/widget" \
		-css "ui/accordion" \
			${UI}/jquery.ui.accordion.js > ${DEVELOPMENT_DIR}/ui/accordion.js

	${MODULARIZE} -jq -n "ui/autocomplete" \
		-d   "ui/core,ui/widget,ui/position,ui/menu" \
		-css "ui/autocomplete" \
			${UI}/jquery.ui.autocomplete.js > ${DEVELOPMENT_DIR}/ui/autocomplete.js

	cat "${UI}/jquery.ui.datepicker.js" "${UI}/i18n/jquery-ui-i18n.js" > ${UI}/jquery.ui.datepicker.tmp
	${MODULARIZE} -jq -n "ui/datepicker" \
		-d   "ui/core" \
		-css "ui/datepicker" \
			${UI}/jquery.ui.datepicker.tmp > ${DEVELOPMENT_DIR}/ui/datepicker.js

	${MODULARIZE} -jq -n "ui/button" \
		-d   "ui/core,ui/widget" \
		-css "ui/button" \
			${UI}/jquery.ui.button.js > ${DEVELOPMENT_DIR}/ui/button.js

	${MODULARIZE} -jq -n "ui/dialog" \
		-d   "ui/core,ui/widget,ui/button,ui/draggable,ui/mouse,ui/position,ui/resizable" \
		-css "ui/dialog" \
			${UI}/jquery.ui.dialog.js > ${DEVELOPMENT_DIR}/ui/dialog.js

	${MODULARIZE} -jq -n "ui/draggable" \
		-d "ui/core,ui/mouse,ui/widget" \
			${UI}/jquery.ui.draggable.js > ${DEVELOPMENT_DIR}/ui/draggable.js

	${MODULARIZE} -jq -n "ui/droppable" \
		-d "ui/draggable" \
			${UI}/jquery.ui.droppable.js > ${DEVELOPMENT_DIR}/ui/droppable.js

	${MODULARIZE} -jq -n "ui/menu" \
		-d   "ui/core,ui/widget" \
		-css "ui/menu" \
			${UI}/jquery.ui.menu.js > ${DEVELOPMENT_DIR}/ui/menu.js

	${MODULARIZE} -jq -n "ui/mouse" \
		-d "ui/widget" \
			${UI}/jquery.ui.mouse.js > ${DEVELOPMENT_DIR}/ui/mouse.js

	${MODULARIZE} -jq -n "ui/position" \
		${UI}/jquery.ui.position.js > ${DEVELOPMENT_DIR}/ui/position.js

	${MODULARIZE} -jq -n "ui/progressbar" \
		-d   "ui/core,ui/widget" \
		-css "ui/progressbar" \
			${UI}/jquery.ui.progressbar.js > ${DEVELOPMENT_DIR}/ui/progressbar.js

	${MODULARIZE} -jq -n "ui/resizable" \
		-d   "ui/core,ui/mouse,ui/widget" \
		-css "ui/resizable" \
			${UI}/jquery.ui.resizable.js > ${DEVELOPMENT_DIR}/ui/resizable.js

	${MODULARIZE} -jq -n "ui/selectable" \
		-d   "ui/core,ui/mouse,ui/widget" \
		-css "ui/selectable" \
			${UI}/jquery.ui.selectable.js > ${DEVELOPMENT_DIR}/ui/selectable.js

	${MODULARIZE} -jq -n "ui/slider" \
		-d "ui/core,ui/mouse,ui/widget" \
		-css "ui/slider" \
			${UI}/jquery.ui.slider.js > ${DEVELOPMENT_DIR}/ui/slider.js

	${MODULARIZE} -jq -n "ui/sortable" \
		-d "ui/core,ui/mouse,ui/widget" \
			${UI}/jquery.ui.sortable.js > ${DEVELOPMENT_DIR}/ui/sortable.js

	${MODULARIZE} -jq -n "ui/spinner" \
		-d "ui/core,ui/mouse,ui/widget" \
		-css "ui/spinner" \
			${UI}/jquery.ui.spinner.js > ${DEVELOPMENT_DIR}/ui/spinner.js

	${MODULARIZE} -jq -n "ui/tabs" \
		-d   "ui/core,ui/widget" \
		-css "ui/tabs" \
			${UI}/jquery.ui.tabs.js > ${DEVELOPMENT_DIR}/ui/tabs.js

	${MODULARIZE} -jq -n "ui/tooltip" \
		-d   "ui/core,ui/mouse,ui/widget" \
		-css "ui/tooltip" \
			${UI}/jquery.ui.tooltip.js > ${DEVELOPMENT_DIR}/ui/tooltip.js

ui-min:
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/core.js          > ${PRODUCTION_DIR}/ui/core.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/accordion.js     > ${PRODUCTION_DIR}/ui/accordion.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/autocomplete.js  > ${PRODUCTION_DIR}/ui/autocomplete.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/button.js        > ${PRODUCTION_DIR}/ui/button.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/datepicker.js    > ${PRODUCTION_DIR}/ui/datepicker.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/dialog.js        > ${PRODUCTION_DIR}/ui/dialog.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/draggable.js     > ${PRODUCTION_DIR}/ui/draggable.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/droppable.js     > ${PRODUCTION_DIR}/ui/droppable.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/menu.js          > ${PRODUCTION_DIR}/ui/menu.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/mouse.js         > ${PRODUCTION_DIR}/ui/mouse.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/position.js      > ${PRODUCTION_DIR}/ui/position.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/progressbar.js   > ${PRODUCTION_DIR}/ui/progressbar.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/resizable.js     > ${PRODUCTION_DIR}/ui/resizable.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/selectable.js    > ${PRODUCTION_DIR}/ui/selectable.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/slider.js        > ${PRODUCTION_DIR}/ui/slider.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/sortable.js      > ${PRODUCTION_DIR}/ui/sortable.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/spinner.js       > ${PRODUCTION_DIR}/ui/spinner.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/tabs.js          > ${PRODUCTION_DIR}/ui/tabs.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/tooltip.js       > ${PRODUCTION_DIR}/ui/tooltip.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/widget.js        > ${PRODUCTION_DIR}/ui/widget.js

css-all:
	cp ${THEMES}/jquery-ui.css ${DEVELOPMENT_DIR}/ui/all.css

css-all-min:
	${UGLIFYCSS} ${DEVELOPMENT_DIR}/ui/all.css > ${PRODUCTION_DIR}/ui/all.css

css:
	cp -r ${THEMES}/images/*                ${DEVELOPMENT_DIR}/ui/images
	cp ${THEMES}/jquery.ui.accordion.css    ${DEVELOPMENT_DIR}/ui/accordion.css
	cp ${THEMES}/jquery.ui.autocomplete.css ${DEVELOPMENT_DIR}/ui/autocomplete.css
	cp ${THEMES}/jquery.ui.button.css       ${DEVELOPMENT_DIR}/ui/button.css
	cp ${THEMES}/jquery.ui.core.css         ${DEVELOPMENT_DIR}/ui/core.css
	cp ${THEMES}/jquery.ui.datepicker.css   ${DEVELOPMENT_DIR}/ui/datepicker.css
	cp ${THEMES}/jquery.ui.dialog.css       ${DEVELOPMENT_DIR}/ui/dialog.css
	cp ${THEMES}/jquery.ui.menu.css         ${DEVELOPMENT_DIR}/ui/menu.css
	cp ${THEMES}/jquery.ui.progressbar.css  ${DEVELOPMENT_DIR}/ui/progressbar.css
	cp ${THEMES}/jquery.ui.resizable.css    ${DEVELOPMENT_DIR}/ui/resizable.css
	cp ${THEMES}/jquery.ui.selectable.css   ${DEVELOPMENT_DIR}/ui/selectable.css
	cp ${THEMES}/jquery.ui.slider.css       ${DEVELOPMENT_DIR}/ui/slider.css
	cp ${THEMES}/jquery.ui.spinner.css      ${DEVELOPMENT_DIR}/ui/spinner.css
	cp ${THEMES}/jquery.ui.tabs.css         ${DEVELOPMENT_DIR}/ui/tabs.css
	cp ${THEMES}/jquery.ui.theme.css        ${DEVELOPMENT_DIR}/ui/theme.css
	cp ${THEMES}/jquery.ui.tooltip.css      ${DEVELOPMENT_DIR}/ui/tooltip.css

css-min:
	cp -r ${THEMES}/images/* ${PRODUCTION_DIR}/ui/images
	${UGLIFYCSS} ${THEMES}/jquery.ui.accordion.css    > ${PRODUCTION_DIR}/ui/accordion.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.autocomplete.css > ${PRODUCTION_DIR}/ui/autocomplete.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.button.css       > ${PRODUCTION_DIR}/ui/button.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.core.css         > ${PRODUCTION_DIR}/ui/core.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.datepicker.css   > ${PRODUCTION_DIR}/ui/datepicker.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.dialog.css       > ${PRODUCTION_DIR}/ui/dialog.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.menu.css         > ${PRODUCTION_DIR}/ui/menu.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.progressbar.css  > ${PRODUCTION_DIR}/ui/progressbar.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.resizable.css    > ${PRODUCTION_DIR}/ui/resizable.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.selectable.css   > ${PRODUCTION_DIR}/ui/selectable.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.slider.css       > ${PRODUCTION_DIR}/ui/slider.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.spinner.css      > ${PRODUCTION_DIR}/ui/spinner.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.tabs.css         > ${PRODUCTION_DIR}/ui/tabs.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.theme.css        > ${PRODUCTION_DIR}/ui/theme.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.tooltip.css      > ${PRODUCTION_DIR}/ui/tooltip.css

clean:
	rm -fr ${PRODUCTION_DIR}/ui
	rm -fr ${PRODUCTION_DIR}/ui.js
	rm -fr ${DEVELOPMENT_DIR}/ui
	rm -fr ${DEVELOPMENT_DIR}/ui.js



