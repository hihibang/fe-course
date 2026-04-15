import React from 'react';

export default function SkillsCoding() {
    // const skills = [
    //     { "title":"HTML",       "value": "98%", "width": "98%"},
    //     { "title":"CSS",        "value": "90%", "width": "90%"},
    //     { "title":"JavaScript", "value": "80%", "width": "80%"},
    //     { "title":"TypeScript", "value": "90%", "width": "90%"},
    //     { "title":"React",      "value": "88%", "width": "88%"},
    //     { "title":"Node.js",    "value": "75%", "width": "75%"}
    // ];
    return (
        <ul>
            {skills.map((skill, idx) => 
                <li className="bar" key={idx}>
                    <div className="bar-title">
                        <span>{skill.title}</span><span>{skill.value}</span>
                    </div>
                    <div className="bar-bg">
                        <div className="bar-value" style={{width:skill.width}}></div>
                    </div>
                </li>            
            )}
        </ul>
    );
}
