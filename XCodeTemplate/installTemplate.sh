#!/usr/bin/env sh

# Configuration
XCODE_TEMPLATE_DIR="${HOME}/Library/Developer/Xcode/Templates/File Templates/Templates"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

copyTemplateToXcode() {
	echo "🤖 Копирование шаблона в Xcode..."
	
	# Удалить, если уже установлен.
	if [ -d "$XCODE_TEMPLATE_DIR" ]; then
	rm -R "$XCODE_TEMPLATE_DIR"
	fi
	
	# Cоздать новую папку.
	mkdir -p "$XCODE_TEMPLATE_DIR"
	
	# Копировать .xctemplate файлы в папку шаблонов Xcode.
	cp -R $SCRIPT_DIR/**/*.xctemplate "$XCODE_TEMPLATE_DIR"
}

# Копировать .xctemplate файлы в локальную папку шаблонов Xcode..
copyTemplateToXcode

echo "🔥 Успешный успех!"
echo "🤖 Для использования выберите в Xcode 'New File...'."
