//
//  customNavigationBar.h
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomNavigationBar : UIView

@property (nonatomic, weak) IBOutlet UIButton                           *backButton;
@property (nonatomic, weak) IBOutlet UIButton                           *rightButton;
@property (nonatomic, weak) IBOutlet UILabel                            *titleLabel;

- (void)addBackButtonWithImageName:(NSString*)image highlightedImage:(NSString*)highLightedImage;
- (void)addRightBarButtonWithImageName:(NSString*)imageName;

@end
