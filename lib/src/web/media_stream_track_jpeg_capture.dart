import 'dart:typed_data';

import 'package:webrtc_interface/webrtc_interface.dart';

/// JPEG capture is only available for native WebRTC video tracks.
extension MediaStreamTrackJpegCapture on MediaStreamTrack {
  Future<Uint8List> captureFrameJpeg({
    required int maxWidth,
    required int quality,
  }) =>
      throw UnsupportedError('Native JPEG capture is unavailable on web.');
}
