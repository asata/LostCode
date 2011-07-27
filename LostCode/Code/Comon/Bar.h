//
//  Bar.h
//  LostCode
//
//  Created by Asata on 11. 7. 25..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface Bar : CCNode {
    CGFloat maxValue;
    CGFloat curValue;
    
    CGSize maxSize;
}

- (id) initWithMaxSize:(CGSize)size curValue:(CGFloat)curVal maxValue:(CGFloat)maxVal;
- (void) updateBar:(CGFloat)curVal;

@end
