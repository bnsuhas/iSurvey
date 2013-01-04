//
//  ESOptionsTableViewCell.h
//  Exilant Survey
//
//  Created by Suhas on 21/12/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESOptionsTableViewCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UIButton *selectionButton;

@property (retain, nonatomic) IBOutlet UITextField *optionTitle;

- (IBAction)optionSelected:(id)sender;

@end
