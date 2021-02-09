import 'dart:io';

/*Stream<FileSystemEvent> dataStream(String path) {
  Directory dir = Directory("/home/lars/Desktop");
  return dir.watch();
}
*/
class DataProvider {
  final String path = "";

  const DataProvider(path);

  Stream<FileSystemEvent>? get getDataStream {
    Directory dir = Directory(path);
  }

  Stream<FileSystemEntity> get getData {
    Directory dir = Directory(path);
    return dir.list(recursive: false).asBroadcastStream();
  }
}


/*
void main() {
  Directory("/home/lars/Desktop")
      .list(recursive: false)
      .asBroadcastStream()
      .listen((event) {
    print("${event.toString()} ");
  });
}

Future<List<FileSystemEntity>> dirContents(Directory dir) {
  var files = <FileSystemEntity>[];
  var completer = Completer<List<FileSystemEntity>>();
  var lister = dir.list(recursive: false);
  lister.listen((file) => files.add(file),
      onDone: () => completer.complete(files));
  return completer.future;
}

Stream<FileSystemEntity> test() {
  Directory dir = Directory("/home/lars/Desktop");
  return dir.list(recursive: false).asBroadcastStream();
}
*/