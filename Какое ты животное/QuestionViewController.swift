//
//  QuestionViewController.swift
//  Какое ты животное
//
//  Created by Друмлевич on 08.12.2018.
//  Copyright © 2018 Alexey Drumlevich. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var singleStack: UIStackView!
    @IBOutlet weak var multyStack: UIStackView!
    @IBOutlet weak var rangeStack: UIStackView!
    
    @IBOutlet var singlQuestionLabels: [UIButton]!
    @IBOutlet var multyQuestionLabels: [UILabel]!
    @IBOutlet var rangeQuestionLabel: [UILabel]!
    
    
    @IBOutlet var switchForMultyQuest: [UISwitch]!
    @IBOutlet weak var sliderForRangeQuest: UISlider!
    
    @IBOutlet weak var questionTextLabel: UILabel!
    var questionIndex = [Int]()
    var answers = [Answer.AnimalType]()
    enum TypeQuestion {
        case single (Question), multy(Question), range(Question)
    }
    var questionsWithTypeQuestion = [TypeQuestion]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTypeQuestion(questions: questions)
        initArrayOfQuestionIndex()
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateUI() {
      
        guard let questionIndex = questionIndex.first else {
            return
        }
        self.navigationItem.title = "Question " + "\(String(questionIndex + 1))"
        
        switch questionsWithTypeQuestion[questionIndex] {
        case .range (let question):
            questionTextLabel.text = question.text
            rangeQuestionLabel.first?.text = question.answers.first?.text
            rangeQuestionLabel.last?.text = question.answers.last?.text
            
            rangeStack.isHidden = false
            multyStack.isHidden = true
            singleStack.isHidden = true
            
        case .multy (let question):
            questionTextLabel.text = question.text
            for (index, value) in multyQuestionLabels.enumerated() {
                value.text = question.answers[index].text
            }
            rangeStack.isHidden = true
            multyStack.isHidden = false
            singleStack.isHidden = true
            
        case .single (let question):
            questionTextLabel.text = question.text
            for (index, subView) in singlQuestionLabels.enumerated(){
                subView.setTitle(question.answers[index].text, for: .normal)
            }
            rangeStack.isHidden = true
            multyStack.isHidden = true
            singleStack.isHidden = false
            
            
        }
        
        
    }
    
    func initArrayOfQuestionIndex() {
        for index in 0..<questions.count{
            questionIndex.append(index)
        }
    }
    
    
    func initTypeQuestion (questions: [Question]) {
        for question in questions {
            switch question.type {
            case .single:
                questionsWithTypeQuestion.append(.single(question))
            case .multy:
                questionsWithTypeQuestion.append(.multy(question))
            case .range:
                questionsWithTypeQuestion.append(.range(question))
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Result" {
            let dvc = segue.destination as? ResultViewController
            dvc?.answers = answers
        }
    }
    
    @IBAction func answerButtons(_ sender: UIButton) {
        guard let questionIndex = questionIndex.first else {
            //переход
            return
        }
        switch questionsWithTypeQuestion[questionIndex] {
        case .single(let question):
            answers.append(question.answers[sender.tag].type)
            print (sender.tag)
        case .multy(let question):
            for (index, value) in switchForMultyQuest.enumerated() {
                if value.isOn {
                    answers.append(question.answers[index].type)
                }
            }
        case .range(let question):
            sliderForRangeQuest.minimumValue = 0
            sliderForRangeQuest.maximumValue = Float(question.answers.count) - 1
            answers.append(question.answers[Int(sliderForRangeQuest.value)].type)
          
        }
        print(answers)
        self.questionIndex.removeFirst()
        updateUI()
        if self.questionIndex.isEmpty {
            performSegue(withIdentifier: "Result", sender: nil)
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
