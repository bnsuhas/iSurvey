//
//  ESSurveyListTableViewCell.h
//  Exilant Survey
//
//  Created by Suhas on 27/11/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESSurveyListTableViewCell : UITableViewCell
{
    
}

@property (retain, nonatomic) IBOutlet UITextField *surveyTitle;

@property (retain, nonatomic) IBOutlet UITextField *surveyInfo;

@property (retain, nonatomic) IBOutlet UITextField *surveyStatus;

@property (retain, nonatomic) IBOutlet UIView *surveyStatusBackGround;

@end
