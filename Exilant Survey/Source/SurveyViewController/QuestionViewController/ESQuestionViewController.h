//
//  ESQuestionViewController.h
//  Exilant Survey
//
//  Created by Suhas on 5/12/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESQuestionViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextView *questionField;

@property (retain, nonatomic) IBOutlet UIView *optionsView;

@property (retain, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
