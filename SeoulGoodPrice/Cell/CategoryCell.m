//
//  CategoryCell.m
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 21..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell

-(void) setCellData{
    _typeLabel.text = [_dicItem objectForKey:@"name"];
    _imgView.image = [UIImage imageNamed:[_dicItem objectForKey:@"image"]];
}

@end
