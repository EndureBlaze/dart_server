import 'dart:io';

import 'package:dartx/dartx_io.dart';
import 'package:shelf/shelf.dart';

Response filesHandler(Request request) {
  String path = '/';
  try {
    path = request.requestedUri.queryParameters['path'] ?? '/';
  } catch (e) {
    print(e);
  }
  final dir = Directory(path);
  final files = dir.listSync();
  final filesNames = pipe(files);
  final result = '''
{
  "path": "${dir.path}",
  "files": $filesNames
}
''';
  return Response.ok(result, headers: {'content-type': 'application/json'});
}

String pipe(List<FileSystemEntity> files) {
  String result = '[';

  for (var element in files) {
    if (element is File) {
      result += '{"file": "${element.name}"},';
    } else {
      result += '{"directory": "${element.name}"},';
    }
  }
  result = result.substring(0, result.length - 1);
  result += ']';
  return result;
}
