//
//  ViewController.swift
//  Counter
//
//  Created by Dmitriy Noise on 06.12.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var clickCounter: UILabel!
    @IBOutlet weak var clickHistory: UITextView!
    
    // Количество нажатий
    private var numberOfClicks = 0
    
    // Обновляем текст
    private func updateLabelCounter(value: Int ) {
        clickCounter.text = "Значение счетчика: \(value)"
    }
    
    // Текущая дата
    private func currentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        
        return "[\(dateFormatter.string(from: Date()))]"
    }
    
    

    // Большая кнопка +1
    @IBAction func counterButton() {
        numberOfClicks += 1
        updateLabelCounter(value: numberOfClicks)
        
        clickHistory.text += "\n\(currentDate()) Значение изменено на +1"
    }
    
    // Кнопка плюс
    @IBAction func addOneToCounter() {
        // Уже есть, ее и повторю
        counterButton()
    }
    
    // Кнопка минус
    @IBAction func subtractOneToCounter() {
        // Завершить если меньше или ноль, чтобы не уходить в минус
        if numberOfClicks <= 0 {
            clickHistory.text += "\n\(currentDate()) Попытка уменьшить значение счётчика ниже 0"
            return
        }
        
        numberOfClicks -= 1
        updateLabelCounter(value: numberOfClicks)
        clickHistory.text += "\n\(currentDate()) Значение изменено на -1"
    }
    
    // Обнуление счетчика
    @IBAction func resetCounter() {
        numberOfClicks = 0
        updateLabelCounter(value: 0)
        
        clickHistory.text += "\n\(currentDate()) Значение сброшено"
    }
    
}

