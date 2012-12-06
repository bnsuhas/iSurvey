//
//  ESCustomButtonBehavior.h
//  Exilant Survey
//
//  Created by Suhas on 4/12/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESCustomButtonBehavior : NSObject

-(void)userSelectedAnOption:(UIButton *)inSender previouslySelectedOptions:(NSArray *)inPreviouslySelectedOptions;

@end
