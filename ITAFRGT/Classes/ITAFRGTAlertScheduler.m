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

@end
