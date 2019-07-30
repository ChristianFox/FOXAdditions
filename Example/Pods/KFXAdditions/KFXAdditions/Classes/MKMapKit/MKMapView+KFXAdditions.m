/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import "MKMapView+KFXAdditions.h"

@implementation MKMapView (KFXAdditions)

-(void)kfx_centreOnCoordinate:(CLLocationCoordinate2D)coordinate withSpan:(CGFloat)span animated:(BOOL)animated{
    
    MKCoordinateSpan cSpan = MKCoordinateSpanMake(span, span);
    MKCoordinateRegion cRegion = MKCoordinateRegionMake(coordinate, cSpan);
    [self setRegion:cRegion animated:animated];
}


-(void)kfx_focusMapOnLocations:(NSArray<CLLocation *> *)locations zoomOut:(CGFloat)zoomOut{
    
    int n = (int)locations.count;
    struct CLLocationCoordinate2D coords[n];
    int idx = 0;
    for (CLLocation *location in locations) {
        coords[idx] = location.coordinate;
        idx++;
    }
    [self kfx_focusMapOnCoordinates:coords coordCount:locations.count zoomOut:zoomOut];
}

-(void)kfx_focusMapOnCoordinates:(CLLocationCoordinate2D *)coords coordCount:(NSUInteger)coordCount zoomOut:(CGFloat)zoomOutPercent{
    
    MKMapRect r = mapRectForCoordinates(coords, coordCount);
    r = MKMapRectMake(r.origin.x-r.size.width*zoomOutPercent, r.origin.y-r.size.height*zoomOutPercent, r.size.width*(1+zoomOutPercent*2), r.size.height*(1+zoomOutPercent*2));
    
    MKCoordinateRegion region = MKCoordinateRegionForMapRect(r);
    

    [self setRegion:[self regionThatFits:region] animated:YES];
}

/*!
 * Positioning MKMapView to show multiple annotations at once
 * https://stackoverflow.com/a/11862786/4082459
 */
MKCoordinateRegion coordinateRegionForCoordinates(CLLocationCoordinate2D *coords, NSUInteger coordCount) {
    MKMapRect r = MKMapRectNull;
    for (NSUInteger i=0; i < coordCount; ++i) {
        MKMapPoint p = MKMapPointForCoordinate(coords[i]);
        r = MKMapRectUnion(r, MKMapRectMake(p.x, p.y, 0, 0));
    }
    return MKCoordinateRegionForMapRect(r);
}

MKMapRect mapRectForCoordinates(CLLocationCoordinate2D *coords, NSUInteger coordCount) {
    MKMapRect r = MKMapRectNull;
    for (NSUInteger i=0; i < coordCount; ++i) {
        MKMapPoint p = MKMapPointForCoordinate(coords[i]);
        r = MKMapRectUnion(r, MKMapRectMake(p.x, p.y, 0, 0));
    }
    return r;
}


@end
