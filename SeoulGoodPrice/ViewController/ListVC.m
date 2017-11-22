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
    
    // 네비게이션 바 타이틀 설정
    [self.navigationItem setTitle:_barName];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    // 네비게이션 바 좌측 상단 버튼 추가.
    UIButton *topLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [topLeftBtn setFrame:CGRectMake(0, 0, 24, 24)];
    [topLeftBtn setImage:[UIImage imageNamed:@"ic_keyboard_arrow_left"] forState:UIControlStateNormal];
    [topLeftBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *topLeftBtnItem = [[UIBarButtonItem alloc]init];
    [topLeftBtnItem setCustomView:topLeftBtn];
    [self.navigationItem setLeftBarButtonItem:topLeftBtnItem];
    
    _priceData = [[PriceData alloc] init];
    _dataList = [NSMutableArray arrayWithArray:[_priceData getDataFromAPI:_code]];
    
    if(_dataList.count == 0){
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"알림"
                                              message:@"데이터가 존재하지 않습니다"
                                              preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertController animated:YES completion:nil];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alertController dismissViewControllerAnimated:YES completion:nil];
            [self.navigationController popViewControllerAnimated:YES];
        });
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backBtnAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) showMessage :(NSString*)msg {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"알림"
                                          message:msg
                                          preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alertController animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alertController dismissViewControllerAnimated:YES completion:nil];
    });
}

#pragma mark - Table View Controller Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.dicItem = [_dataList objectAtIndex:indexPath.row];
    [cell setCellData];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    InfoVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoVC"];
    vc.priceData = [_dataList objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:vc animated:true];
}


@end
