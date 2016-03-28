//
//  DayCardsCreator.h
//  ThinIce
//
//  Created by Dima Shapovalov on 25.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDaysCards.h"

@interface DayCardsCreator : NSObject

@property (strong, nonatomic) UserDaysCards         *currentCard;
@property (strong, nonatomic) NSMutableArray        *weeksCardArray;

- (void)saveCurrentCards;
- (void)checkAndCreateCards;
- (void)changeCardTemperature:(NSNumber*)temperature;

@end