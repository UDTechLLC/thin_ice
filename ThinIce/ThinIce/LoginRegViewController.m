//
//  LoginRegViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "LoginRegViewController.h"

typedef NS_ENUM(NSUInteger, TextFields) {
    LoginTextField,
    PasswordTextField,
    ConfirmPasswordTextField
};

@interface LoginRegViewController ()

@property (weak, nonatomic) IBOutlet UIImageView            *logoPic;

@property (weak, nonatomic) IBOutlet UILabel                *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField            *emailTextFeild;
@property (weak, nonatomic) IBOutlet UIView                 *loginBorderLine;

@property (weak, nonatomic) IBOutlet UILabel                *passwordLabel;
@property (weak, nonatomic) IBOutlet UITextField            *passwordTextField;
@property (weak, nonatomic) IBOutlet UIView                 *passwordBorderLine;

@property (weak, nonatomic) IBOutlet UITextField            *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIView                 *confirmPasswordBorderLine;

@property (weak, nonatomic) IBOutlet UITextView             *descriptionTextView;

// Errors Image Block

@property (weak, nonatomic) IBOutlet UIImageView            *emailHighlightedImage;
@property (weak, nonatomic) IBOutlet UIImageView            *passHighlightedImage;
@property (weak, nonatomic) IBOutlet UIImageView            *confirmPassHighlightedImage;

@end

@implementation LoginRegViewController

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
    
    // Change Background View Color / Radius
    self.view.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    
    self.logoPic.image = [UIImage imageNamed: @"thinice_logotype"];
    
    // Create TextField Group
    self.emailTextFeild.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.emailTextFeild.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.emailTextFeild.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.emailTextFeild.tag = LoginTextField;
    self.loginBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    
    self.passwordTextField.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.passwordTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.passwordTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.passwordTextField.tag = PasswordTextField;
    self.passwordBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    self.passwordTextField.secureTextEntry = YES;
    
    self.confirmPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm Password" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0],
                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.confirmPasswordTextField.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.confirmPasswordTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.confirmPasswordTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.confirmPasswordTextField.tag = ConfirmPasswordTextField;
    self.confirmPasswordBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    self.confirmPasswordTextField.secureTextEntry = YES;
    
    self.descriptionTextView.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    
    self.regUserDict = [[NSMutableDictionary alloc] init];
    self.regUserBOOLDict = [[NSMutableDictionary alloc] init];
    
    [self.regUserBOOLDict setObject:@"0" forKey:kLoginKey];
    [self.regUserBOOLDict setObject:@"0" forKey:kPassKey];
    [self.regUserBOOLDict setObject:@"0" forKey:kConfirmPassKey];
}

#pragma UITextFieldDelegate

- (IBAction)textFieldShouldBeginEditing:(UITextField *)textField {

    if([[self.regUserBOOLDict objectForKey:kLoginKey] isEqualToString:@"0"]) {
        self.emailHighlightedImage.hidden = YES;
    }
    if([[self.regUserBOOLDict objectForKey:kPassKey] isEqualToString:@"0"]) {
        self.passHighlightedImage.hidden = YES;
    }
    if([[self.regUserBOOLDict objectForKey:kConfirmPassKey] isEqualToString:@"0"]) {
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

#pragma mark - Checkers

- (void)checkLoginInCoreData {
    
    NSPredicate *peopleFilterWithKey = [NSPredicate predicateWithFormat:@"userLogin == %@", [self.regUserDict objectForKey:kLoginKey]];
    NSFetchRequest *peopleRequest = [User MR_requestAllWithPredicate:peopleFilterWithKey];
    NSArray *filteredUser = [User MR_executeFetchRequest:peopleRequest];
    
    if(filteredUser.count > 0) {
        [self errorForTextFieldLogin:YES];
        [self.regUserBOOLDict setObject:@"0" forKey:kLoginKey];
    } else {
        [self errorForTextFieldLogin:NO];
        [self.regUserBOOLDict setObject:@"1" forKey:kLoginKey];
    }
}

- (void)checkPasswordEquals {
    
    if([[self.regUserDict objectForKey:kPassKey] isEqualToString: [self.regUserDict objectForKey:kConfirmPassKey]]) {
        
        [self.regUserBOOLDict setObject:@"1" forKey:kPassKey];
        [self.regUserBOOLDict setObject:@"1" forKey:kConfirmPassKey];
        
        [self errorForTextFieldPass:NO];
        [self errorForTextFieldConfirmPass:NO];
        [self checkLoginInCoreData];
    } else {
        
        [self.regUserBOOLDict setObject:@"0" forKey:kPassKey];
        [self.regUserBOOLDict setObject:@"0" forKey:kConfirmPassKey];
        
        [self errorForTextFieldPass:YES];
        [self errorForTextFieldConfirmPass:YES];
    }
}

#pragma mark - Errors

- (void)errorForTextFieldLogin:(BOOL)loginState {
    
    self.emailHighlightedImage.hidden = NO;
    if(loginState) {
        self.emailHighlightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"failed_%d", (int)kScreenWidth]];
    } else {
        self.emailHighlightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"success_%d", (int)kScreenWidth]];
    }
}

- (void)errorForTextFieldPass:(BOOL)passState {
    
    self.passHighlightedImage.hidden = NO;
    if(passState) {
        self.passHighlightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"failed_%d", (int)kScreenWidth]];
    } else {
        self.passHighlightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"success_%d", (int)kScreenWidth]];
    }
}

- (void)errorForTextFieldConfirmPass:(BOOL)passState {
    
    self.confirmPassHighlightedImage.hidden = NO;
    if(passState) {
        self.confirmPassHighlightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"failed_%d", (int)kScreenWidth]];
    } else {
        self.confirmPassHighlightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"success_%d", (int)kScreenWidth]];
    }
}

@end
