//
//  Character.h
//  LostCode
//
//  Created by Asata on 11. 7. 20..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

// 크리처 정보
@interface Character : NSObject {
    NSString *name;         // 이름
    NSString *char_img;     // 이미지
    
    NSInteger level;        // 레벨
    NSInteger power;        // 힘
    NSInteger quickness;    // 민첩 
    NSInteger strength;     // 체력
    NSInteger intelligent;  // 지력
    NSInteger fatigue;      // 피로도
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *char_img;

@property (nonatomic, readwrite) NSInteger level;
@property (nonatomic, readwrite) NSInteger power;
@property (nonatomic, readwrite) NSInteger quickness;
@property (nonatomic, readwrite) NSInteger strength;
@property (nonatomic, readwrite) NSInteger intelligent;
@property (nonatomic, readwrite) NSInteger fatigue;

- (NSString*) getName;
- (NSString*) getCharimg;

- (void) setName:(NSString *)p_name;
- (void) setCharimg:(NSString *)p_img;

@end
