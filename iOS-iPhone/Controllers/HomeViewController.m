//
//  HomeViewController.m
//  Unity-iPhone
//
//  Created by Woody Yan on 25/06/14.
//
//

#import "HomeViewController.h"
#import "Marco.h"
#import "CameraViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
	self.view.backgroundColor = [UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:1.0];
    self.title = @"Home";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:  UIBarButtonSystemItemCamera
                                                  target:self
                                                  action:@selector(openCamera)];
    self.navigationItem.rightBarButtonItem.tintColor = ColorWithHex(0X55CC93);
    
//    NSLog(@"%@",kApp.unityView);

}


- (void) openCamera
{

//    CameraViewController *cam = [CameraViewController new];
//    UnitySendMessage("ARCamera", "bootARCamera","");
//    cam.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    [self presentViewController:cam animated:YES completion:nil];
    

    UIViewController * temp =  (UIViewController *)kApp.cameraVC;
    UnitySendMessage("ARCamera", "bootARCamera","");
    temp.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:temp animated:YES completion:nil];

//    UnitySendMessage("ARCamera", "bootARCamera","");
//    UnitySendMessage("ARCamera", "stopARCamera","");
//    UnitySendMessage("ARCamera", "recordScreen","");

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
