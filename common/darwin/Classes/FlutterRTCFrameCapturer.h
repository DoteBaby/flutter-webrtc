#import <WebRTC/WebRTC.h>

#if TARGET_OS_IPHONE
#import <Flutter/Flutter.h>
#elif TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#endif

@interface FlutterRTCFrameCapturer : NSObject <RTCVideoRenderer>

- (instancetype)initWithTrack:(RTCVideoTrack*)track
                       toPath:(NSString*)path
                       result:(FlutterResult)result;

- (instancetype)initWithTrack:(RTCVideoTrack*)track
                     maxWidth:(NSInteger)maxWidth
                      quality:(NSInteger)quality
                       result:(FlutterResult)result;

+ (CVPixelBufferRef)convertToCVPixelBuffer:(RTCVideoFrame *) frame;

@end
