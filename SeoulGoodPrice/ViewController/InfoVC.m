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
    
    NSDictionary *underlineAttribute = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
    _addrLabel.attributedText = [[NSAttributedString alloc] initWithString:_priceData.shAddr
                                                                    attributes:underlineAttribute];
    
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTappedOnLink:)];
    
    [_addrLabel setUserInteractionEnabled:YES];
    [_addrLabel addGestureRecognizer:gesture];
    
    _phoneLabel.attributedText = [[NSAttributedString alloc] initWithString:_priceData.shPhone
                                                                     attributes:underlineAttribute];
    
    _introTextView.text = _priceData.shPride;
    _infoTextView.text = _priceData.shInfo;
}

- (void)userTappedOnLink:(UIGestureRecognizer*)gestureRecognizer
{
    CLLocationCoordinate2D location = [self getLocationFromAddr];
    
    if(location.latitude != 0.0 && location.longitude != 0.0) {
        
        MapVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MapVC"];
        vc.lat = location.latitude;
        vc.lng = location.longitude;
        vc.markTitle = _priceData.shName;
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (CLLocationCoordinate2D) getLocationFromAddr
{
    CLLocationCoordinate2D locations = CLLocationCoordinate2DMake(0.0, 0.0);
    
    NSString *url = @"https://maps.google.com/maps/api/geocode/json?address=";
    NSString *key = @"AIzaSyDAAplm48lQh330jJ_WLUpIl5kzyAFwsSA";
    
    NSString *inputUrl = [NSString stringWithFormat: @"%@%@&sensor=true&key=%@", url, _priceData.shAddr, key];
    
    NSError *error;
    NSCharacterSet *allowedCharacterSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:[inputUrl stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet]]];
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if(json != nil && ![[json valueForKey:@"status"]isEqualToString:@"ZERO_RESULTS"]){
        NSArray *results = [json valueForKey: @"results"];
        NSArray *items = [results objectAtIndex:0];
        NSArray *geometry = [items valueForKey:@"geometry"];
        NSArray *location = [geometry valueForKey:@"location"];
        
        locations.latitude = [[location valueForKey:@"lat"] doubleValue];
        locations.longitude = [[location valueForKey:@"lng"] doubleValue];
        
        NSLog(@"lat = %lf , lng = %lf", locations.latitude, locations.longitude);
    }else{
        NSString *alertTitle = @"오류";
        NSString *alertMessage = @"위치를 찾을수 없습니다.";
        NSString *alertOkButtonText = @"확인";
        
        if ([UIAlertController class] == nil) {
            //[UIAlertController class] returns nil on iOS 7 and older. You can use whatever method you want to check that the system version is iOS 8+
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:alertTitle
                                                  message:alertMessage
                                                  preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alertController animated:YES completion:nil];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [alertController dismissViewControllerAnimated:YES completion:nil];
            });

        }
        else {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle
                                                                                     message:alertMessage
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            //We add buttons to the alert controller by creating UIAlertActions:
            UIAlertAction *actionOk = [UIAlertAction actionWithTitle:alertOkButtonText
                                                               style:UIAlertActionStyleDefault
                                                             handler:nil]; //You can use a block here to handle a press on this button
            [alertController addAction:actionOk];
            [self presentViewController:alertController animated:YES completion:nil];
        }    }
    
    return locations;
}

@end
