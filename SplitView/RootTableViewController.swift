import UIKit

class RootTableViewController: UITableViewController {

    var sitios = ["http://www.apple.com","http://www.google.com","http://www.yahoo.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sitios.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let sitio = sitios[indexPath.row]
        cell.textLabel?.text = sitio
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.splitViewController?.preferredDisplayMode = .automatic
        let viewcontroller : DetalleViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetalleViewController") as! DetalleViewController
        let fila = sitios[indexPath.row]
        let destino = viewcontroller
        destino.url = fila
        let navigationcontroller = UINavigationController(rootViewController: viewcontroller)
        self.splitViewController?.showDetailViewController(navigationcontroller, sender: self)
    }
    
    

}
