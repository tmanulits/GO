//
//  TopStackView.swift
//  GO
//
//  Created by Timothy Manulits on 6/5/23.
//

import UIKit

class TopStackView: UIStackView {

    func convertWidthValueToDP(_ widthValue: CGFloat) -> CGFloat  {
        let screenWidth = UIScreen.main.bounds.size.width
        let precentage: CGFloat = (widthValue / 390) * 100
        let resultWidth: CGFloat = (precentage / 100) * screenWidth
        print("Precantage \(precentage)")
        print("Result width \(resultWidth)")

        return resultWidth
    }

    func convertHeightValueToDP(_ heightValue: CGFloat) -> CGFloat  {
        let screenHeight = UIScreen.main.bounds.size.height
        let precentage: CGFloat = (heightValue / 844) * 100
        let resultHeight: CGFloat = (precentage / 100) * screenHeight
        print("Precantage \(precentage)")
        print("Result height \(resultHeight)")

        return resultHeight
    }
    
    let settingsButton = UIButton(type: .system)
    let messageButton = UIButton(type: .system)
    let fireImageView = UIImageView(image: #imageLiteral(resourceName: "app_icon"))
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heightAnchor.constraint(equalToConstant: convertHeightValueToDP(80)).isActive = true
        fireImageView.contentMode = .scaleAspectFit
        
        settingsButton.setImage(#imageLiteral(resourceName: "top_left_profile").withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.setImage(#imageLiteral(resourceName: "top_right_messages").withRenderingMode(.alwaysOriginal), for: .normal)
        
        [settingsButton, UIView(), fireImageView, UIView(), messageButton].forEach { (v) in
            addArrangedSubview(v)
        }
        
        distribution = .equalCentering
        
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: convertWidthValueToDP(16), bottom: 0, right: convertWidthValueToDP(16))
        
//        let buttons = [#imageLiteral(resourceName: "top_left_profile"), #imageLiteral(resourceName: "app_icon"), #imageLiteral(resourceName: "top_right_messages")].map { (img) -> UIView in
//            let button = UIButton(type: .system)
//            button.setImage(img.withRenderingMode(.alwaysOriginal), for: .normal)
//            return button
//        }
//
//        buttons.forEach { (v) in
//            addArrangedSubview(v)
//        }
        

    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
