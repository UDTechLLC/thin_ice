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

@interface AchievementsCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    
    NSMutableArray                                                                  *achievementsForCollectionsView;
}

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
}

- (void)createViewController {
    
    [self addAchievementsBackgroundImage];
    
    achievementsForCollectionsView = [[NSMutableArray alloc] init];
    
    achievementsForCollectionsView = [NSKeyedUnarchiver unarchiveObjectWithData: [AccountInfoManager sharedManager].userToken.userAchievements];
    
    
    self.collectionView.backgroundColor             = [UIColor clearColor];
    self.collectionViewFlowLayout.sectionInset      = UIEdgeInsetsMake(-STATUSplusNAVIGATIONBARINSETS, 0, 1, 0);
    
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegate UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return achievementsForCollectionsView.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AchievementsCollectionCell *cell            = nil;
    Achievement                 *achievement    = nil;
                                cell            = [collectionView dequeueReusableCellWithReuseIdentifier:kAchievementsCollectionCellIdentifier forIndexPath:indexPath];
                                achievement     = [achievementsForCollectionsView objectAtIndex:indexPath.row];
    
    NSLog(@"%@ %@ %@", achievement.achievementName, achievement.achievementID, achievement.achievementPicture);
    
    [cell loadCellWithTitle: achievement.achievementName andImageState: achievement.achievementIsEnable achievementsID: achievement.achievementID AchievementImageName: achievement.achievementPicture];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat cellWidth       = ([UIScreen mainScreen].bounds.size.width / 3) - 2;
    CGFloat cellHeight      = ([UIScreen mainScreen].bounds.size.height / 4) - 2;
    
    return CGSizeMake(cellWidth, cellHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if([self checkAchievementsStatusWithIndexPath: indexPath]) {
     
        [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement:[achievementsForCollectionsView objectAtIndex:indexPath.row]];
    }
}

- (BOOL)checkAchievementsStatusWithIndexPath:(NSIndexPath*)indexPath {
    
    Achievement                 *achievement    = nil;
    achievement     = [achievementsForCollectionsView objectAtIndex:indexPath.row];
    
    if(achievement.achievementIsEnable) {
        
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    return YES;
}

@end
