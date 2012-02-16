SRC_DIR = build/dist/jquery-ui-1.9pre
UI = ${SRC_DIR}/ui
THEMES = ${SRC_DIR}/themes/base

FOUNDRY_DIR = ../..
PROD = ${FOUNDRY_DIR}/scripts
DEV = ${FOUNDRY_DIR}/scripts_

MODULARIZE = ${FOUNDRY_DIR}/build/modularize
UGLIFY = uglifyjs --unsafe -nc
UGLIFYCSS = uglifycss

all: premake ant ui-all ui-all-min ui_ ui-min css-all css-all-min css css-min effects effects-min

premake:
	mkdir -p ${DEV}/ui
	mkdir -p ${DEV}/effects
	mkdir -p ${PROD}/ui
	mkdir -p ${PROD}/effects
	mkdir -p ${DEV}/ui/images
	mkdir -p ${PROD}/ui/images

ant:
	cd build && ant && cd ..

effects:
	cp ${UI}/jquery.effects.blind.js      ${DEV}/effects/blind.js
	cp ${UI}/jquery.effects.bounce.js     ${DEV}/effects/bounce.js
	cp ${UI}/jquery.effects.clip.js       ${DEV}/effects/clip.js
	cp ${UI}/jquery.effects.core.js       ${DEV}/effects/core.js
	cp ${UI}/jquery.effects.drop.js       ${DEV}/effects/drop.js
	cp ${UI}/jquery.effects.explode.js    ${DEV}/effects/explode.js
	cp ${UI}/jquery.effects.fade.js       ${DEV}/effects/fade.js
	cp ${UI}/jquery.effects.fold.js       ${DEV}/effects/fold.js
	cp ${UI}/jquery.effects.highlight.js  ${DEV}/effects/highlight.js
	cp ${UI}/jquery.effects.pulsate.js    ${DEV}/effects/pulsate.js
	cp ${UI}/jquery.effects.scale.js      ${DEV}/effects/scale.js
	cp ${UI}/jquery.effects.shake.js      ${DEV}/effects/shake.js
	cp ${UI}/jquery.effects.slide.js      ${DEV}/effects/slide.js
	cp ${UI}/jquery.effects.transfer.js   ${DEV}/effects/transfer.js

effects-min:
	${UGLIFY} ${DEV}/effects/blind.js     > ${PROD}/effects/blind.js
	${UGLIFY} ${DEV}/effects/bounce.js    > ${PROD}/effects/bounce.js
	${UGLIFY} ${DEV}/effects/clip.js      > ${PROD}/effects/clip.js
	${UGLIFY} ${DEV}/effects/core.js      > ${PROD}/effects/core.js
	${UGLIFY} ${DEV}/effects/drop.js      > ${PROD}/effects/drop.js
	${UGLIFY} ${DEV}/effects/explode.js   > ${PROD}/effects/explode.js
	${UGLIFY} ${DEV}/effects/fade.js      > ${PROD}/effects/fade.js
	${UGLIFY} ${DEV}/effects/fold.js      > ${PROD}/effects/fold.js
	${UGLIFY} ${DEV}/effects/highlight.js > ${PROD}/effects/highlight.js
	${UGLIFY} ${DEV}/effects/pulsate.js   > ${PROD}/effects/pulsate.js
	${UGLIFY} ${DEV}/effects/scale.js     > ${PROD}/effects/scale.js
	${UGLIFY} ${DEV}/effects/shake.js     > ${PROD}/effects/shake.js
	${UGLIFY} ${DEV}/effects/slide.js     > ${PROD}/effects/slide.js
	${UGLIFY} ${DEV}/effects/transfer.js  > ${PROD}/effects/transfer.js

ui-all:
	${MODULARIZE} -jq -n "ui" ${UI}/jquery-ui.js > ${DEV}/ui.js

ui-all-min:
	${UGLIFY} ${DEV}/ui.js > ${PROD}/ui.js

ui_:
	${MODULARIZE} -jq -n "ui/core" -css "ui/core,ui/theme" ${UI}/jquery.ui.core.js > ${DEV}/ui/core.js
	${MODULARIZE} -jq -n "ui/widget" ${UI}/jquery.ui.widget.js > ${DEV}/ui/widget.js
	${MODULARIZE} -jq -n "ui/accordion" -d "ui/core,ui/widget" -css "ui/accordion" ${UI}/jquery.ui.accordion.js > ${DEV}/ui/accordion.js
	${MODULARIZE} -jq -n "ui/autocomplete" -d "ui/core,ui/widget,ui/position,ui/menu" -css "ui/autocomplete"${UI}/jquery.ui.autocomplete.js > ${DEV}/ui/autocomplete.js
	${MODULARIZE} -jq -n "ui/button" -d "ui/core,ui/widget" -css "ui/button" ${UI}/jquery.ui.button.js > ${DEV}/ui/button.js
	${MODULARIZE} -jq -n "ui/datepicker" -d "ui/core,ui/i18n" -css "ui/datepicker" ${UI}/jquery.ui.datepicker.js > ${DEV}/ui/datepicker.js
	${MODULARIZE} -jq -n "ui/dialog" -d "ui/core,ui/widget,ui/button,ui/draggable,ui/mouse,ui/position,ui/resizable" -css "ui/dialog" ${UI}/jquery.ui.dialog.js > ${DEV}/ui/dialog.js
	${MODULARIZE} -jq -n "ui/draggable" -d "ui/core,ui/mouse,ui/widget" ${UI}/jquery.ui.draggable.js > ${DEV}/ui/draggable.js
	${MODULARIZE} -jq -n "ui/droppable" -d "ui/draggable" ${UI}/jquery.ui.droppable.js > ${DEV}/ui/droppable.js
	${MODULARIZE} -jq -n "ui/menu" -d "ui/core,ui/widget" -css "ui/menu" ${UI}/jquery.ui.menu.js > ${DEV}/ui/menu.js
	${MODULARIZE} -jq -n "ui/mouse" -d "ui/widget" ${UI}/jquery.ui.mouse.js > ${DEV}/ui/mouse.js
	${MODULARIZE} -jq -n "ui/position" ${UI}/jquery.ui.position.js > ${DEV}/ui/position.js
	${MODULARIZE} -jq -n "ui/progressbar" -d "ui/core,ui/widget" -css "ui/progressbar" ${UI}/jquery.ui.progressbar.js > ${DEV}/ui/progressbar.js
	${MODULARIZE} -jq -n "ui/resizable" -d "ui/core,ui/mouse,ui/widget" -css "ui/resizable" ${UI}/jquery.ui.resizable.js > ${DEV}/ui/resizable.js
	${MODULARIZE} -jq -n "ui/selectable" -d "ui/core,ui/mouse,ui/widget" -css "ui/selectable" ${UI}/jquery.ui.selectable.js > ${DEV}/ui/selectable.js
	${MODULARIZE} -jq -n "ui/slider" -d "ui/core,ui/mouse,ui/widget" -css "ui/slider" ${UI}/jquery.ui.slider.js > ${DEV}/ui/slider.js
	${MODULARIZE} -jq -n "ui/sortable" -d "ui/core,ui/mouse,ui/widget" ${UI}/jquery.ui.sortable.js > ${DEV}/ui/sortable.js
	${MODULARIZE} -jq -n "ui/spinner" -d "ui/core,ui/mouse,ui/widget" -css "ui/spinner" ${UI}/jquery.ui.spinner.js > ${DEV}/ui/spinner.js
	${MODULARIZE} -jq -n "ui/tabs" -d "ui/core,ui/widget" -css "ui/tabs" ${UI}/jquery.ui.tabs.js > ${DEV}/ui/tabs.js
	${MODULARIZE} -jq -n "ui/tooltip" -d "ui/core,ui/mouse,ui/widget" -css "ui/tooltip" ${UI}/jquery.ui.tooltip.js > ${DEV}/ui/tooltip.js
	${MODULARIZE} -jq -n "ui/i18n" -d "ui/datepicker" ${UI}/i18n/jquery-ui-i18n.js > ${DEV}/ui/i18n.js

ui-min:
	${UGLIFY} ${DEV}/ui/core.js          > ${PROD}/ui/core.js
	${UGLIFY} ${DEV}/ui/accordion.js     > ${PROD}/ui/accordion.js
	${UGLIFY} ${DEV}/ui/autocomplete.js  > ${PROD}/ui/autocomplete.js
	${UGLIFY} ${DEV}/ui/button.js        > ${PROD}/ui/button.js
	${UGLIFY} ${DEV}/ui/datepicker.js    > ${PROD}/ui/datepicker.js
	${UGLIFY} ${DEV}/ui/dialog.js        > ${PROD}/ui/dialog.js
	${UGLIFY} ${DEV}/ui/draggable.js     > ${PROD}/ui/draggable.js
	${UGLIFY} ${DEV}/ui/droppable.js     > ${PROD}/ui/droppable.js
	${UGLIFY} ${DEV}/ui/menu.js          > ${PROD}/ui/menu.js
	${UGLIFY} ${DEV}/ui/mouse.js         > ${PROD}/ui/mouse.js
	${UGLIFY} ${DEV}/ui/position.js      > ${PROD}/ui/position.js
	${UGLIFY} ${DEV}/ui/progressbar.js   > ${PROD}/ui/progressbar.js
	${UGLIFY} ${DEV}/ui/resizable.js     > ${PROD}/ui/resizable.js
	${UGLIFY} ${DEV}/ui/selectable.js    > ${PROD}/ui/selectable.js
	${UGLIFY} ${DEV}/ui/slider.js        > ${PROD}/ui/slider.js
	${UGLIFY} ${DEV}/ui/sortable.js      > ${PROD}/ui/sortable.js
	${UGLIFY} ${DEV}/ui/spinner.js       > ${PROD}/ui/spinner.js
	${UGLIFY} ${DEV}/ui/tabs.js          > ${PROD}/ui/tabs.js
	${UGLIFY} ${DEV}/ui/tooltip.js       > ${PROD}/ui/tooltip.js
	${UGLIFY} ${DEV}/ui/widget.js        > ${PROD}/ui/widget.js
	${UGLIFY} ${DEV}/ui/i18n.js          > ${PROD}/ui/i18n.js

css-all:
	cp ${THEMES}/jquery-ui.css ${DEV}/ui/all.css

css-all-min:
	${UGLIFYCSS} ${DEV}/ui/all.css > ${PROD}/ui/all.css

css:
	cp -r ${THEMES}/images/*                ${DEV}/ui/images
	cp ${THEMES}/jquery.ui.accordion.css    ${DEV}/ui/accordion.css
	cp ${THEMES}/jquery.ui.autocomplete.css ${DEV}/ui/autocomplete.css
	cp ${THEMES}/jquery.ui.button.css       ${DEV}/ui/button.css
	cp ${THEMES}/jquery.ui.core.css         ${DEV}/ui/core.css
	cp ${THEMES}/jquery.ui.datepicker.css   ${DEV}/ui/datepicker.css
	cp ${THEMES}/jquery.ui.dialog.css       ${DEV}/ui/dialog.css
	cp ${THEMES}/jquery.ui.menu.css         ${DEV}/ui/menu.css
	cp ${THEMES}/jquery.ui.progressbar.css  ${DEV}/ui/progressbar.css
	cp ${THEMES}/jquery.ui.resizable.css    ${DEV}/ui/resizable.css
	cp ${THEMES}/jquery.ui.selectable.css   ${DEV}/ui/selectable.css
	cp ${THEMES}/jquery.ui.slider.css       ${DEV}/ui/slider.css
	cp ${THEMES}/jquery.ui.spinner.css      ${DEV}/ui/spinner.css
	cp ${THEMES}/jquery.ui.tabs.css         ${DEV}/ui/tabs.css
	cp ${THEMES}/jquery.ui.theme.css        ${DEV}/ui/theme.css
	cp ${THEMES}/jquery.ui.tooltip.css      ${DEV}/ui/tooltip.css

css-min:
	cp -r ${THEMES}/images/* ${PROD}/ui/images
	${UGLIFYCSS} ${THEMES}/jquery.ui.accordion.css    > ${PROD}/ui/accordion.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.autocomplete.css > ${PROD}/ui/autocomplete.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.button.css       > ${PROD}/ui/button.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.core.css         > ${PROD}/ui/core.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.datepicker.css   > ${PROD}/ui/datepicker.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.dialog.css       > ${PROD}/ui/dialog.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.menu.css         > ${PROD}/ui/menu.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.progressbar.css  > ${PROD}/ui/progressbar.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.resizable.css    > ${PROD}/ui/resizable.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.selectable.css   > ${PROD}/ui/selectable.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.slider.css       > ${PROD}/ui/slider.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.spinner.css      > ${PROD}/ui/spinner.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.tabs.css         > ${PROD}/ui/tabs.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.theme.css        > ${PROD}/ui/theme.css
	${UGLIFYCSS} ${THEMES}/jquery.ui.tooltip.css      > ${PROD}/ui/tooltip.css

clean:
	rm -fr ${DEV}/ui
	rm -fr ${DEV}/ui.js
	rm -fr ${DEV}/effects



