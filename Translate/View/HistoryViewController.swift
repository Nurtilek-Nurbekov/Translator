//
//  HistoryViewController.swift
//  Translate
//
//  Created by Nurtilek on 5/24/20.
//  Copyright © 2020 Nurtilek Nurbekov. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UICollectionViewController {
    
    var item: Word?
    var savedItems: Results<Word>?
    
    override func viewDidLoad() {
        savedItems = DBManager.sharedInstance.getDataFromDB()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedItems!.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TextField
        cell.contentView.isUserInteractionEnabled = true
        let items: Word = (savedItems!.sorted(byKeyPath: "date", ascending: false)[indexPath.row])
        configureText(for: cell, with: items)
        return cell
    }
    
    func configureText(for cell: TextField, with item: Word) {
        cell.firstText.text = item.originalWord
        cell.secondText.text = item.translatedWord
    }
}

extension HistoryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let item = savedItems?.sorted(byKeyPath: "date", ascending: false)[indexPath.row] {
            
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)

                    let estimatedFrame = NSString(string: item.originalWord + item.translatedWord).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: nil, context: nil)

                    return CGSize(width: view.frame.width - 20, height: estimatedFrame.height + 100)
            }

                return CGSize(width: view.frame.width - 20, height: 100)
            }
}
