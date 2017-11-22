//
//  InfoVC.h
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 22..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PriceData.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface InfoVC : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *addrLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;
@property (strong, nonatomic) IBOutlet UITextView *introTextView;

@property (strong, nonatomic) IBOutlet UITextView *infoTextView;
@property (strong, nonatomic) PriceData *priceData;
@end
