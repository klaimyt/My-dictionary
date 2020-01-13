//
//  ViewController.swift
//  quizlet
//
//  Created by Иван Клименков on 11.1.2020.
//  Copyright © 2020 Иван Клименков. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let finishWords = ["Terve", "Mita", "Moi", "Kylla", "Joo"]
    let russianWords = ["Привет", "Что", "Привет", "Да", "Да"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let wordVC = segue.destination as? WordViewController else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
        
            wordVC.firstLanguage = finishWords[indexPath.row]
            wordVC.secondLanguage = russianWords[indexPath.row]
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        finishWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = finishWords[indexPath.row]
        
        return cell
    }
}
