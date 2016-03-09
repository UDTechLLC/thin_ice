//
//  InformationViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 03.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController () {
    UIDatePicker                                                        *datePicker_;
    NSDateFormatter                                                     *dateFormatter_;
    UITextField                                                         *currentTextField_;
}

// Containers Block
@property (weak, nonatomic) IBOutlet UIScrollView                       *scrollForInformationBlock;
@property (weak, nonatomic) IBOutlet UIView                             *backgroundForInformationFields;

// FirstName Block
@property (weak, nonatomic) IBOutlet UILabel                            *firstNameLabel;
@property (weak, nonatomic) IBOutlet UITextField                        *firstNameTextField;
@property (weak, nonatomic) IBOutlet UIView                             *firstNameBorderLine;

// LastName Block
@property (weak, nonatomic) IBOutlet UILabel                            *LastNameLabel;
@property (weak, nonatomic) IBOutlet UITextField                        *LastNameTextField;
@property (weak, nonatomic) IBOutlet UIView                             *LastNameBorderLine;

// Choose Sex
@property (weak, nonatomic) IBOutlet UILabel                            *chooseSexLabel;
@property (weak, nonatomic) IBOutlet UITextField                        *chooseSexTextField;
@property (weak, nonatomic) IBOutlet UIView                             *chooseSexBorderLine;

// DateOfBirth Block
@property (weak, nonatomic) IBOutlet UILabel                            *dateOfBirthLabel;
@property (weak, nonatomic) IBOutlet UITextField                        *dateOfBirthTextField;
@property (weak, nonatomic) IBOutlet UIView                             *dateOfBirthBorderLine;
@property (weak, nonatomic) IBOutlet UIImageView                        *dateImageArrow;

// Height Block
@property (weak, nonatomic) IBOutlet UILabel                            *heightLabel;
@property (weak, nonatomic) IBOutlet UITextField                        *heightTextField;
@property (weak, nonatomic) IBOutlet UIView                             *heightBorderLine;

// Width Block
@property (weak, nonatomic) IBOutlet UILabel                            *widthLabel;
@property (weak, nonatomic) IBOutlet UITextField                        *widthTextField;
@property (weak, nonatomic) IBOutlet UIView                             *widthBorderLine;

// Save Button

@property (weak, nonatomic) IBOutlet UIButton                           *saveButton;

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createInformationViewController];
}

- (void)viewWillLayoutSubviews {
    // add ScrollView ContentSize
    
}

- (void)createInformationViewController {
    
    dateFormatter_ = [[NSDateFormatter alloc] init];
    datePicker_ = [[UIDatePicker alloc] init];
    datePicker_.datePickerMode = UIDatePickerModeDate;
    [datePicker_ addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.backgroundForInformationFields.layer.cornerRadius = 13;
    self.backgroundForInformationFields.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    
// FirstName Block init
    self.firstNameLabel.textColor = [UIColor lightGrayColor];
    self.firstNameTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.firstNameTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.firstNameTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.firstNameBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// LastName Block init
    self.LastNameLabel.textColor = [UIColor lightGrayColor];
    self.LastNameTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.LastNameTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.LastNameTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.LastNameBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// ChooseSex Block init
    self.chooseSexLabel.textColor = [UIColor lightGrayColor];
    self.chooseSexTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.chooseSexTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.chooseSexTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.chooseSexBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// DateOfBirth Block init
    self.dateOfBirthLabel.textColor = [UIColor lightGrayColor];
    
    self.dateOfBirthTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.dateOfBirthTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.dateOfBirthTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.dateOfBirthTextField.inputView = datePicker_;
    self.dateImageArrow.image = [UIImage imageNamed: [NSString stringWithFormat:@"arrow_%d", (int)kScreenWidth]];
    self.dateImageArrow.contentMode = UIViewContentModeCenter;
    self.dateOfBirthBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// Height Block init
    self.heightLabel.textColor = [UIColor lightGrayColor];
    self.heightTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.heightTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.heightTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.heightBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// Width Block init
    self.widthLabel.textColor = [UIColor lightGrayColor];
    self.widthTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.widthTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.widthTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.widthBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// Create SaveButton
    self.saveButton.layer.cornerRadius = 13;
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_normal_%d", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateSelected];
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
}

#pragma mark - UITextFieldDelegate

- (IBAction)editingEnd:(id)sender {
    if ([sender isEqual: self.dateOfBirthTextField]) {
        [self updateTextField: datePicker_];
    }
}

- (void)updateTextField:(UIDatePicker *)sender {
    [dateFormatter_ setDateFormat:@"MMM d, yyyy"];
    self.dateOfBirthTextField.text = [dateFormatter_ stringFromDate:sender.date];
    //    NSNumber * userBirth = [NSNumber numberWithInteger:[sender.date timeIntervalSince1970]];
}

@end
