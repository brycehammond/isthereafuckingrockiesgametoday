//
//  ITAFRGTScheduleViewController.m
//  ITAFRGT
//
//  Created by Bryce Hammond on 7/19/14.
//  Copyright (c) 2014 Fluidvision Design. All rights reserved.
//

#import "ITAFRGTScheduleViewController.h"
#import "ITAFRGTGame.h"
#import "ITAFRGTScheduleCell.h"

@interface ITAFRGTScheduleViewController ()

@property (nonatomic, strong) NSArray *allGames;

@end

@implementation ITAFRGTScheduleViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.allGames = [ITAFRGTGame allGames];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allGames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ITAFRGTScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Schedule Cell" forIndexPath:indexPath];
    [cell setGame:self.allGames[indexPath.row]];
    return cell;
}

@end