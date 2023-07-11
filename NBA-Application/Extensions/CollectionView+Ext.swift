//
//  CollectionView+Ext.swift
//  NBA-Application
//
//  Created by Berk on 4.07.2023.
//

import UIKit

extension UICollectionView {
    
    func updateCollectionViewInMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
