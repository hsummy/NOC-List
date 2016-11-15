//
//  NOC.m
//  NOC-List
//
//  Created by HSummy on 11/11/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

#import "NOCAgent.h"

@implementation NOCAgent

+ (NOCAgent *)nocAgentWithDictionary:(NSDictionary *)nocAgentDictionary




{
    NOCAgent *anItem = nil;
    if (nocAgentDictionary)
    {
        anItem = [[NOCAgent alloc] init];
        anItem.coverName = nocAgentDictionary[@"coverName"];
        anItem.realName = nocAgentDictionary[@"realName"];
        anItem.accessLevel = [nocAgentDictionary[@"accessLevel"] integerValue];
    }
    
    return anItem;
    
}

@end
