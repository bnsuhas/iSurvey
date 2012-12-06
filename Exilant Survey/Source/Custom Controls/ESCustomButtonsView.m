//
//  ESCustomButtonsView.m
//  Exilant Survey
//
//  Created by Suhas on 4/12/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import "ESCustomButtonsView.h"
#import "ESRadioButtonBehavior.h"
#import "ESCheckBoxBehavior.h"

#define kButtonXOffset 10

#define kButtonYOffset 40

#define kButtonWidth 30

#define kButtonHeight 30

@implementation ESCustomButtonsView

@synthesize buttonBehavior = buttonBehavior_;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {

    }
    
    return self;
}

-(void)createCustomButtonsForOptions:(NSArray *)inOptionsArray isRadionButton:(BOOL)isRadioButton
{
    CGPoint buttonOrigin = CGPointMake(0, 0);
    
    int index = 0;
    
    for(NSString *option in inOptionsArray)
    {
        //Create button and set appropriate image.
        
        UIButton *customButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonOrigin.x+kButtonXOffset,
                                                                        buttonOrigin.y+kButtonYOffset,
                                                                        kButtonWidth, kButtonHeight)];
        
        [customButton setImage:[UIImage imageNamed:@"Radio Off"] forState:UIControlStateNormal];
        
        if(isRadioButton)
        {
            [customButton setImage:[UIImage imageNamed:@"Radio On"] forState:UIControlStateSelected];
            
            self.buttonBehavior = [[[ESRadioButtonBehavior alloc] init] autorelease];
        }
        
        else
        {
            [customButton setImage:[UIImage imageNamed:@"Check Box On"] forState:UIControlStateSelected];
            
            self.buttonBehavior = [[[ESCheckBoxBehavior alloc] init] autorelease];
        }
        
        customButton.titleLabel.text = option;
        
        customButton.tag = index;
        
        [self addSubview:customButton];
        
        [customButton addTarget:self action:@selector(customButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        //Add label beside the button. This is also a button coz radio and check buttons accept clicks on labels also.
        
        UILabel *labelButton = [[UILabel alloc] initWithFrame:CGRectMake(buttonOrigin.x+kButtonXOffset+kButtonWidth+25,
                                                                           buttonOrigin.y+kButtonYOffset,
                                                                           100, kButtonHeight)];
        
        labelButton.text = option;
        
        labelButton.tag = index;
        
        [self addSubview:labelButton];
        
        buttonOrigin.y = customButton.frame.origin.y;
        
        index++;
    }
    
    self.frame = CGRectMake(0, 0, 600, buttonOrigin.y +kButtonYOffset);
}

-(IBAction)customButtonClicked:(id)sender
{
    UIView *superView = [sender superview];
    
    NSArray *arrayOfSubViews = [superView subviews];
    
    NSPredicate *buttonPredicate = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [UIButton class]];
    
    NSPredicate *subViewsPredicate = [NSPredicate predicateWithFormat:@"isSelected = %@",[NSNumber numberWithBool:YES]];
    
    [self.buttonBehavior userSelectedAnOption:sender previouslySelectedOptions:[[arrayOfSubViews filteredArrayUsingPredicate:buttonPredicate] filteredArrayUsingPredicate:subViewsPredicate]];
}

@end
