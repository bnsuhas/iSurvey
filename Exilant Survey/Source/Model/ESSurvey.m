//
//  ESSurvey.m
//  Exilant Survey
//
//  Created by Suhas on 30/11/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import "ESSurvey.h"

const NSString *kNumberOfResponses = @"numberOfResponses";

const NSString *kNumberOfCompletedSurveys = @"numberOfCompletedSurveys";

const NSString *kNumberOfIncompleteSurveys = @"numberOfIncompleteSurveys";

const NSString *kSurveyResponses = @"surveyResponses";

@implementation ESSurvey

@synthesize numberOfResponses = numberOfResponses_;

@synthesize numberOfCompletedSurveys = numberOfCompletedSurveys_;

@synthesize numberOfIncompleteSurveys = numberOfIncompleteSurveys_;

@synthesize surveyResponses = surveyResponses_;

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if(nil != self)
    {
        self.numberOfResponses = [aDecoder decodeObjectForKey:(NSString *)kNumberOfResponses];
        
        self.numberOfCompletedSurveys = [aDecoder decodeObjectForKey:(NSString *)kNumberOfCompletedSurveys];
        
        self.numberOfIncompleteSurveys = [aDecoder decodeObjectForKey:(NSString *)kNumberOfIncompleteSurveys];
        
        self.surveyResponses = [aDecoder decodeObjectForKey:(NSString *)kSurveyResponses];
    }
    
    return self;
}

-(void)dealloc
{
    self.numberOfResponses = nil;
    
    self.numberOfCompletedSurveys = nil;
    
    self.numberOfIncompleteSurveys = nil;
    
    self.surveyResponses = nil;
    
    [super dealloc];
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.numberOfResponses forKey:(NSString *)kNumberOfResponses];
    
    [aCoder encodeObject:self.numberOfCompletedSurveys forKey:(NSString *)kNumberOfCompletedSurveys];
    
    [aCoder encodeObject:self.numberOfIncompleteSurveys forKey:(NSString *)kNumberOfIncompleteSurveys];
    
    [aCoder encodeObject:self.surveyResponses forKey:(NSString *)kSurveyResponses];
}

@end
