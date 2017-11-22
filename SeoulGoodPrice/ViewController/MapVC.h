//
//  MapVC.h
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 22..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NMapViewerSDK/NMapViewerSDK.h>
#import "NMapViewResources.h"

#define apiKey @"rIZFgx1X8QroWpFtkQMK"

@interface MapVC : UIViewController<NMapViewDelegate, NMapPOIdataOverlayDelegate>

@property (nonatomic) double lat;
@property (nonatomic) double lng;
@property (strong, nonatomic) IBOutlet UILabel *calloutLabel;
@property (strong, nonatomic) IBOutlet UIView *calloutView;
@property (nonatomic, strong) NMapView *mapView;
@property (nonatomic, copy) NSString *markTitle;

@end
