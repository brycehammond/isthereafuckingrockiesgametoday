//
//  ITAFRGTAlertScheduler.m
//  ITAFRGT
//
//  Created by Bryce Hammond on 7/16/14.
//  Copyright (c) 2014 Fluidvision Design. All rights reserved.
//

#import "ITAFRGTAlertScheduler.h"
#import "ITAFRGTGame.h"
#import "NSDate+Escort.h"

@implementation ITAFRGTAlertScheduler

+ (void)scheduleAlerts
{
    NSArray *futureGames = [ITAFRGTGame futureGames];
    
    NSUInteger alertedGameCount = 0;
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    timeFormatter.dateFormat = @"h:mma";
    
    for(ITAFRGTGame *game in futureGames)
    {
        if(alertedGameCount >= 64)
        {
            break; //can only schedule up to 64 alerts in the future
        }
        
        if([game.date isInPast])
        {
            continue;
        }
        
        //don't schedule an alert if we don't want that type
        if((game.isHomeGame && NO == [[NSUserDefaults standardUserDefaults] boolForKey:ITAFRGTAtHomeAlertKey]) ||
           (game.isAwayGame && NO == [[NSUserDefaults standardUserDefaults] boolForKey:ITAFRGTAwayAlertKey]))
        {
            continue;
        }
        
        
        UILocalNotification *reminder = [[UILocalNotification alloc] init];
        reminder.fireDate = [self alarmDateForGame:game];
        reminder.hasAction = YES;
        reminder.alertAction = @"Get the game";
        reminder.alertBody = [NSString stringWithFormat:@"Rockies play the %@ at %@", game.opponent, [timeFormatter stringFromDate:game.date].lowercaseString];
        [[UIApplication sharedApplication] scheduleLocalNotification:reminder];
        
        ++alertedGameCount;
        
    }
    
}

+ (void)unscheduleAllAlerts
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

+ (void)rescheduleAlerts
{
    [ITAFRGTAlertScheduler unscheduleAllAlerts];
    [ITAFRGTAlertScheduler scheduleAlerts];
}

+ (NSDate *)alarmDateForGame:(ITAFRGTGame *)game
{
    NSDate *startOfDay = [game.date dateAtStartOfDay];
    
    //Add to 10 am
    NSDate *fireDate = [startOfDay dateByAddingHours:10];
    
    return fireDate;
}

@end
