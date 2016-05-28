//
//  HistoryCell.swift
//  RockPaperScissors
//
//  Created by Daniel J Janiak on 5/28/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GameHistoryCell: UITableViewCell {
    
    @IBOutlet weak var outcomeImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    //@IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        outcomeImg.layer.cornerRadius = outcomeImg.frame.size.width / 2 //15
        outcomeImg.clipsToBounds = true
    }
    
    func configureCell(game: RPSMatch) {
        
        if game.p1.defeats(game.p2)  {
            titleLbl.text = "You were victorious!"
            outcomeImg.image = UIImage(named:"player-victory")!
        } else if game.p2.defeats(game.p1) {
            titleLbl.text = "You were defeated."
            outcomeImg.image = UIImage(named:"player-defeat")!
        } else {
            titleLbl.text = "This game was a tie."
            outcomeImg.image = UIImage(named:"tie")!
        }
        
        /*
        titleLbl.text = game.
        
        titleLbl.text = post.title
        descLbl.text = post.postDesc
        postImg.image = DataService.instance.imageForPath(post.imagePath)
        */
    }
    
}
