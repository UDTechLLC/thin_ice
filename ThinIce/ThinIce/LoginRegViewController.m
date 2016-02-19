//
//  LoginRegViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "LoginRegViewController.h"

@interface LoginRegViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *logoPic;

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailTextFeild;
@property (weak, nonatomic) IBOutlet UIView *loginBorderLine;

@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIView *passwordBorderLine;

@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIView *confirmPasswordBorderLine;

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

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
    self.loginBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    
    self.passwordTextField.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.passwordTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.passwordBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];

    self.confirmPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm Password" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0],
                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.confirmPasswordTextField.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.confirmPasswordTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.confirmPasswordBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    
    self.descriptionTextView.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    
}

@end
