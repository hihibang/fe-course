import { useState } from 'react';
import BasicCounter from './components/counter/BasicCounter.jsx';
import Counter from './components/counter/Counter.jsx';

export default function App() {
    // let totalCount = 0;  //값이 변경되면 자동 리렌더링❌
    const [totalCount, setTotalCount] = useState(0);  //값이 변경되면 자동 리렌더링⭕
    const hadleTotalCount = (type) => {
        if(type === "+") setTotalCount(totalCount + 1);
        else setTotalCount(totalCount - 1);
    }
    return (
        <>
            <h1>AppCounter</h1>
            {/* <h1>Total Count :: <span><b>{totalCount}</b></span></h1>
            <BasicCounter click={hadleTotalCount} total={totalCount}/>
            <BasicCounter click={hadleTotalCount} total={totalCount}/>
            <BasicCounter click={hadleTotalCount} total={totalCount}/>
            <hr/> */}
            <Counter />
        </>
    )
}