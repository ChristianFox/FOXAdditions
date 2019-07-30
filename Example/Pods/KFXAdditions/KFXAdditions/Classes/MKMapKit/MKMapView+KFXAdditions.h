/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

@import MapKit;

NS_ASSUME_NONNULL_BEGIN

@interface MKMapView (KFXAdditions)

-(void)kfx_centreOnCoordinate:(CLLocationCoordinate2D)coordinate
                     withSpan:(CGFloat)span
                     animated:(BOOL)animated;

-(void)kfx_focusMapOnLocations:(NSArray<CLLocation*>*)locations zoomOut:(CGFloat)zoomOut;

-(void)kfx_focusMapOnCoordinates:(CLLocationCoordinate2D*)coords coordCount:(NSUInteger)coordCount zoomOut:(CGFloat)zoomOut;



@end

NS_ASSUME_NONNULL_END
