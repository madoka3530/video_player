import 'package:pigeon/java_generator.dart';
import 'package:pigeon/objc_generator.dart';
import 'package:pigeon/pigeon_lib.dart';

class TextureMessage {
  TextureMessage({
    required this.textureId,
  });

  int textureId;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['textureId'] = textureId;
    return pigeonMap;
  }

  static TextureMessage decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return TextureMessage(
      textureId: pigeonMap['textureId']! as int,
    );
  }
}

class LoopingMessage {
  LoopingMessage({
    required this.textureId,
    required this.isLooping,
  });

  int textureId;
  bool isLooping;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['textureId'] = textureId;
    pigeonMap['isLooping'] = isLooping;
    return pigeonMap;
  }

  static LoopingMessage decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return LoopingMessage(
      textureId: pigeonMap['textureId']! as int,
      isLooping: pigeonMap['isLooping']! as bool,
    );
  }
}

class VolumeMessage {
  VolumeMessage({
    required this.textureId,
    required this.volume,
  });

  int textureId;
  double volume;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['textureId'] = textureId;
    pigeonMap['volume'] = volume;
    return pigeonMap;
  }

  static VolumeMessage decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return VolumeMessage(
      textureId: pigeonMap['textureId']! as int,
      volume: pigeonMap['volume']! as double,
    );
  }
}

class PositionMessage {
  PositionMessage({
    required this.textureId,
    required this.position,
  });

  int textureId;
  int position;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['textureId'] = textureId;
    pigeonMap['position'] = position;
    return pigeonMap;
  }

  static PositionMessage decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return PositionMessage(
      textureId: pigeonMap['textureId']! as int,
      position: pigeonMap['position']! as int,
    );
  }
}

class CreateMessage {
  CreateMessage({
    this.asset,
    this.uri,
    this.packageName,
    this.formatHint,
    required this.httpHeaders,
  });

  String? asset;
  String? uri;
  String? packageName;
  String? formatHint;
  Map<String?, String?> httpHeaders;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['asset'] = asset;
    pigeonMap['uri'] = uri;
    pigeonMap['packageName'] = packageName;
    pigeonMap['formatHint'] = formatHint;
    pigeonMap['httpHeaders'] = httpHeaders;
    return pigeonMap;
  }

  static CreateMessage decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return CreateMessage(
      asset: pigeonMap['asset'] as String?,
      uri: pigeonMap['uri'] as String?,
      packageName: pigeonMap['packageName'] as String?,
      formatHint: pigeonMap['formatHint'] as String?,
      httpHeaders: (pigeonMap['httpHeaders'] as Map<Object?, Object?>?)!
          .cast<String?, String?>(),
    );
  }
}

@HostApi()
abstract class VideoPlayerApi {
  void initialize();
  TextureMessage create(CreateMessage msg);
  void dispose(TextureMessage msg);
  void setLooping(LoopingMessage msg);
  void setVolume(VolumeMessage msg);
  void play(TextureMessage msg);
  PositionMessage position(TextureMessage msg);
  void seekTo(PositionMessage msg);
  void pause(TextureMessage msg);
}

void configurePigeon(PigeonOptions opts) {
  final options = PigeonOptions(
    dartOut: '../video_player_platform_interface/lib/messages.dart',
    objcHeaderOut: 'ios/Classes/messages.h',
    objcSourceOut: 'ios/Classes/messages.m',
    objcOptions: ObjcOptions(prefix: 'FLT'),
    javaOut:
        'android/src/main/java/io/flutter/plugins/videoplayer/Messages.java',
    javaOptions: JavaOptions(package: 'io.flutter.plugins.videoplayer'),
  );
  opts.merge(options);
}
