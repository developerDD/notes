//
//  ViewController.swift
//  Lesson2
//
//  Created by Дима Деревянко on 15.03.2022.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var notesTable: UITableView!
    var notesArrey = Array<String>()
    @IBOutlet weak var labelNoNotes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
/* override func viewDidAppear(_ animated: Bool) {
        let loginStoryBord = UIStoryboard(name: "login", bundle: Bundle.main)
        
        if let loginVC = loginStoryBord.instantiateInitialViewController() as? LoginViewController {
            present(loginVC,animated: true,completion: nil)
        }
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let notesCount = notesArrey.count
        labelNoNotes.isHidden = notesCount>0
        
        return notesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell")! as UITableViewCell
        
        cell.textLabel?.text = notesArrey[indexPath.row]
        return cell
    }
    
    @IBAction func composeButtonTapped(_ sender: Any) {
        addNote()
    }
    
    func addNote(){
        let note = "\(notesArrey.count+1) task"
        notesArrey.append(note)
        notesTable.reloadData()
    }
    
    func deleteNoteAt(index:Int){
        notesArrey.remove(at: index)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteNoteAt(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}

