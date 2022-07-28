import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let models = [
        "New York",
        "London",
        "Hong Kong",
        "Seattle",
        "Simferopol",
        "New York",
        "London",
        "Hong Kong",
        "Seattle",
        "Simferopol",
        "New York",
        "London",
        "Hong Kong",
        "Seattle",
        "Simferopol",
        "New York",
        "London",
        "Hong Kong",
        "Seattle",
        "Simferopol",
        "New York",
        "London",
        "Hong Kong",
        "Seattle",
        "Simferopol",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }

}

