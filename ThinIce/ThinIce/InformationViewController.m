//
//  InformationViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 03.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "InformationViewController.h"
#import "DashboardViewController.h"

#define kArrayWithSexField                                  [NSArray arrayWithObjects:@"Male",@"Female", nil]

typedef NS_ENUM(NSUInteger, TextFields) {
    FirstNameTextField,
    LastNameTextField,
    SexTextField,
    DateOfBirthTextField,
    HeightTextField,
    WeightTextField
};

@interface InformationViewController () <UIPickerViewDataSource, UIPickerViewDelegate> {
    
    UIPickerView                                            *picker_;
    NSMutableArray                                          *currentArrayForPicker_;
    UIDatePicker                                            *datePicker_;
    NSDateFormatter                                         *dateFormatter_;
    UITextField                                             *currentTextField_;
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
@property (weak, nonatomic) IBOutlet UIImageView                        *sexImageArrow;

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

- (void)createInformationViewController {
    
    self.regUserDict                                        = [[NSMutableDictionary alloc] init];
    self.regUserBOOLDict                                    = [[NSMutableDictionary alloc] init];
    
    picker_                                                 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    picker_.bounds = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height / 5);
    picker_.showsSelectionIndicator                         = YES;
    picker_.dataSource                                      = self;
    picker_.delegate                                        = self;
    
    dateFormatter_                                          = [[NSDateFormatter alloc] init];
    datePicker_                                             = [[UIDatePicker alloc] init];
    datePicker_.datePickerMode                              = UIDatePickerModeDate;
    [datePicker_ addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    
    self.view.backgroundColor                               = [UIColor clearColor];
    
    self.backgroundForInformationFields.layer.cornerRadius  = 13;
    self.backgroundForInformationFields.backgroundColor     = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    
// FirstName Block init
    self.firstNameLabel.textColor                           = [UIColor lightGrayColor];
    self.firstNameTextField.text                            = [self setTextInTextViewWithTag:FirstNameTextField];
    self.firstNameTextField.textColor                       = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.firstNameTextField.tintColor                       = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.firstNameTextField.keyboardAppearance              = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.firstNameTextField.tag                             = FirstNameTextField;
    self.firstNameBorderLine.backgroundColor                = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// LastName Block init
    self.LastNameLabel.textColor                            = [UIColor lightGrayColor];
    self.LastNameTextField.text                             = [self setTextInTextViewWithTag:LastNameTextField];
    self.LastNameTextField.textColor                        = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.LastNameTextField.tintColor                        = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.LastNameTextField.keyboardAppearance               = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.LastNameTextField.tag                              = LastNameTextField;
    self.LastNameBorderLine.backgroundColor                 = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// ChooseSex Block init
    self.chooseSexLabel.textColor                           = [UIColor lightGrayColor];
    self.chooseSexTextField.text                            = [self setTextInTextViewWithTag:SexTextField];
    self.chooseSexTextField.textColor                       = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.chooseSexTextField.tintColor                       = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.chooseSexTextField.keyboardAppearance              = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.chooseSexTextField.inputView                       = picker_;
    self.chooseSexTextField.tag                             = SexTextField;
    self.sexImageArrow.image                                = [UIImage imageNamed: [NSString stringWithFormat:@"arrow_%d", (int)kScreenWidth]];
    self.sexImageArrow.contentMode                          = UIViewContentModeCenter;
    self.chooseSexBorderLine.backgroundColor                = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// DateOfBirth Block init
    self.dateOfBirthLabel.textColor                         = [UIColor lightGrayColor];
    self.dateOfBirthTextField.text                          = [self setTextInTextViewWithTag:DateOfBirthTextField];
    self.dateOfBirthTextField.textColor                     = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.dateOfBirthTextField.tintColor                     = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.dateOfBirthTextField.keyboardAppearance            = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.dateOfBirthTextField.inputView                     = datePicker_;
    self.dateOfBirthTextField.tag                           = DateOfBirthTextField;
    self.dateImageArrow.image                               = [UIImage imageNamed: [NSString stringWithFormat:@"arrow_%d", (int)kScreenWidth]];
    self.dateImageArrow.contentMode                         = UIViewContentModeCenter;
    self.dateOfBirthBorderLine.backgroundColor              = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// Height Block init
    self.heightLabel.textColor                              = [UIColor lightGrayColor];
    self.heightTextField.text                               = [self setTextInTextViewWithTag:HeightTextField];
    self.heightTextField.textColor                          = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.heightTextField.tintColor                          = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.heightTextField.keyboardAppearance                 = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.heightTextField.tag                                = HeightTextField;
    [self.heightTextField setKeyboardType:UIKeyboardTypeNumberPad];
    self.heightBorderLine.backgroundColor                   = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// Width Block init
    self.widthLabel.textColor                               = [UIColor lightGrayColor];
    self.widthTextField.text                                = [self setTextInTextViewWithTag:WeightTextField];
    self.widthTextField.textColor                           = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.widthTextField.tintColor                           = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.widthTextField.keyboardAppearance                  = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.widthTextField.tag                                 = WeightTextField;
    [self.widthTextField setKeyboardType:UIKeyboardTypeNumberPad];
    self.widthBorderLine.backgroundColor                    = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
// Create SaveButton
    self.saveButton.layer.cornerRadius = 13;
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_normal_%d", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateSelected];
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    
    [self.regUserBOOLDict setObject:@"0" forKey:kFirstNameKey];
    [self.regUserBOOLDict setObject:@"0" forKey:kLastNameKey];
    [self.regUserBOOLDict setObject:@"0" forKey:kSexFieldKey];
    [self.regUserBOOLDict setObject:@"0" forKey:kDateOfBirthKey];
    [self.regUserBOOLDict setObject:@"0" forKey:kHeightKey];
    [self.regUserBOOLDict setObject:@"0" forKey:kWeightKey];
}

- (NSString*)setTextInTextViewWithTag:(TextFields)tag {
    
    switch (tag) {
        case FirstNameTextField:
        {
            if([self checkVariable:[AccountInfoManager sharedManager].userToken.first_name]) {
                return [NSString stringWithFormat:@"%@", [AccountInfoManager sharedManager].userToken.first_name];
            } else {
                return @"";
            }
        }
            break;
        case LastNameTextField:
        {
            if([self checkVariable:[AccountInfoManager sharedManager].userToken.last_name]) {
                return [NSString stringWithFormat:@"%@", [AccountInfoManager sharedManager].userToken.last_name];
            } else {
                return @"";
            }
        }
            break;
        case SexTextField:
        {
            if([self checkVariable:[AccountInfoManager sharedManager].userToken.user_sex]) {
                [self updateSexField:[AccountInfoManager sharedManager].userToken.user_sex];
                return @"";
            } else {
                return @"";
            }
        }
            break;
        case DateOfBirthTextField:
        {
            return [self setDateTextInDateTextField: [AccountInfoManager sharedManager].userToken.birthday];
        }
            break;
        case HeightTextField:
        {
            if([self checkVariable:[[AccountInfoManager sharedManager].userToken.user_height stringValue]]) {
                return [NSString stringWithFormat:@"%@", [AccountInfoManager sharedManager].userToken.user_height];
            } else {
                return @"";
            }
        }
            break;
        case WeightTextField:
        {
            if([self checkVariable:[[AccountInfoManager sharedManager].userToken.user_weight stringValue]]) {
                return [NSString stringWithFormat:@"%@", [AccountInfoManager sharedManager].userToken.user_weight];
            } else {
                return @"";
            }
        }
            break;
            
        default:
            break;
    }
    return @"";
}

- (void)updateSexField:(NSString*)sexChoose {
    
    if([sexChoose isEqualToString:@"1"]) {
        
        [currentTextField_ setText:[self pickerView:picker_ titleForRow:1 forComponent:0]];
        [self definitionSexFieldsValue:currentTextField_];
    } else {
        
        [currentTextField_ setText:[self pickerView:picker_ titleForRow:0 forComponent:0]];
        [self definitionSexFieldsValue:currentTextField_];
    }
}

#pragma UITextFieldDelegate

- (IBAction)textFieldBeginEditing:(UITextField *)textField {
    
    currentTextField_ = nil;
    currentTextField_ = textField;
    
    if(currentTextField_.tag == FirstNameTextField) {

    } else if (currentTextField_.tag == LastNameTextField) {
        
    } else if (currentTextField_.tag == SexTextField) {
        
        currentArrayForPicker_ = [kArrayWithSexField mutableCopy];
        [picker_ reloadAllComponents];
    } else if (currentTextField_.tag == DateOfBirthTextField) {
        
    } else if (currentTextField_.tag == HeightTextField) {
        
    } else if (currentTextField_.tag == WeightTextField) {
        
    }
}

- (IBAction)textFieldEndEditing:(UITextField *)textField {
    
    if(currentTextField_.tag == FirstNameTextField) {
        
        if(currentTextField_.text.length > 0) {
            
            [self.regUserDict setObject:currentTextField_.text forKey:kFirstNameKey];
            [self.regUserBOOLDict setObject:@"1" forKey:kFirstNameKey];
        }
    } else if (currentTextField_.tag == LastNameTextField) {
        
        if(currentTextField_.text.length > 0) {
            
            [self.regUserDict setObject:currentTextField_.text forKey:kLastNameKey];
            [self.regUserBOOLDict setObject:@"1" forKey:kLastNameKey];
        }
        
    } else if (currentTextField_.tag == SexTextField) {
        
        if(currentTextField_.text.length == 0) {
            
            [currentTextField_ setText:[self pickerView:picker_ titleForRow:0 forComponent:0]];
            [self definitionSexFieldsValue:currentTextField_];
        }
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

- (NSString*)setDateTextInDateTextField:(NSDate *)sender {
    
    [dateFormatter_ setDateFormat:@"MMM d, yyyy"];
    return [dateFormatter_ stringFromDate:sender];
}

- (void)updateTextField:(UIDatePicker *)sender {
    
    [dateFormatter_ setDateFormat:@"MMM d, yyyy"];
    self.dateOfBirthTextField.text = [dateFormatter_ stringFromDate:sender.date];
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

- (BOOL)checkVariable:(NSString*)string {
    
    BOOL state  = YES;
    
    if(string.length == 0) {
        state   = NO;
    }
    if([string isEqualToString:@"(null)"]) {
        state   = NO;
    }
    if(string == nil) {
        state   = NO;
    }
    
    return state;
}

#pragma mark - saveButtonActions

- (IBAction)saveButtonActionHendlier:(UIButton *)sender {
    
    [self saveRegInformation];
}

- (void)saveRegInformation {

    __weak typeof(self) weakself = self;
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
            
        User *curUser  = [User MR_findFirstByAttribute:[self setUserPredicatFormat] withValue:[self setUserLoginField] inContext:localContext];
        curUser.first_name  = [weakself.regUserDict objectForKey:kFirstNameKey];
        curUser.last_name   = [weakself.regUserDict objectForKey:kLastNameKey];
        curUser.user_sex    = [weakself.regUserDict objectForKey:kSexFieldKey];
        curUser.birthday    = [weakself.regUserDict objectForKey:kDateOfBirthKey];
        curUser.user_height = [weakself.regUserDict objectForKey:kHeightKey];
        curUser.user_weight = [weakself.regUserDict objectForKey:kWeightKey];
    }];
        
    DashboardViewController *dashboard = [[UIStoryboard storyboardWithName:kMainStoryBoardIdentifier bundle:nil] instantiateViewControllerWithIdentifier:kDashboardViewControllerID];
    [[SlideNavigationController sharedInstance] setViewControllers:@[dashboard] animated:YES];
}

- (NSString*)setUserLoginField {
    
    if([self checkVariable:[AccountInfoManager sharedManager].userToken.userLogin]) {
        return [AccountInfoManager sharedManager].userToken.userLogin;
    } else if([self checkVariable:[AccountInfoManager sharedManager].userToken.socialityKey]) {
        return [AccountInfoManager sharedManager].userToken.socialityKey;
    } else {
        return @"";
    }
}

- (NSString*)setUserPredicatFormat {
    
    if([self checkVariable:[AccountInfoManager sharedManager].userToken.userLogin]) {
        return kLoginEmailKey;
    } else if([self checkVariable:[AccountInfoManager sharedManager].userToken.socialityKey]) {
        return kSocialityKey;
    } else {
        return @"";
    }
}

@end
