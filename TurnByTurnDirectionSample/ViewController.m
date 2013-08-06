//
//  ViewController.m
//  TurnByTurnDirectionSample
//
//  Created by SOMTD on 2013/08/06.
//  Copyright (c) 2013年 SOMTD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) MKMapItem *currentItem;
@property (nonatomic, strong) MKMapItem *destinationItem;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _currentItem = [MKMapItem mapItemForCurrentLocation];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onDestinationButton:(id)sender {
    
    
    UIButton *button = (UIButton *)sender;
    int destination = button.tag;
    switch (destination) {
        case 11111:
        {
            //Yokohama landmark tower　35.454569, 139.63142
            CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(35.454569, 139.63142);
            MKPlacemark *place = [[MKPlacemark alloc] initWithCoordinate:coords addressDictionary:nil];
            _destinationItem = [[MKMapItem alloc]initWithPlacemark:place];
            _destinationItem.name = @"Yokohama landmark tower";
        }
            break;
        case 22222:
        {
            //Bashamichi station 35.450135, 139.636175
            CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(35.450135, 139.636175);
            MKPlacemark *place = [[MKPlacemark alloc] initWithCoordinate:coords addressDictionary:nil];
            _destinationItem = [[MKMapItem alloc]initWithPlacemark:place];
            _destinationItem.name = @"Bashamichi station";
        }
            break;
            
        case 33333:
        {
            //Yokohama stadium 35.443336, 139.64
            CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(35.443336, 139.64);
            MKPlacemark *place = [[MKPlacemark alloc] initWithCoordinate:coords addressDictionary:nil];
            _destinationItem = [[MKMapItem alloc]initWithPlacemark:place];
            _destinationItem.name = @"Yokohama stadium";
        }
            
            break;
        default:
            break;
    }
    NSDictionary *options = @{
                              MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving,
                              MKLaunchOptionsMapTypeKey:[NSNumber numberWithInteger:MKMapTypeSatellite],
                              MKLaunchOptionsShowsTrafficKey:@YES
                              };
    
    [MKMapItem openMapsWithItems:@[_currentItem, _destinationItem] launchOptions:options];
}






@end
