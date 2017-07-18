//
//  MyButton.swift
//  MyButtonProject
//
//  Created by Yeon on 2017. 7. 17..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

public enum MyButtonState : Int {
    
    case normal
    case selected
    case highlighted1
    case highlighted2
}

@IBDesignable class MyButton: UIView {
    
    // MARK: - Properties
    
    var titleLabel: UILabel = UILabel()
    
    var state: MyButtonState = .normal
    
    var isDisabled: Bool = false
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupButton()
    }
    
    // MARK: - UIControlState
    
    func title(_ title: String?, for state: MyButtonState) {
        
        titleLabel.text = title
        self.state = state
        
        switch self.state {
        case .normal:
            titleLabel.textColor = UIColor.yellow
            titleLabel.backgroundColor = UIColor.black
        case .selected:
            titleLabel.textColor = UIColor.green
            titleLabel.backgroundColor = UIColor.black
        case .highlighted1:
            titleLabel.textColor = UIColor.white
            titleLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        case .highlighted2:
            titleLabel.textColor = UIColor.red
            titleLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }
    }
    
    // MARK: - UITouch
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if (!self.isDisabled) {
            switch self.state {
            case .normal:
                title("Highlighted1", for: .highlighted1)
            case .selected:
                title("Highlighted2", for: .highlighted2)
            default:
                break
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        if (!self.isDisabled) {
            switch self.state {
            case .highlighted1:
                title("Selected", for: .selected)
            case .highlighted2:
                title("Normal", for: .normal)
            default:
                break
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func setupButton() {
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: 240, height: 128)
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = "Normal"
        titleLabel.textColor = UIColor.yellow
        titleLabel.backgroundColor = UIColor.black
        titleLabel.isHidden = false
        titleLabel.isUserInteractionEnabled = true
        
        self.addSubview(titleLabel)
    }
}
