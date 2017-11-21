//
//  MainVC.h
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 21..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryCell.h"
#import "ListVC.h"

@interface MainVC : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *itemList;

@end
