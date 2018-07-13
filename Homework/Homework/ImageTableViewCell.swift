//
//  ImageTableViewCell.swift
//  UCAS_05
//
//  Created by charles on 2018/6/10.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

struct ImageCell {
    var name: String?
    var info: String?
    var url: String?
    
    var filtered: Bool? = false
}

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var imageCell: ImageCell? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        label1.text = ""
        label2.text = ""
        cellImage.image = UIImage.init(named: "")
        
        if let imageCell = imageCell {
            label1.text = imageCell.name
            label2.text = imageCell.info
        
            //网络下载image
            DispatchQueue.global().async {
                let url = URL.init(string: imageCell.url ?? "")
                let imageData = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    if imageData != nil {
                        self.cellImage.image = UIImage(data: imageData!)
                    } else {
                        self.cellImage.image = nil
                    }
                }
            }
        }
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
