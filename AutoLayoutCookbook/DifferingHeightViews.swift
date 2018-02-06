//
//  DifferingHeightViews.swift
//  AutoLayoutCookbook
//
//  Created by Pasan Premaratne on 2/6/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class DifferingHeightViewController: UIViewController {
    
    let redView = UIView()
    let greenView = UIView()
    let blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.backgroundColor = .red
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(redView)
        view.addSubview(blueView)
        view.addSubview(greenView)
        
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            
            NSLayoutConstraint.activate([
                redView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 8.0),
                redView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -8.0)
            ])
        } else {
            NSLayoutConstraint.activate([
                redView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8.0),
                redView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -8.0)
            ])
        }
        
        NSLayoutConstraint.activate([
            redView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0),
            redView.rightAnchor.constraint(equalTo: greenView.leftAnchor, constant: -8.0),
            greenView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0),
            greenView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 1.0),
            greenView.topAnchor.constraint(equalTo: redView.topAnchor),
            greenView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 3/4),
            greenView.bottomAnchor.constraint(equalTo: blueView.topAnchor, constant: -8.0),
            blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            blueView.leftAnchor.constraint(equalTo: greenView.leftAnchor),
            blueView.rightAnchor.constraint(equalTo: greenView.rightAnchor)

        ])

    }
}

