import 'dart:typed_data';

import 'package:webrtc_interface/webrtc_interface.dart';

import 'media_stream_track_impl.dart';
import 'utils.dart';

/// Captures a resized JPEG directly from a native WebRTC video track.
extension MediaStreamTrackJpegCapture on MediaStreamTrack {
  Future<Uint8List> captureFrameJpeg({
    required int maxWidth,
    required int quality,
  }) async {
    final MediaStreamTrack track = this;
    if (track is! MediaStreamTrackNative || track.kind != 'video') {
      throw UnsupportedError('JPEG capture requires a native video track.');
    }
    if (maxWidth <= 0 || quality < 0 || quality > 100) {
      throw ArgumentError('Invalid JPEG capture dimensions or quality.');
    }
    final Uint8List? bytes = await WebRTC.invokeMethod<Uint8List, dynamic>(
      'captureFrameJpeg',
      <String, dynamic>{
        'trackId': track.id,
        'peerConnectionId': track.peerConnectionId,
        'maxWidth': maxWidth,
        'quality': quality,
      },
    );
    if (bytes == null || bytes.isEmpty) {
      throw StateError('Native JPEG capture returned no image bytes.');
    }
    return bytes;
  }
}
