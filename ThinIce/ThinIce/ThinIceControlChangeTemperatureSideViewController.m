//
//  ThinIceControlChangeTemperatureSideViewController.m
//  ThinIce
//
//  Created by Dmitry on 20.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "ThinIceControlChangeTemperatureSideViewController.h"

#define maxTemperature                                  16
#define minTemperature                                  4

typedef NS_ENUM(NSInteger, ChangeTemperatureButton) {
    PlusTemperatureButton,
    MinusTemperatureButton
};

@interface ThinIceControlChangeTemperatureSideViewController () {
    
    NSInteger                                           temperatureTemp;
}

//Header StoryBoard Connections

@property (weak, nonatomic) IBOutlet UIView             *headerContentView;
@property (weak, nonatomic) IBOutlet UILabel            *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView        *timerImage;
@property (weak, nonatomic) IBOutlet UILabel            *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton           *flipButton;

// Charge Block

@property (weak, nonatomic) IBOutlet UILabel            *chargeLabel;
@property (weak, nonatomic) IBOutlet UIView             *chargeSeparator;

// VestPic

@property (weak, nonatomic) IBOutlet UIImageView        *vestPic;

// Charge Indicator Block

@property (weak, nonatomic) IBOutlet UILabel            *percentLabel;

@property (weak, nonatomic) IBOutlet UIView             *highEnergyView;
@property (weak, nonatomic) IBOutlet UIView             *midEnergyView;
@property (weak, nonatomic) IBOutlet UIView             *lowEnergyView;

// Temperature Block

@property (weak, nonatomic) IBOutlet UILabel            *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIView             *temperatureSeparator;

// Change Temperature Block

@property (weak, nonatomic) IBOutlet UILabel            *changeTemperatureLabel;
@property (weak, nonatomic) IBOutlet UIButton           *plusButton;
@property (weak, nonatomic) IBOutlet UIButton           *minusButton;

@end

@implementation ThinIceControlChangeTemperatureSideViewController

-(void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}


- (void)createViewController {
    
    [self createViewControllerViewUI];
    [self createHeaderBlock];
    [self createChargeBlock];
    [self createVestPickBlock];
    [self createTemperatureBlock];
    [self createChangeTemperatureBlock];
    
}

- (void)createViewControllerViewUI {
    
    temperatureTemp                                     = [AccountInfoManager sharedManager].currentDeviceTemperature;
    self.view.backgroundColor                           = [[HelperManager sharedServer] colorwithHexString:@"346b7d" alpha:1.0];
    [self roundMyView:self.view borderRadius:CellAndTableCornerRadius borderWidth:1.0 color:[UIColor clearColor]];
    
    self.plusButton.tag                                 = PlusTemperatureButton;
    self.minusButton.tag                                = MinusTemperatureButton;
}

- (void)createHeaderBlock {
    
    self.headerContentView.backgroundColor              = [[HelperManager sharedServer] colorwithHexString:@"#1585b7" alpha:1.0];
    
    NSMutableAttributedString * attributedTitlestring   = [[NSMutableAttributedString alloc] initWithString:@"Thin Ice Vest"];
    [attributedTitlestring addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, 8)];
    [attributedTitlestring addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(8, 5)];
    self.titleLabel.attributedText                      = attributedTitlestring;
    
    self.timerImage.image                               = [UIImage imageNamed:[NSString stringWithFormat:@"ThinIceControl_timer_image_320@2x", (int)kScreenWidth]];
    self.timerImage.contentMode                         = UIViewContentModeCenter;
    
    self.timerLabel.text                                = @"12:59 PM";
    self.timerLabel.textColor                           = [UIColor whiteColor];
    
    self.flipButton.backgroundColor                     = [UIColor clearColor];
    self.flipButton.tintColor                           = [UIColor clearColor];
    
    [self.flipButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icons_dashboardFlip_normal_%d", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.flipButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icons_dashboardFlip_active_%d", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.flipButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icons_dashboardFlip_active_%d", (int)kScreenWidth]] forState:UIControlStateSelected];
}

- (void)createChargeBlock {
    
    self.chargeLabel.text                               = @"Charge";
    self.chargeLabel.textColor                          = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.chargeSeparator.backgroundColor                = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
}

- (void)createVestPickBlock {
    
    self.vestPic.image                                  = [UIImage imageNamed:[NSString stringWithFormat:@"ThinIceControl_vest_image_320@2x", (int)kScreenWidth]];
    self.vestPic.contentMode                            = UIViewContentModeCenter;
}

- (void)createTemperatureBlock {
    
    self.percentLabel.backgroundColor                   = [UIColor clearColor];
    self.percentLabel.textColor                         = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
    self.percentLabel .text                             = @"100 %";
    
    self.highEnergyView.backgroundColor                 = [UIColor clearColor];
    [self addBorderLineFor: self.highEnergyView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0];
    self.midEnergyView.backgroundColor                  = [UIColor clearColor];
    [self addBorderLineFor: self.midEnergyView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0];
    self.lowEnergyView.backgroundColor                  = [UIColor clearColor];
    [self addBorderLineFor: self.lowEnergyView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0];
}

- (void)createChangeTemperatureBlock {
    
    self.temperatureLabel.text                          = @"Temperature";
    self.temperatureLabel.textColor                     = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.temperatureSeparator.backgroundColor           = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
    
    self.changeTemperatureLabel.text                    = [self calculateCelsiusFahrenheitValue];
    self.changeTemperatureLabel.textColor               = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    [self.plusButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ThinIceControl_plusButton_normal_320@2x", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.plusButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ThinIceControl_plusButton_active_320@2x", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.plusButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ThinIceControl_plusButton_active_320@2x", (int)kScreenWidth]] forState:UIControlStateSelected];
    
    [self.minusButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ThinIceControl_minusButton_normal_320@2x", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.minusButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ThinIceControl_minusButton_active_320@2x", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.minusButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ThinIceControl_minusButton_active_320@2x", (int)kScreenWidth]] forState:UIControlStateSelected];
}

- (void)addBorderLineFor:(UIView*)view withColor:(UIColor*)color borderWidth:(float)width {
    
    view.layer.cornerRadius     = view.frame.size.height / 2;
    view.layer.borderColor      = color.CGColor;
    view.layer.borderWidth      = width;
}

- (void)roundMyView:(UIView*)view borderRadius:(CGFloat)radius borderWidth:(CGFloat)border color:(UIColor*)color {
    
    CALayer *layer              = [view layer];
    layer.masksToBounds         = YES;
    layer.cornerRadius          = radius;
    layer.borderWidth           = border;
    layer.borderColor           = (__bridge CGColorRef _Nullable)(color);
}

- (NSString*)changeVestTemperatureWithButton:(UIButton*)sender {
    
    int tempTemperature                                 = (int)temperatureTemp;
    
    switch (sender.tag) {
        case PlusTemperatureButton:
        {
            tempTemperature++;
        }
            break;
        case MinusTemperatureButton:
        {
            tempTemperature--;
        }
            break;
        default:
            break;
    }
    
    
    if (tempTemperature < maxTemperature && tempTemperature > minTemperature) {

        switch (sender.tag) {
            case PlusTemperatureButton:
            {
                temperatureTemp++;
                [AccountInfoManager sharedManager].currentDeviceTemperature = temperatureTemp;
                return [self calculateCelsiusFahrenheitValue];
            }
                break;
            case MinusTemperatureButton:
            {
                temperatureTemp--;
                [AccountInfoManager sharedManager].currentDeviceTemperature = temperatureTemp;
                return [self calculateCelsiusFahrenheitValue];
            }
                break;
            default:
                break;
        }
    }
    return [self calculateCelsiusFahrenheitValue];
}

- (NSString*)calculateCelsiusFahrenheitValue {
    
    if([[AccountInfoManager sharedManager].userToken.userSettings.user_temperature isEqualToString:@"℃"]) {
        
        return [NSString stringWithFormat:@"%d %@", (int)temperatureTemp, [AccountInfoManager sharedManager].userToken.userSettings.user_temperature];
    } else {
        
        int temperatureTMPValue                         = 0;
        temperatureTMPValue                             = (temperatureTemp * 1.8) + 32;
        return [NSString stringWithFormat:@"%d %@", (int)temperatureTMPValue, [AccountInfoManager sharedManager].userToken.userSettings.user_temperature];
    }
}

- (IBAction)plusButtonActionHendlier:(UIButton *)sender {
    
    self.changeTemperatureLabel.text                    = [self changeVestTemperatureWithButton:sender];
}

- (IBAction)minusButtonActionHendlier:(UIButton *)sender {
    
    self.changeTemperatureLabel.text                    = [self changeVestTemperatureWithButton:sender];
}

#pragma mark - Flip Action

- (IBAction)headerFlipButtinAction:(UIButton *)sender {
    
    [self.parentVC rightFlip];
}

@end
