//
//  ITAFRGTScheduleCell.m
//  ITAFRGT
//
//  Created by Bryce Hammond on 7/19/14.
//  Copyright (c) 2014 Fluidvision Design. All rights reserved.
//

#import "ITAFRGTScheduleCell.h"

@interface ITAFRGTScheduleCell ()

@property (weak, nonatomic) IBOutlet UILabel *vsLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *datetimeLabel;

@end

@implementation ITAFRGTScheduleCell

static NSDateFormatter *__gameDateFormatter;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setGame:(ITAFRGTGame *)game
{
    if(nil == __gameDateFormatter)
    {
        __gameDateFormatter = [[NSDateFormatter alloc] init];
        __gameDateFormatter.dateFormat = @"M/dd h:mma";
    }
    
    self.datetimeLabel.text = [__gameDateFormatter stringFromDate:game.date];
    self.vsLabel.text = game.opponent;
    self.locationLabel.text = game.location;
}

@end
