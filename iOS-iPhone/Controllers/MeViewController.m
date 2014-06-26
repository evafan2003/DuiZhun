//
//  MeViewController.m
//  Unity-iPhone
//
//  Created by Woody Yan on 25/06/14.
//
//

#import "MeViewController.h"
#import "Marco.h"

#define coverHeight  200

@interface MeViewController ()  <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView  *scrollView;
@property (strong, nonatomic) UIImageView   *coverPhoto;
@property (strong, nonatomic) UIImageView   *profilePhoto;
@property (strong, nonatomic) UILabel       *userName;

@end

@implementation MeViewController

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
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    self.view.backgroundColor = [UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:1.0];
    self.title = @"Me";
    
    [self initUI];
    
    
    AVObject *testObject = [AVObject objectWithClassName:@"Object"];
    [testObject setObject:@"woody" forKey:@"name"];
    [testObject save];


    NSLog(@"path: %@",NSHomeDirectory());

}


#pragma mark - initUI

- (void) initUI
{
    //ScrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.contentSize = CGSizeMake(kScreen_Width, kScreen_Height + 1);
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    //CoverPhoto
    self.coverPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, coverHeight)];
    self.coverPhoto.image = [UIImage imageNamed:@"cover_2.png"];
    
    //ProfilePhoto
    self.profilePhoto = [[UIImageView alloc] initWithFrame:CGRectMake(120, 50, 80, 80)];
    [self.profilePhoto.layer setCornerRadius:(self.profilePhoto.frame.size.height/2)];
    [self.profilePhoto.layer setMasksToBounds:YES];
    [self.profilePhoto setClipsToBounds:YES];
    self.profilePhoto.layer.borderColor = [ColorWithHexAlpha(0XFFFFFF, 0.7) CGColor];
    self.profilePhoto.layer.borderWidth = 2.0f;
    self.profilePhoto.backgroundColor = ColorWithHexAlpha(0XFFFFFF, 0.6);
    [self.profilePhoto setContentMode:UIViewContentModeScaleAspectFill];
    
    //Name
    self.userName = [[UILabel alloc] initWithFrame:CGRectMake(125, 150, 100, 30)];
    self.userName.numberOfLines = 1;
    self.userName.font = [UIFont fontWithName:@"Futura" size:18];
    self.userName.textColor = ColorWithHexAlpha(0xFFFFFF, 1.0f);
    self.userName.textAlignment = NSTextAlignmentCenter;
    self.userName.backgroundColor = [UIColor orangeColor];
    
    //Login
    self.login = [UIButton buttonWithType:UIButtonTypeCustom];
    self.login.frame = CGRectMake(125, 150, 70, 30);
    [self.login setTitle:@"Login" forState:UIControlStateNormal];
    self.login.titleLabel.font = [UIFont systemFontOfSize:13];
    self.login.backgroundColor = ColorWithHexAlpha(0x55CC93, 1.0f);
    self.login.tintColor = ColorWithHexAlpha(0xFFFFFF, 1.0f);
    [self.login addTarget:self action:@selector(goToLogin) forControlEvents:UIControlEventTouchUpInside];
    
    //Add Subviews
    [self.view addSubview: self.scrollView];
    [self.scrollView addSubview:self.coverPhoto];
    [self.scrollView addSubview:self.profilePhoto];
    [self.scrollView addSubview: self.login];
    [self.scrollView addSubview:self.userName];
    
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([kUser boolForKey:@"isLogin"] == NO ) {
        self.login.hidden = NO;
        self.userName.hidden = YES;
    } else {
        self.login.hidden = YES;
        self.userName.hidden = NO;
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset  = scrollView.contentOffset.y;
    //    NSLog(@"%f",yOffset);
    
    if (yOffset > -kScreen_Height ) {
        CGRect f = self.coverPhoto.frame;
        f.origin.y = yOffset;
        if (yOffset < 0) {
            f.origin.x = yOffset / 2;
            f.size.width = -yOffset + kScreen_Width;
        }
        f.size.height =  -yOffset + coverHeight;
        self.coverPhoto.frame = f;
    }
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
