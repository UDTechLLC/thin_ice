//
//  AchievementsCollectionCell.m
//  ThinIce
//
//  Created by Dima Shapovalov on 09.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "AchievementsCollectionCell.h"

#define ImageStateActive                1
#define ImageStateInActive              0

@implementation AchievementsCollectionCell

- (void)loadCellWithTitle:(NSString*)title andImageState:(NSInteger)state achievementsID:(NSUInteger)index {
    
// Configure Cell
    self.backgroundColor                = [UIColor clearColor];
    
// Configure Cell View Elements
    self.cellImageView.contentMode      = UIViewContentModeCenter;

    switch (state) {
        case ImageStateInActive:
        {
            self.cellImageView.image    = [UIImage imageNamed:[NSString stringWithFormat:@"achievements_inactive_%d", (int)kScreenWidth]];
        }
            break;
        case ImageStateActive:
        {
            self.cellImageView.image    = [UIImage imageNamed:[NSString stringWithFormat:@"achievements_active_%d", (int)kScreenWidth]];
        }
            break;
            
        default:
            break;
    }
    
    self.cellTitle.textColor            = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.cellTitle.text                 = title;
    
    
    self.achievementsID                 = index;
}

@end
