import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:retro_station/emulation/emulator.dart';

void main() {
  group('EmulatorInput', () {
    test('represents button presses and releases', () {
      const press = EmulatorInput(button: EmulatorButton.a, isPressed: true);
      const release = EmulatorInput(button: EmulatorButton.a, isPressed: false);

      expect(press.button, EmulatorButton.a);
      expect(press.isPressed, isTrue);
      expect(release.isPressed, isFalse);
    });
  });

  group('EmulatorFrame', () {
    test('accepts RGBA pixels matching the frame dimensions', () {
      final frame = EmulatorFrame(
        width: 2,
        height: 1,
        pixels: Uint8List(8),
      );

      expect(frame.width, 2);
      expect(frame.height, 1);
      expect(frame.pixels, hasLength(8));
    });

    test('rejects a pixel buffer with the wrong dimensions', () {
      expect(
        () => EmulatorFrame(
          width: 2,
          height: 1,
          pixels: Uint8List(4),
        ),
        throwsArgumentError,
      );
    });
  });

  group('AudioBuffer', () {
    test('accepts interleaved samples for the configured channels', () {
      final buffer = AudioBuffer(
        sampleRate: 44100,
        channelCount: 2,
        samples: Int16List(4),
      );

      expect(buffer.sampleRate, 44100);
      expect(buffer.channelCount, 2);
      expect(buffer.samples, hasLength(4));
    });

    test('rejects samples that do not form complete channel frames', () {
      expect(
        () => AudioBuffer(
          sampleRate: 44100,
          channelCount: 2,
          samples: Int16List(3),
        ),
        throwsArgumentError,
      );
    });
  });
}
