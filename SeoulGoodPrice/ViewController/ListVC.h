//
//  ListVC.h
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 21..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListCell.h"
#import "PriceData.h"

@interface ListVC : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *rcmnLabel;
@property (strong, nonatomic) IBOutlet UILabel *addrLabel;
@property NSInteger idx;

@property (strong, nonatomic) PriceData *priceData;
@property (strong, nonatomic) NSMutableArray *dataList;

@end
