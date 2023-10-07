//
//  DetailViewController.swift
//  MVVMPatrones
//
//  Created by Marco Muñoz on 5/10/23.
//

import UIKit

// MARK: - PROTOCOL
protocol DetailViewControllerProtocol: AnyObject {
    func updateviews()
}

// MARK: - CLASS
class DetailViewController: UIViewController {

    var viewModel: DetailViewModelProtocol?

    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var descriptionDetail: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
     
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

//MARK: - EXTENSION

extension DetailViewController: DetailViewControllerProtocol {
    func updateviews() {
        guard let data = viewModel?.getCharacter() else {
            return
        }
        update(name: data.name)
        update(image: data.image)
        update(description: data.description)
    }
    
}
