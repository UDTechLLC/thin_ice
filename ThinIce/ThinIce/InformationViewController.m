//
//  InformationViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 03.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()

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
@property (weak, nonatomic) IBOutlet UITextField                        *dayOfBirthTextField;
@property (weak, nonatomic) IBOutlet UIView                             *dayOfBirthBorderLine;

@property (weak, nonatomic) IBOutlet UITextField                        *monthOfBirthTextField;
@property (weak, nonatomic) IBOutlet UIView                             *monthOfBirthBorderLine;

@property (weak, nonatomic) IBOutlet UITextField                        *yearTextField;
@property (weak, nonatomic) IBOutlet UIView                             *yearBorderLine;

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
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.backgroundForInformationFields.layer.cornerRadius = 13;
    self.backgroundForInformationFields.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    
// FirstName Block init
    self.firstNameLabel.textColor = [UIColor lightGrayColor];
    self.firstNameTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.firstNameTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.firstNameBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// LastName Block init
    self.LastNameLabel.textColor = [UIColor lightGrayColor];
    self.LastNameTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.LastNameTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.LastNameBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// ChooseSex Block init
    self.chooseSexLabel.textColor = [UIColor lightGrayColor];
    self.chooseSexTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.chooseSexTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.chooseSexBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// DateOfBirth Block init
    self.dateOfBirthLabel.textColor = [UIColor lightGrayColor];
    
    self.dayOfBirthTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.dayOfBirthTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.dayOfBirthBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.monthOfBirthTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.monthOfBirthTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.monthOfBirthBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.yearTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.yearTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.yearBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// Height Block init
    self.heightLabel.textColor = [UIColor lightGrayColor];
    self.heightTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.heightTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.heightBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// Width Block init
    self.widthLabel.textColor = [UIColor lightGrayColor];
    self.widthTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.widthTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.widthBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// Create SaveButton
    self.saveButton.layer.cornerRadius = 13;
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_normal_%d", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateSelected];
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
}

@end
