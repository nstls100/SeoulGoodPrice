//
//  InfoVC.m
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 22..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "InfoVC.h"

@interface InfoVC ()

@end

@implementation InfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 네비게이션 바 타이틀 설정
    [self.navigationItem setTitle:_priceData.shName];
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
    
    [self setImage];
    [self setLabel];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backBtnAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setImage {
    NSCharacterSet *allowedCharacterSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSURL *imageURL = [NSURL URLWithString:[_priceData.shPhoto stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet]];
    [_imgView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"NoImage"]];
}

-(void)setLabel {
    _addrLabel.text = _priceData.shAddr;
    _phoneLabel.text = _priceData.shPhone;
    _introTextView.text = _priceData.shPride;
    _infoTextView.text = _priceData.shInfo;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
