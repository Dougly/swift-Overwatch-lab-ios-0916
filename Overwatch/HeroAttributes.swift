//
//  HeroAttributes.swift
//  Overwatch
//
//  Created by Paul Tangen on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum HeroName: CustomStringConvertible {
    
    case genji
    case mcCree
    case pharah
    case reaper
    case soldier76
    case tracer
    case bastion
    case hanzo
    case junkrat
    case mei
    case torbjörn
    case widowmaker
    case dva
    case reinhardt
    case roadhog
    case winston
    case zarya
    case ana
    case lúcio
    case mercy
    case symmetra
    case zenyatta
    
    static func hero(with type: HeroType) -> [HeroName] {
        switch type {
        case .offense:
            return [.genji, .mcCree, .pharah, .reaper, .soldier76, .tracer]
        case .defense:
            return [.bastion, .hanzo, .junkrat, .mei, .torbjörn, .widowmaker]
        case .tank:
            return [.dva, .reinhardt, .roadhog, .winston, .zarya]
        case .support:
            return [.ana, .lúcio, .mercy, .symmetra, .zenyatta]
        }
    }
    
    
    var description: String {
        
        switch self {
        case .genji:
            return "Genji"
        case .mcCree:
            return "McCree"
        case .pharah:
            return "Pharah".capitalized
        case .reaper:
            return "reaper".capitalized
        case .soldier76:
            return "soldier76".capitalized
        case .tracer:
            return "tracer".capitalized
        case .bastion:
            return "bastion".capitalized
        case .hanzo:
            return "hanzo".capitalized
        case .junkrat:
            return "junkrat".capitalized
        case .mei:
            return "mei".capitalized
        case .torbjörn:
            return "torbjörn".capitalized
        case .widowmaker:
            return "widowmaker".capitalized
        case .dva:
            return "D.Va"
        case .reinhardt:
            return "reinhardt".capitalized
        case .roadhog:
            return "roadhog".capitalized
        case .winston:
            return "winston".capitalized
        case .zarya:
            return "zarya".capitalized
        case .ana:
            return "ana".capitalized
        case .lúcio:
            return "lúcio".capitalized
        case .mercy:
            return "mercy".capitalized
        case .symmetra:
            return "symmetra".capitalized
        case .zenyatta:
            return "zenyatta".capitalized

        }
    }
}

enum HeroType: CustomStringConvertible {
    case offense
    case defense
    case support
    case tank
    
    var description: String{
        switch self {
        case .offense:
            return "Offense: 💥"
        case .defense:
            return "Defense: 🛡"
        case .support:
            return "Support: 🚑"
        case .tank:
            return "Tank: 🐼"
        }
    }
    
    static var allTypes: [HeroType] {
        return [.offense, .defense, .tank, .support]
    }
}






















