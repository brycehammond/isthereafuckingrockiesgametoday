//
//  ITAFRGTFirstViewController.m
//  ITAFRGT
//
//  Created by Bryce Hammond on 7/15/14.
//  Copyright (c) 2014 Fluidvision Design. All rights reserved.
//

#import "ITAFRGTTodayViewController.h"
#import "ITAFRGTGame.h"
#import "NSDate+Escort.h"

@interface ITAFRGTTodayViewController ()

@property (weak, nonatomic) IBOutlet UILabel *yesNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end

@implementation ITAFRGTTodayViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    ITAFRGTGame *nextGame = [ITAFRGTGame nextGame];
    
    ITAFRGTGame *currentGame = nil;
    
    if([[nextGame.date dateAtStartOfDay] isEqualToDate: [[NSDate date] dateAtStartOfDay]])
    {
        currentGame = nextGame;
    }
    
    
    if(currentGame)
    {
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        timeFormatter.dateFormat = @"h:mma";
    
        self.yesNoLabel.text = @"YES";
        self.locationLabel.text = [currentGame.location isEqualToString:@"Coors Field"] ? @"At home" : @"Away";
        self.detailLabel.text = [NSString stringWithFormat:@"Rockies play the %@ %@ at %@", currentGame.opponent, [timeFormatter stringFromDate:currentGame.date].lowercaseString, currentGame.location];
    }
    else
    {
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        timeFormatter.dateFormat = @"eeee, M/d h:mma";
        
        self.yesNoLabel.text = @"NO";
        self.locationLabel.text = @"";
        
        if(nextGame)
        {
            self.detailLabel.text = [NSString stringWithFormat:@"Rockies will play the %@ on %@ at %@", nextGame.opponent, [timeFormatter stringFromDate:nextGame.date], nextGame.location];
        }
        else
        {
            self.detailLabel.text = @"";
        }
        
        
    }
    
}

@end
