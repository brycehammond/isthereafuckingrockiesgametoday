//
//  ITAFRGTGame.m
//  ITAFRGT
//
//  Created by Bryce Hammond on 7/13/14.
//  Copyright (c) 2014 Fluidvision Design. All rights reserved.
//

#import "ITAFRGTGame.h"
#import "NSDate+Escort.h"

@implementation ITAFRGTGame

static NSArray *__allGames;

- (id)initWithConfig:(NSDictionary *)config
{
    self = [self init];
    self.location = config[@"location"];
    self.opponent = config[@"opponent"];
    
    NSString *fullDate =  [NSString stringWithFormat:@"%@ %@", config[@"date"], config[@"time"]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM/dd/yyyy h:mma zzz";
    self.date = [dateFormatter dateFromString:fullDate];
    
    return self;
}

+ (NSArray *)allGames
{
 
    if(nil == __allGames)
    {
        NSData *configData = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"schedule" ofType:@"json"] options:0 error: nil];
        NSArray *configs = [NSJSONSerialization JSONObjectWithData:configData options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *games = [[NSMutableArray alloc] init];
        
        for(NSDictionary *config in configs)
        {
            [games addObject:[[ITAFRGTGame alloc] initWithConfig:config]];
        }
        
        __allGames = games.copy;
    }
    
    return __allGames;
}

+ (NSArray *)futureGames
{
    NSMutableArray *futureGames = [[NSMutableArray alloc] init];
    
    NSArray *allGames = [ITAFRGTGame allGames];
    
    NSDate *startOfDay = [[NSDate date] dateAtStartOfDay];
    
    for(ITAFRGTGame *game in allGames)
    {
        if([game.date isLaterThanDate:startOfDay])
        {
            [futureGames addObject:game];
        }
    }
        
    return futureGames.copy;
}

@end
