//
//  Word.swift
//  Translate
//
//  Created by Nurtilek on 5/24/20.
//  Copyright © 2020 Nurtilek Nurbekov. All rights reserved.
//


import Foundation
import RealmSwift

class Word: Object {
    
    @objc dynamic var originalWord = ""
    @objc dynamic var translatedWord = ""
    @objc dynamic var date: Date = Date()
}
