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
    
    var currentWord: Word!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        firstWordTextField.addTarget(self, action: #selector(textFieldChanged),
                                     for: .editingChanged)
        secondWordTextField.addTarget(self, action: #selector(textFieldChanged),
                                      for: .editingChanged)
        setupEditingScreen()
    }
    
    func saveWord() {
        
        guard let word = firstWordTextField.text,
            let translate = secondWordTextField.text
            else { return }
        
        let newWord = Word(firstLanguageWord: word,
                           secondLanguageWord: translate)
        
        if currentWord != nil {
            try! realm.write {
                currentWord.firstLanguageWord = newWord.firstLanguageWord
                currentWord.secondLanguageWord = newWord.secondLanguageWord
            }
        } else {
            StorageManager.saveObject(newWord)
        }
    }
    
    @IBAction func saveButtonPressed() {
        if firstWordTextField.text != nil || secondWordTextField.text != nil {
            saveWord()
            dismiss(animated: true)
        }
    }
    
    private func setupEditingScreen() {
        if currentWord != nil {
            firstWordTextField.text = currentWord.firstLanguageWord
            secondWordTextField.text = currentWord.secondLanguageWord
        }
    }
}

extension NewWordViewController: UITextFieldDelegate {
    
    @objc private func textFieldChanged() {
        
        if firstWordTextField.text?.isEmpty == false && secondWordTextField.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
        
    }
}
