//
//  Header.h
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#ifndef Header_h
#define Header_h

// ----------------------------------------====================================================================================----------------------------------------

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// ----------------------------------------====================================================================================----------------------------------------

// Other Deffines

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define TwitterCostumerKey                                      @"QyznDuH4eeJtAliH4aAwlB7dU"
#define TwitterCostumerSecretKey                                @"0XWx6ggIL5HCHbjvkeTTzDm1bkHduN9X1VUHTcwoOfbxmVRpYb"
#define pluseOnePage                                            (1)
#define numberOfSlideMenuCells                                  (6)
#define kMainStoryBoardIdentifier                               @"Main"
#define NagivationBarTitleFontSize                              20
#define STATUSplusNAVIGATIONBARINSETS                           64
#define AchievementsCount                                       16
#define DEGREES_RADIANS(angle)                                  ((angle) / 180.0 * M_PI)

// ----------------------------------------====================================================================================----------------------------------------

// NotificationCenter

#define FlipTableViewNotification                               @"FlipTableView"

// ----------------------------------------====================================================================================----------------------------------------

// DashBoard Cell Settings =====------

#define BurntCaloriesLength                     16
#define CellAndTableCornerRadius                13

// ----------------------------------------====================================================================================----------------------------------------

// Colors

#define ColorFromSeparators                 @"#33c6cb"
#define ColorFromPlaceHolderText            @"#cccccc"
#define ColorFromInputTextYELLOW            @"#cddc39"
#define ColorFromInputTextGYMSession        @"#00e676"
#define ColorFromInputTextWaterIntake       @"#4285f4"
#define ColorFromInputTextJunkFood          @"#64ffda"
#define ColorFromHproteinMeals              @"#b2ff59"
#define ColorForStatisticsCircleStateEmpty  @"#5e35b1"
#define ColorForStatisticsCircleStateFull   @"#33c6cb"
#define ColorForStatisticsPlannedLabel      @"#9575cd"
#define ColorForHighlightedButton           @"#cccccc"
#define ColorFroAccountImageBackground      @"#396465"
#define ColorForSettingsBackgroundSlider    @"#6b8a98"

// ----------------------------------------====================================================================================----------------------------------------


// Image Name Deffines

#define kBackButtonImageNormal                                  @"btn_back_normal"
#define kBackButtonImageActive                                  @"btn_back_active"
#define SlideMenuBackgroundImage                                @"SlideMenuBackground"

// ----------------------------------------====================================================================================----------------------------------------



// Segue Identifiers

#define kDashboardSegueIdentifier                               @"DashboardSegueIdentifier"
#define kAchievemetsUnlockedViewControllerSegueIdentifier       @"AchievemetsUnlockedViewControllerSegueIdentifier"





// ----------------------------------------====================================================================================----------------------------------------






// ViewController StoryBoardID

#define kHomeViewControllerID                                   @"HomeViewControllerIdentifier"
#define kPageViewControllerID                                   @"PageViewController"
#define kDashboardViewControllerID                              @"DashboardViewControllerID"
#define kSignUpViewControllerID                                 @"SignUpViewControllerID"
#define kLoginRegViewControllerID                               @"LoginRegViewControllerID"
#define kUserInfoRegViewControllerID                            @"UserInfoRegViewControllerID"
#define kBluetoothConnectViewControllerID                       @"BluetoothConnectViewControllerID"
#define kLeftMenuViewControllerID                               @"LeftMenuViewControllerStoryboardID"
#define kDashboardFlipViewControllerID                          @"DashboardFlipViewControllerIdentifier"
#define kStatisticsViewControllerID                             @"StatisticsViewControllerIdentifier"
#define kStatisticsContentViewControllerID                      @"StatisticsContentViewControllerIdentifier"
#define kAccountInformationViewControllerID                     @"AccountInformationViewControllerIdentifier"
#define kAccountViewControllerID                                @"AccountViewControllerIdentifier"
#define kInformationViewControllerID                            @"InformationViewControllerIdentifier"
#define kSettingsViewControllerID                               @"SettingsViewControllerIdentifier"
#define kMeasurementsViewControllerID                           @"MeasurementsViewControllerIdentifier"
#define kNotificationsViewControllerID                          @"NotificationsViewControllerIdentifier"
#define kAchievementsCollectionViewControllerID                 @"AchievementsCollectionViewControllerIdentifier"
#define kAchievemetsUnlockedViewControllerID                    @"AchievemetsUnlockedViewControllerIdentifier"
#define kThinIceControlViewControllerID                         @"ThinIceControlViewControllerIdentifier"
#define kBackSideDashboardID                                    @"BackSideDashboardIdentifier"

// Cells Identifier

// ----------------------------------------====================================================================================----------------------------------------

// Slide Menu Cells ID ===----

#define kDashboardCellID                                        @"DashboardCellID"
#define kStatisticCellID                                        @"StatisticCellID"
#define kThinIceControllCellID                                  @"ThinIceControllCellID"
#define kAccountCellID                                          @"AccountCellID"
#define kAchievementsCellID                                     @"AchievementsCellID"
#define kSettingsCellID                                         @"SettingsCellID"

// DashboardCellID

#define kDashboardCellIdentifier                                @"DashboardDayCardIdentifier"

// Achievements Cell

#define kAchievementsCollectionCellIdentifier                   @"AchievementsCollectionCellIdentifier"


// ----------------------------------------====================================================================================----------------------------------------

// Slide Menu Cells Image Strings ===----

#define kIcons_thinIceControlImage                              @"icons_thinIceControl"
#define kIcons_statisticImage                                   @"icons_statistic"
#define kIcons_dashboardImage                                   @"icons_dashboard"
#define kIcons_achievementsImage                                @"icons_achievements"
#define kIcons_accountImage                                     @"icons_account"
#define kIcon_SettingsImage                                     @"icon_Settings"

#define kSlideMenuSelectedImage                                 @"SlideMenuSelectedImage"


// ----------------------------------------====================================================================================----------------------------------------


#endif /* Header_h */
