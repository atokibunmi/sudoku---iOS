//
//  difficultyViewController.swift
//  Sudoku
//
//  Created by Atoki Bolutife on 14/05/2022.
//

import UIKit

class difficultyViewController: UIViewController {

    @IBOutlet var difficultyButtonCollection: [UIButton]!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "easy"{
            let vc = segue.destination as? newGameViewController
            vc?.numberToRemove = 36
    }
        
        if segue.identifier == "medium"{
            let vc = segue.destination as? newGameViewController
            vc?.numberToRemove = 46
    }
        if segue.identifier == "hard"{
            let vc = segue.destination as? newGameViewController
            vc?.numberToRemove = 52
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* To Make Difficulty button Round */
        for i in difficultyButtonCollection{
            i.layer.cornerRadius = 8
        }
        

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
