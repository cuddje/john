https://developer.android.google.cn/ndk/guides/application_mk?hl=zh_cn

Application.mk 指定 ndk-build 的项目级设置。默认情况下，它位于应用项目目录中的 jni/Application.mk 下。
NDK_APPLICATION_MK=<file>

NDK_PROJECT_PATH=. NDK_APPLICATION_MK=Application.mk APP_BUILD_SCRIPT=Android.mk
