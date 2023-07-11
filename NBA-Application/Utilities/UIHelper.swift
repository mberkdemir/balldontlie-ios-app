//
//  UIHelper.swift
//  NBA-Application
//
//  Created by Berk on 1.07.2023.
//

import UIKit

enum UIHelper {
    
    static func createBasicListFlowLayout(height: Double) -> UICollectionViewFlowLayout  {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = CGFloat.dWidth
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth, height: height)
        layout.minimumLineSpacing = Constraint.MEDIUM
        
        return layout
    }
    
    static func showAlertMessage(in viewController: UIViewController, message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: AppText.OPS_TEXT, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: AppText.OK_TEXT, style: .default, handler: nil)
            alertController.addAction(okAction)
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    static func setDefaultFontSize(label: UILabel) {
        label.font = .systemFont(ofSize: Constraint.MEDIUM)
    }
}
