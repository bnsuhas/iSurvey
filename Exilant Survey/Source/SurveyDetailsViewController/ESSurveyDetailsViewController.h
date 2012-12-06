//
//  ESSurveyDetailsViewController.h
//  Exilant Survey
//
//  Created by Suhas on 29/11/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESSurvey.h"

@interface ESSurveyDetailsViewController : UIViewController
{
    NSString *selectedSurveyName_;
    
    ESSurvey *selectedSurvey_;
}

@property (retain, nonatomic) IBOutlet UITextField *numberOfRespondents;

@property (retain, nonatomic) IBOutlet UITextField *completedSurveys;

@property (retain, nonatomic) IBOutlet UITextField *incompleteSurveys;

@property (retain, nonatomic) IBOutlet UIView *graphView;

@property (nonatomic, retain) NSString *selectedSurveyName;

@property (nonatomic ,retain) ESSurvey *selectedSurvey;

- (IBAction)startSurvey:(id)sender;

-(NSString *)dataFilePath;

@end
