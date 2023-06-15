//
//  CardView.swift
//  GO
//
//  Created by Timothy Manulits on 6/8/23.
//

import UIKit

class CardView: UIView {

    // Configurations

    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "Amber_Starling"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .white
        layer.cornerRadius = 20
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.fillSuperview()
        imageView.contentMode = .scaleAspectFill
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state {
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)

        default:
            ()
        }
    }
    
    fileprivate func handleChanged(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
//        self.transform = CGAffineTransform(translationX: translation.x, y: translation.y)

        
        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        
        
        print(translation.x)
        
        let rotationalTransformation = CGAffineTransform.init(rotationAngle: angle)
        self.transform = rotationalTransformation.translatedBy(x: translation.x, y: translation.y)
    }
    
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        
        let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        let treshold: CGFloat = convertWidthValueToDP(100)
        let shouldDismissCards = abs(gesture.translation(in: nil).x) > treshold
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut) {
            
            if shouldDismissCards {
                //self.frame = CGRect(x: 1000 * translationDirection, y: 0, width: self.frame.width, height: self.frame.height)
                self.transform = .init(translationX: 1000 * translationDirection, y: 0)
                //self.transform = .init(translationX: -1000, y: 0)
            } else {
                self.transform = .identity
            }
            
            
        } completion: { (_) in
            self.transform = .identity
            //self.frame = CGRect(x: 0, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
            
        }
    }
    
    fileprivate func convertWidthValueToDP(_ widthValue: CGFloat) -> CGFloat  {
        let screenWidth = UIScreen.main.bounds.size.width
        let precentage: CGFloat = (widthValue / 390) * 100
        let resultWidth: CGFloat = (precentage / 100) * screenWidth
        print("Precantage \(precentage)")
        print("Result width \(resultWidth)")

        return resultWidth
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
