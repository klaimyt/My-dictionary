//
//  WordViewController.swift
//  quizlet
//
//  Created by Иван Клименков on 12.1.2020.
//  Copyright © 2020 Иван Клименков. All rights reserved.
//

import UIKit

class WordViewController: UIViewController {
    
    @IBOutlet weak var firstLanguageView: UIView!
    @IBOutlet weak var secondLanguageView: UIView!
    
    @IBOutlet weak var firstLanguageLabel: UILabel!
    @IBOutlet weak var secondLanguageLabel: UILabel!
    
    
    var firstLanguage = ""
    var secondLanguage = ""
    var isFlipped = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLanguageLabel.text = firstLanguage
        secondLanguageLabel.text = secondLanguage
        secondLanguageView.isHidden = true
    }
    
    //MARK: - IB Actions
    @IBAction func flipButtonPressed() {
        
        let fromView = isFlipped ? firstLanguageView : secondLanguageView
        let toView = isFlipped ? secondLanguageView : firstLanguageView
        
        UIView.transition(from: fromView!,
                          to: toView!,
                          duration: 0.3,
                          options: [.curveEaseOut, .transitionFlipFromTop, .showHideTransitionViews])
        
        secondLanguageView.isHidden = !secondLanguageView.isHidden
        firstLanguageView.isHidden = !firstLanguageView.isHidden
        isFlipped = !isFlipped
    }
    
    
    
}
