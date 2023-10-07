//
//  DetailViewController.swift
//  MVVMPatrones
//
//  Created by Marco Muñoz on 5/10/23.
//

import UIKit

class DetailViewController: UIViewController {

    var characterData: CharacterModel

    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var descriptionDetail: UITextView!
    
    init(characterData:  CharacterModel) {
        self.characterData = characterData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(data: characterData)
     
    }

    
    func updateView(data: CharacterModel) {
        update(name: data.name)
        update(image: data.image)
        update(description: data.description)
    }
    private func update(name: String?) {
        nameDetail.text = name ?? ""
    }
    private func update(description: String?) {
        descriptionDetail.text = description ?? ""
    }
    private func update(image: String?) {
        imageDetail.image = UIImage(named: image ?? "")
    }
    
 

}
