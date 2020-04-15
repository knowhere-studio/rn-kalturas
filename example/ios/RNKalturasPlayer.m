//
//  RNKalturasPlayer.m
//  RnKalturasExample
//
//  Created by Sanjay Achar on 15/04/21.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

//@interface RCT_EXTERN_MODULE(HelloWorld, NSObject)
//  RCT_EXTERN_METHOD(ShowMessage:(NSString *)message duration:(double *)duration)
//@end

@interface RNKalturaView : RCTViewManager
@end

@implementation RNKalturaView

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

- (UIView *)view {
    return [[RNKalturasPlayer alloc] initWithBridge:self.bridge];
}

- (dispatch_queue_t)methodQueue {
    return _bridge.uiManager.methodQueue;
}

RCT_EXPORT_VIEW_PROPERTY(ServerUrl, NSString);
RCT_EXPORT_VIEW_PROPERTY(PartnerId, NSString);
RCT_EXPORT_VIEW_PROPERTY(UiConfId, NSString);

RCT_EXPORT_VIEW_PROPERTY(PlayerState, RCTDirectEventBlock);
RCT_EXPORT_VIEW_PROPERTY(PlayerError, RCTDirectEventBlock);
RCT_EXPORT_VIEW_PROPERTY(PlayerFullscreen, RCTDirectEventBlock);

RCT_EXPORT_METHOD(init:(nonnull NSString *)reactTag)
{
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSString *, UIView *> *viewRegistry) {
      RNKalturasPlayer *player = (RNKalturasPlayer*)viewRegistry[reactTag];

        [player init];
    }];
}

RCT_EXPORT_METHOD(play:reactTag)
{
//    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSString *, UIView *> *viewRegistry) {
//      RNKalturasPlayer *player = (RNKalturasPlayer*)viewRegistry[reactTag];
//
//        [player play];
//    }];
}

@end
