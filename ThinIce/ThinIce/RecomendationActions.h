//
//  RecomendationActions.h
//  ThinIce
//
//  Created by Dima Shapovalov on 25.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecomendationActions : NSObject <NSCoding>

@property (strong, nonatomic) NSNumber                    *gymSession;
@property (strong, nonatomic) NSNumber                    *waterIntake;
@property (strong, nonatomic) NSNumber                    *junkFood;
@property (strong, nonatomic) NSNumber                    *hProtein;
@property (strong, nonatomic) NSNumber                    *hoursSlept;
@property (strong, nonatomic) NSNumber                    *carbsConsumed;

- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)encoder;

@end
