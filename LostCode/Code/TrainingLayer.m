//
//  TrainingLayer.m
//  LostCode
//
//  Created by Asata on 11. 7. 28..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "MainLayer.h"

@implementation TrainingLayer

- (id)init {
    if ((self = [super init])) {  
        [self printBackground];
        [self printMenu]; 
    }
    
    return self;
}

- (void) dealloc {
    [super dealloc];
}

- (void) printBackground {
    CCSprite *traingBgSprite = [CCSprite spriteWithFile:@"training_background1.jpg"];
    traingBgSprite.anchorPoint = CGPointZero;
    [traingBgSprite setPosition:ccp(0, 0)];
    [self addChild:traingBgSprite]; 
}

- (void) printMenu {
    // 스탯 훈련 메뉴
    [CCMenuItemFont setFontName:@"Marker Felt"];
    [CCMenuItemFont setFontSize:34]; 
    CCMenuItemToggle *stateItem1 = [CCMenuItemToggle itemWithTarget:self
                                                           selector:@selector(stateTrainingCallBack:)
                                                              items:[CCMenuItemFont itemFromString:@"힘"], nil];
    CCMenuItemToggle *stateItem2 = [CCMenuItemToggle itemWithTarget:self
                                                           selector:@selector(stateTrainingCallBack:)
                                                              items:[CCMenuItemFont itemFromString:@"민첩"], nil];
    CCMenuItemToggle *stateItem3 = [CCMenuItemToggle itemWithTarget:self
                                                           selector:@selector(stateTrainingCallBack:)
                                                              items:[CCMenuItemFont itemFromString:@"지력"], nil];
    CCMenuItemToggle *stateItem4 = [CCMenuItemToggle itemWithTarget:self
                                                           selector:@selector(stateTrainingCallBack:)
                                                              items:[CCMenuItemFont itemFromString:@"체력"], nil];
    stateItem1.tag = ST_POWER;
    stateItem2.tag = ST2_QUICKNESS;
    stateItem3.tag = ST3_INTELLIGENT;
    stateItem4.tag = ST4_STRENGTH;
    CCMenu *stateTrainingMenu = [CCMenu menuWithItems:stateItem1, stateItem2, stateItem3, stateItem4, nil];
    stateTrainingMenu.position = ccp(120, 160);
    [stateTrainingMenu alignItemsVerticallyWithPadding:20];
    [self addChild:stateTrainingMenu];
    
    // 기술 훈련 메뉴
    // 훈련 가능한 기술 목록을 보여줌
    [CCMenuItemFont setFontName:@"Marker Felt"];
    [CCMenuItemFont setFontSize:34];
    CCMenuItemToggle *techniqueItem1 = [CCMenuItemToggle itemWithTarget:self
                                                               selector:@selector(techniqueTrainingCallBack:)
                                                                  items:[CCMenuItemFont itemFromString:@"때리기"], nil];
    CCMenuItemToggle *techniqueItem2 = [CCMenuItemToggle itemWithTarget:self
                                                               selector:@selector(techniqueTrainingCallBack:)
                                                                  items:[CCMenuItemFont itemFromString:@"들기"], nil];
    CCMenuItemToggle *techniqueItem3 = [CCMenuItemToggle itemWithTarget:self
                                                               selector:@selector(techniqueTrainingCallBack:)
                                                                  items:[CCMenuItemFont itemFromString:@"굶기기"], nil];
    CCMenuItemToggle *techniqueItem4 = [CCMenuItemToggle itemWithTarget:self
                                                               selector:@selector(techniqueTrainingCallBack:)
                                                                  items:[CCMenuItemFont itemFromString:@"숨기"], nil];
    CCMenuItemToggle *techniqueItem5 = [CCMenuItemToggle itemWithTarget:self
                                                               selector:@selector(techniqueTrainingCallBack:)
                                                                  items:[CCMenuItemFont itemFromString:@"패기"], nil];
    CCMenu *techniqueTrainingMenu = [CCMenu menuWithItems:techniqueItem1, techniqueItem2, techniqueItem3, techniqueItem4, techniqueItem5, nil];
    techniqueTrainingMenu.position = ccp(360, 160);
    [techniqueTrainingMenu alignItemsVerticallyWithPadding:15];
    [self addChild:techniqueTrainingMenu];
}

- (void) stateTrainingCallBack:(id)sender {
    NSLog(@"스탯훈련");
    
    NSInteger stateTag = [sender tag];
    [self playMiniGame:stateTag];
}

- (void) techniqueTrainingCallBack:(id)sender {
    NSLog(@"기술훈련");
}

- (void) playMiniGame:(NSInteger)tag {
    // 랜덤으로 미니 게임 실행~
    // 테스트차 현재는 선택한 스탯에 따라 훈련 진행
    //PrintMemoryGame
    if(tag == ST_POWER) {
        [(CCLayerMultiplex*)parent_ switchTo:PrintMemoryGame];
    } else if(tag == ST2_QUICKNESS) {
        NSLog(@"민첩");
    } else if(tag == ST3_INTELLIGENT) {
        NSLog(@"지력");
    } else if(tag == ST4_STRENGTH) {
        NSLog(@"체력");
    }
}
@end
