//
//  IDWOverlay.swift
//  OSWifiHeatMap
//
//  Created by Ondrej Stocek on 22/04/16.
//  Copyright © 2016 Ondrej Stocek. All rights reserved.
//

import MapKit

class IDWOverlay: NSObject, MKOverlay {
    
    private(set) var coordinate: CLLocationCoordinate2D = kCLLocationCoordinate2DInvalid
    private(set) var boundingMapRect: MKMapRect = MKMapRectNull
    
    var mapPoints: [(MKMapPoint, Double)] = [] {
        didSet {
            
        }
    }
    
    private func inverseDistanceWeight(target: MKMapPoint, mapPoints: [(MKMapPoint, Double)], exp: Double = 1.0) -> Double {
        var total: Double = 0
        var sum: Double = 0
        
        for (point, value) in mapPoints {
            let distance = sqrt(pow(target.x - point.x, 2) + pow(target.y - point.y, 2))
            let weight = 1 / pow(distance, exp)
            total += value * weight
            sum += weight
        }
        
        return total / sum
    }
}
