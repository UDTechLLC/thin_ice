//
//  InformationViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 03.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollForInformationBlock;
@property (weak, nonatomic) IBOutlet UIView *backgroundForInformationFields;






@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createInformationViewController];
}

- (void)createInformationViewController {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.scrollForInformationBlock.layer.cornerRadius = 13;
    self.scrollForInformationBlock.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    
    
    
    
    
}

@end
