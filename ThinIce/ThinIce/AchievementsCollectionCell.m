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

@implementation AchievementsCollectionCell {
    NSString    *achievementImageName;
}

- (void)loadCellWithTitle:(NSString*)title andImageState:(BOOL)state achievementsID:(NSString*)ID AchievementImageName:(NSString*)imageName {
    
    self.achievementsAddStatus = state;
    
    
// Save Image Name
    achievementImageName = imageName;
    
// Configure Cell
    self.backgroundColor                = [UIColor clearColor];
    
// Configure Cell View Elements
    self.cellImageView.contentMode      = UIViewContentModeCenter;

    if(self.achievementsAddStatus) {
        
        self.cellImageView.image    = [UIImage imageNamed:[NSString stringWithFormat:@"%@%d",imageName, (int)kScreenWidth]];
    } else {
     
        self.cellImageView.image    = [UIImage imageNamed:[NSString stringWithFormat:@"achievements_active_%d", (int)kScreenWidth]];
    }

    
    self.cellTitle.textColor            = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.cellTitle.text                 = title;
    
    self.achievementsID = ID;
}

- (void)setHighlighted:(BOOL)highlighted {
    
    [super setHighlighted:highlighted];
    
    if(self.achievementsAddStatus) {
        
        if (highlighted) {
            
            [self setImageOnImage];
            self.cellTitle.textColor            = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
            
        } else {
            
            self.cellImageView.image            = [UIImage imageNamed:[NSString stringWithFormat:@"%@%d",achievementImageName, (int)kScreenWidth]];
            self.cellImageView.contentMode      = UIViewContentModeCenter;
            self.cellTitle.textColor            = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
        }
    }
}

#pragma Mark - drow text on Image

- (void)setImageOnImage {
    
    UIView *view                            = [[UIView alloc] initWithFrame:self.cellImageView.bounds];
    view.backgroundColor                    = [UIColor clearColor];
    
    UIImageView *photoImageView             = [[UIImageView alloc] initWithImage: [UIImage imageNamed:[NSString stringWithFormat:@"%@%d",achievementImageName, (int)kScreenWidth]]];
    photoImageView.frame                    = self.cellImageView.bounds;
    photoImageView.contentMode              = UIViewContentModeCenter;
    
    UIImageView *backgroundphotoImageView   = [[UIImageView alloc] initWithImage: [UIImage imageNamed:[NSString stringWithFormat:@"SelectedBackground_%d", (int)kScreenWidth]]];
    backgroundphotoImageView.frame          = self.cellImageView.bounds;
    backgroundphotoImageView.contentMode    = UIViewContentModeCenter;
    
    [view addSubview:photoImageView];
    [view addSubview:backgroundphotoImageView];
    //i.e. customize view to get what you need
    
    self.cellImageView.image                = [self imageFromView:view];
}

- (UIImage *)imageFromView:(UIView *) view {
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        
        UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [[UIScreen mainScreen] scale]);
    } else {
        
        UIGraphicsBeginImageContext(view.frame.size);
    }
    
    [view.layer renderInContext: UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
