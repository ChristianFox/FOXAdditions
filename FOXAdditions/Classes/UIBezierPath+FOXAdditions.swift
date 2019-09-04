
import UIKit.UIBezierPath

public extension UIBezierPath {
    
    /**
	Create a straight line from the head to the tail
    */
    class func fox_straightLine(withHead head:CGPoint, tail:CGPoint) -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: tail)
        path.addLine(to: head)
        path.lineCapStyle = .round
        return path
    }
	
	/**
	Create a curved line from the head to the tail using the controlPoint to determine the curve
	*/
    class func fox_curvedLine(withHead head:CGPoint, tail:CGPoint, controlPoint:CGPoint) -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: tail)
        path.addQuadCurve(to: head, controlPoint: controlPoint)
        path.lineCapStyle = .round
        return path
    }

	/**
	Create a curved line from the head to the tail using the headControlPoint & tailControlPoint to determine the curve
	*/
    class func fox_curvedLine(withHead head:CGPoint, tail:CGPoint, headControlPoint:CGPoint, tailControlPoint:CGPoint) -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: tail)
        path.addQuadCurve(to: head, controlPoint: headControlPoint)
        path.addQuadCurve(to: tail, controlPoint: tailControlPoint)
        path.lineCapStyle = .round
        return path
    }

	/**
	Create an arrowHead (aka triangle).
	
	If attaching to a line to make an arrow then use the same head CGPoint as the line.
	
	- Parameters:
		- head: The head point for the line that the arrowHead will attach t
		- controlPoint: The CGPoint used to control the direction of the arrowHead. Usually somewhere between the head and the tail of the line
		- size: The size of the arrowHead as a CGFloat
	*/
	class func fox_arrowHead(withHeadPoint head:CGPoint, controlPoint:CGPoint, size:CGFloat) -> UIBezierPath {
        
        let angle = atan2(head.y - controlPoint.y, head.x - controlPoint.x)
        let headPath = UIBezierPath()
        headPath.move(to: head)
        headPath.addLine(to: fox_calculatePoint(fromPoint: head, angle: angle + CGFloat.pi/2, size: size))
        headPath.addLine(to: fox_calculatePoint(fromPoint: head, angle: angle, size: size))
        headPath.addLine(to: fox_calculatePoint(fromPoint: head, angle: angle - CGFloat.pi/2, size: size))
        headPath.lineCapStyle = .round
        headPath.close()
        return headPath
    }

	/**
	Create a triangle.
	*/
    class func fox_triangle(withCentreBasePoint centreBase:CGPoint, controlPoint:CGPoint, size:CGSize) -> UIBezierPath {
        
        let angle = atan2(centreBase.y - controlPoint.y, centreBase.x - controlPoint.x)
        let path = UIBezierPath()
        path.move(to: centreBase)
        path.addLine(to: fox_calculatePoint(fromPoint: centreBase, angle: angle + CGFloat.pi/2, size: size))
        path.addLine(to: fox_calculatePoint(fromPoint: centreBase, angle: angle, size: size))
        path.addLine(to: fox_calculatePoint(fromPoint: centreBase, angle: angle - CGFloat.pi/2, size: size))
        path.lineCapStyle = .round
        path.close()
        return path
    }
	
	/**
	Calculate the controlPoints to use to create a curvedLine. This method simplifies the process by using a bendFactor value.
	*/
    class func fox_controlPointsForCurvedLine(withHead head:CGPoint, tail:CGPoint, bendFactor:CGFloat) -> (headCP:CGPoint, tailCP:CGPoint) {
     
        let center = CGPoint(x: (tail.x+head.x)*0.5, y: (tail.y+head.y)*0.5)
        let normal = CGPoint(x: -(tail.y-head.y), y: (tail.x-head.x))
        let normalNormalized: CGPoint = {
            let normalSize = sqrt(normal.x*normal.x + normal.y*normal.y)
            guard normalSize > 0.0 else { return .zero }
            return CGPoint(x: normal.x/normalSize, y: normal.y/normalSize)
        }()
        
        let midControlPoint: CGPoint = CGPoint(x: center.x + normal.x*bendFactor, y: center.y + normal.y*bendFactor)
        let headControlPoint: CGPoint = CGPoint(x: midControlPoint.x + normalNormalized.x*0.5, y: midControlPoint.y + normalNormalized.y*0.5)
        let tailControlPoint: CGPoint = CGPoint(x: midControlPoint.x - normalNormalized.x*0.5, y: midControlPoint.y - normalNormalized.y*0.5)
        return (headControlPoint,tailControlPoint)
    }

	/**
	Calculate a new point from a given point, angle and size
	*/
    class func fox_calculatePoint(fromPoint point:CGPoint, angle:CGFloat, size:CGFloat) -> CGPoint {
		return CGPoint(x: point.x + CGFloat(cosf(Float(angle))) * size, y: point.y + CGFloat(sinf(Float(angle))) * size)
    }

	/**
	Calculate a new point from a given point, angle and size
	*/
    class func fox_calculatePoint(fromPoint point:CGPoint, angle:CGFloat, size:CGSize) -> CGPoint {
        let point = CGPoint(x: point.x + CGFloat(cosf(Float(angle))) * size.width, y: point.y + CGFloat(sinf(Float(angle))) * size.height)
        print("point: \(point)")
        return point
    }


}
