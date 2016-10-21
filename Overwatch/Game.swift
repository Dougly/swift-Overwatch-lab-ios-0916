//
//  Game.swift
//  Overwatch
//
//  Created by Paul Tangen on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

struct Game {
    var offenseCharacters: [Hero] = []
    var defenseCharacters: [Hero] = []
    var supportCharacters: [Hero] = []
    var tankCharacters: [Hero] = []
    var heroType: HeroType =  .offense
    var heroes: [Hero] {
        return herosForType()
    }
    
    init() {
        createAllHeros()
    }

}

extension Game {
    mutating func createAllHeros() {
        
        for heroType in HeroType.allTypes {
            switch heroType {
            case .offense:
                for name in HeroName.hero(with: heroType) {
                    offenseCharacters.append(Hero(name: name))
                }
            case .defense:
                for name in HeroName.hero(with: heroType) {
                    defenseCharacters.append(Hero(name: name))
                }
            case .support:
                for name in HeroName.hero(with: heroType) {
                    supportCharacters.append(Hero(name: name))
                }
            case .tank:
                for name in HeroName.hero(with: heroType) {
                    tankCharacters.append(Hero(name: name))
                }
            }
        }
    }
}

extension Game {
    
    func herosForType() -> [Hero] {
        switch heroType {
        case .offense:
            return self.offenseCharacters
        case .defense:
            return self.defenseCharacters
        case .support:
            return self.supportCharacters
        case .tank:
            return self.tankCharacters
        }
    }
}













