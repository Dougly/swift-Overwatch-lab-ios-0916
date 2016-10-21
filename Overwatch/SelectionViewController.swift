//
//  SelectionViewController.swift
//  Overwatch
//
//  Created by Paul Tangen on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit
//this is the correct file

class SelectionViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var characterStackView: UIStackView!
    @IBOutlet weak var characterStackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroScrollView: UIScrollView!
    var index: Int = 0
    
    @IBAction func changeInHeroType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            heroType = .offense
        case 1:
            heroType = .defense
        case 2:
            heroType = .tank
        case 3:
            heroType = .support
        default:
            break
        }
        updateStackViewWithHeroes()

    }
    
    
    
    var game: Game = Game()
    var heroType: HeroType! {
        
        didSet{
            game.heroType = self.heroType
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroScrollView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        heroType = .offense
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        updateStackViewWithHeroes()
        
    }
    
    func updateStackViewWithHeroes() {
        
        for subview in characterStackView.subviews {
            subview.removeFromSuperview()
        }
        
        let heroesToDisplay = game.herosForType()
        let stackViewWidthConstant = containerView.frame.width * (CGFloat(heroesToDisplay.count) - 1)
        characterStackViewWidth.constant = stackViewWidthConstant
        
        heroNameLabel.text = heroesToDisplay[index].name.description
        
        for hero in heroesToDisplay {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false

            image.image = hero.produceProfileImage()
            characterStackView.addArrangedSubview(image)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        self.index = Int((scrollView.contentOffset.x / scrollView.frame.size.width))
        let heroesBeingDisplayed = game.herosForType()
        heroNameLabel.text = heroesBeingDisplayed[index].name.description

    }
}



