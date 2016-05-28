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
    
    var playerWinCount = 0
    var cpuWinCount = 0
    
    @IBOutlet var playerVictoryCountLbl: UILabel!
    @IBOutlet var cpuVictoryCountLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        for item in gameHistory {
            
            if item.p1.defeats(item.p2) {
                playerWinCount += 1
            }
            
            if item.p2.defeats(item.p1) {
                cpuWinCount += 1
            }
        }
        
        playerVictoryCountLbl.text = String(playerWinCount)
        cpuVictoryCountLbl.text = String(cpuWinCount)
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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87.0
    }
    
    @IBAction func backBtnTapped(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
}
