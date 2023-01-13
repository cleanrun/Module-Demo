//
//  PostCell.swift
//  Module-Demo
//
//  Created by cleanmac on 13/01/23.
//

import UIKit

class PostCell: UITableViewCell {
    
    /// The label for displaying the id from the Post model.
    @IBOutlet weak var idLabel: UILabel!
    
    /// The label for displaying the title from the Post model.
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// Setting up the cell based on the post model.
    /// - Parameter model: The post model needed to show the contents.
    func setupContents(model: Post) {
        idLabel.text = "ID: \(model.postId)"
        titleLabel.text = model.title
    }
    
}
