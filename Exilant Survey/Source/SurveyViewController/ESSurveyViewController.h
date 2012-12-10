//
//  ESSurveyViewController.h
//  Exilant Survey
//
//  Created by Suhas on 29/11/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ESSurveyViewControllerDelegate <NSObject>

-(void)userClosedSurvey;

@end

@interface ESSurveyViewController : UIViewController
{
    NSMutableArray *questionViewsArray_;
    
    NSDictionary *surveyDetailsDict_;
    
    int currentlyDisplayedQuestion_;
    
    id<ESSurveyViewControllerDelegate> delegate_;
}

@property(nonatomic, retain) NSMutableArray *questionViewsArray;
@property(nonatomic, retain) NSDictionary *surveyDetailsDict;
@property(nonatomic, assign) id<ESSurveyViewControllerDelegate> delegate;

@property (retain, nonatomic) IBOutlet UIProgressView *surveyProgressView;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *finishButton;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (retain, nonatomic) IBOutlet UIToolbar *topToolBar;
@property (retain, nonatomic) IBOutlet UIToolbar *bottomToolBar;
@property (retain, nonatomic) IBOutlet UIImageView *logoImageView;

- (IBAction)closeSurvey:(id)sender;
- (IBAction)finishSurvey:(id)sender;
- (IBAction)nextQuestion:(id)sender;
- (IBAction)previousQuestion:(id)sender;

-(void)createAndDisplayQuestionViewForQuestionNumber:(int)inQuestionNumber;
-(void)updateUIWithUserPreferencesForSurvey;

@end
