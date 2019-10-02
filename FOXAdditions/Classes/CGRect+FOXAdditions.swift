

import CoreGraphics

extension CGRect {
	
	var fox_centre:CGPoint {
		return CGPoint(x: midX, y: midY)
	}
	
	init(centre:CGPoint, size:CGSize) {
		let origin = CGPoint(x: centre.x - size.width*0.5, y: centre.y - size.height*0.5)
		self = CGRect(origin: origin, size: size)
	}
}
