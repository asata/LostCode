//
//  MainLayer.m
//  LostCode
//
//  Created by Asata on 11. 7. 27..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "MainLayer.h"
#import "Reachability.h"
#import "Character.h"

// 로그인 부분 출력
@implementation LoginLayer

- (id)init {
    if ((self = [super init])) {
        size = [[CCDirector sharedDirector] winSize];
        
        // 아이디 저장 여부 구분
        
        // 저장시 로그인 처리 부분으로 이동하여 로그인
        
        // 없을 경우 로그인 화면 출력
        [self printBackground];
        [self printMenu];
    }
    
    return self;
}

- (void) dealloc {
    [super dealloc];
}

- (void) printBackground {
    // 배경 출력
    CCSprite *bgSprite = [CCSprite spriteWithFile:@"login.jpg"];
    bgSprite.anchorPoint = CGPointZero;
    [bgSprite setPosition:ccp(0,0)];
    [self addChild:bgSprite];
}

- (void) printMenu {
    // 회원 가입 버튼
    CCMenuItem *menu01 = [CCMenuItemImage itemFromNormalImage:@"join_button.jpg" 
                                                selectedImage:@"join_button.jpg" 
                                                       target:self 
                                                     selector:@selector(joinCallBack:)];
    // 로그인 버튼
    CCMenuItem *menu02 = [CCMenuItemImage itemFromNormalImage:@"login_button.jpg" 
                                                selectedImage:@"login_button.jpg" 
                                                       target:self 
                                                     selector:@selector(loginCallBack:)];
    
    CCMenu *menu = [CCMenu menuWithItems:menu01, menu02, nil];
    [menu setPosition:ccp(size.width / 2, 60)];
    [menu alignItemsHorizontallyWithPadding:30];
    [self addChild:menu];
}

- (void) joinCallBack:(id)sender {
    NSLog(@"회원가입");
}

- (void) loginCallBack:(id)sender { 
    NSLog(@"로그인");
    
    // 네트워크 연결이 되었는지 확인
    NetworkStatus netStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    UIAlertView *alertView;
    //Character *character;
    
    switch (netStatus) {
        case NotReachable: 
            // 연결되지않음
            alertView = [[UIAlertView alloc] initWithTitle: @"Network Message"
                                                   message: @"서버와 연결할 수 없습니다."
                                                  delegate: self
                                         cancelButtonTitle: @"확인"
                                         otherButtonTitles: nil];  
            [alertView show];
            [alertView autorelease];
            break;
        case ReachableViaWWAN: 
        case ReachableViaWiFi: 
            // 로그인 검사 이상이 없을 경우 
            
            
            
            // 메인 화면으로 넘어감
            [(CCLayerMultiplex*)parent_ switchTo:PrintMain];
            break;       
    }
}

@end

// 메뉴 부분 출력
@implementation MainLayer

- (id)init {
    if ((self = [super init])) {
        [self printBackground];
        [self printMenu];   
        
    }
    
    return self;
}

- (void) onEnterTransitionDidFinish {
    [self getCharacterInfo];
    [self printCharcher]; 
}

- (void) dealloc {
    [super dealloc];
}

- (void) getCharacterInfo {
    character = [[Character alloc] init];
    character.name = @"아사타";
    character.char_img = @"1311075035_teddy_bear_toy_1.png";     // 이미지
    character.level = 1;            // 레벨
    character.power = 300;          // 힘
    character.quickness = 100;      // 민첩 
    character.strength = 290;       // 체력
    character.intelligent = 10;     // 지력
    character.fatigue = 260;        // 피로도
}

- (void) printBackground {
    CCSprite *bgSprite = [CCSprite spriteWithFile:@"1311075143_bedroom.png"];
    bgSprite.anchorPoint = CGPointZero;
    [bgSprite setPosition:ccp(20,0)];
    [self addChild:bgSprite z:0]; 
}

- (void) printMenu {
    // 훈련
    CCMenuItem *trainingMenu = [CCMenuItemImage itemFromNormalImage:@"menu01.jpg"
                                                      selectedImage:@"menu01.jpg"
                                                             target:self
                                                           selector:@selector(trainingCallBack:)];
    // 탐험
    CCMenuItem *explorationMenu = [CCMenuItemImage itemFromNormalImage:@"menu02.jpg"
                                                         selectedImage:@"menu02.jpg" 
                                                                target:self 
                                                              selector:@selector(explorationCallBack:)];
    // 대전
    CCMenuItem *warMenu = [CCMenuItemImage itemFromNormalImage:@"menu03.jpg" 
                                                 selectedImage:@"menu03.jpg" 
                                                        target:self 
                                                      selector:@selector(warCallBack:)];
    // 상태
    CCMenuItem *stateMenu = [CCMenuItemImage itemFromNormalImage:@"menu04.jpg" 
                                                   selectedImage:@"menu04.jpg" 
                                                          target:self
                                                        selector:@selector(stateCallBack:)];
    // 인벤토리
    CCMenuItem *kitlistMenu = [CCMenuItemImage itemFromNormalImage:@"menu05.jpg"
                                                     selectedImage:@"menu05.jpg"
                                                            target:self
                                                          selector:@selector(kitlistCallBack:)];
    
    CCMenu *mainMenu = [CCMenu menuWithItems:trainingMenu, explorationMenu, warMenu, stateMenu, kitlistMenu, nil];
    [mainMenu setPosition:ccp(410, WIN_HEIGHT / 2)];
    [mainMenu alignItemsVerticallyWithPadding:10.0f];
    [self addChild:mainMenu z:1];
}

- (void) printCharcher {
    CCSprite *mon = [CCSprite spriteWithFile:character.char_img];
    mon.anchorPoint = CGPointZero;
    [mon setPosition:ccp(size.width / 2 - 140, size.height / 2 - 68)];
    [self addChild:mon z:2];
}

- (void) trainingCallBack:(id)sender {
    NSLog(@"훈련");
    [(CCLayerMultiplex*)parent_ switchTo:PrintTraining];
}

- (void) explorationCallBack:(id)sender {
    NSLog(@"탐험");
}

- (void) warCallBack:(id)sender {
    NSLog(@"대전");
}

- (void) stateCallBack:(id)sender {
    NSLog(@"정보");
    [(CCLayerMultiplex*)parent_ switchTo:PrintState];
}

- (void) kitlistCallBack:(id)sender {
    NSLog(@"인벤토리");
}
@end
