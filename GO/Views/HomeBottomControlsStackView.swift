//
//  HomeBottomControlsStackView.swift
//  GO
//
//  Created by Timothy Manulits on 5/16/23.
//

import UIKit

class HomeBottomControlsStackView: UIStackView {

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
    
    let dislikeButton = UIButton(type: .system)
    let messageButton = UIButton(type: .system)
    let likeButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        //backgroundColor = .clear
        //distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: convertHeightValueToDP(100)).isActive = true
        
        dislikeButton.setImage(#imageLiteral(resourceName: "dismiss_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.setImage(#imageLiteral(resourceName: "boost_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        likeButton.setImage(#imageLiteral(resourceName: "like_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        
        [UIView(), dislikeButton, messageButton, likeButton, UIView()].forEach { (v) in
            addArrangedSubview(v)
        }
        
        distribution = .equalCentering
        
//        let subviews = [#imageLiteral(resourceName: "dismiss_circle"), #imageLiteral(resourceName: "boost_circle"), #imageLiteral(resourceName: "like_circle")].map { (img) -> UIView in
//            let button = UIButton(type: .system)
//            //let imageSize = CGSize(width: convertWidthValueToDP(44), height: convertHeightValueToDP(44))
//            button.setImage(img.withRenderingMode(.alwaysOriginal), for: .normal)
//            button.contentHorizontalAlignment = .right
//            button.contentHorizontalAlignment = .left
//            //button.backgroundColor = .white
//            //button.frame.size = CGSize(width: convertWidthValueToDP(10), height: convertHeightValueToDP(10))
//            return button
//        }
//
        
        
//        let button = UIButton(type: .system)
//
//        let buttomSubViews = [UIColor.gray, .yellow, .red].map { (color) -> UIView in
//            let v = UIView()
//            v.backgroundColor = color
//            return v
//        }
        
//        subviews.forEach { (v) in
//            addArrangedSubview(v)
//
//        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
