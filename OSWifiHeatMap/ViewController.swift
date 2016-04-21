//
//  ViewController.swift
//  OSWifiHeatMap
//
//  Created by Ondrej Stocek on 20/04/16.
//  Copyright © 2016 Ondrej Stocek. All rights reserved.
//

import UIKit
import MapKit
import DTMHeatmap

class ViewController: UIViewController, MKMapViewDelegate {

	@IBOutlet weak var mapView: MKMapView!
	
	var locations: [NSValue: Float] = [:]
	
	lazy var heatMap: DTMHeatmap = {
		return DTMHeatmap()
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		mapView.showsUserLocation = true
		mapView.addOverlay(heatMap)
	}
	
	// MARK: - Map View Delegate

	func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
		if let location = userLocation.location {
			
			if locations.count == 0 {
				mapView.region = MKCoordinateRegionMakeWithDistance(location.coordinate, 100, 100)
			}
			
			let mapPoint = MKMapPointForCoordinate(location.coordinate)
			let value = NSValue(MKMapPoint: mapPoint)
			locations[value] = 1
			
			// FIXME: force rerendering instead of readding whole overlay
			mapView.removeOverlay(heatMap)
			heatMap.setData(locations)
			mapView.addOverlay(heatMap)
		}
	}
	
	func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
		return DTMHeatmapRenderer(overlay: overlay)
	}
}