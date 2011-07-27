//
//  Bar.m
//  LostCode
//
//  Created by Asata on 11. 7. 25..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "Bar.h"

@implementation Bar


- (id) initWithMaxSize:(CGSize)size curValue:(CGFloat)curVal maxValue:(CGFloat)maxVal {
    if((self = [super init])) {
        self.anchorPoint = CGPointZero;
        
        maxSize = size;
        maxValue = maxVal;
        curValue = curVal;
    }
    
    return self;
}

- (void) draw {
    CGFloat width = maxSize.width * curValue / maxValue;
    
    glLineWidth(maxSize.height);
    glColor4ub(57, 248, 11, 255);
    ccDrawLine(ccp(0,0), ccp(width, 0));
}

- (void) updateBar:(CGFloat)curVal {
    curValue = curVal;
    
    if(curValue < 0)
        curValue = 0;
    else if(curValue > maxValue) 
        curValue = maxValue;
    
    [self draw];
}

@end
