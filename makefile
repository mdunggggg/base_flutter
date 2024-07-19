ifeq ($(OS),Windows_NT)
    BUILD_CMD=.\build_and_run_app.bat
    METRICS_CMD=.\tools\dart_code_metrics.bat
    COMMIT_CHECK_CMD=.\tools\check_commit_message.bat
else
    BUILD_CMD=./build_and_run_app.sh
    METRICS_CMD=./tools/dart_code_metrics.sh
    COMMIT_CHECK_CMD=./tools/check_commit_message.sh
endif

get:
	flutter pub get

clean:
	flutter clean

reload_package:
	flutter clean && flutter pub get

run:
	dart run build_runner build --delete-conflicting-outputs

build_apk_ip:
	flutter build apk --dart-define=DART_DEFINES_BASE_URL_HTTP="https://localhost:8080"

build_apk_dev:
	flutter build apk --dart-define=DART_DEFINES_BASE_URL_HTTP="https://localhost:8080"

build_apk_pro:
	flutter build apk --dart-define=DART_DEFINES_BASE_URL_HTTP="https://localhost:8080"

build_appbundle:
	flutter build appbundle --release --dart-define=DART_DEFINES_BASE_URL_HTTP="https://localhost:8080"

build_ios:
	flutter build ipa --dart-define=DART_DEFINES_BASE_URL_HTTP="https://localhost:8080"

build_runner:
	flutter packages pub run build_runner watch --delete-conflicting-outputs

proto:
	protoc --dart_out=grpc:lib/pb -I protos protos/*.proto

