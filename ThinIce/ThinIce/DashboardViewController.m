//
//  DashboardViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#define iPhone6XCoordinateForImege              14
#define iPhone6YCoordinateForImege              88
#define iPhone6PlusXCoordinateForImege          14
#define iPhone6PlusYCoordinateForImege          93
#define SpaceBetweenTwoCells                    10

#import "DashboardViewController.h"
#import "DashboardDaysCardTableViewCell.h"

@interface DashboardViewController () <SlideNavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate> {
    // Array With Data for TableView
    NSMutableArray                                                      *cellData;
}

// Image Block
@property (weak, nonatomic) IBOutlet UIImageView                        *imageViewPhoto;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint                 *imageXCoordinate;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint                 *imageYCoordinate;

// ViewController UI
@property (weak, nonatomic) IBOutlet UILabel                            *userNameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint                 *userNameLabelYCoordinate;

// insoles Block
@property (weak, nonatomic) IBOutlet UIImageView                        *insolesPic;
@property (weak, nonatomic) IBOutlet UILabel                            *powerInsolesLabel;
@property (weak, nonatomic) IBOutlet UIView                             *powerInsolesBattaryHigherView;
@property (weak, nonatomic) IBOutlet UIView                             *powerInsolesBattaryMiddleView;
@property (weak, nonatomic) IBOutlet UIView                             *powerInsolesBattaryLowerView;
// Separators Block
@property (weak, nonatomic) IBOutlet UIView                             *insolesAndVestVerticalSeparator;
@property (weak, nonatomic) IBOutlet UIView                             *horisontalSeparator;
// Vest Block
@property (weak, nonatomic) IBOutlet UIImageView                        *vestPic;
@property (weak, nonatomic) IBOutlet UILabel                            *powerVestLabel;
@property (weak, nonatomic) IBOutlet UIView                             *powerVestBattaryHigherView;
@property (weak, nonatomic) IBOutlet UIView                             *powerVestBattaryMiddleView;
@property (weak, nonatomic) IBOutlet UIView                             *powerVestBattaryLowerView;

@end

@implementation DashboardViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addDashboardBackgroundImage];
    [self createViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [self addNavigationBarAttributeTitle: @"Dashboard"];
    self.navigationController.navigationBarHidden = NO;
    [self translucentNavigationBar: YES];
    [super viewWillAppear:YES];
}

- (void)viewDidLayoutSubviews {
    [self createProfilePhotoImageView];
    if((int)kScreenWidth == 375) {
        self.imageXCoordinate.constant = iPhone6XCoordinateForImege;
        self.imageYCoordinate.constant = iPhone6YCoordinateForImege;
    } else if((int)kScreenWidth == 414) {
        self.imageXCoordinate.constant = iPhone6PlusXCoordinateForImege;
        self.imageYCoordinate.constant = iPhone6PlusYCoordinateForImege;
    }
    [self.view setNeedsLayout];
    [super viewDidLayoutSubviews];
}

- (void)createViewController {
    
    self.userNameLabel.backgroundColor = [UIColor clearColor];
    self.userNameLabel.textColor = [[HelperManager sharedServer] colorwithHexString:@"#ccccccc" alpha:1.0];
    self.userNameLabel.text = [self createFirstAndLastName];
    
    [self createInsolesBlock];
    [self createVestBlock];
    
    // Create SeparatorsView
    self.insolesAndVestVerticalSeparator.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
    self.horisontalSeparator.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
    
    cellData = [[NSMutableArray alloc] init];

    self.dayCardTableViewBackgroundView.backgroundColor = [UIColor clearColor];
    
    self.dayCardsTableView.backgroundColor = [UIColor clearColor];
    self.dayCardsTableView.estimatedRowHeight = 370;
    self.dayCardsTableView.rowHeight = UITableViewAutomaticDimension;
    [self changeDelayButtonClickInTableView:self.dayCardsTableView];
}

- (void)createProfilePhotoImageView {
    
    CGFloat lineWidth    = 2.0;
    UIBezierPath *path   = [self roundedPolygonPathWithRect:self.imageViewPhoto.bounds
                                                  lineWidth:lineWidth
                                                      sides:6
                                               cornerRadius:15];
    
    CAShapeLayer *mask   = [CAShapeLayer layer];
    mask.path            = path.CGPath;
    mask.lineWidth       = lineWidth;
    mask.strokeColor     = [UIColor clearColor].CGColor;
    mask.fillColor       = [UIColor whiteColor].CGColor;
    self.imageViewPhoto.layer.mask = mask;
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.path          = path.CGPath;
    border.lineWidth     = lineWidth;
    border.strokeColor   = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0].CGColor;
    border.fillColor     = [UIColor clearColor].CGColor;
    [self.imageViewPhoto.layer addSublayer:border];
    self.imageViewPhoto.backgroundColor = [UIColor clearColor];
    self.imageViewPhoto.contentMode = UIViewContentModeScaleAspectFill;
    self.imageViewPhoto.image = [[HelperManager sharedServer] getImageFromURL: [AccountInfoManager sharedManager].userToken.user_photo_url];
}

- (void)createInsolesBlock {
    
    self.insolesPic.image = [UIImage imageNamed:[NSString stringWithFormat:@"insoles_%d", (int)kScreenWidth]];
    self.insolesPic.contentMode = UIViewContentModeCenter;
    
    self.powerVestLabel.backgroundColor = [UIColor clearColor];
    self.powerVestLabel.textColor = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
    self.powerVestLabel.text = @"100 %";
    
    self.powerVestBattaryHigherView.backgroundColor = [UIColor clearColor];
    [self addBorderLineFor: self.powerVestBattaryHigherView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0];
    self.powerVestBattaryMiddleView.backgroundColor = [UIColor clearColor];
    [self addBorderLineFor: self.powerVestBattaryMiddleView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0];
    self.powerVestBattaryLowerView.backgroundColor = [UIColor clearColor];
    [self addBorderLineFor: self.powerVestBattaryLowerView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0];
}

- (void)createVestBlock {
    
    self.vestPic.image = [UIImage imageNamed:[NSString stringWithFormat:@"thin_ice_vest_%d", (int)kScreenWidth]];
    self.vestPic.contentMode = UIViewContentModeCenter;
    
    self.powerInsolesLabel.backgroundColor = [UIColor clearColor];
    self.powerInsolesLabel.textColor = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
    self.powerInsolesLabel.text = @"100 %";
    
    self.powerInsolesBattaryHigherView.backgroundColor = [UIColor clearColor];
    [self addBorderLineFor: self.powerInsolesBattaryHigherView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0];
    self.powerInsolesBattaryMiddleView.backgroundColor = [UIColor clearColor];
    [self addBorderLineFor: self.powerInsolesBattaryMiddleView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0];
    self.powerInsolesBattaryLowerView.backgroundColor = [UIColor clearColor];
    [self addBorderLineFor: self.powerInsolesBattaryLowerView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0];
}

#pragma mark - UITableViewDelegate / UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1; //cellData.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4; //array count returns 10
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    [view setBackgroundColor: [UIColor clearColor]];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DashboardDaysCardTableViewCell *cell = [self.dayCardsTableView dequeueReusableCellWithIdentifier:kDashboardCellIdentifier forIndexPath:indexPath];
    [cell loadCellWithData:nil];
    cell.dashboardSelf = self;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return 0;
    }
    return SpaceBetweenTwoCells;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (void)reloadCellsInTableView {
    
    [self.dayCardsTableView reloadData];
}

- (void)flipTableViewWithAnimationsBlock:(void(^)())animBlock ComplitionBlock:(void(^)())complitionblock {
    
    [UIView transitionWithView:self.dayCardsTableView duration:0.6 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        animBlock();
    } completion:^(BOOL finished) {
        complitionblock();
    }];
}

- (NSString*)createFirstAndLastName {
    NSString *firstNameTemp;
    NSString *lastNameTemp;
    
    if([AccountInfoManager sharedManager].userToken.first_name.length > 0) {
        firstNameTemp = [AccountInfoManager sharedManager].userToken.first_name;
    } else {
        firstNameTemp = @"";
    }
    if([AccountInfoManager sharedManager].userToken.last_name.length > 0) {
        lastNameTemp  = [AccountInfoManager sharedManager].userToken.last_name;
    } else {
        lastNameTemp = @"";
    }
    return [NSString stringWithFormat:@"%@%@",firstNameTemp, lastNameTemp];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    return YES;
}

@end
