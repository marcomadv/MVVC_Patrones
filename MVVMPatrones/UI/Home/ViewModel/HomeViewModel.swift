//
//  HomeViewModel.swift
//  MVVMPatrones
//
//  Created by Marco Muñoz on 5/10/23.
//

import Foundation


//MARK: - PROTOCOL

protocol HomeViewModelProtocol {
    var dataCount: Int { get }
    func onViewsLoaded()
    func data(at index: Int) -> CharacterModel?
    func onItemSelected(at index: Int)
}







//MARK: - CLASS

final class homeViewModel {
    private weak var viewDelegate: HomeViewProtocol?
    private var viewData = CharactersModel()
    
    init(viewDelegate: HomeViewProtocol? = nil) {
        self.viewDelegate = viewDelegate
    }
    private func loadData() {
        viewData = sampleCharacterData
        viewDelegate?.updateViews()
    }
}







//MARK: - EXTENSION

extension homeViewModel: HomeViewModelProtocol {
    func onItemSelected(at index: Int) {
        guard let data = data(at: index) else { return }
        viewDelegate?.navigateToDetail(with: data)
        
    }
    func data(at index: Int) -> CharacterModel? {
        guard index < dataCount else { return nil }
        return viewData[index]
    }
    var dataCount: Int {
        viewData.count
    }
    func onViewsLoaded() {
        loadData()
    }
  
}
