//
//  AchievementsCollectionViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 09.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "AchievementsCollectionViewController.h"
#import "AchievementsCollectionCell.h"
#import "AchievementsInfo.h"

typedef NS_ENUM(NSUInteger, ImageState) {
    ImageStateInactive,
    ImageStateActive
};

@interface AchievementsCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView                               *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout                     *collectionViewFlowLayout;

@end

@implementation AchievementsCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [self addNavigationBarAttributeTitle: @"Achievements"];
    self.navigationController.navigationBarHidden = NO;
    [self translucentNavigationBar: YES];
    [super viewWillAppear:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [AchievementsUnlockerManager sharedManager];
    });
}

- (void)createViewController {
    
    [self addAchievementsBackgroundImage];
    
    self.collectionView.backgroundColor             = [UIColor clearColor];
    self.collectionViewFlowLayout.sectionInset      = UIEdgeInsetsMake(-STATUSplusNAVIGATIONBARINSETS, 0, 1, 0);
    
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegate UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [AccountInfoManager sharedManager].userAchievements.achievements.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AchievementsCollectionCell *cell            = nil;
    Achievement                 *achievement    = nil;
                                cell            = [collectionView dequeueReusableCellWithReuseIdentifier:kAchievementsCollectionCellIdentifier forIndexPath:indexPath];
                                achievement    = [[AccountInfoManager sharedManager].userAchievements.achievements objectAtIndex:indexPath.row];
    
    [cell loadCellWithTitle: achievement.achievementName andImageState: achievement.achievementIsEnable  achievementsID: achievement.achievementID AchievementImageName: achievement.achievementPicture];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat cellWidth       = ([UIScreen mainScreen].bounds.size.width / 3) - 2;
    CGFloat cellHeight      = ([UIScreen mainScreen].bounds.size.height / 3.5) - 2;
    
    return CGSizeMake(cellWidth, cellHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   // AchievemetsUnlockedViewController *unlockerAchive = [self.storyboard instantiateViewControllerWithIdentifier:kAchievemetsUnlockedViewControllerID];
   // [self performSegueWithIdentifier:kAchievemetsUnlockedViewControllerSegueIdentifier sender:nil];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    return YES;
}

@end
