//
//  ServerManager.m
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "AccountInfoManager.h"

@interface AccountInfoManager ()

@property (nonatomic, strong, readwrite) SavedUser                  *userSavedInHomeDirectory;
@property (nonatomic, strong, readwrite) User                       *userToken;
@property (nonatomic, strong, readwrite) AchievementsInfo           *userAchievements;
@property (nonatomic, strong, readwrite) DayCardsCreator            *userDaysCard;

@end

@implementation AccountInfoManager

+ (AccountInfoManager *)sharedManager {
    
    static AccountInfoManager *instanceHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instanceHelper = [[self alloc] init];
    });
    
    return instanceHelper;
}

- (id)init {
    
    self = [super init];
    if (self) {
        
        self.userDaysCard = [[DayCardsCreator alloc] init];
        [self p_getTimerTemperatureDeviceDelay];
        [self p_getSettings];
        [self p_getToken];
        
        [self addObserver:self forKeyPath:@"deviceONOFFTimer" options:NSKeyValueObservingOptionNew context:NULL];
        [self addObserver:self forKeyPath:@"currentDeviceTemperature" options:NSKeyValueObservingOptionNew context:NULL];
        [self addObserver:self forKeyPath:@"deviceTimer" options:NSKeyValueObservingOptionNew context:NULL];
        [self addObserver:self forKeyPath:@"timerDelay" options:NSKeyValueObservingOptionNew context:NULL];
        
        [self addObserver:self forKeyPath:@"userSavedInHomeDirectory" options:NSKeyValueObservingOptionNew context:NULL];
        [self addObserver:self forKeyPath:@"isNotificationON" options:NSKeyValueObservingOptionNew context:NULL];
        [self addObserver:self forKeyPath:@"notificationDelay" options:NSKeyValueObservingOptionNew context:NULL];
    }
    
    return self;
}

- (void)p_getTimerTemperatureDeviceDelay {
    
   // NSString *stringGetTimeForTimer                 = [[NSUserDefaults standardUserDefaults] objectForKey:kStoreTimeForTimer];
    NSString *stringGetTimerState                   = [[NSUserDefaults standardUserDefaults] objectForKey:kSaveDeviceTimerOnOFFKey];
    NSString *stringGetDeviceTimerDelay             = [[NSUserDefaults standardUserDefaults] objectForKey:kSaveDeviceTimeDelayKey];
    NSString *stringGetCurrentDeviceTemperature     = [[NSUserDefaults standardUserDefaults] objectForKey:kStoreCurrentDeviceTemperature];
    
    //self.deviceTimer                                = [stringGetTimeForTimer integerValue];
    self.deviceONOFFTimer                           = [stringGetTimerState integerValue];
    self.timerDelay                                 = [stringGetDeviceTimerDelay integerValue];
    self.currentDeviceTemperature                   = [stringGetCurrentDeviceTemperature integerValue];
    
    [self checkTemperature];
}

- (void)p_getSettings {
    
    NSString *stringInObjectNotificationState   = [[NSUserDefaults standardUserDefaults] objectForKey:kSaveInObjectNotificationStateKey];
    NSString *stringInObjectNotificationDelay   = [[NSUserDefaults standardUserDefaults] objectForKey:kSaveInObjectNotificationDelayKey];
    
    self.isNotificationON                       = [stringInObjectNotificationState integerValue];
    self.notificationDelay                      = [stringInObjectNotificationDelay integerValue];

}

- (void)p_getToken {
    
    NSLog(@"keyChain - %@", [[NSUserDefaults standardUserDefaults] objectForKey:ktokenKey]);
    NSLog(@"keyChain - %@", [[NSUserDefaults standardUserDefaults] objectForKey:kEmailKey]);
    NSLog(@"keyChain - %@", [[NSUserDefaults standardUserDefaults] objectForKey:kPasswordKey]);
    
    if([self checkVariable: [[NSUserDefaults standardUserDefaults] objectForKey:kEmailKey]] && [self checkVariable: [[NSUserDefaults standardUserDefaults] objectForKey:kPasswordKey]]) {
        
        self.userSavedInHomeDirectory = [SavedUser initWithLogin:[[NSUserDefaults standardUserDefaults] objectForKey:kEmailKey] Pass:[[NSUserDefaults standardUserDefaults] objectForKey:kPasswordKey]];
    } else if([self checkVariable: [[NSUserDefaults standardUserDefaults] objectForKey:ktokenKey]]) {
        
        self.userSavedInHomeDirectory = [SavedUser initWithSocialityKey:[[NSUserDefaults standardUserDefaults] objectForKey:ktokenKey]];
    }
}

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context {
    
    if ([keyPath isEqual:@"userSavedInHomeDirectory"]) {
        
        [self saveToken: ((AccountInfoManager*)object).userSavedInHomeDirectory];
    }
    if([keyPath isEqual:@"isNotificationON"]) {
        
        [self saveSettingisNotificationON];
    }
    if([keyPath isEqual:@"notificationDelay"]) {
        
        [self saveSettingNotificationDelay];
    }
    if([keyPath isEqual:@"deviceONOFFTimer"]) {
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:  self.deviceONOFFTimer] forKey:kSaveDeviceTimerOnOFFKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    if([keyPath isEqual:@"currentDeviceTemperature"]) {
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:  self.currentDeviceTemperature] forKey:kStoreCurrentDeviceTemperature];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    if([keyPath isEqual:@"deviceTimer"]) {
        
    // [[NSUserDefaults standardUserDefaults] setObject:self.savedUserPass forKey:kStoreTimeForTimer];
    //     [[NSUserDefaults standardUserDefaults] synchronize];
    }
    if([keyPath isEqual:@"timerDelay"]) {
        
        [[NSUserDefaults standardUserDefaults] setObject: [NSNumber numberWithInteger: self.timerDelay] forKey:kSaveDeviceTimeDelayKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)saveToken:(SavedUser*)token {
    
    [[NSUserDefaults standardUserDefaults] setObject:token.savedSocialityKey forKey:ktokenKey];
    [[NSUserDefaults standardUserDefaults] setObject:token.savedUserLogin forKey:kEmailKey];
    [[NSUserDefaults standardUserDefaults] setObject:token.savedUserPass forKey:kPasswordKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)saveSettingisNotificationON {
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger: self.isNotificationON] forKey:kSaveInObjectNotificationStateKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)saveSettingNotificationDelay {
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger: self.notificationDelay] forKey:kSaveInObjectNotificationDelayKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)checkTemperature {
    
    if(self.currentDeviceTemperature == 0) {
        
        self.currentDeviceTemperature = 13;
    }
}

- (void)logout {
    
    self.userToken                  = nil;
    self.userSavedInHomeDirectory   = nil;
    self.userAchievements           = nil;
    
    [self saveToken:self.userSavedInHomeDirectory];
}

- (void)registrationNewUserWithParams:(NSDictionary*)userParams Block:(void(^)())block {
    
    NSManagedObjectContext      *defaultContext = [NSManagedObjectContext MR_defaultContext];
    
    User                        *newUser        = [User MR_createEntityInContext:defaultContext];
    newUser.birthday                            = [userParams objectForKey:kDateOfBirthKey];
    newUser.userLogin                           = [userParams objectForKey:kLoginKey];
    newUser.userPass                            = [userParams objectForKey:kPassKey];
    newUser.user_heightValue                    = [[userParams objectForKey:kHeightKey] floatValue];
    newUser.user_weightValue                    = [[userParams objectForKey:kWeightKey] floatValue];
    newUser.user_sex                            = [userParams objectForKey:kSexFieldKey];
    
    self.userToken                              = newUser;
    
    self.userAchievements                       = [[AchievementsInfo alloc] init];
    [self.userAchievements createNSArrayAchievements];
    
    [self injectUserSettings:newUser];
    [defaultContext MR_saveToPersistentStoreAndWait];
    
    block();
}

- (void)autorizationWithLoginAndPass:(NSString*)login pass:(NSString*)pass Block:(void(^)(BOOL isUserEnable))block {
    
    NSPredicate     *peopleFilterWithLogin  = [NSPredicate predicateWithFormat:@"userLogin == %@", login];
    NSFetchRequest  *peopleRequest          = [User MR_requestAllWithPredicate:peopleFilterWithLogin];
    NSArray         *filteredUser           = [User MR_executeFetchRequest:peopleRequest];
    NSPredicate     *peopleFilterWithPass   = [NSPredicate predicateWithFormat:@"userPass == %@", pass];
    NSArray         *filteredPassword       = [filteredUser filteredArrayUsingPredicate:peopleFilterWithPass];
    
    if(filteredPassword.count > 0) {
        
        NSLog(@"-------=======user Find=======-------");
        self.userToken                      = [filteredPassword firstObject];
        self.userSavedInHomeDirectory       = [SavedUser initWithLogin:self.userToken.userLogin Pass:self.userToken.userPass];
        
        block(YES);
    } else {
        
        block(NO);
    }
}

- (void)autorizationWithFaceBookAndTwitter:(NSString*)key firstName:(NSString*)userFirstName lastName:(NSString*)userLastName image:(UIImage*)profileImage Block:(void(^)(BOOL isUserEnable))block {
    
    NSManagedObjectContext *defaultContext          = [NSManagedObjectContext MR_defaultContext];
    
    NSPredicate             *peopleFilterWithKey    = [NSPredicate predicateWithFormat:@"socialityKey == %@", key];
    NSFetchRequest          *peopleRequest          = [User MR_requestAllWithPredicate:peopleFilterWithKey];
    NSArray                 *filteredUser           = [User MR_executeFetchRequest:peopleRequest];
    
    if(filteredUser.count > 0) {
        
        NSLog(@"-------=======user Find=======-------");
        self.userToken                              = [filteredUser firstObject];
        self.userSavedInHomeDirectory               = [SavedUser initWithSocialityKey:self.userToken.socialityKey];
        
        block(YES);
    } else {
        
        NSLog(@"-------=======user not find=======-------");
        
        User                *newUser                = [User MR_createEntityInContext:defaultContext];
        newUser.socialityKey                        = key;
        
        if([[HelperManager sharedServer] saveImage:profileImage withFileName:[NSString stringWithFormat:@"%@", key] ofType:[[HelperManager sharedServer] definitionImageType:profileImage]].length > 0) {
            
            newUser.user_photo_url                  = [[HelperManager sharedServer] saveImage:profileImage withFileName:[NSString stringWithFormat:@"%@_%@", key, userFirstName] ofType:[[HelperManager sharedServer] definitionImageType:profileImage]];
        }
        if(userFirstName.length > 0) {
            
            newUser.first_name                      = userFirstName;
        }
        if(userLastName.length > 0) {
            
            newUser.last_name                       = userLastName;
        }
        
        [self injectUserSettings:newUser];
        
        self.userToken = newUser;
        self.userSavedInHomeDirectory               = [SavedUser initWithSocialityKey:self.userToken.socialityKey];
        
        self.userAchievements                       = [[AchievementsInfo alloc] init];
        [self.userAchievements createNSArrayAchievements];
        
        [defaultContext MR_saveToPersistentStoreAndWait];
        
        block(YES);
    }
}

- (void)loadUserObjectWithBlock:(void(^)())block {
    
    NSPredicate             *peopleFilterWithKey        = [NSPredicate predicateWithFormat:@"socialityKey == %@", self.userSavedInHomeDirectory.savedSocialityKey];
    NSFetchRequest          *peopleRequest              = [User MR_requestAllWithPredicate:peopleFilterWithKey];
    NSArray                 *filteredUser               = [User MR_executeFetchRequest:peopleRequest];
    
    if(filteredUser.count > 0) {
        
        self.userToken                                  = [filteredUser firstObject];
        
        
        block();
        
        return;
    }
    
    NSPredicate             *peopleFilterWithEmail      = [NSPredicate predicateWithFormat:@"userLogin == %@", self.userSavedInHomeDirectory.savedUserLogin];
    NSFetchRequest          *emailPeopleRequest         = [User MR_requestAllWithPredicate:peopleFilterWithEmail];
    NSArray                 *emailFilteredUser          = [User MR_executeFetchRequest:emailPeopleRequest];
    
    if(emailFilteredUser.count > 0) {
        
        self.userToken                                  = [emailFilteredUser firstObject];
        
    
        block();
        
        return;
    }
}

- (User*)findUserInDataBase {
    
    NSPredicate         *peopleFilterWithKey            = [NSPredicate predicateWithFormat:@"socialityKey == %@", self.userSavedInHomeDirectory.savedSocialityKey];
    NSFetchRequest      *peopleRequest                  = [User MR_requestAllWithPredicate:peopleFilterWithKey];
    NSArray             *filteredUser                   = [User MR_executeFetchRequest:peopleRequest];
    
    if(filteredUser.count > 0) {
        
        return [filteredUser firstObject];
    }
    
    NSPredicate         *peopleFilterWithEmail          = [NSPredicate predicateWithFormat:@"userLogin == %@", self.userSavedInHomeDirectory.savedUserLogin];
    NSFetchRequest      *emailPeopleRequest             = [User MR_requestAllWithPredicate:peopleFilterWithEmail];
    NSArray             *emailFilteredUser              = [User MR_executeFetchRequest:emailPeopleRequest];
    
    if(emailFilteredUser.count > 0) {
        
        return [filteredUser firstObject];
    }
    return nil;
}

- (BOOL)checkVariable:(NSString*)string {
    
    BOOL state  = YES;
    
    if(string.length == 0) {
        state   = NO;
    }
    if([string isEqualToString:@"(null)"]) {
        state   = NO;
    }
    if(string == nil) {
        state   = NO;
    }
    
    return state;
}

- (void)injectUserSettings:(User*)user {
    
    NSManagedObjectContext *settingsContext = [NSManagedObjectContext MR_defaultContext];
    user.userSettings                       = [UserSettings MR_createEntityInContext: settingsContext];
    
    user.userSettings.user_Volume           = @"Ml";
    user.userSettings.user_temperature      = @"℃";
    user.userSettings.user_weight           = @"Kg";
    user.userSettings.user_Length           = @"Cm";
    
    [settingsContext MR_saveToPersistentStoreAndWait];
}

- (void)createUserCardsWithDay {
    
    
    
    
    
}

@end
