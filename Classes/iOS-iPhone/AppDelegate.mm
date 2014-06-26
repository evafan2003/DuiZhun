//
//  AppDelegate.m
//  Unity-iPhone
//
//  Created by Woody Yan on 25/06/14.
//
//

#import "Marco.h"

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import "UnityView.h"

#import "HomeViewController.h"
#import "ExploreViewController.h"
#import "MessageViewController.h"
#import "MeViewController.h"
#import "CameraViewController.h"

#import <AVFoundation/AVFoundation.h>
#import <AVOSCloud/AVOSCloud.h>

@interface AppDelegate ()

@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UIButton *lightBtn;
@property (nonatomic,strong) UIButton *shotScreenBtn;
@property (nonatomic,strong) UIButton *recordBtn;

@end

@implementation AppDelegate

- (void)createViewHierarchyImpl;
{
    
    self.window =  [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.homeVC = [HomeViewController new];
	self.exploreVC = [ExploreViewController new];
    self.messageVC = [MessageViewController new];
	self.meVC = [MeViewController new];
    
    self.homeVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:100];
    self.exploreVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:200];
    self.messageVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:300];
    self.meVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:400];

    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:self.homeVC];
	UINavigationController *exploreNav = [[UINavigationController alloc] initWithRootViewController:self.exploreVC];
	UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:self.messageVC];
	UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:self.meVC];
    
    
    self.tabVC = [UITabBarController new];
	self.tabVC.viewControllers = [NSArray arrayWithObjects:homeNav,exploreNav,messageNav,meNav,nil];
	self.tabVC.selectedIndex = 0;
//    self.tabVC.tabBar.hidden = YES;
    self.tabVC.tabBar.tintColor = ColorWithHex(0X55CC93);
    
    
    self.window.rootViewController = self.tabVC;
    _rootController	= [self.window rootViewController];
	_rootView		= _rootController.view;
    
    
    [AVOSCloud setApplicationId:@"qg46drnaqun8nnktjwcia7hzun9dap0v8g3pwujz457faben"
                      clientKey:@"aju8ojzwppd03v87q7sj3uytad87djryh3wqo6cznsz63n9j"];

    
    [self createCameraVC];

}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return  (1 << UIInterfaceOrientationPortrait);
}



- (void) createCameraVC
{
    self.cameraVC = [CameraViewController new];
//    self.cameraVC.view = _unityView;
    
    NSLog(@"%@",_unityView);
    self.cameraVC.view.backgroundColor = [UIColor yellowColor];
    [self.cameraVC.view addSubview:_unityView];
    
    NSLog(@"unityView frame  = %@",NSStringFromCGRect(_unityView.frame));
    NSLog(@"%@",[self.cameraVC.view subviews]);
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backBtn.backgroundColor = [UIColor clearColor];
    self.backBtn.frame = CGRectMake(20, 20, 44, 44);
    [self.backBtn setImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];
    self.backBtn.layer.cornerRadius = 22;
    self.backBtn.clipsToBounds = YES;
    [self.backBtn addTarget:self action:@selector(popOut) forControlEvents:UIControlEventTouchUpInside];
    [ self.cameraVC.view addSubview:self.backBtn];
    
    self.lightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.lightBtn.backgroundColor = [UIColor clearColor];
    self.lightBtn.frame = CGRectMake(20, kScreen_Height - 64, 44, 44);
    [self.lightBtn setImage:[UIImage imageNamed:@"light_off.png"] forState:UIControlStateNormal];
    [self.lightBtn setImage:[UIImage imageNamed:@"light_on.png"] forState:UIControlStateSelected];
    self.lightBtn.layer.cornerRadius = 22;
    self.lightBtn.clipsToBounds = YES;
    [self.lightBtn addTarget:self action:@selector(turnLight:) forControlEvents:UIControlEventTouchUpInside];
    [ self.cameraVC.view addSubview:self.lightBtn];
    
    self.recordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.recordBtn.backgroundColor = [UIColor clearColor];
    self.recordBtn.frame = CGRectMake(125, kScreen_Height - 80, 70, 70);
    [self.recordBtn setImage:[UIImage imageNamed:@"record_video.png"] forState:UIControlStateNormal];
    self.recordBtn.layer.cornerRadius = 35;
    self.recordBtn.clipsToBounds = YES;
    [self.recordBtn addTarget:self action:@selector(recordVideo) forControlEvents:UIControlEventTouchUpInside];
    [ self.cameraVC.view addSubview:self.recordBtn];

    
    self.shotScreenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shotScreenBtn.backgroundColor = [UIColor clearColor];
    self.shotScreenBtn.frame = CGRectMake(300 - 44, kScreen_Height - 64, 44, 44);
    [self.shotScreenBtn setImage:[UIImage imageNamed:@"screen_shot.png"] forState:UIControlStateNormal];
    self.shotScreenBtn.layer.cornerRadius = 22;
    self.shotScreenBtn.clipsToBounds = YES;
    [self.shotScreenBtn addTarget:self action:@selector(takeScreenShot) forControlEvents:UIControlEventTouchUpInside];
    [ self.cameraVC.view addSubview:self.shotScreenBtn];
    
   
}


-(void) popOut
{
    [self.cameraVC dismissViewControllerAnimated:YES completion:^{
        UnitySendMessage("ARCamera", "stopARCamera","");
    }];
}



-(void) turnLight:(UIButton *) sender
{
    
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];

    if ([device hasTorch]) {
        if (!self.lightBtn.selected) {
            self.lightBtn.selected = YES;
            [device lockForConfiguration:nil];
            [device setTorchMode:AVCaptureTorchModeOn];
            [device unlockForConfiguration];
        } else {
            self.lightBtn.selected = NO;
            [device lockForConfiguration:nil];
            [device setTorchMode:AVCaptureTorchModeOff];
            [device unlockForConfiguration];
        }
  
    } else {
        NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError
                                                          title:@"未发现摄像头"
                                                        message:@""
                                                       delegate:nil];
        [alert show];
    }

}

/*
- (void)flashTurnOn
{
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn];
        [device unlockForConfiguration];
    }
}

- (void)flashTurnOff
{
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
}
*/




extern "C" {
    
    bool saveToGallery( const char * path ){
        NSString *imagePath = [NSString stringWithUTF8String:path];
        
        NSLog(@"###### This is the file path being passed: %@", imagePath);
        
        if( ![[NSFileManager defaultManager] fileExistsAtPath:imagePath] ) {
            NSLog(@"###### Early exit - file doesn't exist");
            return false;
        }
        
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        
        if( image ) {
            NSLog(@"###### Trying to write image");
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil );
            return true;
        }
        
        return false;
    }
    
}



-(void) takeScreenShot
{
    
    UnitySendMessage("ARCamera", "captureScreen","");

    /*
    if(UIGraphicsBeginImageContextWithOptions != NULL){
        UIGraphicsBeginImageContextWithOptions(kScreen_Frame.size, YES, 0.0);
    } else {
        UIGraphicsBeginImageContext(kScreen_Frame.size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [_unityView.layer renderInContext:context];
    UIImage *screenshot=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(screenshot, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
     
     */
    
}

- (void)image:(UIImage *)image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    if (error != nil) {
        NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError
                                                          title:@"保存失败"
                                                        message:@"未保存"
                                                       delegate:nil];
        [alert show];
    } else {
        NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleSuccess
                                                          title:@"保存成功"
                                                        message:@"已保存到相册"
                                                       delegate:nil];
        [alert show];
    }
}


-(void) recordVideo
{
    UnitySendMessage("ARCamera", "recordScreen","");
}



@end
