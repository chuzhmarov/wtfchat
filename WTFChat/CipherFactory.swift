//
//  DecipherFactory.swift
//  WTFChat
//
//  Created by Artem Chuzhmarov on 12/09/15.
//  Copyright (c) 2015 Artem Chuzhmarov. All rights reserved.
//

import Foundation

protocol Cipher {
    func getTextForDecipher(word: Word) -> String
    func getCipherType() -> CipherType
}

enum CipherType : String, CustomStringConvertible {
    case FirstLetterCipher = "FirstLetterCipher"
    case HalfWordRoundUpCipher = "HalfWordRoundUpCipher"
    case HalfWordRoundDownCipher = "HalfWordRoundDownCipher"
    case ShuffleCipher = "ShuffleCipher"
    
    var description : String {
        get {
            return self.rawValue
        }
    }
}

class CipherFactory {
    static func getCipher(cipherType: CipherType) -> Cipher {
        switch cipherType {
        case CipherType.FirstLetterCipher:
            return FirstLetterCipher()
        case CipherType.HalfWordRoundDownCipher:
            return HalfWordRoundDownCipher()
        case CipherType.HalfWordRoundUpCipher:
            return HalfWordRoundUpCipher()
        case CipherType.ShuffleCipher:
            return ShuffleCipher()
        }
    }
    
    static func getNextCipherType(cipherType: CipherType) -> CipherType {
        switch cipherType {
        case CipherType.FirstLetterCipher:
            return CipherType.HalfWordRoundDownCipher
        case CipherType.HalfWordRoundDownCipher:
            return CipherType.HalfWordRoundUpCipher
        case CipherType.HalfWordRoundUpCipher:
            return CipherType.ShuffleCipher
        case CipherType.ShuffleCipher:
            return CipherType.FirstLetterCipher
        }
    }
}
