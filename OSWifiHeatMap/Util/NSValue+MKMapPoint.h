//
//  NSValue+MKMapPoint.h
//  OSWifiHeatMap
//
//  Created by Ondrej Stocek on 21/04/16.
//  Copyright © 2016 Ondrej Stocek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface NSValue (MKMapPoint)

+ (NSValue *)valueWithMKMapPoint:(MKMapPoint)mapPoint;
- (MKMapPoint)MKMapPointValue;

@end
