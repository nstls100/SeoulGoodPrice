//
//  ListCell.h
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 21..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PriceData.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *rcmnLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property NSInteger idx;
@property (strong, nonatomic) PriceData *dicItem;

-(void) setCellData;
@end
