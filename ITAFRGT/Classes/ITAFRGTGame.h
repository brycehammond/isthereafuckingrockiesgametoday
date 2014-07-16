//
//  ITAFRGTGame.h
//  ITAFRGT
//
//  Created by Bryce Hammond on 7/13/14.
//  Copyright (c) 2014 Fluidvision Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITAFRGTGame : NSObject

@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *opponent;
@property (nonatomic, strong) NSDate *date;

- (id)initWithConfig:(NSDictionary *)config;

+ (NSArray *)allGames;

@end
