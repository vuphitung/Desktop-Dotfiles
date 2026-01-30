#!/bin/bash

# Màu sắc cho nó chuyên nghiệp
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE} Đang bắt đầu xây dựng cho bro...${NC}"

# 1. Kiểm tra và cài đặt font (Dành cho Arch Linux)
if pacman -Qs ttf-jetbrains-mono-nerd > /dev/null ; then
    echo -e "${GREEN}✅ Font JetBrainsMono Nerd đã có sẵn.${NC}"
else
    echo -e "${BLUE}📦 Đang cài đặt font cần thiết...${NC}"
    sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd
fi

# 2. Tạo thư mục config nếu chưa có
echo -e "${BLUE}📂 Đang chuẩn bị thư mục cấu hình...${NC}"
mkdir -p ~/.config/waybar

# 3. Backup cấu hình cũ để người ta không kiện mình
if [ -d "~/.config/waybar" ]; then
    echo -e "${BLUE}💾 Đang backup lại cấu hình cũ của bro tại ~/.config/waybar_backup${NC}"
    cp -r ~/.config/waybar ~/.config/waybar_backup
fi

# 4. Copy cấu hình "Luxury" vào máy
echo -e "${BLUE}🚀 Đang đưa các file cấu hình vào vị trí...${NC}"
cp -rv waybar/* ~/.config/waybar/

echo -e "${GREEN}✨ CHÚC MỪNG! Cung điện của bro đã sẵn sàng.${NC}"
echo -e "${GREEN}👉 Nhấn Super+Shift+R hoặc gõ 'killall waybar && waybar &' để tận hưởng nhé!${NC}"
