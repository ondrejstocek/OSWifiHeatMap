//
//  NSValue+MKMapPoint.m
//  OSWifiHeatMap
//
//  Created by Ondrej Stocek on 21/04/16.
//  Copyright © 2016 Ondrej Stocek. All rights reserved.
//

#import "NSValue+MKMapPoint.h"

@implementation NSValue (MKMapPoint)

+ (NSValue *)valueWithMKMapPoint:(MKMapPoint)mapPoint {
	return [NSValue value:&mapPoint withObjCType:@encode(MKMapPoint)];
}

- (MKMapPoint)MKMapPointValue {
	MKMapPoint mapPoint;
	[self getValue:&mapPoint];
	return mapPoint;
}

@end
