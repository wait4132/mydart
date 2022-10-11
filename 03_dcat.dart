// 命令行程序 （https://dart.dev/tutorials/server/cmdline）
//dart pub get
//创建一个 pubspec （一个名为 pubspec.yaml 文件，文件列出依赖的包以及包含的其他元数据，比如当前包的版本）。

//使用 dart pub get 获取当前所依赖的包。

//如果当前 Dart 代码依赖包中的某个库，导入（import）该库。
import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

const lineNumber = 'line-number';

void main(List<String> args) {
  exitCode = 0;
  final parser = ArgParser()..addFlag(lineNumber, negatable: false, abbr: 'n');

  ArgResults argResults = parser.parse(args);

  final paths = argResults.rest; // 剩余的命令行参数

  dcat(paths, showLineNumbers: argResults[lineNumber] as bool);
}

Future<void> dcat(List<String> paths, {bool showLineNumbers = false}) async {
  if (paths.isEmpty) {
    print('type exit to quit.');
    while (true) {
      stdout.write(
          '# '); // 这样就不换行了 (https://stackoverflow.com/questions/14073217/print-without-a-newline-in-dart)
      String? line = stdin.readLineSync();
      print('${line}\n');

      if (line?.toLowerCase() == 'exit') {
        print('bye.');
        break;
      }
    }
  } else {
    for (final path in paths) {
      var lineNumber = 1;
      final lines = utf8.decoder
          .bind(File(path).openRead())
          .transform(const LineSplitter());

      try {
        await for (final line in lines) {
          if (showLineNumbers) {
            stdout.write('${lineNumber++} ');
          }
          stdout.writeln(line);
        }
      } catch (_) {
        await _handleError(path);
      }
    }
  }
}

Future<void> _handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('Error: $path is a directory.');
  } else {
    exitCode = 2;
  }
}
