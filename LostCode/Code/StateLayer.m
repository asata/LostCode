//
//  StateLayer.m
//  LostCode
//
//  Created by Asata on 11. 7. 27..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "MainLayer.h"
#import "Character.h"
#import "Bar.h"

@implementation StateLayer
@synthesize c_name;

- (id)init {
    if ((self = [super init])) {
        [self printBackground];
        [self printLabel];
    }
    
    return self;
}

- (void) onEnterTransitionDidFinish {
    [self displayCharacterInfo];
}

- (void) dealloc {
    [super dealloc];
}

- (void) printBackground {
    CCSprite *bgSprite = [CCSprite spriteWithFile:@"state.jpg"];
    bgSprite.anchorPoint = CGPointZero;
    [bgSprite setPosition:ccp(0, 0)];
    [self addChild:bgSprite]; 
}

- (void) printLabel {
    self.c_name = [CCLabelTTF labelWithString:@"name"
                                     fontName:@"Arial"
                                     fontSize:18];
    self.c_name.position = ccp(50,50);
    [self addChild:self.c_name];
}

- (void) displayCharacterInfo {
    // 크리처 출력
    CCSprite *mon = [CCSprite spriteWithFile:character.char_img];
    mon.anchorPoint = CGPointZero;
    CGSize size = [[CCDirector sharedDirector] winSize];
    [mon setPosition:ccp(10, size.height / 2 - 20)];
    [self addChild:mon];
    
    self.c_name.color = ccc3(0, 0, 0);
    [self.c_name setString:character.name];
    
    Bar *power = [[Bar alloc] initWithMaxSize:CGSizeMake(200, 10) curValue:character.power maxValue:300];
    power.position = ccp(250, 260);
    [self addChild:power];
    [power release];
    
    Bar *quickness = [[Bar alloc] initWithMaxSize:CGSizeMake(200, 10) curValue:character.quickness maxValue:300];
    quickness.position = ccp(250, 230);
    [self addChild:quickness];
    [quickness release];
    
    Bar *strength = [[Bar alloc] initWithMaxSize:CGSizeMake(200, 10) curValue:character.strength maxValue:300];
    strength.position = ccp(250, 200);
    [self addChild:strength];
    [strength release];
    
    Bar *intelligent = [[Bar alloc] initWithMaxSize:CGSizeMake(200, 10) curValue:character.intelligent maxValue:300];
    intelligent.position = ccp(250, 170);
    [self addChild:intelligent];
    [intelligent release];
    
    Bar *fatigue = [[Bar alloc] initWithMaxSize:CGSizeMake(200, 10) curValue:character.fatigue maxValue:300];
    fatigue.position = ccp(250,140);
    [self addChild:fatigue];
    [fatigue release];
}
@end
