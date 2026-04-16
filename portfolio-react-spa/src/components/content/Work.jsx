import React from 'react';
import Categories from './Categories.jsx';
import Projects from '../content/Projects.jsx';
import { Title, SubTitle } from '../commons/Titles.jsx'

export default function Work({ data }) {
    return (
        <section id="work" class="section container">
            <Title title="My Work"/>
            <SubTitle subTitle="Projects"/>
            <Categories categories={data?.categories}/>
            <Projects projects={data?.projects}/>
        </section>
    );
}

