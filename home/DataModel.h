//
//  DataModel.h
//  home
//
//  Created by Junsu Kim on 4/25/16.
//  Copyright © 2016 Junsu Kim. All rights reserved.
//

#import <Realm/Realm.h>

@interface Users : RLMObject
@property NSString* name;
//@property RLMArray<Stylists*><Stylists>*myHistory;
//***type relationship problem.
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Users>
RLM_ARRAY_TYPE(Users)

@interface Stylists : RLMObject
@property NSString* name;
@property NSString* biography;
@property NSData* photo;
@property RLMArray<Users*><Users>*followers;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Stylists>
RLM_ARRAY_TYPE(Stylists)