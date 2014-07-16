//
//  ITAFRGTFirstViewController.m
//  ITAFRGT
//
//  Created by Bryce Hammond on 7/15/14.
//  Copyright (c) 2014 Fluidvision Design. All rights reserved.
//

#import "ITAFRGTTodayViewController.h"
#import "ITAFRGTGame.h"

@interface ITAFRGTTodayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *yesNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation ITAFRGTTodayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    ITAFRGTGame *currentGame = [self todaysGame];
    
    if(currentGame)
    {
        self.yesNoLabel.text = @"YES";
        self.locationLabel.text = [currentGame.location isEqualToString:@"Coors Field"] ? @"At home" : @"Away";
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        timeFormatter.dateFormat = @"h:mma";
        
        self.detailLabel.text = [NSString stringWithFormat:@"Rockies play the %@ %@ at %@", currentGame.opponent, [timeFormatter stringFromDate:currentGame.date].lowercaseString, currentGame.location];
    }
    else
    {
        self.yesNoLabel.text = @"NO";
        self.locationLabel.text = @"";
        self.detailLabel.text = @"";
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ITAFRGTGame *)todaysGame
{
    NSDate *today = [NSDate date];
    
    
    
    return nil;
}

@end
