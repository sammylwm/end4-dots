#!/bin/bash

# Пути к исходным директориям
HYPR_SRC="$HOME/end4-dots/hypr"
QUICKSHELL_SRC="$HOME/end4-dots/quickshell"

# Пути назначения
HYPR_TARGET="$HOME/.config/hypr"
QUICKSHELL_TARGET="$HOME/.config/quickshell"

# Функция для замены директории
replace_dir() {
    local src="$1"
    local target="$2"

    if [ -d "$src" ]; then
        # Удаляем старую директорию полностью
        rm -rf "$target"
        # Копируем новую
        cp -r "$src" "$target"
        echo "Обновлено: $target"
    else
        echo "Ошибка: исходная директория $src не найдена!" >&2
    fi
}

# Обновляем hypr и quickshell
replace_dir "$HYPR_SRC" "$HYPR_TARGET"
#replace_dir "$QUICKSHELL_SRC" "$QUICKSHELL_TARGET"
