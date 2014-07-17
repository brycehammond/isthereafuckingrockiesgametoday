//
//  ITAFRGTAlertScheduler.h
//  ITAFRGT
//
//  Created by Bryce Hammond on 7/16/14.
//  Copyright (c) 2014 Fluidvision Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITAFRGTAlertScheduler : NSObject

+ (void)scheduleAlerts;
+ (void)unscheduleAllAlerts;

@end
