//
//  PriceData.m
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 21..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "PriceData.h"

@implementation PriceData

- (id)initWidthJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        _shId = [jsonDictionary objectForKey:@"SH_ID"];
        _shName = [jsonDictionary objectForKey:@"SH_NAME"];
        _indutyCodeSe = [jsonDictionary objectForKey:@"INDUTY_CODE_SE"];
        _indutyCodeName = [jsonDictionary objectForKey:@"INDUTY_CODE_SE_NAME"];
        _shAddr = [jsonDictionary objectForKey:@"SH_ADDR"];
        _shPhone = [jsonDictionary objectForKey:@"SH_PHONE"];
        _shWay = [jsonDictionary objectForKey:@"SH_WAY"];
        _shInfo = [jsonDictionary objectForKey:@"SH_INFO"];
        _shPride= [jsonDictionary objectForKey:@"SH_PRIDE"];
        _shRcmn = [jsonDictionary objectForKey:@"SH_RCMN"];
        _shPhoto = [jsonDictionary objectForKey:@"SH_PHOTO"];
        _baseYm = [jsonDictionary objectForKey:@"BASE_YM"];
    }
    
    return self;
}

- (NSArray *) getDataFromAPI
{
    NSString *url = @"http://openapi.seoul.go.kr:8088";
    NSString *key = @"6f4a4471636e737439366c42446d66";
    NSString *type = @"json";
    NSString *serviceName = @"ListPriceModelStoreService";
    NSInteger startIndex = _curIndex;
    NSInteger endIndex = _curIndex + 10;
    _curIndex += 11;
    
    NSString *inputUrl = [NSString stringWithFormat: @"%@/%@/%@/%@/%ld/%ld", url, key, type, serviceName, startIndex, (long)endIndex];
    
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:inputUrl]];
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if(json != nil){
        NSMutableDictionary *listPMSS = [json valueForKey: @"ListPriceModelStoreService"];
        NSArray *row = [listPMSS valueForKey: @"row"];
        
        NSMutableArray *lists = [[NSMutableArray alloc]init];
        
        for(NSDictionary *dict in row){
            PriceData *list = [[PriceData alloc]initWidthJSONDictionary:dict];
            [lists addObject:list];
        }
        
        return lists;
    }
    
    return nil;
}


@end
