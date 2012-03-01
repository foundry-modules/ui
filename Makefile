include ../../build/modules.mk

SOURCE_DIR = build/dist/jquery-ui-1.9pre
UI = ${SOURCE_DIR}/ui
THEMES = ${SOURCE_DIR}/themes/base

all: premake ant ui-all ui-all-min ui_ ui-min css-all css-all-min css css-min effects effects-min

premake:
	mkdir -p ${DEVELOPMENT_DIR}/ui
	mkdir -p ${DEVELOPMENT_DIR}/effects
	mkdir -p ${PRODUCTION_DIR}/ui
	mkdir -p ${PRODUCTION_DIR}/effects
	mkdir -p ${DEVELOPMENT_DIR}/ui/images
	mkdir -p ${PRODUCTION_DIR}/ui/images

ant:
	cd build && ant && cd ..

effects:
	${MODULARIZE} -jq -n "effects/core" ${UI}/jquery.effects.core.js > ${DEVELOPMENT_DIR}/effects/core.js

	${MODULARIZE} -jq -n "effects/blind"     -d "effects/core" ${UI}/jquery.effects.blind.js      > ${DEVELOPMENT_DIR}/effects/blind.js
	${MODULARIZE} -jq -n "effects/bounce"    -d "effects/core" ${UI}/jquery.effects.bounce.js     > ${DEVELOPMENT_DIR}/effects/bounce.js
	${MODULARIZE} -jq -n "effects/clip"      -d "effects/core" ${UI}/jquery.effects.clip.js       > ${DEVELOPMENT_DIR}/effects/clip.js
	${MODULARIZE} -jq -n "effects/drop"      -d "effects/core" ${UI}/jquery.effects.drop.js       > ${DEVELOPMENT_DIR}/effects/drop.js
	${MODULARIZE} -jq -n "effects/explode"   -d "effects/core" ${UI}/jquery.effects.explode.js    > ${DEVELOPMENT_DIR}/effects/explode.js
	${MODULARIZE} -jq -n "effects/fade"      -d "effects/core" ${UI}/jquery.effects.fade.js       > ${DEVELOPMENT_DIR}/effects/fade.js
	${MODULARIZE} -jq -n "effects/fold"      -d "effects/core" ${UI}/jquery.effects.fold.js       > ${DEVELOPMENT_DIR}/effects/fold.js
	${MODULARIZE} -jq -n "effects/highlight" -d "effects/core" ${UI}/jquery.effects.highlight.js  > ${DEVELOPMENT_DIR}/effects/highlight.js
	${MODULARIZE} -jq -n "effects/pulsate"   -d "effects/core" ${UI}/jquery.effects.pulsate.js    > ${DEVELOPMENT_DIR}/effects/pulsate.js
	${MODULARIZE} -jq -n "effects/scale"     -d "effects/core" ${UI}/jquery.effects.scale.js      > ${DEVELOPMENT_DIR}/effects/scale.js
	${MODULARIZE} -jq -n "effects/shake"     -d "effects/core" ${UI}/jquery.effects.shake.js      > ${DEVELOPMENT_DIR}/effects/shake.js
	${MODULARIZE} -jq -n "effects/slide"     -d "effects/core" ${UI}/jquery.effects.slide.js      > ${DEVELOPMENT_DIR}/effects/slide.js
	${MODULARIZE} -jq -n "effects/transfer"  -d "effects/core" ${UI}/jquery.effects.transfer.js   > ${DEVELOPMENT_DIR}/effects/transfer.js

effects-min:
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/blind.js     > ${PRODUCTION_DIR}/effects/blind.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/bounce.js    > ${PRODUCTION_DIR}/effects/bounce.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/clip.js      > ${PRODUCTION_DIR}/effects/clip.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/core.js      > ${PRODUCTION_DIR}/effects/core.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/drop.js      > ${PRODUCTION_DIR}/effects/drop.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/explode.js   > ${PRODUCTION_DIR}/effects/explode.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/fade.js      > ${PRODUCTION_DIR}/effects/fade.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/fold.js      > ${PRODUCTION_DIR}/effects/fold.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/highlight.js > ${PRODUCTION_DIR}/effects/highlight.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/pulsate.js   > ${PRODUCTION_DIR}/effects/pulsate.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/scale.js     > ${PRODUCTION_DIR}/effects/scale.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/shake.js     > ${PRODUCTION_DIR}/effects/shake.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/slide.js     > ${PRODUCTION_DIR}/effects/slide.js
	${UGLIFYJS} ${DEVELOPMENT_DIR}/effects/transfer.js  > ${PRODUCTION_DIR}/effects/transfer.js

ui-all:
	${MODULARIZE} -jq -n "ui" ${UI}/jquery-ui.js > ${DEVELOPMENT_DIR}/ui.js

ui-all-min:
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui.js > ${PRODUCTION_DIR}/ui.js

ui_:
	${MODULARIZE} -jq -n "ui/core" -css "ui/core,ui/theme" ${UI}/jquery.ui.core.js > ${DEVELOPMENT_DIR}/ui/core.js
	${MODULARIZE} -jq -n "ui/widget" ${UI}/jquery.ui.widget.js > ${DEVELOPMENT_DIR}/ui/widget.js
	${MODULARIZE} -jq -n "ui/accordion" -d "ui/core,ui/widget" -css "ui/accordion" ${UI}/jquery.ui.accordion.js > ${DEVELOPMENT_DIR}/ui/accordion.js
	${MODULARIZE} -jq -n "ui/autocomplete" -d "ui/core,ui/widget,ui/position,ui/menu" -css "ui/autocomplete" ${UI}/jquery.ui.autocomplete.js > ${DEVELOPMENT_DIR}/ui/autocomplete.js
	${MODULARIZE} -jq -n "ui/button" -d "ui/core,ui/widget" -css "ui/button" ${UI}/jquery.ui.button.js > ${DEVELOPMENT_DIR}/ui/button.js
	${MODULARIZE} -jq -n "ui/datepicker" -d "ui/core,ui/i18n" -css "ui/datepicker" ${UI}/jquery.ui.datepicker.js > ${DEVELOPMENT_DIR}/ui/datepicker.js
	${MODULARIZE} -jq -n "ui/dialog" -d "ui/core,ui/widget,ui/button,ui/draggable,ui/mouse,ui/position,ui/resizable" -css "ui/dialog" ${UI}/jquery.ui.dialog.js > ${DEVELOPMENT_DIR}/ui/dialog.js
	${MODULARIZE} -jq -n "ui/draggable" -d "ui/core,ui/mouse,ui/widget" ${UI}/jquery.ui.draggable.js > ${DEVELOPMENT_DIR}/ui/draggable.js
	${MODULARIZE} -jq -n "ui/droppable" -d "ui/draggable" ${UI}/jquery.ui.droppable.js > ${DEVELOPMENT_DIR}/ui/droppable.js
	${MODULARIZE} -jq -n "ui/menu" -d "ui/core,ui/widget" -css "ui/menu" ${UI}/jquery.ui.menu.js > ${DEVELOPMENT_DIR}/ui/menu.js
	${MODULARIZE} -jq -n "ui/mouse" -d "ui/widget" ${UI}/jquery.ui.mouse.js > ${DEVELOPMENT_DIR}/ui/mouse.js
	${MODULARIZE} -jq -n "ui/position" ${UI}/jquery.ui.position.js > ${DEVELOPMENT_DIR}/ui/position.js
	${MODULARIZE} -jq -n "ui/progressbar" -d "ui/core,ui/widget" -css "ui/progressbar" ${UI}/jquery.ui.progressbar.js > ${DEVELOPMENT_DIR}/ui/progressbar.js
	${MODULARIZE} -jq -n "ui/resizable" -d "ui/core,ui/mouse,ui/widget" -css "ui/resizable" ${UI}/jquery.ui.resizable.js > ${DEVELOPMENT_DIR}/ui/resizable.js
	${MODULARIZE} -jq -n "ui/selectable" -d "ui/core,ui/mouse,ui/widget" -css "ui/selectable" ${UI}/jquery.ui.selectable.js > ${DEVELOPMENT_DIR}/ui/selectable.js
	${MODULARIZE} -jq -n "ui/slider" -d "ui/core,ui/mouse,ui/widget" -css "ui/slider" ${UI}/jquery.ui.slider.js > ${DEVELOPMENT_DIR}/ui/slider.js
	${MODULARIZE} -jq -n "ui/sortable" -d "ui/core,ui/mouse,ui/widget" ${UI}/jquery.ui.sortable.js > ${DEVELOPMENT_DIR}/ui/sortable.js
	${MODULARIZE} -jq -n "ui/spinner" -d "ui/core,ui/mouse,ui/widget" -css "ui/spinner" ${UI}/jquery.ui.spinner.js > ${DEVELOPMENT_DIR}/ui/spinner.js
	${MODULARIZE} -jq -n "ui/tabs" -d "ui/core,ui/widget" -css "ui/tabs" ${UI}/jquery.ui.tabs.js > ${DEVELOPMENT_DIR}/ui/tabs.js
	${MODULARIZE} -jq -n "ui/tooltip" -d "ui/core,ui/mouse,ui/widget" -css "ui/tooltip" ${UI}/jquery.ui.tooltip.js > ${DEVELOPMENT_DIR}/ui/tooltip.js
	${MODULARIZE} -jq -n "ui/i18n" -d "ui/datepicker" ${UI}/i18n/jquery-ui-i18n.js > ${DEVELOPMENT_DIR}/ui/i18n.js

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
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/i18n.js          > ${PRODUCTION_DIR}/ui/i18n.js

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
	rm -fr ${DEVELOPMENT_DIR}/ui
	rm -fr ${DEVELOPMENT_DIR}/ui.js
	rm -fr ${DEVELOPMENT_DIR}/effects



