//
//  customNavigationBar.m
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "CustomNavigationBar.h"

@implementation CustomNavigationBar

- (void)addBackButtonWithImageName:(NSString*)image highlightedImage:(NSString*)highLightedImage {
    
    self.backButton.translatesAutoresizingMaskIntoConstraints = YES;
    self.backButton.exclusiveTouch = YES;
    self.backButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [self.backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.backButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:highLightedImage] forState:UIControlStateHighlighted];
    [self.backButton setImage:[UIImage imageNamed:highLightedImage] forState:UIControlStateSelected];
    [self.backButton setImageEdgeInsets:UIEdgeInsetsMake(1.0, 6.0, 0.0, 0.0)];
}

- (void)addRightBarButtonWithImageName:(NSString*)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    [self.rightButton setTitle: @"" forState:UIControlStateNormal];
    [self.rightButton setBackgroundColor:[UIColor clearColor]];
    [self.rightButton setImage:image forState:UIControlStateNormal];
    self.rightButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [self.rightButton setTitleColor: [[HelperManager sharedServer] colorwithHexString:@"#7bc7ff" alpha:1.0] forState:UIControlStateHighlighted];
    self.rightButton.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    self.rightButton.titleLabel.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    self.rightButton.imageView.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    self.rightButton.contentMode = UIViewContentModeCenter;
    [self.rightButton sizeToFit];
}

@end
