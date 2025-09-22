#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

#ifdef RCT_NEW_ARCH_ENABLED
#import "RNChangeIconSpec.h"

@interface ChangeIconModule : NSObject <NativeChangeIconSpec>
#else
@interface ChangeIconModule : NSObject <RCTBridgeModule>
#endif

@end
