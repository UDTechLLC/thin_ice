//
//  UserInfoRegViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "UserInfoRegViewController.h"

#define kArrayWithSexField                                  [NSArray arrayWithObjects:@"Male",@"Female", nil]

typedef NS_ENUM(NSUInteger, TextFields) {
    SexTextField,
    DateOfBirthTextField,
    HeightTextField,
    WeightTextField
};

@interface UserInfoRegViewController () <UIPickerViewDataSource, UIPickerViewDelegate> {
    
    UIPickerView                                            *picker_;
    NSMutableArray                                          *currentArrayForPicker_;
    UIDatePicker                                            *datePicker_;
    NSDateFormatter                                         *dateFormatter_;
    UITextField                                             *currentTextField_;
}

@property (weak, nonatomic) IBOutlet UIImageView            *logoPic;

@property (weak, nonatomic) IBOutlet UILabel                *chooseSexLabel;
@property (weak, nonatomic) IBOutlet UITextField            *cooseSexTextField;
@property (weak, nonatomic) IBOutlet UIView                 *cooseSexBorderLine;

@property (weak, nonatomic) IBOutlet UILabel                *dateOfBirthLabel;
@property (weak, nonatomic) IBOutlet UITextField            *dateTextField;
@property (weak, nonatomic) IBOutlet UIView                 *dateBorderLine;
@property (weak, nonatomic) IBOutlet UIImageView            *dateImageArrow;

@property (weak, nonatomic) IBOutlet UILabel                *heightLabel;
@property (weak, nonatomic) IBOutlet UITextField            *heightTextField;
@property (weak, nonatomic) IBOutlet UIView                 *heightBorderLine;

@property (weak, nonatomic) IBOutlet UILabel                *weightLabel;
@property (weak, nonatomic) IBOutlet UITextField            *weightTextField;
@property (weak, nonatomic) IBOutlet UIView                 *weightBorderLine;

@end

@implementation UserInfoRegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    [super viewWillDisappear:animated];
}

- (void)createViewController {
    
    picker_ = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    picker_.bounds = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height / 5);
    picker_.showsSelectionIndicator = YES;
    picker_.dataSource = self;
    picker_.delegate = self;
    
    currentArrayForPicker_ = [[NSMutableArray alloc] init];
    
    dateFormatter_ = [[NSDateFormatter alloc] init];
    datePicker_ = [[UIDatePicker alloc] init];
    datePicker_.datePickerMode = UIDatePickerModeDate;
    [datePicker_ addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    
    // Change Background View Color / Radius
    self.view.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    
    self.logoPic.image = [UIImage imageNamed: @"thinice_logotype"];
    
    // Create TextField Group
    
    self.cooseSexTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Choose sex" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0],
                                                                                                             NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.cooseSexTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.cooseSexTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.cooseSexTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.cooseSexTextField.inputView = picker_;
    self.cooseSexTextField.tag = SexTextField;
    self.cooseSexBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    
    self.dateTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Choose your date of birth" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0],
                                                                                                                        NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.dateTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.dateTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.dateTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.dateTextField.inputView = datePicker_;
    self.dateTextField.tag = DateOfBirthTextField;
    
    self.dateImageArrow.image = [UIImage imageNamed: [NSString stringWithFormat:@"arrow_%d", (int)kScreenWidth]];
    self.dateImageArrow.contentMode = UIViewContentModeCenter;
    self.dateBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    

    self.heightTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Your Height" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0],
                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.heightTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.heightTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.heightTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.heightTextField.tag = HeightTextField;
    [self.heightTextField setKeyboardType:UIKeyboardTypeNumberPad];
    self.heightBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    
    self.weightTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Your Weight" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0],
                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.weightTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.weightTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.weightTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.weightTextField.tag = WeightTextField;
    [self.weightTextField setKeyboardType:UIKeyboardTypeNumberPad];
    self.weightBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    
    [self.regUserBOOLDict setObject:@"0" forKey:kSexFieldKey];
    [self.regUserBOOLDict setObject:@"0" forKey:kDateOfBirthKey];
    [self.regUserBOOLDict setObject:@"0" forKey:kHeightKey];
    [self.regUserBOOLDict setObject:@"0" forKey:kWeightKey];
}

#pragma UITextFieldDelegate

- (IBAction)textFieldBeginEditing:(UITextField *)textField {
    
    currentTextField_ = nil;
    currentTextField_ = textField;
    
    if(currentTextField_.tag == SexTextField) {
        currentArrayForPicker_ = [kArrayWithSexField mutableCopy];
        [picker_ reloadAllComponents];
    } else if (currentTextField_.tag == DateOfBirthTextField) {
        
    } else if (currentTextField_.tag == HeightTextField) {
        
    } else if (currentTextField_.tag == WeightTextField) {
        
    }
}

- (IBAction)textFieldEndEditing:(UITextField *)textField {
    
    if(currentTextField_.tag == SexTextField) {
        [currentTextField_ setText:[self pickerView:picker_ titleForRow:0 forComponent:0]];
        [self definitionSexFieldsValue:currentTextField_];
        
    } else if (currentTextField_.tag == DateOfBirthTextField) {
        [self updateTextField: datePicker_];
        
    } else if (currentTextField_.tag == HeightTextField) {
        if(currentTextField_.text.length > 0) {
            [self.regUserDict setObject:currentTextField_.text forKey:kHeightKey];
            [self.regUserBOOLDict setObject:@"1" forKey:kHeightKey];
        }
    } else if (currentTextField_.tag == WeightTextField) {
        if(currentTextField_.text.length > 0) {
            [self.regUserDict setObject:currentTextField_.text forKey:kWeightKey];
            [self.regUserBOOLDict setObject:@"1" forKey:kWeightKey];
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

- (void)updateTextField:(UIDatePicker *)sender {
    [dateFormatter_ setDateFormat:@"MMM d, yyyy"];
    self.dateTextField.text = [dateFormatter_ stringFromDate:sender.date];
    [self.regUserDict setObject:sender.date forKey:kDateOfBirthKey];
    [self.regUserBOOLDict setObject:@"1" forKey:kDateOfBirthKey];
}

- (void)definitionSexFieldsValue:(UITextField*)textField {
    
    if([textField.text isEqualToString:@"Male"]) {
        [self.regUserDict setObject:@"Male" forKey:kSexFieldKey];
    } else {
        [self.regUserDict setObject:@"Female" forKey:kSexFieldKey];
    }
    [self.regUserBOOLDict setObject:@"1" forKey:kSexFieldKey];
}

@end
