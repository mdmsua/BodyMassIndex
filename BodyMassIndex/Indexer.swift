//
//  Indexer.swift
//  BodyMassIndex
//
//  Created by Dmytro Morozov on 21.11.15.
//  Copyright © 2015 Dmytro Morozov. All rights reserved.
//

class Indexer {
    
    func calculate(mass: Double, height: Double, metric: Bool = true) -> Double? {
        guard height > 0 else {
            return nil
        }
        let index = mass / (height * height)
        return metric ? index : index * 703
    }
    
    func categorize(index: Double) -> Category {
        switch index {
        case 0..<15: return Category.VerySeverelyUnderweight
        case 15.0..<16.0: return Category.SeverelyUnderweight
        case 16.0..<18.5: return Category.Underweight
        case 18.5..<25: return Category.Normal
        case 25..<30: return Category.Overweight
        case 30..<35: return Category.ModeratelyObese
        case 35..<40: return Category.SeverelyObese
        default: return Category.VerySeverelyObese
        }
    }
}
