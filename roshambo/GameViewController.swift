//
//  ViewController.swift
//  roshambo
//
//  Created by Lakshmikanth H on 8/7/17.
//  Copyright © 2017 lakshmikantha. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultViewController
        controller.computerValue = self.randomValue()
        
        if segue.identifier == "paperSelect" {
            controller.playerValue = .Paper
        }
        
        if segue.identifier == "scissorsSelect" {
            controller.playerValue = .Scissors
        }
    }
    
    
    func randomValue() -> Shape {
        let computerValue = arc4random() % 3
        return convertIntToShape(x: Int(computerValue))
    }

    func convertIntToShape(x:Int) -> Shape {
        switch x {
        case 0:
            return .Paper
        case 1:
            return .Rock
        default:
            return .Scissors
        }
    }
    
    
    @IBAction private func paperButton(_ sender: Any) {
        performSegue(withIdentifier: "paperSelect", sender: self)
    }
    
    @IBAction private func rockButton(_ sender: Any) {
        var controller: ResultViewController
        controller = self.storyboard?.instantiateViewController(withIdentifier: "result") as! ResultViewController
        controller.playerValue = .Rock
        controller.computerValue = self.randomValue()
        
        self.present(controller, animated: true, completion: nil)
    }

}

