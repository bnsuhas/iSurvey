//
//  ESSurveyListTableViewCell.m
//  Exilant Survey
//
//  Created by Suhas on 27/11/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import "ESSurveyListTableViewCell.h"

@implementation ESSurveyListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        // Initialization code
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_surveyInfo release];
    [_surveyTitle release];
    [_surveyStatus release];
    [_surveyStatusBackGround release];
    [super dealloc];
}
@end
