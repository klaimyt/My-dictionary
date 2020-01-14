//
//  NewWordViewController.swift
//  quizlet
//
//  Created by Иван Клименков on 13.1.2020.
//  Copyright © 2020 Иван Клименков. All rights reserved.
//

import UIKit

class NewWordViewController: UIViewController {
    
    @IBOutlet weak var firstWordTextField: UITextField!
    @IBOutlet weak var secondWordTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func saveWord() {
        
        guard let word = firstWordTextField.text,
        let translate = secondWordTextField.text
        else { return }
        
        let newWord = Word(firstLanguageWord: word,
                           secondLanguageWord: translate)
        StorageManager.saveObject(newWord)
    }
    
    @IBAction func saveButtonPressed() {
        if firstWordTextField.text != nil || secondWordTextField.text != nil {
            saveWord()
            dismiss(animated: true)
        }
    }
}
