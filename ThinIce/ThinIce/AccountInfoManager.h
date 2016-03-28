//
//  ServerManager.h
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "SavedUser.h"
#import "AchievementsInfo.h"
#import "DayCardsCreator.h"

#define kNotificationDeleyKey               @"NotificationDelayKey"
#define kNotificationStateKey               @"NotificationStateKey"

typedef NS_ENUM(NSUInteger, NotificationsDelay) {
    OneHourNotification,
    TwoHourNotification,
    ThreeHourNotification,
    FourHourNotification
};

typedef NS_ENUM(NSUInteger, NotificationsState) {
    NotificationOFF,
    NotificationON
};

typedef NS_ENUM(NSUInteger, TimerDelay) {
    ThirtyMenutes,
    OneHour
};

typedef NS_ENUM(NSUInteger, DeviceTimerState) {
    TimerOFF,
    TimerON
};

@interface AccountInfoManager : NSObject

@property (readonly, nonatomic) SavedUser                       *userSavedInHomeDirectory;
@property (readonly, nonatomic) User                            *userToken;
@property (readonly, nonatomic) AchievementsInfo                *userAchievements;
@property (readonly, nonatomic) DayCardsCreator                 *userDaysCard;                          // inside NSArray Current Card
@property (readonly, nonatomic) NSTimer                         *timer;

// Notifications ViewController propertys

@property (nonatomic) NotificationsState                        isNotificationON;
@property (nonatomic) NotificationsDelay                        notificationDelay;

// Timer / Temperature ViewController propertys

@property (nonatomic) DeviceTimerState                          deviceONOFFTimer;
@property (nonatomic) NSInteger                                 currentDeviceTemperature;
@property (nonatomic) TimerDelay                                timerDelay;

+ (AccountInfoManager *)sharedManager;

- (void)autorizationWithLoginAndPass:(NSString*)login pass:(NSString*)pass Block:(void(^)(BOOL isUserEnable))block;
- (void)autorizationWithFaceBookAndTwitter:(NSString*)key firstName:(NSString*)userFirstName lastName:(NSString*)userLastName image:(UIImage*)profileImage Block:(void(^)(BOOL isUserEnable))block;
- (void)loadUserObjectWithBlock:(void(^)())block;
- (void)logout;
- (User*)findUserInDataBase;
- (void)registrationNewUserWithParams:(NSDictionary*)userParams Block:(void(^)())block;


- (void)startDeviceWorkingTimer;
- (void)stopDeviceWorkingTimer;

@end
