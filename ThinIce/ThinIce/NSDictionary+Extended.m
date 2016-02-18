//
//  NSDictionary+Extended.m
//  AirSoft
//
//  Created by Denisov Ilya on 10/30/14.
//  Copyright (c) 2014 Pro2005. All rights reserved.
//

#import "NSDictionary+Extended.h"

@implementation NSDictionary (Extended)

- (NSString *)jsonString {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (error == nil) {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSAssert(error, @"error");
    return @"";
}

+ (NSDictionary *)dictionaryFromJSON:(NSString *)json {
    NSError *error;
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding]
                                                                   options:NSJSONReadingMutableContainers
                                                                     error:&error];
    if (error == nil && [JSONDictionary isKindOfClass:[NSDictionary class]]) {
        return JSONDictionary;
    }
    return @{};
}

@end
