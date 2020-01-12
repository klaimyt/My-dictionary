//
//  ViewController.swift
//  quizlet
//
//  Created by Иван Клименков on 11.1.2020.
//  Copyright © 2020 Иван Клименков. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let testArray = ["Moi", "terve", "joo"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = testArray[indexPath.row]
        
        return cell!
    }
}

