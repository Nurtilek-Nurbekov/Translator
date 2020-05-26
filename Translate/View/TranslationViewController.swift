//
//  ViewController.swift
//  Translate
//
//  Created by Nurtilek on 5/22/20.
//  Copyright © 2020 Nurtilek Nurbekov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TranslationViewController: UIViewController, UITextViewDelegate {
    
    var translTimer: Timer?
    var item: Word?
    var secondWord: String = ""
    
    @IBOutlet weak var langChange: UIButton!
    @IBOutlet weak var imageEng: UIImageView!
    @IBOutlet weak var imageRus: UIImageView!
    @IBOutlet weak var originalText: UITextView!
    @IBOutlet weak var translatedText: UITextView!
    
    
    @IBAction func changeItem(_ sender: Any) {
        if ServerManager.shared.lang.description == "en-ru" {
            ServerManager.shared.lang = "ru-en"
            firstRussianImage()
        
        } else {
            ServerManager.shared.lang = "en-ru"
            firstEnglishImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureChecker(item: ServerManager.shared.lang)
    }
    
    @objc func runTimedCode() {
        ServerManager.shared.makeRequest(words: originalText.text, completion: putTranslatedWord(translate:))
    }
    
    func putTranslatedWord(translate: String) {
        if translate.isEmpty {
            translatedText.text = "Oops, bad Internet connection =("
        } else {
            translatedText.text = translate
            saveData()
        }
    }
    
    func pictureChecker(item: String) {
        if item == "en-ru" {
            firstEnglishImage()
        } else {
            firstRussianImage()
        }
    }
    
    func saveData() {
        let item = Word()
        item.originalWord = originalText.text
        item.translatedWord = translatedText.text
        if item.originalWord != "" {
            DBManager.sharedInstance.addData(object: item)
        }
    }

}

