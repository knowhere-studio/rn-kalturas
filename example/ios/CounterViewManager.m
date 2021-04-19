//
//  CounterViewManager.m
//  RnKalturasExample
//
//  Created by Sanjay Achar on 18/04/21.
//

#import "React/RCTViewManager.h"
@interface RCT_EXTERN_MODULE(CounterViewManager, RCTViewManager)

// Initial Props
RCT_EXPORT_VIEW_PROPERTY(ServerUrl, NSString)
RCT_EXPORT_VIEW_PROPERTY(PartnerId, NSString)
RCT_EXPORT_VIEW_PROPERTY(UiConfId, NSString)

RCT_EXTERN_METHOD(
  play:(nonnull NSNumber *)node
)

RCT_EXTERN_METHOD(
  pause:(nonnull NSNumber *)node
)

RCT_EXTERN_METHOD(
  toggleFullScreen:(nonnull NSNumber *)node
)

@end
