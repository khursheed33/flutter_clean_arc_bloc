# Useful commands

<!-- Build Run to Generate From Json and To Json -->
dart run build_runner build --delete-conflicting-outputs

<!-- Generate Splash Icons  -->
dart run flutter_native_splash:create

<!-- Flutter Launcher Icons  -->
dart run flutter_launcher_icons:main

<!-- Show outdated packages -->
flutter pub outdated

<!-- Upgrade packages -->
flutter pub upgrade --major-versions

<!-- See full list of available changes -->
dart fix --dry-run

<!-- Fix Problem:notifications -->
dart fix --apply

<!-- Compile and optimize SVG -->
dart run vector_graphics_compiler -i assets/foo.svg -o assets/foo.svg.vec

<!-- Check SVG Compatibility -->
dart run vector_graphics_compiler -i $SVG_FILE -o $TEMPORARY_OUTPUT_TO_BE_DELETED --no-optimize-masks --no-optimize-clips --no-optimize-overdraw --no-tessellate
