//
//  MainLayer.h
//  LostCode
//
//  Created by Asata on 11. 7. 27..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "Character.h"
#import "EnumList.h"
#import "MemoryGameLayer.h"

#define WIN_WIDTH   480
#define WIN_HEIGHT  320

CGSize size;
Character *character;

// 로그인 화면
@interface LoginLayer : CCLayer {
}

- (void) printBackground;
- (void) printMenu;

- (void) joinCallBack:(id)sender;
- (void) loginCallBack:(id)sender;
@end



// 메인화면
@interface MainLayer : CCLayer {
}

- (void) getCharacterInfo;
- (void) printBackground;
- (void) printMenu;
- (void) printCharcher;

- (void) trainingCallBack:(id)sender;
- (void) explorationCallBack:(id)sender;
- (void) warCallBack:(id)sender;
- (void) stateCallBack:(id)sender;
- (void) kitlistCallBack:(id)sender;
@end



// 훈련
@interface TrainingLayer : CCLayer {
}

- (void) printBackground;
- (void) printMenu;

- (void) playMiniGame:(NSInteger)tag;

- (void) stateTrainingCallBack:(id)sender;
- (void) techniqueTrainingCallBack:(id)sender;
@end



// 크리처 정보
@interface StateLayer : CCLayer {
    CCLabelTTF *c_name;
}

@property (nonatomic, retain) CCLabelTTF *c_name;

- (void) printBackground;
- (void) printLabel;
- (void) displayCharacterInfo;
@end



////////////////////////
//      미니 게임       //
////////////////////////
@interface MemoryGameLayer : CCLayer {
    NSInteger question[MAX_NUM];    // 출제된 문제 기록
    
    Boolean touchInput;             // 사용자로부터 터치 입력을 막음
    Boolean questionEnable;         // 문제 출제 : YES, 정답 입력 : NO
    
    NSInteger level;                // 문제 난이도
    NSInteger questionNum;          // 출제 문제수 (문제 난이도 * 문제수)
    NSInteger point;                // 점수
    NSInteger combo;                // 연속으로 맞춘 횟수 
    NSInteger life;
    
    CCLabelTTF *scoreLabel;
    CCLabelTTF *lifeLabel;
    
    CCLabelTTF *label;
    
    CCSprite *button1;
    CCSprite *button2;
    CCSprite *button3;
    CCSprite *button4;
}

@property (nonatomic, retain) CCLabelTTF *scoreLabel;
@property (nonatomic, retain) CCLabelTTF *lifeLabel;
@property (nonatomic, retain) CCLabelTTF *label;

@property (nonatomic, retain) CCSprite *button1;
@property (nonatomic, retain) CCSprite *button2;
@property (nonatomic, retain) CCSprite *button3;
@property (nonatomic, retain) CCSprite *button4;

- (void) initGame;

- (void) createBackground;
- (void) createButton;
- (void) createLabel;

- (void) displayScore;
- (void) displayLife;

- (Boolean) AnswerCheck:(int)i_answer;

- (void) correctAnswer;
- (void) incorrectAnswer;


- (void) endGame;
@end
