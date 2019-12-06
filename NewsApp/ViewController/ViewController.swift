//
//  ViewController.swift
//  NewsApp
//
//  Created by SAURABH MISHRA on 06/12/19.
//  Copyright © 2019 SAURABH MISHRA. All rights reserved.
//

import UIKit
import SDWebImage




class ViewController: UIViewController {
    
    

    var storydata:StoryData?
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.accessibilityIdentifier = "table--storyTableView"

        
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Ny Times Most Popular"

        getNews()
        // Do any additional setup after loading the view.
    }

    func getNews() {

        let url = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=so0PGL5eAacoWY3OhLCzy6spxirjw3T0"
        URLSession.shared.dataTask(with: URL(string: url)!) {[weak self] (data, res, err) in
            
            guard let data = data else {return}
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self?.storydata = try decoder.decode(StoryData.self, from: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }

            }catch let jsonErr{
                print("error in json parsing",jsonErr)
            }
            
        }.resume()
        
    }

}


// tableView datasource & delegates

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        storydata?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "storyCell") as! StoryTableViewCell
        cell.title.text = storydata?.results[indexPath.row].title
        cell.date.text = storydata?.results[indexPath.row].publishedDate
        cell.authors.text = storydata?.results[indexPath.row].byline
        cell.imgView.setRounded()
        cell.imgView.backgroundColor = .gray
        cell.accessoryType = .disclosureIndicator

        let imgArr = storydata?.results[indexPath.row].media[0].mediaMetaData[0]
        
        if let urlStr = imgArr?.url{
            
            cell.imgView.sd_setImage(with: URL(string: urlStr), completed: nil)

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.story = storydata?.results[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)

        
    }
    
}
