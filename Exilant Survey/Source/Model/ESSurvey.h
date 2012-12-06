//
//  ESSurvey.h
//  Exilant Survey
//
//  Created by Suhas on 30/11/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESSurvey : NSObject <NSCoding>
{
    NSNumber *numberOfResponses_;
    
    NSNumber *numberOfCompletedSurveys_;
    
    NSNumber *numberOfIncompleteSurveys_;
    
    NSDictionary *surveyResponses_;
}

@property(nonatomic, retain) NSNumber *numberOfResponses;

@property(nonatomic, retain) NSNumber *numberOfCompletedSurveys;

@property(nonatomic, retain) NSNumber *numberOfIncompleteSurveys;

@property(nonatomic, retain) NSDictionary *surveyResponses;

@end
