

import CoreGraphics

public extension CGRect {
	
    /** The centre point of the receiver */
	var fox_centre:CGPoint {
		return CGPoint(x: midX, y: midY)
	}
	
    /** Create a new CGRect with the given `size` and the origin calculated from the `centre` */
	init(centre:CGPoint, size:CGSize) {
		let origin = CGPoint(x: centre.x - size.width*0.5, y: centre.y - size.height*0.5)
		self = CGRect(origin: origin, size: size)
	}
}
