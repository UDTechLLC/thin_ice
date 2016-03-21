//
//  ThinIceControlChangeTimerAndDeviceSideViewController.m
//  ThinIce
//
//  Created by Dmitry on 20.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "ThinIceControlChangeTimerAndDeviceSideViewController.h"

typedef NS_ENUM(NSInteger, DelayedTimerButton) {
    ThirtyMinutesDelayedTimerButton,
    OneHourDelayedTimerButton
};

@interface ThinIceControlChangeTimerAndDeviceSideViewController () {
    
    // Save in CoreData Current Timer and Deleyed Time
    NSInteger                                               currentSelectedButton;
    NSInteger                                               currentTimeOnTimer;
    DeviceTimerState                                        isTimerEnable;
    TimerDelay                                              timerDelay;
}

// header View

@property (weak, nonatomic) IBOutlet UIView                 *headerContentView;
@property (weak, nonatomic) IBOutlet UIButton               *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton               *saveButton;

// Timer ON OFF Block

@property (weak, nonatomic) IBOutlet UILabel                *delayedTimerLabel;
@property (weak, nonatomic) IBOutlet UISwitch               *delayedTimerSwitch;
@property (weak, nonatomic) IBOutlet UIView                 *delayedTimerSeparator;

// Timer Select Delay Block

@property (weak, nonatomic) IBOutlet UIView                 *timerSelectContentView;
@property (weak, nonatomic) IBOutlet UIButton               *thirtyMinutesDelayButton;
@property (weak, nonatomic) IBOutlet UIButton               *oneHourDelayButton;
@property (weak, nonatomic) IBOutlet UIView                 *timerSelectSeparator;

// Power Block

@property (weak, nonatomic) IBOutlet UILabel                *powerLabel;
@property (weak, nonatomic) IBOutlet UISwitch               *powerSwitch;
@property (weak, nonatomic) IBOutlet UIView                 *powerSeparator;

// Thin Ice Control Info

@property (weak, nonatomic) IBOutlet UILabel                *thinIceControlInfoLabel;

// Delete Device Button Block

@property (weak, nonatomic) IBOutlet UIButton               *deleteDeviceButton;

@end

@implementation ThinIceControlChangeTimerAndDeviceSideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createViewController];
}

- (void)viewWillLayoutSubviews {
    // change CornerRadius
    
    // CornerRadius Header View
    [self roundCornersOnView:self.headerContentView onTopLeft:YES topRight:YES bottomLeft:NO bottomRight:NO radius:13.0];
    
    // Change CornerRadius From notificationsSelectedSlider -
    self.timerSelectContentView.layer.cornerRadius = self.timerSelectContentView.frame.size.height / 2;
    
    // Set Notification Hours If Switch state - ON
    [self delayedTimerSwitchHendlier: self.delayedTimerSwitch];
    [self powerSwitchHendlier: self.powerSwitch];
    
    [super viewWillLayoutSubviews];
}

- (void)createViewController {
    
    currentSelectedButton                               = 0;
    isTimerEnable                                       = [self delayedSwitchState];
    self.view.backgroundColor                           = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    self.view.layer.cornerRadius                        = 13;
    
    [self createHeaderContentView];
    [self createTimerBlock];
    [self createDelyaedTimerBlock];
    [self createPoworBlock];
    [self createDeleteDeviceAndThinIceControlInfoBlock];
}

- (void)createHeaderContentView {
 
    self.headerContentView.backgroundColor              = [[HelperManager sharedServer] colorwithHexString:@"#1585b7" alpha:1.0];
    
    [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
}

- (void)createTimerBlock {
    
    self.delayedTimerLabel.text                         = @"Delayed Timer";
    self.delayedTimerLabel.textColor                    = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.delayedTimerSwitch.onTintColor                 = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    self.delayedTimerSwitch.tintColor                   = [UIColor whiteColor];
    self.delayedTimerSwitch.on                          = isTimerEnable;
    self.delayedTimerSeparator.backgroundColor          = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
}

- (void)createDelyaedTimerBlock {
    
    self.timerSelectContentView.backgroundColor         = [[HelperManager sharedServer] colorwithHexString: ColorForSettingsBackgroundSlider alpha: 0.5];
    
    // Button Thirty
    self.thirtyMinutesDelayButton.tag                   = ThirtyMinutesDelayedTimerButton;
    [self.thirtyMinutesDelayButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
    [self.thirtyMinutesDelayButton setTitle: @"30 min" forState:UIControlStateNormal];
    
    // Button One Hour
    self.oneHourDelayButton.tag                         = OneHourDelayedTimerButton;
    [self.oneHourDelayButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
    [self.oneHourDelayButton setTitle: @"1 Hour" forState:UIControlStateNormal];
    
    self.timerSelectSeparator.backgroundColor           = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
}

- (void)createPoworBlock {
    
    self.powerLabel.text                                = @"Power";
    self.powerLabel.textColor                           = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.powerSwitch.onTintColor                        = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    self.powerSwitch.tintColor                          = [UIColor whiteColor];
    self.powerSwitch.on                                 = isTimerEnable;
    self.powerSeparator.backgroundColor                 = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
}

- (void)createDeleteDeviceAndThinIceControlInfoBlock {
    
    self.thinIceControlInfoLabel.backgroundColor        = [UIColor clearColor];
    self.thinIceControlInfoLabel.textColor              = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.deleteDeviceButton.layer.cornerRadius          = 13;
    [self.deleteDeviceButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"thinIceControl_btn_deletedevice_normal_320@2x", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.deleteDeviceButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"thinIceControl_btn_deletedevice_active_320@2x", (int)kScreenWidth]] forState:UIControlStateSelected];
    [self.deleteDeviceButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"thinIceControl_btn_deletedevice_active_320@2x", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.deleteDeviceButton setTitle:@"Delete Device" forState:UIControlStateNormal];
}

#pragma mark - Switch Change State With Saved User Info

- (BOOL)delayedSwitchState {
    
    if([AccountInfoManager sharedManager].deviceONOFFTimer == TimerON) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - Delayed Switch Action

- (IBAction)delayedTimerSwitchHendlier:(UISwitch *)sender {
    
    if(sender.on) {
        
        [self changeButtonBackgroundColorWithButtonSelected:currentSelectedButton];
        self.timerSelectContentView.userInteractionEnabled                  = YES;
        self.delayedTimerLabel.textColor                                    = [UIColor whiteColor];
        
        isTimerEnable                                                       = TimerON;
        timerDelay                                                          = ThirtyMenutes;
    } else {
        
        self.delayedTimerLabel.textColor                                    = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
        currentSelectedButton                                               = 0;
        [self changeButtonBackgroundColorWithButtonSelected:currentSelectedButton];
        [self.thirtyMinutesDelayButton setBackgroundColor:[UIColor lightGrayColor]];
        self.timerSelectContentView.userInteractionEnabled                  = NO;
        
        isTimerEnable                                                       = TimerOFF;
    }
}

#pragma mark - Selected Button Action

- (IBAction)selectedDelayTimerButtonActionHendlier:(UIButton *)sender {
    
    currentSelectedButton                                                   = sender.tag;
    [self changeButtonBackgroundColorWithButtonSelected: currentSelectedButton];
}

#pragma mark - Power Switch Action

- (IBAction)powerSwitchHendlier:(UISwitch *)sender {
    
    if(sender.on) {
        
        self.powerLabel.textColor                                           = [UIColor whiteColor];
    } else {
        
        self.powerLabel.textColor                                           = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    }
}

- (void)roundMyView:(UIView*)view borderRadius:(CGFloat)radius borderWidth:(CGFloat)border color:(UIColor*)color {
    
    CALayer *layer          = [view layer];
    layer.masksToBounds     = YES;
    layer.cornerRadius      = radius;
    layer.borderWidth       = border;
    layer.borderColor       = (__bridge CGColorRef _Nullable)(color);
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
        
        UIView          *roundedView    = view;
        UIBezierPath    *maskPath       = [UIBezierPath bezierPathWithRoundedRect:roundedView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer    *maskLayer      = [CAShapeLayer layer];
        maskLayer.frame                 = roundedView.bounds;
        maskLayer.path                  = maskPath.CGPath;
        roundedView.layer.mask          = maskLayer;
        
        return roundedView;
    } else {
        
        return view;
    }
}

- (void)changeButtonBackgroundColorWithButtonSelected:(NSInteger)index {
    
    
    switch (index) {
        case ThirtyMinutesDelayedTimerButton:
        {
            [self.thirtyMinutesDelayButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.thirtyMinutesDelayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.thirtyMinutesDelayButton = (UIButton *)[self roundCornersOnView:self.thirtyMinutesDelayButton onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius: self.thirtyMinutesDelayButton.bounds.size.height / 2];
            
            [self.oneHourDelayButton setBackgroundColor: [UIColor clearColor]];
            [self.oneHourDelayButton setTitleColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] forState:UIControlStateNormal];
            self.oneHourDelayButton                                             = (UIButton *)[self roundCornersOnView:self.oneHourDelayButton onTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius: 0];
            
            [AccountInfoManager sharedManager].timerDelay                       = ThirtyMenutes;
        }
            break;
        case OneHourDelayedTimerButton:
        {
            [self.thirtyMinutesDelayButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.thirtyMinutesDelayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.thirtyMinutesDelayButton = (UIButton *)[self roundCornersOnView:self.thirtyMinutesDelayButton onTopLeft:YES topRight:NO bottomLeft:YES bottomRight:NO radius: self.thirtyMinutesDelayButton.bounds.size.height / 2];
            
            [self.oneHourDelayButton setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0]];
            [self.oneHourDelayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.oneHourDelayButton                                             = (UIButton *)[self roundCornersOnView:self.oneHourDelayButton onTopLeft:NO topRight:YES bottomLeft:NO bottomRight:YES radius: self.oneHourDelayButton.bounds.size.height / 2];
            
            [AccountInfoManager sharedManager].timerDelay                       = OneHour;
        }
            break;
        default:
            break;
    }
}

- (void)saveContentViewInfo {
    
    [AccountInfoManager sharedManager].deviceONOFFTimer                         = isTimerEnable;
    [AccountInfoManager sharedManager].timerDelay                               = timerDelay;
}

- (IBAction)headerSaveButtonAction:(UIButton *)sender {
    
    [self saveContentViewInfo];
    [self.parentVC leftFlip];
}

- (IBAction)hedaerCancelButtonAction:(UIButton *)sender {
    
    [self.parentVC leftFlip];
}

@end
