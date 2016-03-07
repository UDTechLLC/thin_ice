//
//  MeasurementsViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 07.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "MeasurementsViewController.h"

@interface MeasurementsViewController ()

// MeasurementsBackground Block
@property (weak, nonatomic) IBOutlet UIView                         *measurementsBackgroundView;

// Volume Block
@property (weak, nonatomic) IBOutlet UILabel                        *volumeLabel;
@property (weak, nonatomic) IBOutlet UITextField                    *volumeTextField;
@property (weak, nonatomic) IBOutlet UIView                         *volumeBorderLine;

// Temperature Block
@property (weak, nonatomic) IBOutlet UILabel                        *temperatureLabel;
@property (weak, nonatomic) IBOutlet UITextField                    *temperatureTextField;
@property (weak, nonatomic) IBOutlet UIView                         *temperatureBorderLine;

// Weight Block
@property (weak, nonatomic) IBOutlet UILabel                        *weightLabel;
@property (weak, nonatomic) IBOutlet UITextField                    *weightTextField;
@property (weak, nonatomic) IBOutlet UIView                         *weightBorderLine;

// Length Block

@property (weak, nonatomic) IBOutlet UILabel                        *lengthLabel;
@property (weak, nonatomic) IBOutlet UITextField                    *lengthTextField;
@property (weak, nonatomic) IBOutlet UIView                         *lengthBorderLine;

// Save Button Block
@property (weak, nonatomic) IBOutlet UIButton                       *saveButton;

@end

@implementation MeasurementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createViewController];
    
}

- (void)createViewController {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    self.measurementsBackgroundView.layer.cornerRadius = 13;
    self.measurementsBackgroundView.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    
// Create Volume Block init
    
    self.volumeLabel.text = @"Volume";
    self.volumeLabel.textColor = [UIColor lightGrayColor];
    self.volumeTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.volumeTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.volumeBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// Create Temperature Block init
    
    self.temperatureLabel.text = @"Temperature";
    self.temperatureLabel.textColor = [UIColor lightGrayColor];
    //self.temperatureTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter New Password" attributes:@{NSForegroundColorAttributeName: [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0]}];
    self.temperatureTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.temperatureTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.temperatureBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    
// Create Temperature Block init
    
    self.weightLabel.text = @"Weight";
    self.weightLabel.textColor = [UIColor lightGrayColor];
    //self.weightTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter New Password" attributes:@{NSForegroundColorAttributeName: [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0]}];
    self.weightTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.weightTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.weightBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    
// Create Temperature Block init
    
    self.lengthLabel.text = @"Length";
    self.lengthLabel.textColor = [UIColor lightGrayColor];
    //self.lengthTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter New Password" attributes:@{NSForegroundColorAttributeName: [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0]}];
    self.lengthTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.lengthTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.lengthBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];

    
// Create SaveButton init
    
    self.saveButton.layer.cornerRadius = 13;
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_normal_%d", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateSelected];
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
}

- (IBAction)saveButtonActionHendlier:(UIButton *)sender {
    

}


@end
