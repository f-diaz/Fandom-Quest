//
//  Data.swift
//  FandomQuest
//
//  Created by Fernando Diaz de Tudela on 20/7/24.
//
import Foundation

let games: [Game] = [
    Game(name: "Star Wars", cards: [
        Card(character: "Luke", imageName: "luke", biography: "Luke Skywalker es un Caballero Jedi y héroe de la Alianza Rebelde."),
        Card(character: "Leia", imageName: "leia", biography: "La Princesa Leia es una líder de la Alianza Rebelde y hermana gemela de Luke Skywalker."),
        Card(character: "Han", imageName: "han", biography: "Han Solo es un contrabandista convertido en héroe de la Alianza Rebelde."),
        Card(character: "Chewbacca", imageName: "chewbacca", biography: "Chewbacca es un guerrero Wookiee y copiloto del Halcón Milenario."),
        Card(character: "Darth Vader", imageName: "vader", biography: "Darth Vader, anteriormente Anakin Skywalker, es un Lord Sith al servicio del Imperio Galáctico."),
        Card(character: "Yoda", imageName: "yoda", biography: "Yoda es un sabio y poderoso Maestro Jedi."),
        Card(character: "R2-D2", imageName: "r2d2", biography: "R2-D2 es un droide astromecánico que ha servido a muchos amos."),
        Card(character: "C-3PO", imageName: "c3po", biography: "C-3PO es un droide de protocolo fluido en más de seis millones de formas de comunicación."),
        Card(character: "Obi-Wan", imageName: "obiwan", biography: "Obi-Wan Kenobi es un Maestro Jedi que entrena a Luke Skywalker."),
        Card(character: "Boba Fett", imageName: "bobafett", biography: "Boba Fett es un famoso cazarrecompensas.")
    ]),
    Game(name: "El Señor de los Anillos", cards: [
        Card(character: "Frodo", imageName: "frodo", biography: "Frodo Bolsón es un hobbit que lleva el Anillo Único al Monte del Destino."),
        Card(character: "Sam", imageName: "sam", biography: "Samwise Gamgee es el leal compañero y amigo de Frodo."),
        Card(character: "Gandalf", imageName: "gandalf", biography: "Gandalf el Gris es un poderoso mago y miembro de la Comunidad del Anillo."),
        Card(character: "Aragorn", imageName: "aragorn", biography: "Aragorn es el heredero de Isildur y el legítimo rey de Gondor."),
        Card(character: "Legolas", imageName: "legolas", biography: "Legolas es un príncipe elfo y hábil arquero."),
        Card(character: "Gimli", imageName: "gimli", biography: "Gimli es un guerrero enano y miembro de la Comunidad del Anillo."),
        Card(character: "Boromir", imageName: "boromir", biography: "Boromir es un valiente guerrero de Gondor y miembro de la Comunidad del Anillo."),
        Card(character: "Gollum", imageName: "gollum", biography: "Gollum, anteriormente conocido como Sméagol, es una criatura corrompida por el Anillo Único."),
        Card(character: "Galadriel", imageName: "galadriel", biography: "Galadriel es una poderosa elfa y señora de Lothlórien."),
        Card(character: "Elrond", imageName: "elrond", biography: "Elrond es el señor de Rivendel y un sabio líder elfo.")
    ]),
    Game(name: "Juego de Tronos", cards: [
        Card(character: "Jon Snow", imageName: "jonsnow", biography: "Jon Snow es el hijo de Eddard Stark y miembro de la Guardia de la Noche."),
        Card(character: "Daenerys", imageName: "daenerys", biography: "Daenerys Targaryen es la última superviviente de la Casa Targaryen."),
        Card(character: "Tyrion", imageName: "tyrion", biography: "Tyrion Lannister es un enano y miembro de la Casa Lannister."),
        Card(character: "Arya", imageName: "arya", biography: "Arya Stark es la hija menor de Eddard Stark y una asesina hábil."),
        Card(character: "Sansa", imageName: "sansa", biography: "Sansa Stark es la hija mayor de Eddard Stark y Señora de Invernalia."),
        Card(character: "Bran", imageName: "bran", biography: "Bran Stark es el hijo de Eddard Stark y el Cuervo de Tres Ojos."),
        Card(character: "Cersei", imageName: "cersei", biography: "Cersei Lannister es la Reina de los Siete Reinos."),
        Card(character: "Jaime", imageName: "jaime", biography: "Jaime Lannister es un caballero de la Guardia Real y miembro de la Casa Lannister."),
        Card(character: "Ned", imageName: "ned", biography: "Eddard Stark es el Guardián del Norte y jefe de la Casa Stark."),
        Card(character: "Khal Drogo", imageName: "khaldrogo", biography: "Khal Drogo es el líder de una horda dothraki y esposo de Daenerys Targaryen.")
    ])
]
