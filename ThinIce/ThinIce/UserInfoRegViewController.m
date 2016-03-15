//
//  UserInfoRegViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "UserInfoRegViewController.h"

typedef NS_ENUM(NSUInteger, TextFields) {
    SexTextField,
    DateOfBirthTextField,
    HeightTextField,
    WeightTextField
};

@interface UserInfoRegViewController () {
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

/*
 [textField setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
 [textField reloadInputViews];*/

- (void)createViewController {
    
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
    self.heightBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    
    self.weightTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Your Weight" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0],
                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.weightTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.weightTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.weightTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.weightTextField.tag = WeightTextField;
    self.weightBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
}

#pragma UITextFieldDelegate

- (IBAction)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if([[self.regUserBOOLDict objectForKey:kSexFieldKey] isEqualToString:@"0"]) {
        self.cooseSexTextField.attributedPlaceholder = 
    }
    if([[self.regUserBOOLDict objectForKey:kDateOfBirthKey] isEqualToString:@"0"]) {
        self.emailHighlightedImage.hidden = YES;
    }
    if([[self.regUserBOOLDict objectForKey:kWeightKey] isEqualToString:@"0"]) {
        self.passHighlightedImage.hidden = YES;
    }
    if([[self.regUserBOOLDict objectForKey:kHeightKey] isEqualToString:@"0"]) {
        self.confirmPassHighlightedImage.hidden = YES;
    }
}

- (IBAction)textFieldShouldEndEditing:(UITextField *)textField {
    
    switch (textField.tag) {
        case LoginTextField:
        {
            if(self.emailTextFeild.text.length > 0) {
                
                [self.regUserDict setObject:self.emailTextFeild.text forKey:kLoginKey];
                [self checkLoginInCoreData];
            } else {
                [self errorForTextFieldLogin:YES];
            }
        }
            break;
        case PasswordTextField:
        {
            if(self.passwordTextField.text.length > 0) {
                
                [self.regUserDict setObject:self.passwordTextField.text forKey:kPassKey];
                [self checkPasswordEquals];
            } else {
                
                [self errorForTextFieldPass:YES];
            }
        }
            break;
        case ConfirmPasswordTextField:
        {
            if(self.confirmPasswordTextField.text.length > 0) {
                
                [self.regUserDict setObject:self.confirmPasswordTextField.text forKey:kConfirmPassKey];
                [self checkPasswordEquals];
            } else {
                
                [self errorForTextFieldConfirmPass:YES];
            }
        }
            break;
        default:
            break;
    }
}

- (void)updateTextField:(UIDatePicker *)sender {
    [dateFormatter_ setDateFormat:@"MMM d, yyyy"];
    self.dateTextField.text = [dateFormatter_ stringFromDate:sender.date];
//    NSNumber * userBirth = [NSNumber numberWithInteger:[sender.date timeIntervalSince1970]];
}

@end
