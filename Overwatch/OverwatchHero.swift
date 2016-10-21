//
//  OverwatchHero.swift
//  Overwatch
//
//  Created by Paul Tangen on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

typealias Health = Int

protocol Weapon {
    func fire() -> String
    func heal() -> String
    
}


protocol OverwatchHero: Weapon, CustomStringConvertible{
    var name: HeroName { get set }
    var hitPoints: Health { get set }
    var heroType: HeroType { get }
    
    func produceHeroType() -> HeroType
    func produceInitialHitPoints() -> Health

}


extension OverwatchHero {
    func produceHeroType() -> HeroType {
        switch self.name {
        case .bastion, .hanzo, .junkrat, .mei, .torbjörn, .widowmaker:
            return HeroType.defense
        case .genji, .mcCree, .pharah, .reaper, .soldier76, .tracer:
            return HeroType.offense
        case .dva, .reinhardt, .roadhog, .winston, .zarya:
            return HeroType.tank
//        case .ana, .lúcio, .mei, .symmetra, .zenyatta:
//            return HeroType.support
        default:
            break
        }
        return HeroType.support
    }
    
    
    func produceInitialHitPoints() -> Health {
        switch heroType {
            
        case .offense, .defense:
            return 250
        case .support:
            return 150
        case .tank:
            return 500
        }
    }
}



extension OverwatchHero {
    func fire() -> String {
        switch heroType {

        case .offense:
            return "Offense: 👊🏽"
        case .defense:
            return "Defense: ✋🏽"
        case .support:
            return "Support: 👐🏽"
        case .tank:
            return "Tank: ✊🏽"
        }
    }
    
    func heal() -> String {
        switch heroType {
            
        case .offense, .defense, .tank:
            return "Heal: ✖️"
        case .support:
            return "Support: ❤️"

        }
    }
    
}

extension OverwatchHero {
    var description: String {
        return "Name: \(self.name)\nType: \(self.heroType)\nAttack: \(self.fire())\nHeal: \(self.heal())\nHit Points: \(hitPoints)"
    }
}







