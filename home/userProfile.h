//
//  userProfile.h
//  home
//
//  Created by Junsu Kim on 4/25/16.
//  Copyright © 2016 Junsu Kim. All rights reserved.
//

#import <Realm/Realm.h>

@interface userProfile : RLMObject
@property NSString* name;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<userProfile>
RLM_ARRAY_TYPE(userProfile)

@implementation userProfile

@end