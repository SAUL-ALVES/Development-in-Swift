//
//  SoundManager.swift
//  Timer
//
//  Created by user on 04/11/24.
//

import AVFoundation

class SoundManager {
    var audioPlayer: AVAudioPlayer?
    var soundNames: [String] = []
    let defaultSoundName = "default_sound.mp3" 

    init() {
        loadSoundNames()
    }

    private func loadSoundNames() {
        let fileManager = FileManager.default
        let audioPath = Bundle.main.resourcePath! + "/Audios"

        do {
            let files = try fileManager.contentsOfDirectory(atPath: audioPath)
            soundNames = files.filter { $0.hasSuffix(".mp3") || $0.hasSuffix(".wav") } 
        } catch {
            print("Error loading audio files: \(error.localizedDescription)")
        }
    }

    func playSound(named soundName: String) {
        guard let url = Bundle.main.url(forResource: "Audios/\(soundName)", withExtension: nil) else {
            
            playDefaultSound()
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
            
            playDefaultSound()
        }
    }

    func getRandomSoundName() -> String {
        return soundNames.randomElement() ?? defaultSoundName 
    }

    private func playDefaultSound() {
        guard let url = Bundle.main.url(forResource: "Audios/\(defaultSoundName)", withExtension: nil) else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing default sound: \(error.localizedDescription)")
        }
    }
}

