




dep-check-outdated:
	fluter pub outdated


clean:
	-rm -rf ~/.pub-cache
	-rm pubspec.lock
	flutter clean
	flutter pub get


