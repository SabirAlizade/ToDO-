//
//  BaseCell.swift
//  ToDO!
//
//  Created by Sabir Alizade on 31.05.2022.
//

import UIKit

class BaseCell: UITableViewCell {
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
    }
    
    func setupView() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
