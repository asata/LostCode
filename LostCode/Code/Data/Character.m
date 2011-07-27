//
//  Character.m
//  LostCode
//
//  Created by Asata on 11. 7. 20..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Character.h"


@implementation Character
@synthesize name, char_img;
@synthesize level, power, quickness, strength, intelligent, fatigue;

- (id) init {
    if((self = [super init])) {
        name = nil;
        char_img = nil;
    }
    
    return self;
}

- (NSString*) getName {
    return name;
}

- (void) setName:(NSString *)p_name {
    name = p_name;
}

- (NSString*) getCharimg {
    return char_img;
}

- (void) setCharimg:(NSString *)p_img {
    char_img = p_img;
}

@end
