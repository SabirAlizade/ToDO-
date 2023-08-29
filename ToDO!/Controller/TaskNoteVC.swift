//
//  TaskNoteVC.swift
//  ToDO!
//
//  Created by Sabir Alizade on 30.05.2022.
//

import Foundation
import UIKit

class TaskNoteVC: UIViewController {
    
    var viewModel: UpdateViewModel = {
        let model = UpdateViewModel()
        return model
    }()
    
    let noteTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Add note:"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let noteTextView: UITextView = {
        let view = UITextView()
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.contentInset = UIEdgeInsets(top: 5, left: 4, bottom: 0, right: 0)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapUpdate))
        
        view.backgroundColor = .white
        view.addSubview(noteTitleLabel)
        view.addSubview(noteTextView)
        
        NSLayoutConstraint.activate([
            
            noteTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            noteTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            noteTitleLabel.heightAnchor.constraint(equalToConstant: 16),
            
            noteTextView.leadingAnchor.constraint(equalTo: noteTitleLabel.leadingAnchor),
            noteTextView.topAnchor.constraint(equalTo: noteTitleLabel.bottomAnchor, constant: 16),
            noteTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            noteTextView.heightAnchor.constraint(equalToConstant: view.frame.height / 2)
        ])
    }
    
    @objc private func didTapUpdate(){
        
        guard let note = noteTextView.text else {return}
        viewModel.updateData(note: note)
        navigationController?.popViewController(animated: true)
    }
}







