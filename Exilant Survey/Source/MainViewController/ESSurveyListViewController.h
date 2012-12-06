//
//  ESSurveyListViewController.h
//  Exilant Survey
//
//  Created by Suhas on 27/11/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESSurveyListViewController : UITableViewController
{
    NSArray *surveysArray_;
}

@property(nonatomic, retain) NSArray *surveysArray;

@end
