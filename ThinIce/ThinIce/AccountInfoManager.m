//
//  ServerManager.m
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "AccountInfoManager.h"

@interface AccountInfoManager ()

@property (nonatomic, strong, readwrite) User *userToken;

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
        
    }
    return self;
}

- (void)autorizationWithLoginAndPass:(NSString*)login pass:(NSString*)pass Block:(void(^)(BOOL isUserEnable))block {
    
    NSPredicate *peopleFilterWithLogin = [NSPredicate predicateWithFormat:@"userLogin == %@", login];
    
    NSFetchRequest *peopleRequest = [User MR_requestAllWithPredicate:peopleFilterWithLogin];
    NSArray *filteredUser = [User MR_executeFetchRequest:peopleRequest];
    
    NSPredicate *peopleFilterWithPass = [NSPredicate predicateWithFormat:@"userPass == %@", pass];
    NSArray *filteredPassword = [filteredUser filteredArrayUsingPredicate:peopleFilterWithPass];
    
    if(filteredPassword.count > 0) {
        NSLog(@"-------=======user Find=======-------");
        self.userToken = [filteredPassword firstObject];
        block(YES);
    } else {
        NSLog(@"-------=======user not find=======-------");
        block(NO);
    }
    
    /*
     User *newUser = [User MR_createEntity];
     newUser.userLogin = login;
     newUser.userPass = pass;
     [self saveContext];
     */
    
}

- (void)createAchivementsDataBaseForUser:(User*)user {
    
    NSMutableArray *arrayOfAchivements = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < AchievementsCount; i ++) {
        UserAchievements *uAchievement = [[UserAchievements alloc] init];
        [uAchievement setAchivment_addStatusValue:NO];
        uAchievement.achivment_id = [NSNumber numberWithInt:i];
        uAchievement.achivment_progress = 0;
        [arrayOfAchivements addObject:uAchievement];
    }
    user.userAchievements = arrayOfAchivements;
    
}

- (void)saveContext {
    UIApplication *application = [UIApplication sharedApplication];
    
    __block UIBackgroundTaskIdentifier bgTask = [application beginBackgroundTaskWithExpirationHandler:^{
        [application endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    }];
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        
        // Do your work to be saved here
        
    } completion:^(BOOL success, NSError *error) {
        [application endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    }];
}
@end
