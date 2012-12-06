//
//  ESCheckBox.m
//  Exilant Survey
//
//  Created by Suhas on 4/12/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//



#import "ESCheckBoxBehavior.h"

@implementation ESCheckBoxBehavior

-(void)userSelectedAnOption:(UIButton *)inSender previouslySelectedOptions:(NSArray *)inPreviouslySelectedOptions
{
    [inSender setSelected:YES];
}

@end
