TurnByTurnDirectionsSample
==========================

Turn-by-Turn Directions Sample App

![screen shot](http://f.cl.ly/items/0m0N38392v3U3V0c2z3N/map1.png) ![screen shot](http://f.cl.ly/items/0m2I1G2v1p3G2O2c1d0e/map2.png) ![screen shot](http://f.cl.ly/items/0o3W3F1s1Y3Z3j1k1r18/map3.png)

##Requirement
iOS6.0 or later

##About this sample app
It is very easy to call Turn-by-Turn Directions Navigation Map.

This sample app is explain how to wake up the map from your apps.

First, you should make `MKMapItem` by using `mapItemForCurrentLocation`method.

```objectivec
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _currentItem = [MKMapItem mapItemForCurrentLocation];
	// Do any additional setup after loading the view, typically from a nib.
}
```

Second, you should make destination object and set as `mapItems` to `openMapsWithItems:launchOptions:` method.

```objectivec
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
```