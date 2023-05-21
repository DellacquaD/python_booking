import React from 'react'
import styles from './AboutUs.module.css'
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faLinkedinIn } from "@fortawesome/free-brands-svg-icons";
import { Link } from "react-router-dom";


const personas = [
    {
      imagen: 'https://media.discordapp.net/attachments/1075126138562678819/1095099623418376253/fotocv.jpg_1.jpg?width=662&height=676',
      name: 'Florencia Lecha',
      rol: 'Desarrollador Backend',
      redes: {
        linkedin: 'https://www.linkedin.com/in/florencialecha/',
      },
    },
    {
      imagen: 'https://media.discordapp.net/attachments/1075126138562678819/1095100081847410781/IMG-20230410-WA0061.jpg?width=469&height=468',
      rol: 'Base de Datos y Testing',
      name: 'Manuel Godoy',
      redes: {
        linkedin: 'https://www.linkedin.com/in/manuel-godoy-94b20b208/',
      },
    },
    {
        imagen: 'https://i.ibb.co/30fZf8w/fotocarne.png',
        rol: 'Desarrollador Frontend',
        name: 'Damian DellAcqua ',
        redes: {
          linkedin: 'https://www.linkedin.com/in/dami%C3%A1n-dell-acqua-274b29107/',
        },
      },
    {
      imagen: 'https://static.vecteezy.com/system/resources/previews/002/227/847/non_2x/programmer-computer-expert-black-linear-icon-vector.jpg',
      rol: 'Infraestructura de Datos',
      name: 'Ciro Rojas',
      redes: {
        linkedin: 'https://www.linkedin.com/in/ciro-rojas',
      },
    },
    {
        imagen: 'https://static.vecteezy.com/system/resources/previews/002/227/847/non_2x/programmer-computer-expert-black-linear-icon-vector.jpg',
        rol: 'Desarrollador Frontend',
        name: 'Rocky Montero',
        redes: {
            linkedin: 'https://www.linkedin.com/in/rocky-montero',
        },
    },
  ];

const AboutUs = () => {
    return (
        <div className={styles.aboutUsContainer}>
          {personas.map((persona, index) => (
            <div key={index} className={styles.personalContainer}>
              <img src={persona.imagen} alt={`Foto de ${persona.rol}`} className={styles.personalImage}/>
              <p className={styles.personalName}>{persona.name}</p>
              <p>{persona.rol}</p>
              <Link to={persona.redes.linkedin} target="_blank">
                <FontAwesomeIcon icon={faLinkedinIn} size="xl" />
              </Link>
            </div>
          ))}
        </div>
      );
}

export default AboutUs