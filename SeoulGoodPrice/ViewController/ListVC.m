//
//  ListVC.m
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 21..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "ListVC.h"

@interface ListVC ()

@end

@implementation ListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _priceData = [[PriceData alloc] init];
    _dataList = [NSMutableArray arrayWithArray:[_priceData getDataFromAPI]];
    
    NSLog(@"%@", _dataList);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Controller Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.idx = indexPath.row;
    cell.dicItem = [_dataList objectAtIndex:indexPath.row];
    
    [cell setCellData];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
