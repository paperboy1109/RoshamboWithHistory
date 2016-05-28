//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Daniel J Janiak on 5/25/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    var gameHistory = [RPSMatch]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameHistory.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let gameInstance = gameHistory[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("GameHistoryCell") as? GameHistoryCell {
            cell.configureCell(gameInstance)
            return cell
        } else {
            let cell = GameHistoryCell()
            cell.configureCell(gameInstance)
            return cell
        }
    }
    

    
    
}
