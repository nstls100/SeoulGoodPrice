//
//  CategoryCell.h
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 21..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;

@property (nonatomic) NSInteger idx;
@property (strong, nonatomic) NSDictionary *dicItem;

-(void)setCellData;

@end
