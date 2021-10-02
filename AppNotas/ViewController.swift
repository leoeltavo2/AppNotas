//
//  ViewController.swift
//  AppNotas
//
//  Created by Mac3 on 02/10/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var notas = ["ver serie", "pagar cuenta", "comprar pozole"]
    var horas = ["8:00AM", "8:15AM", "9:00AM"]

    @IBOutlet weak var tablaNotas: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //boton agregar nota
    @IBAction func btnAddNota(_ sender: UIBarButtonItem) {
        let alerta = UIAlertController(title: "Nueva Nota", message: "Agrega una nueva nota", preferredStyle: .alert)
        
        //agregar campos al alert
        alerta.addTextField { nombreAlerta in
            nombreAlerta.placeholder = "Escribe el titulo de la nota"
        }
        alerta.addTextField { (horaAlerta) in
            horaAlerta.placeholder = "Escribre la fecha"
            horaAlerta.keyboardType = .numbersAndPunctuation
        }
        
        //Accion cuando se aprieta el boton aceptar
        let accionAceptar = UIAlertAction(title: "Agregar", style: .default) { _ in
            
            guard let notaAlerta = alerta.textFields?.first?.text else { return }
            guard let horaAlerta = alerta.textFields?.last?.text else { return }
            
            self.notas.append(notaAlerta)
            self.horas.append(horaAlerta)
            self.tablaNotas.reloadData()
        }
        
        //accion cuando se aprieta el boton cancelar
        let accionCancelar = UIAlertAction(title: "Cancelar", style: .destructive)
        
        alerta.addAction(accionAceptar)
        alerta.addAction(accionCancelar)
        present(alerta, animated: true)
    }
    
    //funciones para el tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaNotas.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = notas[indexPath.row]
        celda.detailTextLabel?.text = horas[indexPath.row]
        return celda
    }

}

