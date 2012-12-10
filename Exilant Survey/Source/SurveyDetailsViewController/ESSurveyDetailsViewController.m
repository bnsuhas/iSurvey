//
//  ESSurveyDetailsViewController.m
//  Exilant Survey
//
//  Created by Suhas on 29/11/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import "ESSurveyDetailsViewController.h"

@interface ESSurveyDetailsViewController ()

@end

@implementation ESSurveyDetailsViewController

@synthesize selectedSurveyName = selectedSurveyName_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [self dataFilePath];
	
    if([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        self.selectedSurvey = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
    
    else
    {
        self.selectedSurvey = [[ESSurvey alloc] init];
    }
    
    self.numberOfRespondents.text = self.selectedSurvey.numberOfResponses.stringValue;
    
    self.completedSurveys.text = self.selectedSurvey.numberOfCompletedSurveys.stringValue;
    
    self.incompleteSurveys.text = self.selectedSurvey.numberOfIncompleteSurveys.stringValue;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [_numberOfRespondents release];
    [_completedSurveys release];
    [_incompleteSurveys release];
    [_graphView release];
    self.selectedSurveyName = nil;
    self.selectedSurvey = nil;
    [super dealloc];
}

- (IBAction)startSurvey:(id)sender
{
    
}

#pragma mark -
#pragma mark View Controller Delegate Methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[ESSurveyViewController class]])
    {
        NSString *masterListPath = [[NSBundle mainBundle] pathForResource:@"Surveys_Master_List" ofType:@"plist"];
        
        NSDictionary *masterList = [NSDictionary dictionaryWithContentsOfFile:masterListPath];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:[masterList valueForKey:self.selectedSurveyName] ofType:@"plist"];
        
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        
        [(ESSurveyViewController *)segue.destinationViewController setSurveyDetailsDict:dict];
        
        [(ESSurveyViewController *)segue.destinationViewController setDelegate:self];
    }
}

#pragma mark -
#pragma mark ESSurveyViewControllerDelegate Methods

-(void)userClosedSurvey
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Helper Methods

-(NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *dataFilePath = [NSString stringWithFormat:@"%@/%@.exsurv",documentsDirectory,self.selectedSurveyName];
    
    return dataFilePath;
}

@end
