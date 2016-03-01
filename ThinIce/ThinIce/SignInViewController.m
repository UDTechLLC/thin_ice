//
//  SignInViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "SignInViewController.h"
#import "DashboardViewController.h"

static NSString*const kLoginKey                                         = @"Login";
static NSString*const kPasswordKey                                      = @"Password";

@interface SignInViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet CustomNavigationBar                *navigationbar;

@property (weak, nonatomic) IBOutlet UIImageView                        *pic;
@property (weak, nonatomic) IBOutlet UIView                             *textfieldsBackgroundView;

@property (weak, nonatomic) IBOutlet UIImageView                        *loginPic;
@property (weak, nonatomic) IBOutlet UIView                             *loginBorderLine;
@property (weak, nonatomic) IBOutlet UITextField                        *loginTextField;

@property (weak, nonatomic) IBOutlet UIImageView                        *passPic;
@property (weak, nonatomic) IBOutlet UITextField                        *passTextField;
@property (weak, nonatomic) IBOutlet UIView                             *passBorderLine;

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
    
    [self createTextFields];
}

- (void)createTextFields {
    
    self.loginPic.image = [UIImage imageNamed: @"mail_icon"];
    self.loginBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha: 1];
    self.loginTextField.delegate = self;
    
    self.passPic.image = [UIImage imageNamed: @"pass_icon"];
    self.passBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha: 1];
    self.passTextField.delegate = self;
}

#pragma UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    textField.returnKeyType = UIReturnKeyGo;
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if([textField isKindOfClass:[self.loginTextField class]]) {

    } else if([textField isKindOfClass:[self.passTextField class]]) {
        
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:YES];
    [self performSegueWithIdentifier:kDashboardSegueIdentifier sender:nil];
    return YES;
}

@end
