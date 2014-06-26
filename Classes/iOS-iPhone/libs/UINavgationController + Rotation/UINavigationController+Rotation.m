//
//  UINavigationController+Rotation.m
//  TestRotation
//
//  Created by Woody Yan on 12/03/14.
//  Copyright (c) 2014 Woody Yan. All rights reserved.
//

#import "UINavigationController+Rotation.h"

@implementation UINavigationController (Rotation)


- (UIStatusBarStyle)preferredStatusBarStyle {
    return  [[self topViewController] preferredStatusBarStyle];
}

-(BOOL) shouldAutorotate { 
	return [[self topViewController] shouldAutorotate]; 
} 

-(NSUInteger) supportedInterfaceOrientations { 
	return [[self topViewController] supportedInterfaceOrientations]; 
} 

- (UIInterfaceOrientation) preferredInterfaceOrientationForPresentation { 
	return [[self topViewController] preferredInterfaceOrientationForPresentation]; 
} 

@end
