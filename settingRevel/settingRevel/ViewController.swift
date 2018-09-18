//
//  ViewController.swift
//  settingRevel
//
//  Created by Anup Gupta on 17/09/18.
//  Copyright © 2018 GeekGuns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var blueView: DesignView!
    let transition = CircularTransition()
    
    @IBOutlet weak var orangeView: UIView!
    
    @IBOutlet weak var whiteView: UIView!
     var styledButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
//         print(clickButton.frame)
//         print(clickButton.frame.minX)
//         print(clickButton.frame.minY)
//         print(clickButton.frame.midX)
//         print(clickButton.frame.midY)
//        self.view.frame = CGRect(x:0, y:0, width: 600, height: 200)
//        print("Self.view",self.view)
//        let owidth = self.view.bounds.size.width + 20
//        print("owidth",owidth)
//        self.view.backgroundColor = .white
//        let dymanicFrame : CGRect = CGRect(x: 0 , y: 0, width: owidth , height: owidth)
//
//       orangeView.frame = dymanicFrame
//        orangeView.center = clickButton.center
        let rad = orangeView.frame.size.width / 2
        print("cornerRadius",rad)
        orangeView.layoutIfNeeded()
        orangeView.layer.cornerRadius = orangeView.bounds.size.width  / 2
        print("orangeView.frame.size.width",orangeView.frame.size.width)
        whiteView.layer.cornerRadius = 75
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let width: CGFloat = 240.0
//        let height: CGFloat = 160.0
//
//        let demoView = DesignView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
//                                              y: self.view.frame.size.height/2 - height/2,
//                                              width: width,
//                                              height: height))
//
//        self.view.addSubview(demoView)
        
        
//        blueView.createTextLayer()
        blueView.createArcForBottomLeftSideButton()
        blueView.createTextLayer()
    }

    @IBAction func clickButtonAction(_ sender: Any) {
        
       startAnimationBuleView()
//        animateButton()
        
    }
    
    
    func startAnimationBuleView() {

          let owidth = 0
        let dymanicFrame : CGRect = CGRect(x: 0 , y: 0, width: owidth, height: owidth)

//        UIView.animate(withDuration: 1, animations: {
//
//
//
//            self.orangeView.frame = dymanicFrame
//            self.orangeView.center = self.clickButton.center
//            self.orangeView.layoutIfNeeded()
//            self.orangeView.layer.cornerRadius = self.orangeView.bounds.size.width  / 2
//
//
//        }, completion: { done in
//
//
//
//        })
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.25, options: [.curveEaseInOut], animations: {

            self.orangeView.alpha = 0
            self.whiteView.alpha = 0
            self.orangeView.frame = dymanicFrame
            self.whiteView.frame = dymanicFrame
            self.orangeView.center = self.clickButton.center
            
            self.whiteView.center = self.clickButton.center

            self.orangeView.layer.cornerRadius = self.orangeView.bounds.size.width  / 2
            self.whiteView.layer.cornerRadius = self.whiteView.bounds.size.width  / 2

        }, completion: { done in



                    })


    }
}

