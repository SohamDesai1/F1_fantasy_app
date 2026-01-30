#!/bin/bash
set -e
set -x   # 👈 shows commands in Vercel logs

echo "Cloning Flutter..."
git clone https://github.com/flutter/flutter.git -b stable --depth 1

export PATH="$PWD/flutter/bin:$PATH"

echo "Flutter version:"
flutter --version
dart --version

echo "Running pub get..."
flutter pub get

echo "Running build_runner..."
dart run build_runner build --delete-conflicting-outputs

echo "Building web..."
flutter build web --release