//
//  DesignView.swift
//  settingRevel
//
//  Created by Anup Gupta on 17/09/18.
//  Copyright © 2018 GeekGuns. All rights reserved.
//

import UIKit

class DesignView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = UIColor.red
//        simpleShapeLayer()
//        maskVsSublayer()
//        twoShapes()
//        createTextLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
//    override func draw(_ rect: CGRect) {
//
//
//
//        // 1.
////        self.createRectangle()
//
//        // 2.
////        self.createTriangle()
//
//        // 3.  Create an oval shape path.
////        createOvelShap()
//
//        // 4.
////        createCircle()
//
//        // 5.
////        createRectangleWithCornerRadius()
//
//        // 6.
////        createRectangleWithCornerCustomRadius()
//
//        // 7.
//        createArc()
//
//        // Specify the fill color and apply it to the path.
//        UIColor.orange.setFill()
//        path.fill()
//
//        // Specify a border (stroke) color.
//        UIColor.purple.setStroke()
//        path.stroke()
//    }
    
   
    
    func simpleShapeLayer() {
//        self.createRectangle()
        createArc()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        shapeLayer.strokeColor = UIColor.brown.cgColor
        shapeLayer.lineWidth = 3.0
        self.layer.addSublayer(shapeLayer)
    }
    
    func masklayer() {
//        self.createTriangle()
        createArc()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        
//        self.layer.addSublayer(shapeLayer)
//        self.backgroundColor = UIColor.green
        
        self.layer.mask = shapeLayer
    }
    
    
    
    // 1.  Rectangle
    
  private  func createRectangle() {
        // Initialize the path.
        path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        // Create a line between the starting point and the bottom-left side of the view.
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        
        // Create the bottom line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        // Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        
        // Close the path. This will create the last line automatically.
        path.close()
    }
    
    // 2. Triangle
    
    
  private  func createTriangle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }
    
    // 3. Ovel Shap
  private  func createOvelShap() {
        path = UIBezierPath(ovalIn: self.bounds)
    }
    
    // 4. Circle
  private  func createCircle() {
        self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2,y: 0.0,width: self.frame.size.height, height: self.frame.size.height))
    }
    
    //5. create Rectangle With Corner Radius
  private  func createRectangleWithCornerRadius() {
        path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15.0)
    }
    
    // 6. createRectangleWithCornerCustomRadius
 private func createRectangleWithCornerCustomRadius() {
        path = UIBezierPath(roundedRect: self.bounds,
                            byRoundingCorners: [.topLeft, .bottomRight],
                            cornerRadii: CGSize(width: 15.0, height: 0.0))
    }
    
    // 7. Arc
   private func createArc() {
        path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2),
                            radius: self.frame.size.height/2,
                            startAngle: CGFloat(180.0).degreesToRadians,
                            endAngle: CGFloat(0.0).degreesToRadians,
                            clockwise: true)
    }
    
   
    // 8.
    func twoShapes() {
        let width: CGFloat = self.frame.size.width/2
        let height: CGFloat = self.frame.size.height/2
        
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: width/2, y: 0.0))
        path1.addLine(to: CGPoint(x: 0.0, y: height))
        path1.addLine(to: CGPoint(x: width, y: height))
        path1.close()
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: width/2, y: height))
        path2.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path2.addLine(to: CGPoint(x: width, y: 0.0))
        path2.close()
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = UIColor.yellow.cgColor
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = UIColor.green.cgColor
        
        self.layer.addSublayer(shapeLayer1)
        self.layer.addSublayer(shapeLayer2)
//        shapeLayer2.position = CGPoint(x: 0.0, y: height)
        shapeLayer2.position = CGPoint(x: width/2, y: height)
        shapeLayer1.position = CGPoint(x: width/2, y: 0.0)
    }
    
    func createTextLayer() {
        let textLayer = CATextLayer()
        textLayer.string = "WOW!\nThis is text on a layer!"
        textLayer.foregroundColor = UIColor.white.cgColor
        textLayer.font = UIFont(name: "Avenir", size: 15.0)
        textLayer.fontSize = 15.0
        textLayer.alignmentMode = kCAAlignmentCenter
//        textLayer.backgroundColor = UIColor.orange.cgColor
        textLayer.frame = CGRect(x: 0.0, y: self.frame.size.height/2 - 20.0, width: self.frame.size.width, height: 40.0)
        textLayer.contentsScale = UIScreen.main.scale
        self.layer.addSublayer(textLayer)
    }

    
    func createArcForBottomLeftSideButton(){
        
        path = UIBezierPath(arcCenter: CGPoint(x: 0.0, y: self.frame.size.height),
                            radius: self.frame.size.width,
                            startAngle: CGFloat(0.0).degreesToRadians,
                            endAngle: CGFloat(90.0).degreesToRadians,
                            clockwise: false)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        
        self.layer.mask = shapeLayer
    }
    
    
}


extension BinaryInteger {
    var degreesToRadians: CGFloat { return CGFloat(Int(self)) * .pi / 180 }
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
