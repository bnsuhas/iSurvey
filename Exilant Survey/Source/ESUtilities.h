//
//  ESUtilities.h
//  Exilant Survey
//
//  Created by Suhas on 6/12/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    eMultipleOptionSingleChoice = 0,
    eMultipleOptionMultipleChoice,
    eTextInput
}EESQuestionTypes;

@interface ESUtilities : NSObject

+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end
