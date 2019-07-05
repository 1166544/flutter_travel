# flutter_travel

A new Flutter project.

## Upgrade
```shell
flutter upgrade
```

## RUN
```shell
flutter run
```

## BUILD
```shell
// 开发环境
flutter build -t lib/core/env/EnviromentDev.dart

// 测试环境
flutter build -t lib/core/env/EnviromentTest.dart

// 灰度环境
flutter build -t lib/core/env/EnviromentGrey.dart

// 生产环境
flutter build -t lib/main.dart
```

## STRUCTS
```shell
lib
  |-- config 		环境配置目录
  |-- core   		核心逻辑
  |-- pages  		业务逻辑
  |----- common  	业务逻辑公用组件
  |----- modules 	业务逻辑模块存放目录
  |-- redux  		状态管理
  |----- actions 	业务逻辑action
  |----- reducers 	业务逻辑reducer
  |----- states 	业务逻辑state
  |-- routers 		虚拟路由页面，用于表示各业务逻辑页面入口
  |-- services 		业务逻辑调用接口存一存放目录
```

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

# Tips:
```shell
Could not determine the dependencies of task ':app:flutterBuildDebug' when start vscode flutter debugging
错误解决办法

flutter clean
然后
flutter run
```
