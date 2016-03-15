//
//  SignInViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "SignInViewController.h"
#import "DashboardViewController.h"

@interface SignInViewController () <UITextFieldDelegate> {
    NSMutableDictionary                                                 *dictLoginPass;
}

@property (weak, nonatomic) IBOutlet CustomNavigationBar                *navigationbar;

@property (weak, nonatomic) IBOutlet UIImageView                        *pic;
@property (weak, nonatomic) IBOutlet UIView                             *textfieldsBackgroundView;

@property (weak, nonatomic) IBOutlet UIImageView                        *loginPic;
@property (weak, nonatomic) IBOutlet UIView                             *loginBorderLine;
@property (weak, nonatomic) IBOutlet UITextField                        *loginTextField;

@property (weak, nonatomic) IBOutlet UIImageView                        *passPic;
@property (weak, nonatomic) IBOutlet UITextField                        *passTextField;
@property (weak, nonatomic) IBOutlet UIView                             *passBorderLine;

// Errors Image

@property (weak, nonatomic) IBOutlet UIImageView                        *loginHighLightedImage;
@property (weak, nonatomic) IBOutlet UIImageView                        *passHighlightedImage;


@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addLoginBackgroundImage];
    [self createViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [self createCustomNavBar];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    // Focused UItextField
    [self.loginTextField becomeFirstResponder];
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)createCustomNavBar {
    [self.navigationbar addBackButtonWithImageName:kBackButtonImageNormal highlightedImage:kBackButtonImageActive];
    [self.navigationbar setTintColor: [UIColor clearColor]];
    self.navigationbar.backgroundColor = [UIColor clearColor];
}

- (void)createViewController {
    
    self.pic.image = [UIImage imageNamed: @"thinice_logotype"];
    
    self.textfieldsBackgroundView.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    self.textfieldsBackgroundView.layer.cornerRadius = 13;
    
    self.loginHighLightedImage.hidden = YES;
    self.passHighlightedImage.hidden = YES;
    
    [self createTextFields];
}

- (void)createTextFields {
    
    self.loginPic.image = [UIImage imageNamed: @"mail_icon"];
    self.loginBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha: 1];
    self.loginTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.loginTextField.delegate = self;
    
    self.passPic.image = [UIImage imageNamed: @"pass_icon"];
    self.passBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha: 1];
    self.passTextField.keyboardAppearance = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.passTextField.secureTextEntry = YES;
    self.passTextField.delegate = self;
    
    dictLoginPass = [[NSMutableDictionary alloc] init];
}

#pragma UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.loginHighLightedImage.hidden = YES;
    self.passHighlightedImage.hidden = YES;
    textField.returnKeyType = UIReturnKeyGo;
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    if([textField isKindOfClass:[self.loginTextField class]]) {
        
        if(self.loginTextField.text.length > 0) {
            [self errorForTextFieldLogin:NO];
            [dictLoginPass setValue:self.loginTextField.text forKey:kLoginKey];
        } else {
            [self errorForTextFieldLogin:YES];
        }
        
    } else if([textField isKindOfClass:[self.passTextField class]]) {
        
        if(self.loginTextField.text.length > 0) {
            [self errorForTextFieldPass:NO];
            [dictLoginPass setValue:self.passTextField.text forKey:kPassKey];
        } else {
            [self errorForTextFieldPass:YES];
        }
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:YES];
    
    __weak typeof(self) weakself = self;
    NSString *login = [NSString stringWithFormat:@"%@", [dictLoginPass objectForKey:kLoginKey]];
    NSString *pass = [NSString stringWithFormat:@"%@", [dictLoginPass objectForKey:kPassKey]];
    
    if(![login isEqualToString:@"(null)"] || ![pass isEqualToString:@"(null)"]) {
        if(login.length > 0 && pass.length > 0) {
            [[AccountInfoManager sharedManager] autorizationWithLoginAndPass: [dictLoginPass objectForKey:kLoginKey] pass:[dictLoginPass objectForKey:kPassKey] Block:^(BOOL isUserEnable) {
                if(isUserEnable) {
                    [weakself performSegueWithIdentifier:kDashboardSegueIdentifier sender:nil];
                } else {
                    [weakself errorForTextFieldLogin:YES];
                    [weakself errorForTextFieldPass:YES];
                }
            }];
        } else {
            [self errorForTextFieldLogin:YES];
            [self errorForTextFieldPass:YES];
        }
    } else {
        [self errorForTextFieldLogin:YES];
        [self errorForTextFieldPass:YES];
    }

    return YES;
}

- (void)errorForTextFieldLogin:(BOOL)loginState {
    
    self.loginHighLightedImage.hidden = NO;
    if(loginState) {
        self.loginHighLightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"failed_%d", (int)kScreenWidth]];
    } else {
        self.loginHighLightedImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"success_%d", (int)kScreenWidth]];
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

@end
