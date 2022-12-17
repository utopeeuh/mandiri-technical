//
//  NoVideoView.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 17/12/22.
//

import Foundation
import SnapKit
import UIKit

class NoVideoView: UIView {
    
    let noVideoLabel : UILabel = {
        let label = UILabel()
        label.text = "No trailer available :("
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    required init(){
        super.init(frame: .zero)
        backgroundColor = .black
        alpha = 0
        
        addSubview(noVideoLabel)
        noVideoLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(){
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1
        }
    }
    
    func hide(){
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0
        }
    }
}
