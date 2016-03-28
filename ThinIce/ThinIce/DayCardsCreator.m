//
//  DayCardsCreator.m
//  ThinIce
//
//  Created by Dima Shapovalov on 25.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "DayCardsCreator.h"

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
        [AccountInfoManager sharedManager].userToken.userCard = [NSKeyedArchiver archivedDataWithRootObject:self.weeksCardArray];
        [self saveCurrentCards];
        
    } else if(arrayForCards.count == 7 && [self checkCardsCreateDate]) {
        
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:[NSDate date]];
        NSInteger weekday = [comps weekday] - 1;
        
        [arrayForCards removeLastObject];
        self.currentCard = [[UserDaysCards alloc] initCardsWithDaysID:weekday CurrentCreateDate:[NSDate date]];
        [self.weeksCardArray addObject:self.currentCard];
        [AccountInfoManager sharedManager].userToken.userCard = [NSKeyedArchiver archivedDataWithRootObject:self.weeksCardArray];
        [self saveCurrentCards];
        
    } else if ([self checkCardsCreateDate]) {
        
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:[NSDate date]];
        NSInteger weekday = [comps weekday] - 1;

        self.currentCard = [[UserDaysCards alloc] initCardsWithDaysID:weekday CurrentCreateDate:[NSDate date]];
        [self.weeksCardArray addObject:self.currentCard];
        [AccountInfoManager sharedManager].userToken.userCard = [NSKeyedArchiver archivedDataWithRootObject:self.weeksCardArray];
        
        [self saveCurrentCards];
    } else {
        
        self.weeksCardArray = [NSMutableArray arrayWithArray: arrayForCards];
        self.currentCard    = [self.weeksCardArray firstObject];
    }
}

- (void)changeCardTemperature:(NSNumber*)temperature {
    
    [self.currentCard changeTemperatureWithValue: temperature];
    [self saveCurrentCards];
}

- (BOOL)checkCardsCreateDate {
    
    NSMutableArray *arrayForCards                                   = [[NSMutableArray alloc] init];
    arrayForCards                                                   = [NSKeyedUnarchiver unarchiveObjectWithData: [AccountInfoManager sharedManager].userToken.userCard];
    UserDaysCards *newUserCards                                     = [arrayForCards firstObject];
    
    if([[NSCalendar currentCalendar] isDate:[NSDate date] inSameDayAsDate:newUserCards.createCardsDate]) {
        
        return NO;
    } else {
        
        return YES;
    }
}

- (void)saveCurrentCards {
    
    NSManagedObjectContext *cardsContext                            = [NSManagedObjectContext MR_defaultContext];

    NSMutableArray *arrayForCards                                   = [[NSMutableArray alloc] init];
    arrayForCards                                                   = [NSKeyedUnarchiver unarchiveObjectWithData: [AccountInfoManager sharedManager].userToken.userCard];
    
    [arrayForCards replaceObjectAtIndex:0 withObject:self.currentCard];
    self.weeksCardArray = [NSMutableArray arrayWithArray: arrayForCards];
    [AccountInfoManager sharedManager].userToken.userCard           = [NSKeyedArchiver archivedDataWithRootObject:self.weeksCardArray];
    
    [cardsContext MR_saveToPersistentStoreAndWait];
}

@end
