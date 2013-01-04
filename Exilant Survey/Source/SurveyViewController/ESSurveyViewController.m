//
//  ESSurveyViewController.m
//  Exilant Survey
//
//  Created by Suhas on 29/11/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import "ESSurveyViewController.h"
#import "ESQuestionViewController.h"
#import "ESUtilities.h"

@interface ESSurveyViewController ()

@end

@implementation ESSurveyViewController

@synthesize questionViewsArray = questionViewsArray_;
@synthesize surveyDetailsDict = surveyDetailsDict_;
@synthesize surveyFont = surveyFont_;
@synthesize surveyFontColor = surveyFontColor_;
@synthesize delegate = delegate_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.backButton setEnabled:NO];
    
    maxQuestionsInSurvey_ = [[self.surveyDetailsDict valueForKey:@"Questions"] count];
    
    [self updateUIWithUserPreferencesForSurvey];
    
    self.questionViewsArray = [NSMutableArray array];
    
    self.surveyFont = [UIFont fontWithName:[self.surveyDetailsDict valueForKey:@"Font"] size:[[self.surveyDetailsDict valueForKey:@"FontSize"] floatValue]];
    
    self.surveyFontColor = [ESUtilities colorFromHexString:[self.surveyDetailsDict valueForKey:@"FontColor"]];
    
    //Create the view for 1st question
    
    [self createAndDisplayQuestionViewForQuestionNumber:0];
    
    [self updateSurveyProgress];
}

-(void)dealloc
{
    self.questionViewsArray = nil;
    self.surveyDetailsDict = nil;
    self.surveyFont = nil;
    self.surveyDetailsDict = nil;
    
    [_surveyProgressView release];
    [_nextButton release];
    [_finishButton release];
    [_backButton release];
    
    [_topToolBar release];
    [_bottomToolBar release];
    [_logoImageView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Action Methods

- (IBAction)closeSurvey:(id)sender
{
    [self.delegate userClosedSurvey];
}

- (IBAction)finishSurvey:(id)sender
{
    
}

- (IBAction)nextQuestion:(id)sender
{
    [self createAndDisplayQuestionViewForQuestionNumber:currentlyDisplayedQuestion_+1];
    
    if(currentlyDisplayedQuestion_ == maxQuestionsInSurvey_ - 1)
    {
        [sender setEnabled:NO];
    }
    
    [self.backButton setEnabled:YES];
    
    [self updateSurveyProgress];
}

- (IBAction)previousQuestion:(id)sender
{
    [self createAndDisplayQuestionViewForQuestionNumber:currentlyDisplayedQuestion_-1];
    
    if(currentlyDisplayedQuestion_ == 0)
    {
        [sender setEnabled:NO];
    }
    
    [self.nextButton setEnabled:YES];
    
    [self updateSurveyProgress];
}

#pragma mark -
#pragma mark Helper Methods

-(void)createAndDisplayQuestionViewForQuestionNumber:(int)inQuestionNumber
{
    ESQuestionViewController *viewController = nil;
    
    if(inQuestionNumber >= [self.questionViewsArray count])
    {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    
        viewController = [storyBoard instantiateViewControllerWithIdentifier:@"QuestionView"];
    
        [viewController prepareWithQuestionAndOptionsForDetails:[[self.surveyDetailsDict valueForKey:@"Questions"] objectAtIndex:inQuestionNumber]
                                                      usingFont:self.surveyFont andFontColor:self.surveyFontColor];
    
        [self.questionViewsArray addObject:viewController];
    }
    
    else
    {
        viewController = [self.questionViewsArray objectAtIndex:inQuestionNumber];
    }
    
    if([[self.view subviews] containsObject:[[self.questionViewsArray objectAtIndex:currentlyDisplayedQuestion_] view]])
    {
        [[[self.questionViewsArray objectAtIndex:currentlyDisplayedQuestion_] view] removeFromSuperview];
    }
    
    currentlyDisplayedQuestion_ = inQuestionNumber;
	
    [self.view insertSubview:viewController.view atIndex:0];
}

-(void)updateUIWithUserPreferencesForSurvey
{
    //Set colors for toolbar
    
    UIColor *toolbarColor = [ESUtilities colorFromHexString:[self.surveyDetailsDict valueForKey:@"NavigatonBarColor"]];
    self.topToolBar.tintColor = toolbarColor;
    self.bottomToolBar.tintColor = toolbarColor;
    
    //Set Logo for survey
    UIImage *logoImage = [UIImage imageNamed:[self.surveyDetailsDict valueForKey:@"Logo"]];
    self.logoImageView.image = logoImage;
    
}

-(void)updateSurveyProgress
{
    [self.surveyProgressView setProgress:(float)(currentlyDisplayedQuestion_+1)/maxQuestionsInSurvey_ animated:YES];
}

@end
