//
//  ESOptionsTableViewCell.m
//  Exilant Survey
//
//  Created by Suhas on 21/12/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import "ESOptionsTableViewCell.h"

@implementation ESOptionsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [_selectionButton release];
    [_optionTitle release];
    [super dealloc];
}

- (IBAction)optionSelected:(id)sender
{

}

@end
