//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet var resultLable: UILabel!
    @IBOutlet var resultLableText: UILabel!
    
    // MARK: - data container
    var ansewrChosen: [Answer] = []
    
    private var answerDogCount: [AnimalType] = []
    private var answerCatCount: [AnimalType] = []
    private var answerRabbitCount: [AnimalType] = []
    private var answerTurtleCount: [AnimalType] = []
    
    // MARK: - override func
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        resultCalculate()
        comparsion(currentCount: answerDogCount, answerCount1: answerCatCount, answerCount2: answerRabbitCount, answerCount3: answerTurtleCount)
        comparsion(currentCount: answerCatCount, answerCount1: answerDogCount, answerCount2: answerRabbitCount, answerCount3: answerTurtleCount)
        comparsion(currentCount: answerRabbitCount, answerCount1: answerCatCount, answerCount2: answerDogCount, answerCount3: answerTurtleCount)
        comparsion(currentCount: answerTurtleCount, answerCount1: answerCatCount, answerCount2: answerRabbitCount, answerCount3: answerDogCount)
    }
    // MARK: - IBActiion
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
        ansewrChosen = []
        
        answerDogCount = []
        answerCatCount = []
        answerTurtleCount = []
        answerRabbitCount = []
    }
    // MARK: - private func
     private func resultCalculate() {
        for answer in ansewrChosen {
            let answertype = answer.type
            switch answertype {
            case .dog:
                answerDogCount.append(answertype)
            case .cat:
                answerCatCount.append(answertype)
            case .rabbit:
                answerRabbitCount.append(answertype)
            case .turtle:
                answerTurtleCount.append(answertype)
            }
        }
    }
    
   private func comparsion (currentCount: [AnimalType], answerCount1: [AnimalType], answerCount2: [AnimalType],answerCount3: [AnimalType]) {
        switch currentCount {
        case _ where currentCount.count > answerCount1.count:
            fallthrough
        case _ where currentCount.count > answerCount2.count:
            fallthrough
        case _ where currentCount.count > answerCount3.count:
            resultLable.text = String(currentCount.first?.rawValue ?? "🤬")
            resultLableText.text = currentCount.first?.definition
        default: break
        }
    }
}

