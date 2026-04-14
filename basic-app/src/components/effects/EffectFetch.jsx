import { useEffect, useState } from 'react';
import AvatarList from '../avatar/AvatarList.jsx';
import people1 from '../../assets/people1.webp';
import people2 from '../../assets/people2.webp';
import people3 from '../../assets/people3.webp';

export default function EffectFetch() {
    const [data, setData] = useState([]);
    const [count, setCount] = useState(0);

    const url = "http://localhost:5173/data/alist.json";    
    useEffect(()=>{
        console.log('---> 마운트 or 업데이트시 호출!!', count);        
        const fetchData = async() => {
            const response = await fetch(url);
            const jsonData = await response.json();
            setData(jsonData);
        }
        fetchData();
    }, [count]);

    return(
        <>
            <AvatarList list={data} />
            <h2>{count}</h2>
            <button type="button" onClick={()=>setCount(count+1)}>
                증가(+)
            </button>
        </>
    )
}