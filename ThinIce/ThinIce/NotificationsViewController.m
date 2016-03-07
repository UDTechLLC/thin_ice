//
//  NotificationsViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 07.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "NotificationsViewController.h"

@interface NotificationsViewController () {
    NSInteger                                                                   currentSelectedButton;
    BOOL                                                                        isNotificationsEnable;
}

// Background Container View Block
@property (weak, nonatomic) IBOutlet UIView                                     *backgroundContainerView;

// Notifications Block
@property (weak, nonatomic) IBOutlet UILabel                                    *notificationsLabel;
@property (weak, nonatomic) IBOutlet UISwitch                                   *notificationSwitch;
@property (weak, nonatomic) IBOutlet UIView                                     *notificationsBorderLine;

// Notifications Selected Slider Block
@property (weak, nonatomic) IBOutlet UIView                                     *notificationsSelectedSlider;

@property (weak, nonatomic) IBOutlet UIButton                                   *oneHourButton;
@property (weak, nonatomic) IBOutlet UIButton                                   *twoHourButton;
@property (weak, nonatomic) IBOutlet UIButton                                   *threeHourButton;
@property (weak, nonatomic) IBOutlet UIButton                                   *fourHourButton;

@property (weak, nonatomic) IBOutletCollection(UIButton) NSArray                *hourButtons;

// text Info Label
@property (weak, nonatomic) IBOutlet UILabel                                    *textInfoLabel;

@end

@implementation NotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createViewController];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillLayoutSubviews {
// change CornerRadius
    
    // Change CornerRadius From backgroundContainerView -
    self.backgroundContainerView.layer.cornerRadius = 13;
    
    // Change CornerRadius From notificationsSelectedSlider -
    self.notificationsSelectedSlider.layer.cornerRadius = self.notificationsSelectedSlider.frame.size.height / 2;
    // Set Notification Hours If Switch state - ON
    [self switchChangeNotificationStateView: self.notificationSwitch];
    
    [super viewWillLayoutSubviews];
}

- (void)createViewController {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    currentSelectedButton = 0;
    isNotificationsEnable = NO;
    
    self.backgroundContainerView.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];

// Create Notifications Block init
    self.notificationsLabel.text = @"Notifications";
    self.notificationsLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.notificationSwitch.onTintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    self.notificationSwitch.tintColor = [UIColor whiteColor];
    self.notificationSwitch.on = isNotificationsEnable;
    self.notificationsBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    // Button One
    self.oneHourButton.tag = 0;
    [self.oneHourButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
    [self.oneHourButton setTitle: @"1 Hour" forState:UIControlStateNormal];
    
    // Button Two
    self.twoHourButton.tag = 1;
    [self.twoHourButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
    [self.twoHourButton setTitle: @"2 Hour" forState:UIControlStateNormal];
    
    // Button Three
    self.threeHourButton.tag = 2;
    [self.threeHourButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
    [self.threeHourButton setTitle: @"3 Hour" forState:UIControlStateNormal];
    
    // Button Four
    self.fourHourButton.tag = 3;
    [self.fourHourButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
    [self.fourHourButton setTitle: @"4 Hour" forState:UIControlStateNormal];
    
// Create Notifications Slide Houers Block init
    self.notificationsSelectedSlider.backgroundColor = [[HelperManager sharedServer] colorwithHexString: ColorForSettingsBackgroundSlider alpha: 0.5];
    
    
// Create LabelInfo Block init
    self.textInfoLabel.backgroundColor = [UIColor clearColor];
    self.textInfoLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
}

- (IBAction)switchChangeNotificationStateView:(UISwitch *)sender {
    if(sender.on) {
        [self changeButtonBackgroundColorWithButtonSelected:currentSelectedButton];
        self.notificationsSelectedSlider.userInteractionEnabled = YES;
        self.notificationsLabel.textColor = [UIColor whiteColor];
    } else {
        self.notificationsLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
        currentSelectedButton = 0;
        [self changeButtonBackgroundColorWithButtonSelected:currentSelectedButton];
        [self.oneHourButton setBackgroundColor:[UIColor lightGrayColor]];
        self.notificationsSelectedSlider.userInteractionEnabled = NO;
    }
}

- (IBAction)notificationHourActionHendlier:(UIButton*)sender {
    currentSelectedButton = sender.tag;
    [self changeButtonBackgroundColorWithButtonSelected: currentSelectedButton];
}

- (UIView *)roundCornersOnView:(UIView *)view onTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius {
    
    if (tl || tr || bl || br) {
        UIRectCorner corner = 0; //holds the corner
        //Determine which corner(s) should be changed
        if (tl) {
            corner = corner | UIRectCornerTopLeft;
        }
        if (tr) {
            corner = corner | UIRectCornerTopRight;
        }
        if (bl) {
            corner = corner | UIRectCornerBottomLeft;
        }
        if (br) {
            corner = corner | UIRectCornerBottomRight;
        }
        
        UIView *roundedView = view;
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundedView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = roundedView.bounds;
        maskLayer.path = maskPath.CGPath;
        roundedView.layer.mask = maskLayer;
        return roundedView;
    } else {
        return view;
    }
}

- (void)changeButtonBackgroundColorWithButtonSelected:(NSInteger)index {
    
    
    switch (index) {
        case 0:
        {
            [self.oneHourButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.oneHourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.oneHourButton = (UIButton *)[self roundCornersOnView:self.oneHourButton onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius: self.oneHourButton.bounds.size.height / 2];
            
            [self.twoHourButton setBackgroundColor: [UIColor clearColor]];
            [self.twoHourButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
            self.twoHourButton = (UIButton *)[self roundCornersOnView:self.twoHourButton onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius: 0];
            
            [self.threeHourButton setBackgroundColor: [UIColor clearColor]];
            [self.threeHourButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
            self.threeHourButton = (UIButton *)[self roundCornersOnView:self.threeHourButton onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius: 0];
            
            [self.fourHourButton setBackgroundColor: [UIColor clearColor]];
            [self.fourHourButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
            self.fourHourButton = (UIButton *)[self roundCornersOnView:self.fourHourButton onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius: 0];
        }
            break;
        case 1:
        {
            [self.oneHourButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.oneHourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.oneHourButton = (UIButton *)[self roundCornersOnView:self.oneHourButton onTopLeft:YES topRight:NO bottomLeft:YES bottomRight:NO radius: self.oneHourButton.bounds.size.height / 2];
            
            [self.twoHourButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.twoHourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.twoHourButton = (UIButton *)[self roundCornersOnView:self.twoHourButton onTopLeft:NO topRight:YES bottomLeft:NO bottomRight:YES radius: self.twoHourButton.bounds.size.height / 2];
            
            [self.threeHourButton setBackgroundColor: [UIColor clearColor]];
            [self.threeHourButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
            self.threeHourButton = (UIButton *)[self roundCornersOnView:self.threeHourButton onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius: 0];
            
            [self.fourHourButton setBackgroundColor: [UIColor clearColor]];
            [self.fourHourButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
            self.fourHourButton = (UIButton *)[self roundCornersOnView:self.fourHourButton onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius: 0];
        }
            break;
        case 2:
        {
            [self.oneHourButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.oneHourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.oneHourButton = (UIButton *)[self roundCornersOnView:self.oneHourButton onTopLeft:YES topRight:NO bottomLeft:YES bottomRight:NO radius: self.oneHourButton.bounds.size.height / 2];
            
            [self.twoHourButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.twoHourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.twoHourButton = (UIButton *)[self roundCornersOnView:self.twoHourButton onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius: 0];
            
            [self.threeHourButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.threeHourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.threeHourButton = (UIButton *)[self roundCornersOnView:self.threeHourButton onTopLeft:NO topRight:YES bottomLeft:NO bottomRight:YES radius: self.threeHourButton.bounds.size.height / 2];
            
            [self.fourHourButton setBackgroundColor: [UIColor clearColor]];
            [self.fourHourButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
            self.fourHourButton = (UIButton *)[self roundCornersOnView:self.fourHourButton onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius: 0];
        }
            break;
        case 3:
        {
            [self.oneHourButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.oneHourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.oneHourButton = (UIButton *)[self roundCornersOnView:self.oneHourButton onTopLeft:YES topRight:NO bottomLeft:YES bottomRight:NO radius: self.oneHourButton.bounds.size.height / 2];
            
            [self.twoHourButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.twoHourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.twoHourButton = (UIButton *)[self roundCornersOnView:self.twoHourButton onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius: 0];
            
            [self.threeHourButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.threeHourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.threeHourButton = (UIButton *)[self roundCornersOnView:self.threeHourButton onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius: 0];
            
            [self.fourHourButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.fourHourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.fourHourButton = (UIButton *)[self roundCornersOnView:self.fourHourButton onTopLeft:NO topRight:YES bottomLeft:NO bottomRight:YES radius: self.fourHourButton.bounds.size.height / 2];
        }
            break;
        default:
            break;
    }
}

@end
