//
//  ViewController.swift
//  quizlet
//
//  Created by Иван Клименков on 11.1.2020.
//  Copyright © 2020 Иван Клименков. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var words: Results<Word>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
              words = realm.objects(Word.self)
              
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let wordVC = segue.destination as? WordViewController else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            
            wordVC.firstLanguage = words[indexPath.row].firstLanguageWord
            wordVC.secondLanguage = words[indexPath.row].secondLanguageWord
            wordVC.word = words
            wordVC.index = indexPath.row
        }
        
        if segue.identifier == "ShowDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let newWordVC = segue.destination as!  NewWordViewController
                newWordVC.firstWordTextField.text = words[indexPath.row].firstLanguageWord
                newWordVC.secondWordTextField.text = words[indexPath.row].secondLanguageWord
            }
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newWordVC = segue.source as? NewWordViewController else { return }
        
        newWordVC.saveWord()
        tableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = words[indexPath.row].firstLanguageWord
        
        return cell
    }
    
    //MARK: Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _,_,_  in
            StorageManager.deleteObject(self.words[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let trailingSwipe = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return trailingSwipe
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editingSwipe = UIContextualAction(style: .normal, title: "Edit") { (_, _, _) in
            self.performSegue(withIdentifier: "ShowDetail", sender: nil)
        }
        
        let leadingSwipe = UISwipeActionsConfiguration(actions: [editingSwipe])
        
        return leadingSwipe
    }
}
