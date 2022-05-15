//
//  newGameViewController.swift
//  Sudoku
//
//  Created by Atoki Bolutife on 08/05/2022.
//

import UIKit

class newGameViewController: UIViewController {
    var value: Int = 0
    var digits: [Int] = [1,2,3,4,5,6,7,8,9]
    var eraseValue: String = ""
    var finalAssignment: [String:Int] = [:]
    var tagIte = 11
    var tagConnector: [Int:String] = [11:"A1", 12:"A2", 13: "A3", 14: "A4", 15: "A5", 16: "A6", 17: "A7", 18: "A8", 19: "A9", 20: "B1", 21: "B2", 22: "B3", 23: "B4", 24: "B5", 25: "B6", 26: "B7", 27: "B8", 28: "B9", 29: "C1", 30: "C2", 31: "C3", 32: "C4", 33: "C5", 34: "C6", 35: "C7", 36: "C8", 37: "C9", 38: "D1", 39: "D2", 40: "D3", 41: "D4", 42: "D5", 43: "D6", 44: "D7", 45: "D8", 46: "D9", 47: "E1", 48: "E2", 49: "E3", 50: "E4", 51: "E5", 52: "E6", 53: "E7", 54: "E8", 55: "E9", 56: "F1", 57: "F2", 58: "F3", 59: "F4", 60: "F5", 61: "F6", 62: "F7", 63: "F8", 64: "F9", 65: "G1", 66: "G2", 67: "G3", 68: "G4", 69: "G5", 70: "G6", 71: "G7", 72: "G8", 73: "G9", 74: "H1", 75: "H2", 76: "H3", 77: "H4", 78: "H5", 79: "H6", 80: "H7", 81: "H8", 82: "H9", 83: "I1", 84: "I2", 85: "I3", 86: "I4", 87: "I5", 88: "I6", 89: "I7", 90: "I8", 91: "I9"]
    var numberToRemove: Int = 0
    let range:[String] = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "I1", "I2", "I3", "I4", "I5", "I6", "I7", "I8", "I9"]
    
    
    
//squares is IBOutlet Collection of 81 Buttons
    // Note values in each square in grid is string
    @IBOutlet var squares: [UIButton]!
    
//grids is IBOutlet Collection of 3x3 Grids
    @IBOutlet var grids: [UIStackView]!
    
//mainGrid is IBOutlet of Main Stack View
    @IBOutlet weak var mainGrid: UIStackView!
    
//erasebutton is IBOutlet of Erase button
    @IBOutlet weak var erasebutton: UIButton!
    
        /*    Button Outlets    */
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    /*    Button Outlets Collection   */
    @IBOutlet var inputButtonCollection: [UIButton]!
    
        /*    IBActions     */
// To Set Square display to value of chosen button
    @IBAction func inputNumber(_ sender: UIButton) {
        if digits.contains(value){
            sender.setTitle(String(value), for: .normal)
            value = 0
        }
        // To erase user input
        if eraseValue == "yes" && sender.isEnabled == true{
            sender.setTitle(" ", for: .normal)
            eraseValue = "no"
        }
        //To change square / button color to red if wrong answer is put in
        var sumn: Int = finalAssignment[tagConnector[sender.tag]!]!
        if Int(sender.currentTitle!) != sumn {
            sender.setTitleColor(.red, for: .normal)
            }
            else {
                sender.setTitleColor(.black, for: .normal)
            }
        
        // To disable button with correctly filled answer to prevent editing correct answers
        if Int(sender.currentTitle!) == sumn {
            sender.isEnabled = false
            sender.setTitleColor(.black, for: .disabled)
            }
    }

// To Select Number
    @IBAction func selectNumber(_ sender: UIButton) {
        value = sender.tag
    }
// To help erase User Input
    @IBAction func eraseNumber(_ sender: Any) {
        eraseValue = "yes"
    }
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Sudoku Grid Maker
        /* To Make Input and Erase buttons Round */
        for i in inputButtonCollection{
            i.layer.cornerRadius = 10
        }
        erasebutton.layer.cornerRadius = 8
        
        
            /* Function to Make Borders / Grid */
        func makeBorder(){
            for square in squares{
                square.layer.borderWidth = 1
                square.layer.borderColor = UIColor.gray.cgColor
//                square.textAlignment = .center
            }

            for grid in grids{
                grid.layer.borderWidth = 2
                grid.layer.borderColor = UIColor.systemMint.cgColor
            }

            mainGrid.layer.borderWidth = 3
            mainGrid.layer.borderColor = UIColor.systemMint.cgColor
        }
        
//        Calling Function
        makeBorder()

                    /* Function to generate complete random grid */
        func randomGrid(numberToRemove: Int) -> [[String]]{
            let initialArray = ["2", "4", "3", "8", "5", "1", "9", "7", "6"]
            let shuffledArray = initialArray.shuffled()
            var squares: [[String]] = []
            var a:[String] = []
            var r:[Int] = []
            var answer: [[String]] = []
            var t:[String] = []
                

            // Get 9 lists of digits 1 - 9 shuffled in each
            for i in 0...8{
            a.append(contentsOf: shuffledArray[i...] + shuffledArray[0..<i])
            squares.append(a)
            a = []
            }

            // To ensure no repitition of digits per 3x3 grid
            for i in 0...2{
                    for d in stride(from: 0, to: 8, by: 3){
                        for si in stride(from: i, to: 9, by: 3){
                            for li in d...d+2{
                                t.append(squares[si][li])
                                if t.count == 9{
                                    answer.append(t)
                                    t = []
                                }
                            }
                        }
                        
                    }
                }

            var spaces = [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [0, 8], [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [3, 8], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [4, 8], [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7], [5, 8], [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7], [6, 8], [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7], [7, 8], [8, 0], [8, 1], [8, 2], [8, 3], [8, 4], [8, 5], [8, 6], [8, 7], [8, 8]]
            
            for i in 1...numberToRemove{
                r = spaces.randomElement()!
                answer[r[0]][r[1]] = "0"
                if let index = spaces.firstIndex(of: r){
                    spaces.remove(at: index)
                }
            }
            
            return answer
        }
        print(randomGrid(numberToRemove: numberToRemove))
        

        /* To display Square / Grid Values from Generated values */
        var ite = 0
        var outer = 0
        var inner = 0
        var lst:[[String]] = randomGrid(numberToRemove: numberToRemove)

        
        for i in squares{
            i.setTitle(lst[outer][inner], for: .normal)
            inner += 1
            if inner == 9{
                outer += 1
                inner = 0
            }
        }

        
        /* To assign square names to Correspondong Grid Values */
        var answer: [String: Int] = [:]
        let range:[String] = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "I1", "I2", "I3", "I4", "I5", "I6", "I7", "I8", "I9"]
        var count: Int = 0
        for i in squares{
            answer[range[count]] = Int(i.currentTitle!)
            count = count + 1
            }
  
            /* To create input for sudoku solver*/
                //  Input Template
         /* grid = [[2, 5, 0, 0, 3, 0, 9, 0, 1],
                [0, 1, 0, 0, 0, 4, 0, 0, 0],
                [4, 0, 7, 0, 0, 0, 2, 0, 8],
                [0, 0, 5, 2, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 9, 8, 1, 0, 0],
                [0, 4, 0, 0, 0, 3, 0, 0, 0],
                [0, 0, 0, 3, 6, 0, 0, 7, 2],
                [0, 7, 0, 0, 0, 0, 0, 0, 3],
                [9, 0, 3, 0, 0, 0, 6, 0, 4]] */
        
        var grid = [[answer["A1"], answer["A2"], answer["A3"], answer["A4"], answer["A5"], answer["A6"], answer["A7"], answer["A8"], answer["A9"]], [answer["B1"], answer["B2"], answer["B3"], answer["B4"], answer["B5"], answer["B6"], answer["B7"], answer["B8"], answer["B9"]], [answer["C1"], answer["C2"], answer["C3"], answer["C4"], answer["C5"], answer["C6"], answer["C7"], answer["C8"], answer["C9"]], [answer["D1"], answer["D2"], answer["D3"], answer["D4"], answer["D5"], answer["D6"], answer["D7"], answer["D8"], answer["D9"]], [answer["E1"], answer["E2"], answer["E3"], answer["E4"], answer["E5"], answer["E6"], answer["E7"], answer["E8"], answer["E9"]], [answer["F1"], answer["F2"], answer["F3"], answer["F4"], answer["F5"], answer["F6"], answer["F7"], answer["F8"], answer["F9"]], [answer["G1"], answer["G2"], answer["G3"], answer["G4"], answer["G5"], answer["G6"], answer["G7"], answer["G8"], answer["G9"]], [answer["H1"], answer["H2"], answer["H3"], answer["H4"], answer["H5"], answer["H6"], answer["H7"], answer["H8"], answer["H9"]], [answer["I1"], answer["I2"], answer["I3"], answer["I4"], answer["I5"], answer["I6"], answer["I7"], answer["I8"], answer["I9"]]]

        
        // MARK: - Sudoku Solver
        /* Defining All functions to solve puzzle */
        let M = 9

        func puzzle(grid:[[Int?]]){
            for i in 0...M-1{
                for j in 0...M-1{
                    print(grid[i][j])
                }
                print()
            }
        }

        func solve (grid: inout [[Int?]], row: Int, col:Int, num:Int) -> Bool{
            for i in 0...8{
                if grid[row][i] == num{
                    return false
                }
            }
            
            for i in 0...8{
                if grid[i][col] == num{
                    return false
                }
            }
            
            var startRow = row - (row % 3)
            var startCol = col - (col % 3)
            for i in 0...2{
                for j in 0...2{
                    if grid[i + startRow][j + startCol] == num{
                        return false
                    }
                }
            }
            return true
        }

        func sudoku(grid: inout [[Int?]], row: Int, col:Int) -> Bool{
            var row = row
            var col = col
            
            if (row == (M - 1)) && (col == M){
                return true
            }
            
            if col == M{
                row += 1
                col = 0
            }
            
            if grid[row][col]! > 0{
                return sudoku(grid: &grid, row: row, col: col + 1)
            }
            
            for num in 1...M{
                if solve(grid: &grid, row: row, col: col, num: num){
                    grid[row][col] = Int(num)
                    if sudoku(grid: &grid, row: row, col: col + 1){
                        return true
                    }
                }
                grid[row][col] = 0
            }
            return false
        }


        
// Calling all functions to solve input i.e values in each label on app
        if sudoku(grid: &grid, row: 0, col: 0){
            puzzle(grid: grid)

        }
        else{
            print("The solution is invalid")
        }

        print("Grand Separator")
        
        
// Converting result from optional to string and printing
        for i in grid{
            for j in i{
                print(Int(j!))
            }
        }
        
// To Assign answers to each corresponding square
        var counter = 0
        var finalAnswers: [Int] = []
        for i in grid{
            for j in i{
                finalAnswers.append(Int(j!))
            }
        }
        print(finalAnswers)
    
        for i in range{
            finalAssignment[i] = finalAnswers[counter]
            counter += 1
        }
        
        print(finalAssignment)
        
        
/* To Assign tag numbers to each square to help with comparison */
        for square in squares{
            square.tag = tagIte
            tagIte += 1
        }
        
        /* To Disable already filled squares and retain black colour*/
        for i in squares{
            if digits.contains(Int(i.currentTitle!)!) == true{
                i.isEnabled = false
                i.setTitleColor(.black, for: .disabled)
            }
        }
        
        
        /* To remove 0's from board after first solving the sudoku question with the zeros present. Hence why it is so down below*/
        ite = 0

        for i in squares{
            if Int(i.currentTitle!)! == 0{
            i.setTitle(" ", for: .normal)

            }
            ite += 1
        }
        
        }
    
    // MARK: - Sudoku Saver
    /* To save current game progress to memory so it can be accessed after minimizing or closing app*/
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        

        var savedArray:[[String]] = []
        var jarJar:[String] = []
        
        for square in squares{
            if square.currentTitle == " "{
                jarJar.append("0")
            }
            else {
                jarJar.append(square.currentTitle!)
            }
            
            if jarJar.count == 9{
                savedArray.append(jarJar)
                jarJar = []
            }
        }
        
        
        print("saved data = ")
        print(savedArray)
        
        // Saving values to Array of Arrays; savedData so it can be recalled next time app is opened
        defaults.set(savedArray, forKey: "savedData")
        
    }
    }
   
//Notes
//A. Use random color for border each time user opens
//    1. Put different colour names inside a list
//    2. When user opens app, generate random number within length of colours list
//    3. use list index to set the border colour to the respective index value of the random number in the colours list
//B.
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller. */

