//
//  ServerManager.h
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface AccountInfoManager : NSObject

@property (readonly, nonatomic) User *userToken;

+ (AccountInfoManager *)sharedManager;
- (void)createAchivementsDataBaseForUser:(User*)user;
- (void)autorizationWithLoginAndPass:(NSString*)login pass:(NSString*)pass Block:(void(^)(BOOL isUserEnable))block;




@end
