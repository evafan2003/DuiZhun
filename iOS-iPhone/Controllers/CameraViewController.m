//
//  CameraViewController.m
//  Unity-iPhone
//
//  Created by Woody Yan on 25/06/14.
//
//

#import "CameraViewController.h"
#import "Marco.h"


@interface CameraViewController ()

@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UIButton *lightBtn;
@property (nonatomic,strong) UIButton *shotScreenBtn;
@property (nonatomic,strong) UIButton *recordBtn;

@end

@implementation CameraViewController

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
    
//    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    

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




-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationFade;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
