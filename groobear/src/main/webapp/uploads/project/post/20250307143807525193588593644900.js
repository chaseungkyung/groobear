import {useRef, useState} from 'react'
import UserList from './UserList';
import CreateUser from './CreateUser';

function EffectEx2() {
    const [inputs, setInputs] = useState({
        username:'',
        email:''
    });

    const {username, email} = inputs;

    const onChange = e => {
        const {name, value} = e.target;
        setInputs({
            ...inputs,
            [name]: value
        });
    };

    const nextId = useRef(1);

    const [users, setUsers] = useState([]);

    const onCreate = () => {
        // useRef의 current : current 속성으로 저장된 값 저장
        const user = {
            id: nextId.current,
            username,
            email
        };

        setUsers(users.concat(user));

        setInputs({
            username:'',
            email:''
        });
        nextId.current += 1;
    };

    const onRemove = id => {

    };

    const onToggle = id => {

    };

    return (
        <>
            <CreateUser
                username={username}
                email={email}
                onChange={onChange}
                onCreate={onCreate}
            />
            <UserList users={users} onRemove={onRemove} onToggle={onToggle}/>
        </>
    )
}

export default EffectEx2;
