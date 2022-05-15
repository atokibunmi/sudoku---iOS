//
//  ViewController.swift
//  Sudoku
//
//  Created by Atoki Bolutife on 08/05/2022.
//

import UIKit

class menuViewController: UIViewController {

    @IBOutlet var menuButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view.
        for i in menuButtons{
                i.layer.cornerRadius = 8
        }
    }


}

