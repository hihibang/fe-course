import React from 'react';
import AvatarImage from '../commons/AvatarImage.jsx'

export default function Projects({ projects }) {

    return (
        <ul class="projects">
            {projects?.map((item, idx)=> 
            <li className="project">
                <AvatarImage img={item.img}
                             alt={item.alt}
                             style="project-img"/>
                <div class="project-meta">
                    <h3 className="project-meta-title">{item.title}</h3>
                    <p>{item.description}</p>
                </div>
            </li>
            )}
        </ul>
    );
}

