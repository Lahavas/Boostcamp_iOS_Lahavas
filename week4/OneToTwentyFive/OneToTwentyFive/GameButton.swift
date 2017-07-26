//
//  GameButton.swift
//  OneToTwentyFive
//
//  Created by Yeon on 2017. 7. 27..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

@IBDesignable class GameButton: UIStackView {

    // MARK: Properties
    
    var horizontalStacks = [UIStackView]()
    var gameButtons = [UIButton]()
    
    // MARK: Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createGameButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        createGameButtons()
    }
    
    // MARK: Functions
    
    private func createGameButtons() {
        
        for _ in 0...4 {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            addArrangedSubview(stackView)
            
            for _ in 0...4 {
                let button = UIButton()
                
                button.setTitle("-", for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = UIColor.black.withAlphaComponent(0.5)
                
                stackView.distribution = .fillEqually
                stackView.spacing = 8.0
                
                stackView.addArrangedSubview(button)
                gameButtons.append(button)
            }
        }
    }


}
