import React from 'react';
import Testimonial from './Testimonial.jsx';
import { Title, SubTitle } from '../commons/Titles.jsx'

export default function Testimonials({data}) {

    return (
        <section id="testimonial" class="section container">
            <Title title="Testimonial"/>
            <SubTitle subTitle="See What they say about me"/>
            <ul class="testimonials">
                {data?.map((item, idx) => 
                <li className="testimonial" key={idx}>
                    <Testimonial item={item}/>
                </li>
                )}
            </ul>
        </section>
    );
}

