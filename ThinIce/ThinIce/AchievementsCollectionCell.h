//
//  AchievementsCollectionCell.h
//  ThinIce
//
//  Created by Dima Shapovalov on 09.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AchievementsCollectionCell : UICollectionViewCell

@property (nonatomic) NSUInteger                            achievementsID;
@property (weak, nonatomic) IBOutlet UIImageView            *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel                *cellTitle;

- (void)loadCellWithTitle:(NSString*)title andImageState:(NSInteger)state achievementsID:(NSUInteger)index;

@end
