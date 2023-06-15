//
//  ViewController.swift
//  GO
//
//  Created by Timothy Manulits on 2/26/23.
//

import UIKit

class ViewController: UIViewController {

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
    
    let topStackView = TopStackView()
    let cardsDeckView = UIView()
    let buttonsStackView = HomeBottomControlsStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        //cardsDeckView.backgroundColor = .blue

        setupLayout()
        
        setupCards()
    }
    
    fileprivate func setupCards() {
        
        let cardView = CardView(frame: .zero)
        cardsDeckView.addSubview(cardView)
        cardView.fillSuperview()
        
        
    }
    
    fileprivate func setupLayout() {
        let overallStuckView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, buttonsStackView])
        //overallStuckView.backgroundColor = .blue
        overallStuckView.axis = .vertical
        
        
        view.addSubview(overallStuckView)
        overallStuckView.frame = .init(x: 0, y: 0, width: convertWidthValueToDP(300), height: convertHeightValueToDP(500))
        
        overallStuckView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overallStuckView.isLayoutMarginsRelativeArrangement = true
        overallStuckView.layoutMargins = .init(top: 0, left: convertWidthValueToDP(14), bottom: 0, right: convertWidthValueToDP(14))
        
        overallStuckView.bringSubviewToFront(cardsDeckView)
    }


}

