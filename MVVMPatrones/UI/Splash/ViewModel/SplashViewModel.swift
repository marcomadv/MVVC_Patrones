//
//  SplashViewModel.swift
//  MVVMPatrones
//
//  Created by Marco Muñoz on 4/10/23.
//

import Foundation

//MARK: - PROTOCOLS
protocol SplashViewModelProtocol {
    func onViewsLoaded()
}

//MARK: - CLASS
final class SplashViewModel {
    
    var viewDelegate: SplashViewProtocol?
    
    init(viewDelegate: SplashViewProtocol? = nil) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        viewDelegate?.showLoading(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            self?.viewDelegate?.showLoading(false)
            self?.viewDelegate?.navigateToHome()
        }
    }
}

//MARK: - EXTENSIONS

extension SplashViewModel: SplashViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }
}

