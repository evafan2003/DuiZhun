//
//  AppDelegate.h
//  Unity-iPhone
//
//  Created by Woody Yan on 25/06/14.
//
//

@class HomeViewController, ExploreViewController, MessageViewController, MeViewController,CameraViewController;

#import "UnityAppController.h"

@interface AppDelegate : UnityAppController

@property (strong, nonatomic) UITabBarController  *tabVC;
@property (strong, nonatomic) HomeViewController  *homeVC;
@property (strong, nonatomic) ExploreViewController *exploreVC;
@property (strong, nonatomic) MessageViewController *messageVC;
@property (strong, nonatomic) MeViewController  *meVC;
@property (strong, nonatomic) CameraViewController  *cameraVC;

- (void)createViewHierarchyImpl;

@end
