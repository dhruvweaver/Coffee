//
//  ViewController.swift
//  Coffee
//
//  Created by Dhruv Weaver on 2/12/22.
//

import UIKit

class ViewController: UIViewController {
    var msgLabel: UILabel!
    
    var coffeeData = CoffeeData()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task.init {
            await coffeeData.getData()
            coffeeData.parseToObject()
            msgLabel.text = "Coffee type: \(coffeeData.coffeeTypes[0].getTitle())"
        }
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        msgLabel = UILabel()
        msgLabel.translatesAutoresizingMaskIntoConstraints = false
        msgLabel.textAlignment = .center
        msgLabel.text = "Placeholder"
        view.addSubview(msgLabel)
        
        NSLayoutConstraint.activate([
            msgLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            msgLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),

            // more constraints to be added here!
        ])
    }

}

