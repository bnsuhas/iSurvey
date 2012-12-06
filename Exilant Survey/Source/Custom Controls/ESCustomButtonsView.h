//
//  ESCustomButtonsView.h
//  Exilant Survey
//
//  Created by Suhas on 4/12/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESCustomButtonBehavior.h"

@interface ESCustomButtonsView : UIView
{
    ESCustomButtonBehavior *buttonBehavior_;
}

@property(nonatomic, retain) ESCustomButtonBehavior *buttonBehavior;

-(void)createCustomButtonsForOptions:(NSArray *)inOptionsArray isRadionButton:(BOOL)isRadioButton;

@end
