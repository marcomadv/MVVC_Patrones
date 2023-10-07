//
//  DetailViewModel.swift
//  MVVMPatrones
//
//  Created by Marco Muñoz on 6/10/23.
//

import Foundation

//MARK: - PROTOCOL
protocol DetailViewModelProtocol {
    func onViewsLoaded()
    func getCharacter() -> CharacterModel
}








//MARK: - CLASS
final class DetailViewModel {
    
    private var characterData: CharacterModel
    
    private weak var viewDelegate: DetailViewControllerProtocol?

    init(viewDelegate: DetailViewControllerProtocol? = nil, characterData: CharacterModel) {
        self.viewDelegate = viewDelegate
        self.characterData = characterData
    }
    
    func loadData() {
        viewDelegate?.updateviews()
    }
}









//MARK: - EXTENSION
extension DetailViewModel: DetailViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }
    
    func getCharacter() -> CharacterModel {
        return self.characterData
    }
}
