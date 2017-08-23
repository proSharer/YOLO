
const express = require('express');
const http = require('http');
const fs = require('fs');
const socketio = require('socket.io');

const app = express();

app.use(express.static(__dirname+'/public'));

const server = http.createServer(app);
server.listen(3000,function(){
    console.log("Server running at http://192.168.201.29:3000");
});

const users = [];

const io = socketio.listen(server);

io.sockets.on('connection',function(socket){

    console.log(io.sockets.in("chat").sockets);
    
    socket.on('join', function(name) {
        users.push({
            "name": name,
            "id": socket.id
        });

        socket.join("chat");
        socket.emit('getMyId', socket.id); // 방금접속한 브라우저에게만 id를 파라미터로 보내준다.
        io.sockets.in("chat").emit("displayAllUsers", users); 
    });

    socket.on("broadcast",function(data){
        console.log("Client send data:"+ data);

            socket.emit("receive", data);
            io.sockets.in("chat").emit("receive", data);

    });

    // 소켓이 끊어지면 자동으로 호출
    socket.on("disconnect", function() {
        console.log("연결이 끊어짐 - " + socket.id);
        for (let i in users) {
            if (users[i].id == socket.id) {
                users.splice(i, 1);
                break;
            }
        }
      
        io.sockets.in("chat").emit("displayAllUsers", users);
    });

});


app.use(function(request,response){
    fs.readFile("client.html","utf-8",function(err,data){
        response.type("text/html");
        response.send(data);
    });
});