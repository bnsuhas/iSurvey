//
//  ESQuestionFactory.m
//  Exilant Survey
//
//  Created by Suhas on 3/12/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import "ESQuestionFactory.h"
#import "ESCustomButtonsView.h"

@implementation ESQuestionFactory

+(UIView *)questionViewForDetails:(NSDictionary *)inQuestionDetailsDictionary
{
    ESCustomButtonsView *customView = [[[ESCustomButtonsView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)] autorelease];
    
    [customView createCustomButtonsForOptions:[[inQuestionDetailsDictionary valueForKey:@"Options"] valueForKey:@"Title"] isRadionButton:YES];
    
    return customView;
}

@end
