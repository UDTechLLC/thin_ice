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
#import "HomeViewController.h"
#import "RSKImageCropper.h"
#import "TOActionSheet.h"

#define iPhone6XCoordinateForAccountImege               110
#define iPhone6YCoordinateForAccountImege               69

#define iPhone6PlusXCoordinateForAccountImege           119.5
#define iPhone6PlusYCoordinateForAccountImege           65

@interface AccountInformationViewController () <CarbonTabSwipeDelegate, RSKImageCropViewControllerDelegate, RSKImageCropViewControllerDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    
    NSArray                                                         *items;
    
    CarbonTabSwipeNavigation                                        *tabSwipe;
    
    AccountViewController                                           *segmentAccount;
    InformationViewController                                       *segmentInformation;
    UIImagePickerController                                         *imagePicker;
    
    BOOL                                                            onceCreateImageAndCarbonBlock;
}

// Account Image Block
@property (weak, nonatomic) IBOutlet UIImageView                    *accountPhotoImageView;

// Image Constraints
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
    
    onceCreateImageAndCarbonBlock = YES;
    
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

- (void)viewDidAppear:(BOOL)animated {
    
    if(onceCreateImageAndCarbonBlock) {
        
        [self createAccountImageBlock];
        [self createCarbonTabSwipe];
        [self insertPhotoInAccountPhotoImageView];
        onceCreateImageAndCarbonBlock = NO;
    }
    [super viewDidAppear:animated];
}

- (void)viewDidLayoutSubviews {
    
    if((int)kScreenWidth == 320) {
        
        self.accountPhotoImageView.center = CGPointMake(self.view.bounds.size.width / 2, 129);
        
    } else if((int)kScreenWidth == 375) {
        
        self.accountPhotoImageView.center = CGPointMake(self.view.bounds.size.width / 2, 153);
        
    } else if((int)kScreenWidth == 414) {
        
        self.accountPhotoImageView.center = CGPointMake(self.view.bounds.size.width / 2, 170);
    }
}

- (void)createAccountInformationViewController {
    
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    
    UITapGestureRecognizer *openPhotoDataSource = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseImageDataSource)];
    openPhotoDataSource.numberOfTapsRequired = 1;
    self.accountPhotoImageView.userInteractionEnabled = YES;
    [self.accountPhotoImageView addGestureRecognizer:openPhotoDataSource];
}

- (void)createCarbonTabSwipe {
    
    self.accountAndInformationContentViewController = [[UIViewController alloc] init];
    [self.accountAndInformationContentView addSubview: self.accountAndInformationContentViewController.view];
    self.accountAndInformationContentViewController.view.frame = self.accountAndInformationContentView.bounds;
    self.accountAndInformationContentViewController.navigationController.navigationBarHidden = YES;
    
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
    UIBezierPath *path   = [self selfedRoundedPolygonPathWithRect:self.accountPhotoImageView.bounds lineWidth:lineWidth sides:6 cornerRadius:15];
    
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
    [[AccountInfoManager sharedManager] logout];
    HomeViewController *homeController = [self.storyboard instantiateViewControllerWithIdentifier: kHomeViewControllerID];
    [[SlideNavigationController sharedInstance] setViewControllers:[NSArray arrayWithObject:homeController] animated:YES];
}

- (void)insertPhotoInAccountPhotoImageView {
    [self setImageOnImage: [[HelperManager sharedServer] getImageFromURL: [AccountInfoManager sharedManager].userToken.user_photo_url]];
}

#pragma Mark - drow text on Image

- (void)setImageOnImage:(UIImage*)image {
    
    UIView *view = [[UIView alloc] initWithFrame:self.accountPhotoImageView.bounds];
    view.backgroundColor = [UIColor clearColor];
    
    UIImageView *photoImageView = [[UIImageView alloc] initWithImage: image];
    photoImageView.frame = self.accountPhotoImageView.bounds;
    
    UIView *viewBackground = [[UIView alloc] initWithFrame:self.accountPhotoImageView.bounds];
    viewBackground.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFroAccountImageBackground alpha:0.5];
    
    UIImageView *photoCameraImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"icons_account_photo_%d", (int)kScreenWidth]]];
    [photoCameraImageView sizeToFit];
    
    photoCameraImageView.center = viewBackground.center;
    CGPoint centerPhotoCam = photoCameraImageView.center;
    centerPhotoCam.y = centerPhotoCam.y - 6;
    photoCameraImageView.center = centerPhotoCam;
    
    [view addSubview:photoImageView];
    [view addSubview:viewBackground];
    [view addSubview:photoCameraImageView];
    //i.e. customize view to get what you need
    
    self.accountPhotoImageView.image = [self imageFromView:view];
    [self.accountPhotoImageView setNeedsDisplay];
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

#pragma mark - UIAlertControllerDelegate

- (void)chooseImageDataSource {
    
    __weak __typeof(self) weakSelf = self;
    UIAlertController *actionMultimediaView = [UIAlertController alertControllerWithTitle: nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
 
    [actionMultimediaView.navigationItem setHidesBackButton:YES];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) { }];
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { [weakSelf takePhoto]; }];
    UIAlertAction *gallery = [UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { [weakSelf takePhotoWithGallery]; }];
    
    [actionMultimediaView addAction:cancel];
    [actionMultimediaView addAction:camera];
    [actionMultimediaView addAction:gallery];
    
    [self presentViewController:actionMultimediaView animated:YES completion:nil];
    
//    __weak __typeof(self) weakSelf = self;
//    TOActionSheet *actionSheet = [[TOActionSheet alloc] init];
//    actionSheet.title = nil;
//    actionSheet.style = TOActionSheetStyleDark;
//    
//    [actionSheet addButtonWithTitle:@"Camera" tappedBlock:^{
//        [weakSelf takePhoto];
//    }];
//    
//    [actionSheet addButtonWithTitle:@"Gallery" tappedBlock:^{
//        [weakSelf takePhotoWithGallery];
//    }];
//    
//
//    [actionSheet showFromView:self.view inView:self.navigationController.view];
}

#pragma mark - ImagePickerDelegate

- (void)takePhotoWithGallery {
    
    imagePicker.allowsEditing = NO;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)takePhoto {
    
    imagePicker.allowsEditing = NO;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if(image) {
        [self onAddPhotoButtonTouch:image];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)onAddPhotoButtonTouch:(UIImage *)image {
    
    RSKImageCropViewController *imageCropVC = [[RSKImageCropViewController alloc] initWithImage:image cropMode:RSKImageCropModeCustom];
    imageCropVC.delegate = self;
    imageCropVC.dataSource = self;
    [self.navigationController pushViewController:imageCropVC animated:NO];
}

#pragma mark - RSKImageCropViewControllerDelegate

- (void)imageCropViewControllerDidCancelCrop:(RSKImageCropViewController *)controller {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)imageCropViewController:(RSKImageCropViewController *)controller didCropImage:(UIImage *)croppedImage usingCropRect:(CGRect)cropRect {
    
    [AccountInfoManager sharedManager].userToken.user_photo_url = [[HelperManager sharedServer] saveImage:croppedImage withFileName:[self writeImageFileName] ofType:[[HelperManager sharedServer] definitionImageType:croppedImage]];
    [self setImageOnImage:croppedImage];
    NSManagedObjectContext *defaultContext = [NSManagedObjectContext MR_defaultContext];
    [defaultContext MR_saveToPersistentStoreAndWait];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - RSKImageCropViewControllerDataSource

// Returns a custom rect for the mask.
- (CGRect)imageCropViewControllerCustomMaskRect:(RSKImageCropViewController *)controller {
    
    CGSize maskSize;
    maskSize = CGSizeMake(250, 250);

    CGFloat viewWidth = CGRectGetWidth(controller.view.frame);
    CGFloat viewHeight = CGRectGetHeight(controller.view.frame);
    
    CGRect maskRect = CGRectMake((viewWidth - maskSize.width) * 0.5f, (viewHeight - maskSize.height) * 0.5f, maskSize.width, maskSize.height);
    
    return maskRect;
}

// Returns a custom path for the mask.
- (UIBezierPath *)imageCropViewControllerCustomMaskPath:(RSKImageCropViewController *)controller {

    return [self selfedRoundedPolygonPathWithRect: controller.maskRect lineWidth:1.0 sides:6 cornerRadius:10];
}

// Returns a custom rect in which the image can be moved.
- (CGRect)imageCropViewControllerCustomMovementRect:(RSKImageCropViewController *)controller {
    
    // If the image is not rotated, then the movement rect coincides with the mask rect.
    return controller.maskRect;
}

- (UIBezierPath *)selfedRoundedPolygonPathWithRect:(CGRect)rect lineWidth:(CGFloat)lineWidth sides:(NSInteger)sides cornerRadius:(CGFloat)cornerRadius {
    
    UIBezierPath        *path               = [UIBezierPath bezierPath];
    
    CGFloat             theta               = 2.0 * M_PI / sides;                           // how much to turn at every corner
    CGFloat             width               = MIN(rect.size.width, rect.size.height);   // width of the square
    
    // Calculate Center
    CGPoint             center              = CGPointMake(rect.origin.x + width / 2.0, rect.origin.y + width / 2.0);
    CGFloat             radius              = (width - lineWidth + cornerRadius - (cos(theta) * cornerRadius)) / 2.0;
    
    // Start drawing at a point, which by default is at the right hand edge
    // but can be offset
    CGFloat             angle               = M_PI / 2;
    
    CGPoint             corner              = CGPointMake(center.x + (radius - cornerRadius) * cos(angle), center.y + (radius - cornerRadius) * sin(angle));
    [path moveToPoint:(CGPointMake(corner.x + cornerRadius * cos(angle + theta), corner.y + cornerRadius * sin(angle + theta)))];
    
    // draw the sides and rounded corners of the polygon
    
    for (NSInteger side = 0; side < sides; side++) {
        
        angle += theta;
        
        CGPoint         corner              = CGPointMake(center.x + (radius - cornerRadius) * cos(angle), center.y + (radius - cornerRadius) * sin(angle));
        CGPoint         tip                 = CGPointMake(center.x + radius * cos(angle), center.y + radius * sin(angle));
        CGPoint         start               = CGPointMake(corner.x + cornerRadius * cos(angle - theta), corner.y + cornerRadius * sin(angle - theta));
        CGPoint         end                 = CGPointMake(corner.x + cornerRadius * cos(angle + theta), corner.y + cornerRadius * sin(angle + theta));
        
        [path addLineToPoint:start];
        [path addQuadCurveToPoint:end controlPoint:tip];
    }
    
    [path closePath];
    
    return path;
}

- (NSString*)writeImageFileName {
    
    if([AccountInfoManager sharedManager].userToken.socialityKey) {
        
        return [AccountInfoManager sharedManager].userToken.socialityKey;
    } else if([AccountInfoManager sharedManager].userToken.userLogin) {
        
        return [AccountInfoManager sharedManager].userToken.userLogin;
    }
    
    return @"feil";
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    return YES;
}

@end
