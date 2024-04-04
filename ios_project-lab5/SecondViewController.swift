//
//  SecondViewController.swift
//  ios_project-lab5
//
//  Created by Nursultan Konkanov on 04.04.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    var message: String?
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            textLabel.text = message
    }
}

