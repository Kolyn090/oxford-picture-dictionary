//
//  AudioManager.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/29/24.
//

import AVFoundation

class SpeechManager {
    static let shared = SpeechManager()
    
    let speedRateObject = PercentObservableObject(val: AVSpeechUtteranceDefaultSpeechRate, 
                                                  minimum: 0.2, maximum: 0.6, defaultPercent: 0.96)
    let volumeObject = PercentObservableObject(val: 1.0, minimum: 0, maximum: 1, defaultPercent: 0.96)
    
    private let synthesizer = AVSpeechSynthesizer()
    private var voice = AVSpeechSynthesisVoice(language: "en-UK")
    private var pitchMultiplier: Float = 1.0

    private init() {

    }
    
    func speak(word: String) -> Void {
        let utterance = AVSpeechUtterance(string: process(word: word))
        utterance.voice = voice
        utterance.rate = speedRateObject.val
        utterance.pitchMultiplier = pitchMultiplier
        utterance.volume = volumeObject.val
        
        synthesizer.speak(utterance)
    }
    
    func changeLanguage(to language: String) -> Void {
        voice = AVSpeechSynthesisVoice(language: language)
    }
    
    private func process(word: String) -> String {
        return word.replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
    }
}
