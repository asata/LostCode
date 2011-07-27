//
//  MainLayer.h
//  LostCode
//
//  Created by Asata on 11. 7. 27..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "Character.h"

#define WIN_WIDTH   480
#define WIN_HEIGHT  320

CGSize size;
Character *character;


// 로그인 화면
@interface LoginLayer : CCLayer {

    
}

- (void) printLogin;

- (void) joinCallBack: (id) sender;
- (void) loginCallBack: (id) sender;
@end

// 메인화면
@interface MainLayer : CCLayer {
    CCMenuItem* menu01;
    CCMenuItem* menu02;
    CCMenuItem* menu03;
    CCMenuItem* menu04;
    CCMenuItem* menu05;
}

- (void) getCharacterInfo;
- (void) printBackground;
- (void) printMenu;
- (void) printCharcher;
@end
