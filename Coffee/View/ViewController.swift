//
//  ViewController.swift
//  Coffee
//
//  Created by Dhruv Weaver on 2/12/22.
//

import UIKit

class ViewController: UIViewController {
    var msgLabel: UILabel!
    var loadingIcon: UIActivityIndicatorView!
    
    var coffeeData = CoffeeData()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task.init {
            await coffeeData.getData()
            coffeeData.parseToObject()
            msgLabel.text = "Coffee type: \(coffeeData.coffeeTypes[1].getTitle())\nDescription:\n\(coffeeData.coffeeTypes[1].getDescription())"
        }
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        msgLabel = UILabel()
        msgLabel.numberOfLines = 6
        msgLabel.lineBreakMode = .byWordWrapping
        msgLabel.translatesAutoresizingMaskIntoConstraints = false
        msgLabel.textAlignment = .center
        
        loadingIcon = UIActivityIndicatorView()
        view.addSubview(msgLabel)
        
        NSLayoutConstraint.activate([
            msgLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            msgLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),

            // more constraints to be added here!
        ])
    }

}

