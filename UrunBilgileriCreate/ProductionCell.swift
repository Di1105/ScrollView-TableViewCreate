//
//  ProductionCell.swift
//  UrunBilgileriCreate
//
//  Created by Dilara Elçioğlu on 29.12.2022.
//

import UIKit

class ProductionCell: UITableViewCell {

   lazy var cellLabel = UILabel()
   lazy var cellButton = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(cellLabel)
        cellLabel.font = UIFont.systemFont(ofSize: 16)
        cellLabel.text = "Kategorikjnkskgnarg"
        cellLabel.textColor = .black
        contentView.addSubview(cellLabel)
        cellLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.leading.equalTo(contentView.snp.leading).offset(20)
        }
        
        cellButton.setTitle("<", for: .normal)
        cellButton.tintColor = .black
        contentView.addSubview(cellButton)
        cellButton.snp.makeConstraints { make in
            make.width.height.equalTo(32)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
        }
    }
    
    
    
}
