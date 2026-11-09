import 'dart:typed_data';

/// Common interface for an emulator implementation.
abstract interface class Emulator {
  /// Video frames in RGBA8888 pixel format.
  Stream<EmulatorFrame> get videoFrames;

  /// Audio output as interleaved signed 16-bit PCM samples.
  Stream<AudioBuffer> get audioBuffers;

  /// Sends a button press or release to the emulator.
  void handleInput(EmulatorInput input);

  Future<void> start();

  Future<void> pause();

  Future<void> resume();

  Future<void> stop();

  /// Returns an opaque snapshot that can later be passed to [loadState].
  Future<Uint8List> saveState();

  Future<void> loadState(Uint8List state);
}

enum EmulatorButton {
  up,
  down,
  left,
  right,
  a,
  b,
  x,
  y,
  leftShoulder,
  rightShoulder,
  start,
  select,
}

class EmulatorInput {
  const EmulatorInput({required this.button, required this.isPressed});

  final EmulatorButton button;
  final bool isPressed;
}

class EmulatorFrame {
  EmulatorFrame({
    required this.width,
    required this.height,
    required this.pixels,
  }) {
    if (width <= 0) {
      throw ArgumentError.value(width, 'width', 'Must be greater than zero');
    }
    if (height <= 0) {
      throw ArgumentError.value(height, 'height', 'Must be greater than zero');
    }
    if (pixels.length != width * height * 4) {
      throw ArgumentError.value(
        pixels.length,
        'pixels.length',
        'Must match the RGBA8888 frame dimensions',
      );
    }
  }

  final int width;
  final int height;
  final Uint8List pixels;
}

class AudioBuffer {
  AudioBuffer({
    required this.sampleRate,
    required this.channelCount,
    required this.samples,
  }) {
    if (sampleRate <= 0) {
      throw ArgumentError.value(
        sampleRate,
        'sampleRate',
        'Must be greater than zero',
      );
    }
    if (channelCount <= 0) {
      throw ArgumentError.value(
        channelCount,
        'channelCount',
        'Must be greater than zero',
      );
    }
    if (samples.length % channelCount != 0) {
      throw ArgumentError.value(
        samples.length,
        'samples.length',
        'Must contain a whole number of interleaved frames',
      );
    }
  }

  final int sampleRate;
  final int channelCount;
  final Int16List samples;
}
