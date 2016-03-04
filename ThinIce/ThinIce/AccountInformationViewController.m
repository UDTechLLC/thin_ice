//
//  AccountInformationViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 03.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "AccountInformationViewController.h"
#import "AccountViewController.h"
#import "InformationViewController.h"
#import "CarbonKit.h"

#define iPhone6XCoordinateForAccountImege               117
#define iPhone6YCoordinateForAccountImege               70

#define iPhone6PlusXCoordinateForAccountImege           119.5
#define iPhone6PlusYCoordinateForAccountImege           65

@interface AccountInformationViewController () <CarbonTabSwipeDelegate> {
    NSArray                                                         *items;
    
    CarbonTabSwipeNavigation                                        *tabSwipe;
    
    AccountViewController                                           *segmentAccount;
    InformationViewController                                       *segmentInformation;
}

// Account Image Block

@property (weak, nonatomic) IBOutlet UIImageView                    *accountPhotoImageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint             *imageYCoordinate;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint             *imageXCoordinate;

// Account Content Account And Information Block

@property (weak, nonatomic) IBOutlet UIView                         *accountAndInformationContentView;
@property (strong, nonatomic) UIViewController                      *accountAndInformationContentViewController;

@end

@implementation AccountInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addAccountInformationBackgroundImage];
    [self addRightBarButtonWithImageName:[NSString stringWithFormat:@"icons_account_exit_account_normal_%d", (int)kScreenWidth] highlightedImageName:[NSString stringWithFormat:@"icons_account_exit_account_active_%d", (int)kScreenWidth] selector:@selector(logout)];
    [self createAccountInformationViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [self addNavigationBarAttributeTitle: @"Account"];
    self.navigationController.navigationBarHidden = NO;
    [self translucentNavigationBar: YES];
    [super viewWillAppear:YES];
}

- (void)viewDidLayoutSubviews {
    [self createAccountImageBlock];
    if((int)kScreenWidth == 375) {
        self.imageXCoordinate.constant = iPhone6XCoordinateForAccountImege;
        self.imageYCoordinate.constant = iPhone6YCoordinateForAccountImege;
    } else if((int)kScreenWidth == 414) {
        self.imageXCoordinate.constant = iPhone6PlusXCoordinateForAccountImege;
        self.imageYCoordinate.constant = iPhone6PlusYCoordinateForAccountImege;
    }
    [self createCarbonTabSwipe];
    [self insertPhotoInAccountPhotoImageView];
    [self.view setNeedsLayout];
    [super viewDidLayoutSubviews];
}

- (void)createAccountInformationViewController {

}

- (void)createCarbonTabSwipe {
    
    self.accountAndInformationContentViewController = [[UIViewController alloc] init];
    self.accountAndInformationContentViewController.view.frame = self.accountAndInformationContentView.bounds;
    self.accountAndInformationContentViewController.navigationController.navigationBarHidden = YES;
    [self.accountAndInformationContentView addSubview: self.accountAndInformationContentViewController.view];
    
    
    items = @[@"Account", @"Information"];
    tabSwipe = [[CarbonTabSwipeNavigation alloc] createWithRootViewController:self.accountAndInformationContentViewController tabNames:items tintColor:[UIColor clearColor] delegate:self isBuyerEnable:NO];
    [tabSwipe setTranslucent:YES];
    [tabSwipe setIndicatorHeight:3.f];
    [tabSwipe setSelectedColor:[[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0] font:[UIFont boldSystemFontOfSize:17]];
    [tabSwipe setNormalColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] font:[UIFont boldSystemFontOfSize:17]];
}

# pragma mark - Carbon Tab Swipe Delegate
// required
- (UIViewController *)tabSwipeNavigation:(CarbonTabSwipeNavigation *)tabSwipe viewControllerAtIndex:(NSUInteger)index {
    
    switch (index) {
        case 0:
        {
            segmentAccount = [self.storyboard instantiateViewControllerWithIdentifier:kAccountViewControllerID];
            return segmentAccount;
        }
        case 1:
        {
            segmentInformation = [self.storyboard instantiateViewControllerWithIdentifier:kInformationViewControllerID];
            return segmentInformation;
        }
        default:
            return [self.storyboard instantiateViewControllerWithIdentifier:kAccountViewControllerID];
    }
}

// optional
- (void)tabSwipeNavigation:(CarbonTabSwipeNavigation *)tabSwipe didMoveAtIndex:(NSInteger)index {
    NSLog(@"Current tab: %d", (int)index);
}

- (void)createAccountImageBlock {
    CGFloat lineWidth    = 3.0;
    UIBezierPath *path   = [self roundedPolygonPathWithRect:self.accountPhotoImageView.bounds
                                                  lineWidth:lineWidth
                                                      sides:6
                                               cornerRadius:15];
    
    CAShapeLayer *mask   = [CAShapeLayer layer];
    mask.path            = path.CGPath;
    mask.lineWidth       = lineWidth;
    mask.strokeColor     = [UIColor clearColor].CGColor;
    mask.fillColor       = [UIColor whiteColor].CGColor;
    self.accountPhotoImageView.layer.mask = mask;
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.path          = path.CGPath;
    border.lineWidth     = lineWidth;
    border.strokeColor   = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0].CGColor;
    border.fillColor     = [UIColor clearColor].CGColor;
    [self.accountPhotoImageView.layer addSublayer:border];
    self.accountPhotoImageView.backgroundColor = [UIColor clearColor];
}

- (void)logout {
    NSLog(@"logout");
}

- (void)insertPhotoInAccountPhotoImageView {
    [self setImageOnImage: [UIImage imageNamed:@"images"]];
}

#pragma Mark - drow text on Image

- (void)setImageOnImage:(UIImage*)image {
    
    UIView *view = [[UIView alloc] initWithFrame:self.accountPhotoImageView.bounds];
    view.backgroundColor = [UIColor clearColor];
    
    UIView *viewBackground = [[UIView alloc] initWithFrame:self.accountPhotoImageView.bounds];
    viewBackground.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFroAccountImageBackground alpha:0.5];
    
    UIImageView *photoImageView = [[UIImageView alloc] initWithImage: image];
    photoImageView.frame = self.accountPhotoImageView.bounds;
    
    UIImageView *photoCameraImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"icons_account_photo_%d", (int)kScreenWidth]]];
    photoCameraImageView.center = view.center;
    
    [view addSubview:photoImageView];
    [view addSubview:viewBackground];
    [view addSubview:photoCameraImageView];
    //i.e. customize view to get what you need
    
    self.accountPhotoImageView.image = [self imageFromView:view];
}

- (UIImage *)imageFromView:(UIView *) view {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [[UIScreen mainScreen] scale]);
    } else {
        UIGraphicsBeginImageContext(view.frame.size);
    }
    [view.layer renderInContext: UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    return YES;
}

@end
