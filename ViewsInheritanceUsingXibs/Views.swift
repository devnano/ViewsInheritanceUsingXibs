//
//  Views.swift
//  ViewsInheritanceUsingXibs
//
//  Created by Mariano Heredia on 12/23/15.
//  Copyright © 2015 FreshFeed. All rights reserved.
//

import UIKit

class AView : UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addContainerView()
    }
    
    func addContainerView() {
        Bundle.main.loadNibNamed(xibName(), owner: self, options: nil)
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        var allConstraints = [NSLayoutConstraint]()
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[containerView]|", options: [], metrics: nil, views: ["containerView":containerView])
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView]|", options: [], metrics: nil, views: ["containerView":containerView])
        
        allConstraints += verticalConstraints
        allConstraints += horizontalConstraints
        
        NSLayoutConstraint.activate(allConstraints)

        titleLabel.text = xibName()
    }
   
    func xibName() -> String {
        return "AView"
    }
}

class BView : AView {
    override func xibName() -> String {
        return "BView"
    }
}

class CView : AView {
    override func xibName() -> String {
        return "CView"
    }
}
