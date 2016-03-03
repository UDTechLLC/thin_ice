//
//  AccountViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 03.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()

@property (weak, nonatomic) IBOutlet UIView                     *backgoundForAutorizationBlock;
@property (weak, nonatomic) IBOutlet UILabel                    *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField                *emailTextField;
@property (weak, nonatomic) IBOutlet UIView                     *emailBorderLine;

@property (weak, nonatomic) IBOutlet UILabel                    *passwordLabel;
@property (weak, nonatomic) IBOutlet UITextField                *passwordTextField;
@property (weak, nonatomic) IBOutlet UIView                     *passwordBorderLine;

@property (weak, nonatomic) IBOutlet UITextField                *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIView                     *confirmPasswordBorderLine;

@property (weak, nonatomic) IBOutlet UIButton                   *saveButton;

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createAccountViewController];
}

- (void)createAccountViewController {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.backgoundForAutorizationBlock.layer.cornerRadius = 13;
    self.backgoundForAutorizationBlock.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    
    // Create Login Block
    
    self.emailLabel.text = @"Email";
    self.emailLabel.textColor = [UIColor lightGrayColor];
    
    self.emailTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.emailBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    // Create Password Block
    
    self.passwordLabel.text = @"Password";
    self.passwordLabel.textColor = [UIColor lightGrayColor];
    
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter New Password" attributes:@{NSForegroundColorAttributeName: [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0]}];
    self.passwordTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.passwordBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.confirmPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm New Password" attributes:@{NSForegroundColorAttributeName: [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0]}];
    self.confirmPasswordTextField.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.confirmPasswordBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    // Create SaveButton
    
    self.saveButton.layer.cornerRadius = 13;
    self.saveButton.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
    self.saveButton.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#ffffff" alpha:1.0];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
}

@end