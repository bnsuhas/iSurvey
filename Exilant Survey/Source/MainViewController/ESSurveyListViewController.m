//
//  ESSurveyListViewController.m
//  Exilant Survey
//
//  Created by Suhas on 27/11/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import "ESSurveyListViewController.h"
#import "ESSurveyListTableViewCell.h"
#import "ESSurveyDetailsViewController.h"

@interface ESSurveyListViewController ()

@end

@implementation ESSurveyListViewController

@synthesize surveysArray = surveysArray_;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self)
    {
    
    }
    
    return self;
}

-(void)dealloc
{
    self.surveysArray = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.surveysArray = [[NSDictionary dictionaryWithContentsOfFile:
                          [[NSBundle mainBundle] pathForResource:@"Surveys_Master_List" ofType:@"plist"]] allKeys];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.surveysArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SurveyListCell";
    
    ESSurveyListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(nil == cell)
    {
        cell = [[ESSurveyListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SurveyListCell"];
    }
    
    cell.surveyTitle.text = [self.surveysArray objectAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

#pragma mark - ViewController delegate

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[ESSurveyDetailsViewController class]])
    {
        int selectedRow = [[self.tableView indexPathForSelectedRow] row];
        
        [(ESSurveyDetailsViewController *)segue.destinationViewController setSelectedSurveyName:[self.surveysArray objectAtIndex:selectedRow]];
    }
}

@end
