//
//  ListCell.m
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 21..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setCellData{
    NSCharacterSet *allowedCharacterSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSURL *imageURL = [NSURL URLWithString:[_dicItem.shPhoto stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet]];
    
    [_imgView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"NoImage"]];
    _titleLabel.text = _dicItem.shName;
    _rcmnLabel.text = [NSString stringWithFormat:@"%@",_dicItem.shRcmn];
    _addressLabel.text = _dicItem.shAddr;
}

@end
