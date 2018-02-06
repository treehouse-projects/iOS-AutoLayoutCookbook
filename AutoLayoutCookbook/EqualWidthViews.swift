//
//  EqualWidthViews.swift
//  AutoLayoutCookbook
//
//  Created by Pasan Premaratne on 2/6/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class EqualWidthViewController: UIViewController {
    
    let blueView = UIView()
    let redView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueView.backgroundColor = .blue
        redView.backgroundColor = .red
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(redView)
        view.addSubview(blueView)
        
        activateLayoutConstraints()
    }
    
    func activateLayoutConstraints() {
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            
            NSLayoutConstraint.activate([
                redView.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 8.0),
                redView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 8.0),
                redView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -8.0),
                blueView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 8.0),
                blueView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -8.0),
                blueView.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -8.0)
            ])
        } else {
            NSLayoutConstraint.activate([
                redView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0),
                redView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8.0),
                redView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -8.0),
                blueView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8.0),
                blueView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -8.0),
                blueView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0)
            ])
        }
        
        NSLayoutConstraint.activate([
            redView.rightAnchor.constraint(equalTo: blueView.leftAnchor, constant: -8.0),
            redView.widthAnchor.constraint(equalTo: blueView.widthAnchor, multiplier: 1.0)
        ])
    }
}

