#!/bin/bash

# 🌐 Universal Yurei CLI Installer
echo "🔍 Mendeteksi sistem operasi..."

# Deteksi OS
if [[ "$OSTYPE" == "linux-gnu"* || "$OSTYPE" == "darwin"* ]]; then
  echo "🟢 Linux/macOS terdeteksi"
  
  echo "🌸 Memulai instalasi Yurei CLI untuk Linux/macOS..."
  read -p "📦 Jalankan 'npm install'? (y/n): " installDeps
  if [[ "$installDeps" == "y" ]]; then
    npm install || { echo "❌ Gagal install dependency."; exit 1; }
  fi

  read -p "🔗 Ingin meng-link Yurei secara global (npm link)? (y/n): " doLink
  if [[ "$doLink" == "y" ]]; then
    npm link || { echo "❌ Gagal link global."; exit 1; }
    echo "✅ Yurei CLI berhasil di-link secara global!"
  else
    echo "⚠️ Anda dapat menjalankan secara lokal via: node bin/yurei.js"
  fi

  echo "🎉 Instalasi selesai. Jalankan 'yurei menu' untuk memulai."

else
  echo "🪟 Deteksi Windows/PowerShell"
  echo "➡️ Menjalankan installer PowerShell..."

  powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/faizinuha/Yuri-Install/main/Install.ps1 -OutFile Install.ps1; ./Install.ps1"
fi
