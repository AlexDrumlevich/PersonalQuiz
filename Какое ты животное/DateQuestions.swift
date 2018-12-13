//
//  DateQuestions.swift
//  Какое ты животное
//
//  Created by Друмлевич on 09.12.2018.
//  Copyright © 2018 Alexey Drumlevich. All rights reserved.
//

import Foundation
var questions: [Question] = [
    Question(text: "Вы ленивый?", type: .range, answers: [Answer(text: "Нет!", type: .cow), Answer(text: "Скорее нет", type: .pig), Answer(text: "Скорее да", type: .owl), Answer(text: "Очень!", type: .dog)]),
    Question(text: "Какой у Вас распорядок дня", type: .single, answers: [Answer(text: "Рано встаю и рано ложусь спать", type:  .dog), Answer(text: "Ложусь под утро, встаю под вечер ", type: .owl), Answer(text: "Встаю и ложусь спась вместе с солнцем", type: .cow), Answer(text: "На работе сутками", type: .pig)]),
    Question(text: "Что Вы любите есть?", type: .multy, answers: [Answer(text: "Молоко", type: .cow), Answer(text: "Мясо", type: .dog), Answer(text: "Все!", type: .pig),  Answer(text: "Я только пью!", type: .owl)])
]
    
