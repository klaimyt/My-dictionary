//
//  WordViewController.swift
//  quizlet
//
//  Created by Иван Клименков on 12.1.2020.
//  Copyright © 2020 Иван Клименков. All rights reserved.
//

import UIKit

class WordViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var finishWord = ""
    var russianWord = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = finishWord
        
        // Do any additional setup after loading the view.
    }
}
