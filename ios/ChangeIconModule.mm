#import "ChangeIconModule.h"
#import "ChangeIcon.h"
#import <React/RCTUtils.h>

using namespace facebook::react;

@implementation ChangeIconModule

RCT_EXPORT_MODULE()

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

#ifdef RCT_NEW_ARCH_ENABLED
#else
RCT_EXPORT_METHOD(getIcon:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
    [ChangeIcon getIcon:resolve reject:reject];
}

RCT_EXPORT_METHOD(changeIcon:(NSString *)iconName
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
    [ChangeIcon changeIcon:iconName resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(resetIcon:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
    [ChangeIcon resetIcon:resolve reject:reject];
}
#endif

// Code for the new architecture
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<TurboModule>)getTurboModule:(const ObjCTurboModule::InitParams &)params
{
    return std::make_shared<NativeChangeIconSpecJSI>(params);
}

- (void)getIcon:(RCTPromiseResolveBlock)resolve
       reject:(RCTPromiseRejectBlock)reject
{
    [ChangeIcon getIcon:resolve reject:reject];
}

- (void)changeIcon:(NSString *)iconName
          resolve:(RCTPromiseResolveBlock)resolve
          reject:(RCTPromiseRejectBlock)reject
{
    [ChangeIcon changeIcon:iconName resolve:resolve reject:reject];
}

- (void)resetIcon:(RCTPromiseResolveBlock)resolve
          reject:(RCTPromiseRejectBlock)reject
{
    [ChangeIcon resetIcon:resolve reject:reject];
}
#endif

@end
