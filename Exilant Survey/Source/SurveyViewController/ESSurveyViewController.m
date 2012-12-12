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
    
    [self updateUIWithUserPreferencesForSurvey];
    
    self.questionViewsArray = [NSMutableArray array];
    
    self.surveyFont = [UIFont fontWithName:[self.surveyDetailsDict valueForKey:@"Font"] size:[[self.surveyDetailsDict valueForKey:@"FontSize"] floatValue]];
    
    self.surveyFontColor = [ESUtilities colorFromHexString:[self.surveyDetailsDict valueForKey:@"FontColor"]];
    
    //Create the view for 1st question
    
    [self createAndDisplayQuestionViewForQuestionNumber:0];
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
}

- (IBAction)previousQuestion:(id)sender
{
}

#pragma mark -
#pragma mark Helper Methods

-(void)createAndDisplayQuestionViewForQuestionNumber:(int)inQuestionNumber
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    
    ESQuestionViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"QuestionView"];
    
    [viewController prepareWithQuestionAndOptionsForDetails:[[self.surveyDetailsDict valueForKey:@"Questions"] objectAtIndex:inQuestionNumber]
     usingFont:self.surveyFont andFontColor:self.surveyFontColor];
    
    [self.questionViewsArray addObject:viewController];
    
    currentlyDisplayedQuestion_ = inQuestionNumber;
	
    [self.view insertSubview:viewController.view atIndex:0];
    
    [viewController release];
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

@end
