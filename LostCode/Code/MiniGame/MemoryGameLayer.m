//
//  MemoryLayer.m
//  LostCode
//
//  Created by Asata on 11. 7. 28..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "MainLayer.h"
#import "MemoryGameLayer.h"

@implementation MemoryGameLayer
@synthesize scoreLabel, lifeLabel, label;
@synthesize button1, button2, button3, button4;

- (id)init {
    if (self = [super init]) {
        self.isTouchEnabled = YES;
    }
    
    return self;
}

- (void) onEnterTransitionDidFinish {
    [self initGame];
    
    [self createBackground];
    [self createButton];
    [self createLabel];
}

- (void) initGame {
    for(int i = 0; i < MAX_NUM; i++) {
        question[i] = 0;
    }
    
    level = character.level;
    questionEnable = YES;    
    touchInput = NO;
    life = 3;
    point = 0;
    
    [label setVisible:YES];
    
    [self displayLife];
    [self displayScore];
}

- (void) createBackground {
    // 배경 화면 출력
    CCSprite *bgSprite = [CCSprite spriteWithFile:@"state.jpg"];
    bgSprite.anchorPoint = CGPointZero;
    [bgSprite setPosition:ccp(0,0)];
    [self addChild:bgSprite]; 
}

- (void) createButton {
    CCSprite *sprite = [[CCSprite alloc] initWithFile:@"icon.png"];
    self.button1 = sprite;
    self.button1.position = ccp(110 + self.button1.contentSize.width / 2, self.button1.contentSize.height / 2 + 40);
    [self addChild:self.button1];
    [sprite release];
    
    sprite = [[CCSprite alloc] initWithFile:@"icon.png"];
    self.button2 = sprite;
    self.button2.position = ccp(180 + self.button1.contentSize.width / 2, self.button1.contentSize.height / 2 + 40);
    [self addChild:self.button2];
    [sprite release];
    
    sprite = [[CCSprite alloc] initWithFile:@"icon.png"];
    self.button3 = sprite;
    self.button3.position = ccp(250 + self.button1.contentSize.width / 2, self.button1.contentSize.height / 2 + 40);
    [self addChild:self.button3];
    [sprite release];
    
    sprite = [[CCSprite alloc] initWithFile:@"icon.png"];
    self.button4 = sprite;
    self.button4.position = ccp(320 + self.button1.contentSize.width / 2, self.button1.contentSize.height / 2 + 40);
    [self addChild:self.button4];
    [sprite release];
}

- (void) createLabel {
    self.label = [CCLabelTTF labelWithString:@"Touch Screen" fontName:@"Marker Felt" fontSize:60];
    self.label.position =  ccp( size.width / 2 , size.height / 2 );
    [self addChild: label];
    
    self.scoreLabel = [CCLabelTTF labelWithString:@"Score : 0"
                                         fontName:@"Arial"
                                         fontSize:18];
    self.scoreLabel.position = ccp(50, size.height - 20);
    [self addChild:self.scoreLabel];
    
    
    self.lifeLabel = [CCLabelTTF labelWithString:@"Life : 3"
                                        fontName:@"Arial"
                                        fontSize:18];
    self.lifeLabel.position = ccp(450, size.height - 20);
    [self addChild:self.lifeLabel];
}

- (void) displayScore {
    NSString *scroeStr = [[ NSString alloc] initWithFormat:@"Score : %d", point];
    [self.scoreLabel setString:scroeStr];
    [scroeStr release];
}

- (void) displayLife {
    NSString *lifeStr = [[ NSString alloc] initWithFormat:@"Life : %d", life];
    [self.lifeLabel setString:lifeStr];
    [lifeStr release];
    
}

- (BOOL) isTouchInside:(CCSprite*)sprite withTouch:(UITouch*)touch {
    CGPoint location = [touch locationInView:[touch view]];
    
    CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    CGFloat halfWidth = sprite.contentSize.width / 2.0;
    CGFloat halfHeight = sprite.contentSize.height / 2.0;
    
    if(convertedLocation.x > (sprite.position.x + halfWidth) ||
       convertedLocation.x < (sprite.position.x - halfWidth) ||
       convertedLocation.y < (sprite.position.y - halfHeight) ||
       convertedLocation.y > (sprite.position.y + halfHeight)) {
        return NO;
    }
    
    return YES;
}

- (void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    if(touchInput) return;
    
    if([self isTouchInside:self.button1 withTouch:touch] == YES && !questionEnable) {
        NSLog(@"버튼 1 선택 ");  
        if([self AnswerCheck:1]) [self correctAnswer];
        else [self incorrectAnswer];
    } else if([self isTouchInside:self.button2 withTouch:touch] == YES && !questionEnable) {
        NSLog(@"버튼 2 선택 ");
        if([self AnswerCheck:2]) [self correctAnswer];
        else [self incorrectAnswer];
    } else if([self isTouchInside:self.button3 withTouch:touch] == YES && !questionEnable) {
        NSLog(@"버튼 3 선택 ");
        if([self AnswerCheck:3]) [self correctAnswer];
        else [self incorrectAnswer];
    } else if([self isTouchInside:self.button4 withTouch:touch] == YES && !questionEnable) {
        NSLog(@"버튼 4 선택 ");       
        if([self AnswerCheck:4]) [self correctAnswer];
        else [self incorrectAnswer];
    } else if(questionEnable) {
        questionEnable = !questionEnable;
        questionNum = 0;
        
        [label setVisible:NO];
        
        touchInput = !touchInput;   // 문제 출제 시간 동안 터치 이벤트 방지
		[self schedule:@selector(Question:) interval:1.0f];
    }
}

- (void) Question:(ccTime)deltaTime {
    int num = 0;
    
    while (1) {
        NSString* randSeed = [NSString stringWithFormat:@"%0.9f", [NSDate timeIntervalSinceReferenceDate]];
        randSeed = [randSeed substringFromIndex:10];
        srand([randSeed intValue]);
        num = rand() % 4 + 1;
        
        if(questionNum == 0) break;
        if(question[questionNum - 1] != num) break;
    }
    
    NSLog(@"%d", num);
    
    [button1 setVisible:NO];
    [button2 setVisible:NO];
    [button3 setVisible:NO];
    [button4 setVisible:NO];
    
    if(num == 1) {
        [button1 setVisible:YES];    
    } else if(num == 2) {
        [button2 setVisible:YES];
    }  else if(num == 3) {
        [button3 setVisible:YES];
    }  else if(num == 4) {
        [button4 setVisible:YES];
    } 
    
    question[questionNum] = num;
    questionNum++;
    
    // 마지막 문제는 버림 -> 표시가 되지 않는 문제로 인해 버림
    if(questionNum >= (level * Q_NUM) + 1) {
        [self unschedule:@selector(Question:)];
        
        //[NSThread sleepForTimeInterval:1];
        
        [button1 setVisible:YES];
        [button2 setVisible:YES];
        [button3 setVisible:YES];
        [button4 setVisible:YES];
        
        questionNum--;
        
        touchInput = !touchInput;   // 문제 출제 시간 동안 터치 이벤트 방지 해제
    }
}

// 정답 체크
- (Boolean) AnswerCheck:(int)i_answer {
    int q_num = (level * Q_NUM) - questionNum;
    Boolean result = NO;
    
    if(question[q_num] == i_answer)
        result = YES;    
    
    question[q_num] = 0;
    questionNum--;
    
    if(questionNum == 0) {
        questionEnable = !questionEnable;
        [label setVisible:YES];
    }
    
    return result;
}

- (void) correctAnswer {
    combo++;
    
    if(level == EASY) {
        point += POINT_EASY + (POINT_EASY * combo / 10);
    } else if(level == MIDDLE) {
        point += POINT_MIDDLE+ (POINT_MIDDLE * combo / 10);
    } else if(level == HIGH) { 
        point += POINT_HIGH+ (POINT_HIGH * combo / 10);
    }
    
    [self displayScore];
}

- (void) incorrectAnswer {
    life--;
    combo = 0;
    
    [self displayLife];
    if(life == 0) [self endGame];
}

- (void) dealloc {
    [button1 release];
    [button2 release];
    [button3 release];
    [button4 release];
    
    [super dealloc];
}

- (void) endGame {
    // 점수에 따라 스탯 증가
    
    // 게임 초기화 or 게임 결과 표시 후 종료
    [self initGame];
}

@end
