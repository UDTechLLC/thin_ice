//
//  UserInfoRegViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "UserInfoRegViewController.h"

@interface UserInfoRegViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *logoPic;

@property (weak, nonatomic) IBOutlet UILabel *chooseSexLabel;
@property (weak, nonatomic) IBOutlet UITextField *cooseSexTextField;
@property (weak, nonatomic) IBOutlet UIView *cooseSexBorderLine;

@property (weak, nonatomic) IBOutlet UILabel *DateOfBirthLabel;
@property (weak, nonatomic) IBOutlet UITextField *DayTextField;
@property (weak, nonatomic) IBOutlet UIView *DayBorderLine;

@property (weak, nonatomic) IBOutlet UITextField *monthTextField;
@property (weak, nonatomic) IBOutlet UIView *monthBorderLine;

@property (weak, nonatomic) IBOutlet UITextField *yearTextField;
@property (weak, nonatomic) IBOutlet UIView *yesrBorderLine;

@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UIView *heightBorderLine;

@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UIView *weightBorderLine;

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

- (void)createViewController {
    
    // Change Background View Color / Radius
    self.view.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    
    self.logoPic.image = [UIImage imageNamed: @"thinice_logotype"];
    
    // Create TextField Group
    
    self.cooseSexTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Male" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0],
                                                                                                             NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.cooseSexTextField.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.cooseSexTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.cooseSexBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    
    self.DayTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Day" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0],
                                                                                                                        NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.DayTextField.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.DayTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.DayBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    
    self.monthTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Month" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0],
                                                                                                                        NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.monthTextField.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.monthTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.monthBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    
    self.yearTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Year" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0],
                                                                                                                        NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.yearTextField.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.yearTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.yesrBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    
    self.heightTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Your Height" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0],
                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.heightTextField.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.heightTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.heightBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
    
    self.weightTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Your Weight" attributes:@{NSForegroundColorAttributeName:[[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0],
                                                                                                                                      NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]}];
    self.weightTextField.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.weightTextField.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.weightBorderLine.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#258895" alpha:1.0];
}

@end
