//
//  MessageViewController.m
//  Unity-iPhone
//
//  Created by Woody Yan on 25/06/14.
//
//

#import "MessageViewController.h"
#import "Marco.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

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
    self.title = @"Message";
    
    UILabel *info = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    info.center = self.view.center;
    info.font = [UIFont fontWithName:@"Futura" size:14];
    info.text = @"Message is in developing.";
    info.backgroundColor = [UIColor clearColor];
    info.textColor = ColorWithHex(0XFC4A59);
    info.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:info];

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
