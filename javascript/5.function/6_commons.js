/*
    commons 폴더에 저장된 함수 호출
    - 공통으로 사용되는 함수를 선언하고 반복 호출
*/
import { singleGugudan, multiGuguden } from "../commons/gugudan.js";

singleGugudan(3);
singleGugudan(7);
multiGuguden(3, 7);
multiGuguden(1, 9);