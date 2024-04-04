//
//  ViewController.swift
//  ios_project-lab5
//
//  Created by Nursultan Konkanov on 25.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondScreen" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.message = "Вы перешли на следующую страницу!"
            }
        }
    }
    
    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "toSecondScreen", sender: nil)
    }
}


