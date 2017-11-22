//
//  MainVC.m
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 21..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 네비게이션 바 타이틀 설정
    [self.navigationItem setTitle:@"카테고리"];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    // 콜렉션뷰 데이터 세팅
    NSDictionary *item1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"한식", @"name", @"koreanFood.png", @"image", @"001", @"code", nil];
    NSDictionary *item2 = [[NSDictionary alloc]initWithObjectsAndKeys:@"중식", @"name", @"chinsesFood.jpg", @"image",@"002", @"code", nil];
    NSDictionary *item3 = [[NSDictionary alloc]initWithObjectsAndKeys:@"일식", @"name", @"japaneseFood.jpg", @"image",@"003", @"code", nil];
    NSDictionary *item4 = [[NSDictionary alloc]initWithObjectsAndKeys:@"기타외식업", @"name", @"otherFood.png", @"image",@"004", @"code", nil];
    NSDictionary *item5 = [[NSDictionary alloc]initWithObjectsAndKeys:@"이 미용업", @"name", @"beautyParlor.jpg", @"image", @"005", @"code",nil];
    NSDictionary *item6 = [[NSDictionary alloc]initWithObjectsAndKeys:@"목욕업", @"name", @"bathHouse.jpg", @"image",@"006", @"code", nil];
    NSDictionary *item7 = [[NSDictionary alloc]initWithObjectsAndKeys:@"세탁업", @"name", @"washHouse.jpg", @"image", @"007", @"code",nil];
    NSDictionary *item8 = [[NSDictionary alloc]initWithObjectsAndKeys:@"숙박업", @"name", @"stayHouse.jpg", @"image",@"008", @"code", nil];
    NSDictionary *item9 = [[NSDictionary alloc]initWithObjectsAndKeys:@"영화관람", @"name", @"theater.png", @"image", @"009", @"code",nil];
    NSDictionary *item10 = [[NSDictionary alloc]initWithObjectsAndKeys:@"VTR대여", @"name", @"vtrHouse.JPG", @"image", @"010", @"code",nil];
    NSDictionary *item11 = [[NSDictionary alloc]initWithObjectsAndKeys:@"노래방", @"name", @"singHouse.jpg", @"image", @"011", @"code",nil];
    NSDictionary *item12 = [[NSDictionary alloc]initWithObjectsAndKeys:@"수영장/볼링장/\n당구장/골프연습장", @"name", @"otherSports.jpg", @"image", @"012", @"code",nil];
    NSDictionary *item13 = [[NSDictionary alloc]initWithObjectsAndKeys:@"기타서비스업", @"name", @"etcServices.jpg", @"image",@"013", @"code", nil];
    
    _itemList = [[NSArray alloc] initWithObjects:item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
#pragma mark - 콜렉션뷰 델리킷
    
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _itemList.count;
}
    
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"rowCell" forIndexPath:indexPath];
    
    cell.layer.borderWidth = 1.0f;
    cell.layer.borderColor = [UIColor grayColor].CGColor;
    cell.layer.cornerRadius = 8;

    cell.idx = indexPath.row;
    cell.dicItem = [_itemList objectAtIndex:indexPath.row];
    
    [cell setCellData];
    
    return cell;
}
    
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.bounds.size.width / 2 - 1.0, self.collectionView.bounds.size.width / 2 -1);
}
    
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    // 컬렉션 뷰 위, 아래 그림의 여백
    return 2.0;
}
    
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    // 컬렉션 뷰 양 옆 사이 여백
    return 1.0;
}
    
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dicItem = [_itemList objectAtIndex:indexPath.row];
    ListVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ListVC"];
    vc.code = [dicItem objectForKey:@"code"];
    vc.barName = [dicItem objectForKey:@"name"];
    vc.tableCount = 0;
    [self.navigationController pushViewController:vc animated:true];
}

@end
