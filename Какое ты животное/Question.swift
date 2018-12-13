//
//  Question.swift
//  Какое ты животное
//
//  Created by Друмлевич on 08.12.2018.
//  Copyright © 2018 Alexey Drumlevich. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
    
    enum ResponseType: Int {
        case single, multy, range
    }
}

struct Answer {
    var text: String
    var type: AnimalType
    
    enum  AnimalType: Character {
        case dog =  "🐶", cow = "🐮", pig = "🐷", owl = "🦉"
    
        var definition: String {
            switch self {
            case .dog:
                return "Принесет тапки и доест оставшуюся еду со стола"
            case .cow:
                return "У Вас будет много молока или мяса (но только чего-то одного)"
            case .pig:
                return "Вам будет на кого переложить ответственность за беспорядок дома"
            case .owl:
                return "Вам будет не скучно ночью и никто не разбудит Вас устром"
            }
        }
    }
}
