//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Kate on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChosen: [Answer] = []
    var answersFiltered: Animal!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
    
        getResult()
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

extension ResultViewController {
    private func getResult() {
        let answersSorted = answersChosen.map { $0.animal }
        let animalsGroups = Dictionary(grouping: answersSorted, by: { $0.rawValue } )
          
        let animalsFiltered = animalsGroups
            .filter { $1.count > 1 }
        
        for animal in animalsFiltered {
            let animal = animal.value
            answersFiltered = animal.first
        }
        showResult(for: answersFiltered)
    }

    private func showResult(for type: Animal) {
        switch type {
        case .cat:
            resultLabel.text = "Вы - \(Animal.cat.rawValue)!"
            definitionLabel.text = Animal.cat.definition
        case .dog:
            resultLabel.text = "Вы - \(Animal.dog.rawValue)!"
            definitionLabel.text = Animal.dog.definition
        case .turtle:
            resultLabel.text = "Вы - \(Animal.turtle.rawValue)!"
            definitionLabel.text = Animal.turtle.definition
        case .rabbit:
            resultLabel.text = "Вы - \(Animal.rabbit.rawValue)!"
            definitionLabel.text = Animal.rabbit.definition
        }
    }
}
