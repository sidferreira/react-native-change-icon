#import "ChangeIconCore.h"

@implementation ChangeIconCore

+ (void)getIcon:(RCTPromiseResolveBlock)resolve
        reject:(RCTPromiseRejectBlock)reject
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *currentIcon = [[UIApplication sharedApplication] alternateIconName];
        if (currentIcon) {
            resolve(currentIcon);
        } else {
            resolve(@"Default");
        }
    });
}

+ (void)changeIcon:(NSString *)iconName
          resolve:(RCTPromiseResolveBlock)resolve
          reject:(RCTPromiseRejectBlock)reject
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSError *error = nil;

        if ([[UIApplication sharedApplication] supportsAlternateIcons] == NO) {
            reject(@"Error", @"IOS:NOT_SUPPORTED", error);
            return;
        }

        NSString *currentIcon = [[UIApplication sharedApplication] alternateIconName];

        if ([iconName isEqualToString:currentIcon]) {
            reject(@"Error", @"IOS:ICON_ALREADY_USED", error);
            return;
        }

        NSString *newIconName;
        if (iconName == nil || [iconName length] == 0 || [iconName isEqualToString:@"Default"]) {
            newIconName = nil;
            resolve(@"Default");
        } else {
            newIconName = iconName;
            resolve(newIconName);
        }

        [[UIApplication sharedApplication] setAlternateIconName:newIconName completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error changing app icon: %@", error.localizedDescription);
            }
        }];
    });
}

+ (void)resetIcon:(RCTPromiseResolveBlock)resolve
          reject:(RCTPromiseRejectBlock)reject
{
    [self changeIcon:@"Default" resolve:resolve reject:reject];
}

@end
