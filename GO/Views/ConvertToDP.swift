//
//  ConvertToDP.swift
//  GO
//
//  Created by Timothy Manulits on 5/30/23.
//

import UIKit

class ConvertToDP: NSLayoutDimension {
    
    override init() {
        super.init()
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
        }    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
