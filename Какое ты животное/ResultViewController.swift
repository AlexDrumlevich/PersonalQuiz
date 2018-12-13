//
//  ResultViewController.swift
//  Какое ты животное
//
//  Created by Друмлевич on 12.12.2018.
//  Copyright © 2018 Alexey Drumlevich. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    var answers = [Answer.AnimalType]()
    
    
    var winner: Answer.AnimalType?
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationItem.setHidesBackButton(true, animated: false)
        
        foundWinner()
        resultLabel.text = "БЕРИТЕ \(winner?.rawValue ?? Answer.AnimalType.dog.rawValue)!"
        
            switch winner ?? .dog {
            case .dog:
            textView.text = Answer.AnimalType.dog.definition
        case .cow:
            textView.text =  Answer.AnimalType.cow.definition
        case .pig:
            textView.text =  Answer.AnimalType.pig.definition
        case .owl:
            textView.text =  Answer.AnimalType.owl.definition
        }
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

        
    }
    
    func foundWinner() {
        var answersTypeWithIndex: [Answer.AnimalType: Int] = [.cow: 0, .dog: 0, .pig: 0, .owl: 0]
        for value in answers {
            switch value {
            case .cow:
                answersTypeWithIndex[.cow]! += 1
            case .dog:
                answersTypeWithIndex[.dog]! += 1
            case . pig:
                answersTypeWithIndex[.pig]! += 1
            case .owl:
                answersTypeWithIndex[.owl]! += 1
            }
        }
        for (key, value) in answersTypeWithIndex {
            if winner == nil {
                winner = value > 0 ? key : nil
            } else {
                winner = value > answersTypeWithIndex[winner!]! ? key : winner
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
