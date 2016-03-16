//
//  AccountViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 03.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "AccountViewController.h"
#import "DashboardViewController.h"

typedef NS_ENUM(NSUInteger, TextFields) {
    LoginTextField,
    PasswordTextField,
    ConfirmPasswordTextField
};

@interface AccountViewController () {
    UITextField                                                 *currentTextField_;
    NSMutableDictionary                                         *userParams;
    NSMutableDictionary                                         *regUserBOOLDict;
}

//Email Block
@property (weak, nonatomic) IBOutlet UIView                     *backgoundForAutorizationBlock;
@property (weak, nonatomic) IBOutlet UILabel                    *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField                *emailTextField;
@property (weak, nonatomic) IBOutlet UIImageView                *loginHighlightedImage;
@property (weak, nonatomic) IBOutlet UIView                     *emailBorderLine;

// Password Block
@property (weak, nonatomic) IBOutlet UILabel                    *passwordLabel;
@property (weak, nonatomic) IBOutlet UITextField                *passwordTextField;
@property (weak, nonatomic) IBOutlet UIImageView                *passwordHighlightedImage;
@property (weak, nonatomic) IBOutlet UIView                     *passwordBorderLine;

// Confirm Pass Block
@property (weak, nonatomic) IBOutlet UITextField                *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIImageView                *confirmPasswordHighlightedImage;
@property (weak, nonatomic) IBOutlet UIView                     *confirmPasswordBorderLine;

// Save Button Block
@property (weak, nonatomic) IBOutlet UIButton                   *saveButton;

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createAccountViewController];
}

- (void)viewWillLayoutSubviews {
    NSLog(@"%@", NSStringFromCGRect(self.saveButton.frame));
}

- (void)createAccountViewController {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    userParams = [[NSMutableDictionary alloc] init];
    regUserBOOLDict = [[NSMutableDictionary alloc] init];
    
    self.backgoundForAutorizationBlock.layer.cornerRadius = 13;
    self.backgoundForAutorizationBlock.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    
    // Create Login Block
    
    self.emailLabel.text = @"Email";
    self.emailLabel.textColor = [UIColor lightGrayColor];
    self.emailTextField.text = [self setLogintInTextViewWithTag:LoginTextField];
    self.emailTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.emailTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.emailTextField.tag = LoginTextField;
    self.emailTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.emailBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    // Create Password Block
    
    self.passwordLabel.text = @"Password";
    self.passwordLabel.textColor = [UIColor lightGrayColor];
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter New Password" attributes:@{NSForegroundColorAttributeName: [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0]}];
    self.passwordTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.passwordTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.passwordTextField.tag = PasswordTextField;
    self.passwordTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.passwordBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.confirmPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm New Password" attributes:@{NSForegroundColorAttributeName: [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0]}];
    self.confirmPasswordTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.confirmPasswordTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.confirmPasswordTextField.tag = ConfirmPasswordTextField;
    self.confirmPasswordTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.confirmPasswordBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    // Create SaveButton
    
    self.saveButton.layer.cornerRadius = 13;
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_normal_%d", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateSelected];
    [self.saveButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    
    self.loginHighlightedImage.hidden = YES;
    self.passwordHighlightedImage.hidden = YES;
    self.confirmPasswordHighlightedImage.hidden = YES;
    
    [regUserBOOLDict setObject:@"0" forKey:kLoginKey];
    [regUserBOOLDict setObject:@"0" forKey:kPassKey];
    [regUserBOOLDict setObject:@"0" forKey:kConfirmPassKey];
}

- (NSString*)setLogintInTextViewWithTag:(TextFields)tag {
    
    NSString *loginField;
    if([self checkVariable:[AccountInfoManager sharedManager].userToken.userLogin]) {
        loginField = [NSString stringWithFormat:@"%@", [AccountInfoManager sharedManager].userToken.userLogin];
    } else {
        loginField = @"";
    }
    
    return loginField;
}

- (BOOL)checkVariable:(NSString*)string {
    
    BOOL state = YES;
    
    if(string.length == 0) {
        state = NO;
    }
    if([string isEqualToString:@"(null)"]) {
        state = NO;
    }
    if(string == nil) {
        state = NO;
    }
    
    return state;
}

#pragma UITextFieldDelegate

- (IBAction)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if([[regUserBOOLDict objectForKey:kLoginKey] isEqualToString:@"0"]) {
        self.loginHighlightedImage.hidden = YES;
    }
    if([[regUserBOOLDict objectForKey:kPassKey] isEqualToString:@"0"]) {
        self.passwordHighlightedImage.hidden = YES;
    }
    if([[regUserBOOLDict objectForKey:kConfirmPassKey] isEqualToString:@"0"]) {
        self.confirmPasswordHighlightedImage.hidden = YES;
    }
}

- (IBAction)textFieldShouldEndEditing:(UITextField *)textField {
    
    switch (textField.tag) {
        case LoginTextField:
        {
            if(self.emailTextField.text.length > 0) {
                
                [userParams setObject:self.emailTextField.text forKey:kLoginKey];
                [self checkLoginInCoreData];
            } else {
                [self errorForTextFieldLogin:YES];
            }
        }
            break;
        case PasswordTextField:
        {
            if(self.passwordTextField.text.length > 0) {
                
                [userParams setObject:self.passwordTextField.text forKey:kPassKey];
                [self checkPasswordEquals];
            } else {
                
                [self errorForTextFieldPass:YES];
            }
        }
            break;
        case ConfirmPasswordTextField:
        {
            if(self.confirmPasswordTextField.text.length > 0) {
                
                [userParams setObject:self.confirmPasswordTextField.text forKey:kConfirmPassKey];
                [self checkPasswordEquals];
            }
        }
            break;
        default:
            break;
    }
}

- (IBAction)saveButtonHendlier:(UIButton *)sender {
    
    [self createUserParamsDictionary];
    [self saveRegInformation];
}

- (void)saveRegInformation {
    if([[regUserBOOLDict objectForKey:kLoginKey] isEqualToString:@"1"] && [[regUserBOOLDict objectForKey:kPassKey] isEqualToString:@"1"] && [[regUserBOOLDict objectForKey:kConfirmPassKey] isEqualToString:@"1"]) {
        
        [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {

            User *curUser  = [User MR_findFirstByAttribute:[self setUserPredicatFormat] withValue:[self setUserLoginField] inContext:localContext];
            curUser.userLogin = [userParams objectForKey:kLoginKey];
            curUser.userPass = [userParams objectForKey:kPassKey];
            NSLog(@"userlogin - %@", curUser.userLogin);
            NSLog(@"userPass - %@", curUser.userPass);
        }];

        DashboardViewController *dashboard = [[UIStoryboard storyboardWithName:kMainStoryBoardIdentifier bundle:nil] instantiateViewControllerWithIdentifier:kDashboardViewControllerID];
        [[SlideNavigationController sharedInstance] setViewControllers:@[dashboard] animated:YES];
    } else {
        
        [self checkLoginInCoreData];
        if([[regUserBOOLDict objectForKey:kLoginKey] isEqualToString:@"0"]) {
            [self errorForTextFieldLogin:YES];
        }
        if([[regUserBOOLDict objectForKey:kPassKey] isEqualToString:@"0"]) {
            [self errorForTextFieldPass:YES];
        }
        if([[regUserBOOLDict objectForKey:kConfirmPassKey] isEqualToString:@"0"]) {
            [self errorForTextFieldConfirmPass:YES];
        }
    }
}

- (void)checkLoginInCoreData {
    
    NSPredicate *peopleFilterWithKey = [NSPredicate predicateWithFormat:@"userLogin == %@", [userParams objectForKey:kLoginKey]];
    NSFetchRequest *peopleRequest = [User MR_requestAllWithPredicate:peopleFilterWithKey];
    NSArray *filteredUser = [User MR_executeFetchRequest:peopleRequest];
    
    if(filteredUser.count > 0) {
        
        User *findUser = [filteredUser lastObject];
        if([[AccountInfoManager sharedManager].userToken.userLogin isEqualToString:findUser.userLogin]) {
            [self errorForTextFieldLogin:NO];
            [regUserBOOLDict setObject:@"1" forKey:kLoginKey];
        } else {
            [self errorForTextFieldLogin:YES];
            [regUserBOOLDict setObject:@"0" forKey:kLoginKey];
        }
    } else {
        [self errorForTextFieldLogin:NO];
        [regUserBOOLDict setObject:@"1" forKey:kLoginKey];
    }
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

- (void)checkPasswordEquals {
    
    if([[userParams objectForKey:kPassKey] isEqualToString: [userParams objectForKey:kConfirmPassKey]]) {
        
        [regUserBOOLDict setObject:@"1" forKey:kPassKey];
        [regUserBOOLDict setObject:@"1" forKey:kConfirmPassKey];
        
        [self errorForTextFieldPass:NO];
        [self errorForTextFieldConfirmPass:NO];
        [self checkLoginInCoreData];
    } else {
        
        [regUserBOOLDict setObject:@"0" forKey:kPassKey];
        [regUserBOOLDict setObject:@"0" forKey:kConfirmPassKey];
        
        [self errorForTextFieldPass:YES];
        [self errorForTextFieldConfirmPass:YES];
    }
}

#pragma mark - Errors

- (void)errorForTextFieldLogin:(BOOL)loginState {
    
    self.loginHighlightedImage.hidden = NO;
    if(loginState) {
        self.loginHighlightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"failed_%d", (int)kScreenWidth]];
    } else {
        self.loginHighlightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"success_%d", (int)kScreenWidth]];
    }
}

- (void)errorForTextFieldPass:(BOOL)passState {
    
    self.passwordHighlightedImage.hidden = NO;
    if(passState) {
        self.passwordHighlightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"failed_%d", (int)kScreenWidth]];
    } else {
        self.passwordHighlightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"success_%d", (int)kScreenWidth]];
    }
}

- (void)errorForTextFieldConfirmPass:(BOOL)passState {
    
    self.confirmPasswordHighlightedImage.hidden = NO;
    if(passState) {
        self.confirmPasswordHighlightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"failed_%d", (int)kScreenWidth]];
    } else {
        self.confirmPasswordHighlightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"success_%d", (int)kScreenWidth]];
    }
}

- (void)createUserParamsDictionary {
    
    if(self.emailTextField.text.length > 0) {
        [userParams setObject:self.emailTextField.text forKey:kLoginKey];
    }
    if(self.passwordTextField.text.length > 0) {
        [userParams setObject:self.passwordTextField.text forKey:kPassKey];
    }
    if(self.confirmPasswordTextField.text.length > 0) {
        [userParams setObject:self.confirmPasswordTextField.text forKey:kConfirmPassKey];
    }
}


@end