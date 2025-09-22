#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <UIKit/UIKit.h>

@interface ChangeIconCore : NSObject

+ (void)getIcon:(RCTPromiseResolveBlock)resolve
        reject:(RCTPromiseRejectBlock)reject;

+ (void)changeIcon:(NSString *)iconName
          resolve:(RCTPromiseResolveBlock)resolve
          reject:(RCTPromiseRejectBlock)reject;

+ (void)resetIcon:(RCTPromiseResolveBlock)resolve
          reject:(RCTPromiseRejectBlock)reject;

@end
