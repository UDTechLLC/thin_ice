//
//  AchievementsCollectionCell.h
//  ThinIce
//
//  Created by Dima Shapovalov on 09.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AchievementsCollectionCell : UICollectionViewCell

@property (weak, nonatomic) NSString                        *achievementsID;
@property (weak, nonatomic) IBOutlet UIImageView            *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel                *cellTitle;
@property (nonatomic) BOOL                                  achievementsAddStatus;

- (void)loadCellWithTitle:(NSString*)title andImageState:(BOOL)state achievementsID:(NSString*)ID AchievementImageName:(NSString*)imageName;

@end
