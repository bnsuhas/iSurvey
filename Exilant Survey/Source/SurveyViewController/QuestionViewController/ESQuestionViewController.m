//
//  ESQuestionViewController.m
//  Exilant Survey
//
//  Created by Suhas on 5/12/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import "ESQuestionViewController.h"
#import "ESQuestionFactory.h"

@interface ESQuestionViewController ()

@end

@implementation ESQuestionViewController

@synthesize questionNumber = questionNumber_;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.questionNumber = nil;
    
    [_questionField release];
    [_optionsView release];
    [_backgroundImageView release];
    [super dealloc];
}

-(void)prepareWithQuestionAndOptionsForDetails:(NSDictionary *)inDetailsDictionary usingFont:(UIFont *)inFont andFontColor:(UIColor *)inFontColor
{
    UIView *view = [ESQuestionFactory questionViewForDetails:inDetailsDictionary];
    
    view.frame = CGRectMake(400, 250, 500, 500);
    
    self.view.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 40);
    
    [self.view addSubview:view];
    
    self.questionField.font = inFont;
    
    self.questionField.textColor = inFontColor;
    
    self.questionField.text = [inDetailsDictionary valueForKey:@"Question"];
}
@end
