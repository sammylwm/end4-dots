#!/bin/bash

# Проверяем, что передан ровно один аргумент
if [ "$#" -ne 1 ]; then
    echo "Использование: $0 <аргумент>"
    exit 1
fi

./scripts/app_install.sh

case "$1" in
    end4)
        ./scripts/end4_install.sh
        ;;
    vpn)
        ./scripts/vpn_install.sh
        ;;
    grub_theme)
        ./monterey-grub-theme/install.sh
        ;;
    *)
        echo "Допустимые значения: vpn, end4, grub_theme"
        exit 1
        ;;
esac

echo "🧰 Copying all dotfiles..."

for dir in "$HOME/end4-dots/dotfiles"/*; do
    name=$(basename "$dir")
    target="$HOME/.config/$name"

    # Создаём целевую директорию, если её нет
    mkdir -p "$target"

    # Копируем содержимое (а не саму папку), перезаписывая только то, что есть в dotfiles
    if [ -d "$dir" ]; then
        cp -rT "$dir/" "$target/"
    else
        cp "$dir" "$target"
    fi
done



hyprctl reload >/dev/null 2>&1

