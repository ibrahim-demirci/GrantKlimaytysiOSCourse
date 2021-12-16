//
//  StructsEnums.swift
//  Calculator
//
//  Created by İbrahim Demirci on 17.12.2021.
//

import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
    
}

enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
    
}
