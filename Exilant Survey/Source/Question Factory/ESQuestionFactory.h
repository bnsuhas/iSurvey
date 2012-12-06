//
//  ESQuestionFactory.h
//  Exilant Survey
//
//  Created by Suhas on 3/12/12.
//  Copyright (c) 2012 Exilant Technologies Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESQuestionFactory : NSObject

+(UIView *)questionViewForDetails:(NSDictionary *)inQuestionDetailsDictionary;

@end
