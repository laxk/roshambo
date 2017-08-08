//
//  ResultViewController.swift
//  roshambo
//
//  Created by Lakshmikanth H on 8/7/17.
//  Copyright © 2017 lakshmikantha. All rights reserved.
//

import UIKit

enum Shape: String {
    case Rock, Paper, Scissors
}

class ResultViewController: UIViewController {
    
    var playerValue: Shape?
    var computerValue: Shape?

    private var resultLabel: String?
    
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var resultMessage: UILabel!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        self.compareValues(playerValue: self.playerValue!, computerValue: self.computerValue!)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.compareValues(playerValue: self.playerValue!, computerValue: self.computerValue!)
    }
    
    private func compareValues(playerValue:Shape, computerValue:Shape) {
        
        switch (playerValue, computerValue) {
        case (.Paper, .Rock):
            resultImage.image = #imageLiteral(resourceName: "PaperCoversRock")
            resultMessage.text = "Paper Covers Rock, You Win"
            
        case (.Paper, .Scissors):
            resultImage.image = UIImage(named: "ScissorsCutPaper")
            resultMessage.text = "Scissors Cut Paper, Computer wins"

        case (.Rock, .Paper):
            resultImage.image = UIImage(named: "PaperCoversRock")
            resultMessage.text = "Paper Covers Rock, Computer Wins"
            
        case (.Rock, .Scissors):
            resultImage.image = #imageLiteral(resourceName: "RockCrushesScissors")
            resultMessage.text = "Rock Crushes Scissors, You Win"
            
        case (.Scissors, .Paper):
            resultImage.image = #imageLiteral(resourceName: "ScissorsCutPaper")
            resultMessage.text = "Scissors Cut Paper, You win"
            
        case (.Scissors, .Rock):
            resultImage.image = #imageLiteral(resourceName: "RockCrushesScissors")
            resultMessage.text = "Rock Crushes Scissors, Computer Wins"
            
        default:
            resultImage.image = UIImage(named: "itsATie")
            resultMessage.text = "TIE !!"
        }
    }
    
    @IBAction private func playAgainButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
