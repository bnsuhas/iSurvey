//
//  ESQuestionViewController.h
//  Exilant Survey
//
//  Created by Suhas on 5/12/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESQuestionViewController : UIViewController
{
    NSNumber *questionNumber_;
}

@property (retain, nonatomic) NSNumber *questionNumber;

@property (retain, nonatomic) IBOutlet UITextView *questionField;

@property (retain, nonatomic) IBOutlet UIView *optionsView;

@property (retain, nonatomic) IBOutlet UIImageView *backgroundImageView;

-(void)prepareWithQuestionAndOptionsForDetails:(NSDictionary *)inDetailsDictionary usingFont:(UIFont *)inFont andFontColor:(UIColor *)inFontColor;

@end
