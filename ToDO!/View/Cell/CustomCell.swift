//
//  DashBoardCell.swift
//  ToDO!
//
//  Created by Sabir Alizade on 31.05.2022.
//

import UIKit
class CustomCell: BaseCell {
    
    var item: TaskModel? {
        didSet {
            guard let item = item else { return }
            
            titleLabel.text = item.name
            timeLabel.text = item.createdAt
            
            if let note = item.note {
                noteLabel.text = note
            } else {
                noteLabel.text = "(empty)"
            }
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    let noteLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupView() {
        super.setupView()
   
        addSubview(timeLabel)
        addSubview(titleLabel)
        addSubview(noteLabel)
        
      NSLayoutConstraint.activate([

            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            noteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            noteLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            noteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            noteLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            timeLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}


