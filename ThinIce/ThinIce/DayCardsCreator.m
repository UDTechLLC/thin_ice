//
//  DayCardsCreator.m
//  ThinIce
//
//  Created by Dima Shapovalov on 25.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "DayCardsCreator.h"

#define OPACITY                         0.55

static NSString * const kDayCardsColor[] = { @"#BA68C8", @"#7E57C2", @"#4B6697", @"#29B6F6", @"#64FFDA", @"#16A086", @"#54A6B7", @"#607d8b" };

@implementation DayCardsCreator

- (id)init {
    
    self = [super init];
    if (self) {
        
        self.weeksCardArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)checkAndCreateCards {

    NSMutableArray *arrayForCards                                 = [[NSMutableArray alloc] init];
    arrayForCards                                                 = [NSKeyedUnarchiver unarchiveObjectWithData: [AccountInfoManager sharedManager].userToken.userCard];

    if(arrayForCards.count == 0) {
        
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:[NSDate date]];
        NSInteger weekday = [comps weekday] - 1;
        
        
        self.currentCard = [[UserDaysCards alloc] initCardsWithDaysID:weekday CurrentCreateDate:[NSDate date]];
        
        [self.weeksCardArray addObject:self.currentCard];
    } else {
        
        
    }
}

- (void)changeCardTemperature:(NSNumber*)temperature {
    
    
    
    
}

@end
