//
//  ITAFRGTSecondViewController.m
//  ITAFRGT
//
//  Created by Bryce Hammond on 7/15/14.
//  Copyright (c) 2014 Fluidvision Design. All rights reserved.
//

#import "ITAFRGTSettingsViewController.h"
#import "ITAFRGTAlertScheduler.h"

@interface ITAFRGTSettingsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *atHomeSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *awaySwitch;

@end

@implementation ITAFRGTSettingsViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.atHomeSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:ITAFRGTAtHomeAlertKey];
    self.awaySwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:ITAFRGTAwayAlertKey];
}

- (IBAction)gameTypeSwitchSet:(UISwitch *)sender
{
    if(sender == self.atHomeSwitch)
    {
        [[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:ITAFRGTAtHomeAlertKey];
    }
    else if(sender == self.awaySwitch)
    {
        [[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:ITAFRGTAwayAlertKey];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    [ITAFRGTAlertScheduler rescheduleAlerts];
    
    
}

@end
