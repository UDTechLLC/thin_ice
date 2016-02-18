//
//  ServerManager.m
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "ServerManager.h"

@implementation ServerManager

+ (ServerManager *)sharedServer {
    static ServerManager *instanceHelper = nil;
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

@end
