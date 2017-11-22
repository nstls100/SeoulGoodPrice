//
//  MapVC.m
//  SeoulGoodPrice
//
//  Created by 이재홍 on 2017. 11. 22..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "MapVC.h"

@interface MapVC ()

@end

@implementation MapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView = [[NMapView alloc] initWithFrame:self.view.frame];
    self.navigationController.navigationBar.translucent = NO;
    
    // set the delegate for map view
    [self.mapView setDelegate:self];
    
    // set the application api key for Open MapViewer Library
    [self.mapView setClientId:apiKey];
    
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.mapView];
    [self createExitBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createExitBtn
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(340.0, 30.0, 25.0, 25.0);
    button.layer.cornerRadius = 0.5 * button.bounds.size.width;
    button.clipsToBounds = true;
    [button setTitle:@"X" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    
    [button addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)btnclick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) onMapView:(NMapView *)mapView initHandler:(NMapError *)error {
    if (error == nil) { // success
        // set map center and level
        [self.mapView setMapCenter:NGeoPointMake(self.lng, self.lat) atLevel:8];
        [self.mapView setMapEnlarged:YES mapHD:YES];
    } else { // fail
        NSLog(@"onMapView:initHandler: %@", [error description]);
    }
}

#pragma mark CustomMarkersMapViewController

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self addMarkers];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self clearOverlays];
    [self.mapView viewWillDisappear];
}

- (void) addMarkers {
    NMapOverlayManager *mapOverlayManager = [self.mapView mapOverlayManager];
    // create POI data overlay
    NMapPOIdataOverlay *poiDataOverlay = [mapOverlayManager newPOIdataOverlay];
    
    [poiDataOverlay initPOIdata:1];
    [poiDataOverlay addPOIitemAtLocation:NGeoPointMake(self.lng, self.lat) title:_markTitle type:UserPOIflagTypeDefault iconIndex:0 withObject:nil];
    [poiDataOverlay endPOIdata];
    
    // show all POI data
    [poiDataOverlay showAllPOIdata];
    
    [poiDataOverlay selectPOIitemAtIndex:0 moveToCenter:NO focusedBySelectItem:YES];
}

- (void)clearOverlays {
    NMapOverlayManager *mapOverlayManager = [self.mapView mapOverlayManager];
    [mapOverlayManager clearOverlays];
}

#pragma mark NMapPOIdataOverlayDelegate

- (UIImage *) onMapOverlay:(NMapPOIdataOverlay *)poiDataOverlay imageForOverlayItem:(NMapPOIitem *)poiItem selected:(BOOL)selected {
    return [NMapViewResources imageWithType:poiItem.poiFlagType selected:selected];
}

- (CGPoint) onMapOverlay:(NMapPOIdataOverlay *)poiDataOverlay anchorPointWithType:(NMapPOIflagType)poiFlagTyp{
    return [NMapViewResources anchorPoint:poiFlagTyp];
}

- (UIView *)onMapOverlay:(NMapPOIdataOverlay *)poiDataOverlay viewForCalloutOverlayItem:(NMapPOIitem *)poiItem
         calloutPosition:(CGPoint *)calloutPosition
{
    calloutPosition->x = roundf((self.calloutView.bounds.size.width)/2) + 1;
    self.calloutLabel.text = poiItem.title;
    return self.calloutView;
}

- (UIImage*) onMapOverlay:(NMapPOIdataOverlay *)poiDataOverlay imageForCalloutOverlayItem:(NMapPOIitem *)poiItem
           constraintSize:(CGSize)constraintSize selected:(BOOL)selected
imageForCalloutRightAccessory:(UIImage *)imageForCalloutRightAccessory
          calloutPosition:(CGPoint *)calloutPosition calloutHitRect:(CGRect *)calloutHitRect {
    return nil;
}

- (CGPoint) onMapOverlay:(NMapPOIdataOverlay *)poiDataOverlay calloutOffsetWithType:(NMapPOIflagType)poiFlagType {
    return CGPointMake(0.5, 0.5);
}

@end
