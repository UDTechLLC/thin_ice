//
//  NSObject+Runtime.m
//  iGreekNation
//
//  Created by Denisov Ilya on 9/27/13.
//  Copyright (c) 2013 Denisov Ilya. All rights reserved.
//

#import "NSObject+Runtime.h"

@implementation NSObject (Runtime)

+ (NSDictionary *)getAllPropertiesWithAttributes {
    NSMutableDictionary *allPreperties = [NSMutableDictionary dictionaryWithCapacity:0];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
            const char *propAttributes = property_getAttributes(property);
            NSString *propertyName = [NSString stringWithUTF8String:propName];
            NSString *propertyAttr = [NSString stringWithUTF8String:propAttributes];
            [allPreperties setObject:propertyAttr forKey:propertyName];
        }
    }
    free(properties);
    return allPreperties;
}

@end
