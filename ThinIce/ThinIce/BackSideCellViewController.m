//
//  BackSideCellViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 10.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "BackSideCellViewController.h"

@interface BackSideCellViewController ()

// Header View Block
@property (weak, nonatomic) IBOutlet UIView                             *headerCellView;
@property (weak, nonatomic) IBOutlet UIButton                           *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton                           *saveButton;

@end

@implementation BackSideCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createViewController];
}

- (void)createViewController {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.headerCellView.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#6568a1" alpha:1.0];
    
    [self.cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
    [self.saveButton setTitle:@"Save" forState:UIControlStateHighlighted];
}

- (IBAction)backflip:(UIButton *)sender {

    [self.cellSelf cellflipActionButton:nil];
}

@end
