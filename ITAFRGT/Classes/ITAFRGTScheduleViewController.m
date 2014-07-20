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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.allGames = [ITAFRGTGame allGames];
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSUInteger scrollToIndex = [self.allGames indexOfObject:[ITAFRGTGame nextGame]];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:scrollToIndex inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
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
