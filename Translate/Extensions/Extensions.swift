//
//  Extensions.swift
//  Translate
//
//  Created by Nurtilek on 5/24/20.
//  Copyright © 2020 Nurtilek Nurbekov. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire
import SwiftyJSON

extension TranslationViewController {
    
    func textViewDidChange(_ textView: UITextView) {
        refreshTimer()
    }
    
    func refreshTimer() {
        translTimer?.invalidate()
        translTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: false)
    }
    
    func firstEnglishImage() {
        imageEng.image = UIImage(named: "eng")
        imageRus.image = UIImage(named: "rus")
    }
    
    func firstRussianImage() {
        imageEng.image = UIImage(named: "rus")
        imageRus.image = UIImage(named: "eng")
    }
}
