import React from 'react';
import AvatarImage from '../commons/AvatarImage.jsx';

export default function Testimonial({item}) {
    return (
        <>
            <AvatarImage img={item.img} // "images/testimonials/people1.webp"
                         alt={item.alt} // "people1"
                         style="testimonial-img"  />
            <div className="testimonial-text">
                <p>{item.description}</p>
                <p><a href="#">
                    <span className="testimonial-text-name">{item.name}</span>
                    <span className="testimonial-text-company">{item.comapny}</span></a></p>     
            </div>
        </>
    );
}

