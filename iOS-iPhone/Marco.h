//
//  Marco.h
//  Unity-iPhone
//
//  Created by Woody Yan on 25/06/14.
//
//


#import "UnityAppController.h"
#import "AppDelegate.h"
#import <AVOSCloud/AVOSCloud.h>


#define Version                 @"1.0"
#define AppleAppID              @""
#define ShareURL                ([NSString stringWithFormat:@"https://itunes.apple.com/app/id%@", AppleAppID])

#define BaiDuApiKey             @""
#define WXApiID                 @""
#define QQApiID                 @""
#define SinaApiID               @""


#define kApp ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define kUser [NSUserDefaults standardUserDefaults]
#define userManager [UserInfoManager sharedManager]

#define kScreen_Height ([UIScreen mainScreen].bounds.size.height)
#define kScreen_Width ([UIScreen mainScreen].bounds.size.width)
#define kScreen_Frame    (CGRectMake(0, 0 ,kScreen_Width,kScreen_Height))

#define isiOS6 ([[[UIDevice currentDevice] systemVersion] intValue] ==6)
#define isiOS7 ([[[UIDevice currentDevice] systemVersion] intValue] ==7)

#define isiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define ColorWithHex(rgbValue) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0])
#define ColorWithHexAlpha(rgbValue,a) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)])





