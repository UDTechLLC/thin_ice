//
//  NSDictionary+Extended.h
//  AirSoft
//
//  Created by Denisov Ilya on 10/30/14.
//  Copyright (c) 2014 Pro2005. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extended)

- (NSString *)jsonString;
+ (NSDictionary *)dictionaryFromJSON:(NSString *)json;

@end
