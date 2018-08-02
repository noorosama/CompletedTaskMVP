





import Foundation

protocol ListConfigurable {
    
    func configure(listViewController: ListViewController)
}

class ListConfigurator: ListConfigurable {
    
    let items: [String]
    
    init(items: [String]) {
        
        self.items = items
    }
    
    func configure(listViewController: ListViewController) {
        
        let router = listRouter(viewController: listViewController)
        
        let presenter = ListPresenter(output: listViewController, items: items, router: router)
        
        listViewController.presenter = presenter
        
    }
    
}
