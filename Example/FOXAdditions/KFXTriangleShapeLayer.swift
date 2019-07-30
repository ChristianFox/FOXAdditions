//
//  KFXTriangleShapeLayer.swift
//  FOXAdditions_Example
//
//  Created by Eyeye on 30/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class KFXTriangleShapeLayer: CAShapeLayer {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    private let edge:CGRectEdge

    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    init(pointingToEdge edge:CGRectEdge) {
        self.edge = edge
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //=======================================
    // MARK: Inherited Methods
    //=======================================
    override func draw(in ctx: CGContext) {
        super.draw(in: ctx)
        
        var controlX:CGFloat = 0.0
        var controlY:CGFloat = 0.0
        var baseCentreX:CGFloat = 0.0
        var baseCentreY:CGFloat = 0.0
        var size:CGSize = .zero
        switch self.edge {
        case .minXEdge:
            controlX = bounds.size.width * 2.0
            controlY = bounds.size.height / 2.0
            baseCentreX = bounds.size.width
            baseCentreY = bounds.size.height / 2.0
            size = CGSize(width: bounds.width, height: bounds.height / 2.0)
        case .maxXEdge:
            controlX = bounds.size.width * -2.0
            controlY = bounds.size.height / 2.0
            baseCentreX = 0.0
            baseCentreY = bounds.size.height / 2.0
            size = CGSize(width: bounds.width, height: bounds.height / 2.0)
        case .minYEdge:
            controlX = bounds.size.width / 2.0
            controlY = bounds.size.height * 2.0
            baseCentreX = bounds.size.width / 2.0
            baseCentreY = bounds.size.height
            size = CGSize(width: bounds.width / 2.0, height: bounds.height)
        case .maxYEdge:
            controlX = bounds.size.width / 2.0
            controlY = bounds.size.height * -2.0
            baseCentreX = bounds.size.width / 2.0
            baseCentreY = 0.0
            size = CGSize(width: bounds.width / 2.0, height: bounds.height)
        }
        let controlPoint:CGPoint = CGPoint(x: controlX, y: controlY)
        let centreBase = CGPoint(x: baseCentreX, y: baseCentreY)
        print("controlPoint:\(controlPoint); centreBase:\(centreBase); bounds:\(bounds)")
        let path = UIBezierPath.fox_triangle(withCentreBasePoint: centreBase, controlPoint: controlPoint, size: size)
//        let layer : CAShapeLayer = CAShapeLayer()
        self.path = path.cgPath
        fillColor = UIColor.red.cgColor
//        lineWidth = 0.0
        strokeColor = UIColor.clear.cgColor
        ctx.addPath(path.cgPath)
        ctx.fillPath()
        
    }
 
    func configureLayer() {
        
    }
}
