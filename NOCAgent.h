//
//  NOC.h
//  NOC-List
//
//  Created by HSummy on 11/11/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NOCAgent : NSObject

@property (nonatomic) NSString *realName;
@property (nonatomic) NSString *coverName;
@property (assign) NSInteger accessLevel;

+ (NOCAgent *)nocAgentWithDictionary:(NSDictionary *)nocAgentDictionary;

@end
