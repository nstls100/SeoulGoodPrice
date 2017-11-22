//
//  PriceData.h
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 21..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PriceData : NSObject

@property (strong, nonatomic) NSString *shId;      // 업소아이디
@property (strong, nonatomic) NSString *shName;    // 업소명
@property (strong, nonatomic) NSString *indutyCodeSe; // 분류코드
@property (strong, nonatomic) NSString *indutyCodeName ; // 분류코드명
@property (strong, nonatomic) NSString *shAddr;    // 업소 주소
@property (strong, nonatomic) NSString *shPhone;    // 업소 전화번호
@property (strong, nonatomic) NSString *shWay;      // 찾아오시는길
@property (strong, nonatomic) NSString *shInfo;     // 업소정보
@property (strong, nonatomic) NSString *shPride;   // 자랑거리
@property (strong, nonatomic) NSString *shRcmn;    // 추천수
@property (strong, nonatomic) NSString *shPhoto;    // 업소 사진
@property (strong, nonatomic) NSString *baseYm;    // 기준년월
@property (strong, nonatomic) NSString *thumbnailImage;  // 썸네일 이미지를 담을 UIimage
@property NSInteger curIndex;


- (NSArray *) getDataFromAPI :(NSString*)code;
@end
