//
//  BaseViewController.h
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)addLoginBackgroundImage;
- (void)addStatisticsBackgroundImage;
- (void)addDashboardBackgroundImage;
- (void)addAccountInformationBackgroundImage;
- (void)addSettingsBackgroundImage;
- (void)addAchievementsBackgroundImage;
- (void)addNewAchievementBackgroundImage;
- (void)addThinIceControlBackgroundImage;

- (void)translucentNavigationBar:(BOOL)select;

- (void)roundMyView:(UIView*)view borderRadius:(CGFloat)radius borderWidth:(CGFloat)border color:(UIColor*)color;
- (UIBezierPath *)roundedPolygonPathWithRect:(CGRect)rect lineWidth:(CGFloat)lineWidth sides:(NSInteger)sides cornerRadius:(CGFloat)cornerRadius;
- (void)addBorderLineFor:(UIView*)view withColor:(UIColor*)color borderWidth:(float)width;
- (void)changeDelayButtonClickInTableView:(UITableView*)tableView;
- (void)addNavigationBarAttributeTitle:(NSString*)title;
- (void)addRightBarButtonWithTitle:(NSString*)title normalColorHexName:(NSString*)NormalColorName highlightedColor:(NSString*)hColorName selector:(SEL)selector;
- (void)addRightBarButtonWithImageName:(NSString*)imageName highlightedImageName:(NSString*)hImageName selector:(SEL)selector;

@end
