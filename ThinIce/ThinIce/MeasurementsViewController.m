//
//  MeasurementsViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 07.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "MeasurementsViewController.h"

typedef NS_ENUM(NSUInteger, CurrentTextFields) {
    VolumeTextField,
    TemperatureTextField,
    WeightTextField,
    LengthTextField
};

#define kArrayWithVolume        [NSArray arrayWithObjects:@"Ml",@"Oz", nil]
#define kArrayWithTemperature   [NSArray arrayWithObjects:@"℃",@"℉", nil]
#define kArrayWithWeight        [NSArray arrayWithObjects:@"Kg",@"Lbf", nil]
#define kArrayWithLength        [NSArray arrayWithObjects:@"Cm",@"Ft",@"Inch", nil]

@interface MeasurementsViewController () <UIPickerViewDataSource, UIPickerViewDelegate> {
    UIPickerView                                                    *picker_;
    NSMutableArray                                                  *currentArrayForPicker_;
    UITextField                                                     *currentTextField_;
}

// MeasurementsBackground Block
@property (weak, nonatomic) IBOutlet UIView                         *measurementsBackgroundView;

// Volume Block
@property (weak, nonatomic) IBOutlet UILabel                        *volumeLabel;
@property (weak, nonatomic) IBOutlet UITextField                    *volumeTextField;
@property (weak, nonatomic) IBOutlet UIView                         *volumeBorderLine;
@property (weak, nonatomic) IBOutlet UIImageView                    *volumeArrow;

// Temperature Block
@property (weak, nonatomic) IBOutlet UILabel                        *temperatureLabel;
@property (weak, nonatomic) IBOutlet UITextField                    *temperatureTextField;
@property (weak, nonatomic) IBOutlet UIView                         *temperatureBorderLine;
@property (weak, nonatomic) IBOutlet UIImageView                    *temperatureArrow;

// Weight Block
@property (weak, nonatomic) IBOutlet UILabel                        *weightLabel;
@property (weak, nonatomic) IBOutlet UITextField                    *weightTextField;
@property (weak, nonatomic) IBOutlet UIView                         *weightBorderLine;
@property (weak, nonatomic) IBOutlet UIImageView                    *weightArrow;

// Length Block
@property (weak, nonatomic) IBOutlet UILabel                        *lengthLabel;
@property (weak, nonatomic) IBOutlet UITextField                    *lengthTextField;
@property (weak, nonatomic) IBOutlet UIView                         *lengthBorderLine;
@property (weak, nonatomic) IBOutlet UIImageView                    *lengthArrow;

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
    
    picker_ = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    picker_.bounds = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height / 5);
    picker_.showsSelectionIndicator = YES;
    picker_.dataSource = self;
    picker_.delegate = self;
    
    currentArrayForPicker_ = [[NSMutableArray alloc] init];
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    self.measurementsBackgroundView.layer.cornerRadius = 13;
    self.measurementsBackgroundView.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    
// Create Volume Block init
    
    self.volumeLabel.text = @"Volume";
    self.volumeLabel.textColor = [UIColor lightGrayColor];
    self.volumeTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.volumeTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.volumeTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.volumeTextField.tag = VolumeTextField;
    self.volumeBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    self.volumeArrow.contentMode = UIViewContentModeCenter;
    self.volumeArrow.image = [UIImage imageNamed:[NSString stringWithFormat:@"arrow_%d", (int)kScreenWidth]];
// Create Temperature Block init
    
    self.temperatureLabel.text = @"Temperature";
    self.temperatureLabel.textColor = [UIColor lightGrayColor];
    //self.temperatureTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter New Password" attributes:@{NSForegroundColorAttributeName: [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0]}];
    self.temperatureTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.temperatureTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.temperatureTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.temperatureTextField.tag = TemperatureTextField;
    self.temperatureBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    self.temperatureArrow.contentMode = UIViewContentModeCenter;
    self.temperatureArrow.image = [UIImage imageNamed:[NSString stringWithFormat:@"arrow_%d", (int)kScreenWidth]];
    
// Create Width Block init
    
    self.weightLabel.text = @"Weight";
    self.weightLabel.textColor = [UIColor lightGrayColor];
    //self.weightTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter New Password" attributes:@{NSForegroundColorAttributeName: [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0]}];
    self.weightTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.weightTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.weightTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.weightTextField.tag = WeightTextField;
    self.weightBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    self.weightArrow.contentMode = UIViewContentModeCenter;
    self.weightArrow.image = [UIImage imageNamed:[NSString stringWithFormat:@"arrow_%d", (int)kScreenWidth]];
    
// Create Length Block init
    
    self.lengthLabel.text = @"Length";
    self.lengthLabel.textColor = [UIColor lightGrayColor];
    //self.lengthTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter New Password" attributes:@{NSForegroundColorAttributeName: [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0]}];
    self.lengthTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.lengthTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.lengthTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.lengthTextField.tag = LengthTextField;
    self.lengthBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    self.lengthArrow.contentMode = UIViewContentModeCenter;
    self.lengthArrow.image = [UIImage imageNamed:[NSString stringWithFormat:@"arrow_%d", (int)kScreenWidth]];
    
// Create SaveButton init
    
    self.saveButton.layer.cornerRadius = 13;
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_normal_%d", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateSelected];
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
}

#pragma mark - UITextFieldDelegate

- (IBAction)textFieldBeginEditing:(UITextField *)textField {
    
    currentTextField_ = nil;
    currentTextField_ = textField;
    currentTextField_.inputView = picker_;
    [currentArrayForPicker_ removeAllObjects];
    
    if(currentTextField_.tag == VolumeTextField) {
        currentArrayForPicker_ = [kArrayWithVolume mutableCopy];
        [picker_ reloadAllComponents];
    } else if (currentTextField_.tag == TemperatureTextField) {
        currentArrayForPicker_ = [kArrayWithTemperature mutableCopy];
        [picker_ reloadAllComponents];
    } else if (currentTextField_.tag == WeightTextField) {
        currentArrayForPicker_ = [kArrayWithWeight mutableCopy];
        [picker_ reloadAllComponents];
    } else if (currentTextField_.tag == LengthTextField) {
        currentArrayForPicker_ = [kArrayWithLength mutableCopy];
        [picker_ reloadAllComponents];
    }
}

- (IBAction)textFieldEndEditing:(UITextField *)textField {

    if(textField.text.length == 0) {
        if(currentTextField_.tag == VolumeTextField) {
            [currentTextField_ setText:[self pickerView:picker_ titleForRow:0 forComponent:0]];
        } else if (currentTextField_.tag == TemperatureTextField) {
            [currentTextField_ setText:[self pickerView:picker_ titleForRow:0 forComponent:0]];
        } else if (currentTextField_.tag == WeightTextField) {
            [currentTextField_ setText:[self pickerView:picker_ titleForRow:0 forComponent:0]];
        } else if (currentTextField_.tag == LengthTextField) {
            [currentTextField_ setText:[self pickerView:picker_ titleForRow:0 forComponent:0]];
        }
    }
}

#pragma mark - UIPickerViewDelegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [currentArrayForPicker_ count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [currentArrayForPicker_ objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    //and here you can do in two ways:
    //1
    [currentTextField_ setText:[currentArrayForPicker_ objectAtIndex:row]];
    //2
    [currentTextField_ setText:[self pickerView:picker_ titleForRow:row forComponent:component]];
}

- (IBAction)saveButtonActionHendlier:(UIButton *)sender {
    

}

@end
