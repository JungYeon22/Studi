// // Create a WebSocket connection to the server
// const chattingSock = new SockJS(`${contextPath}/chat`);
//
// chattingSock.onopen = function() {
//     console.log('scoket연결완료');
// };
// // Add event listener to the "send" button
// document.getElementById("send").addEventListener("click", sendMessage);
//
// // Function to send a message
// function sendMessage() {
//     const myChat = document.getElementById("myChat");
//
//     if (myChat.value.trim().length === 0) {
//         alert("채팅을 입력해주세요");
//         myChat.value = "";
//         myChat.focus();
//     } else {
//         // Create a chat message object
//         const chatMessage = {
//             "memberNO": memberNO,
//             "memberName": memberName,
//             "chatRoomNo": chatRoomNO,
//             "message": myChat.value
//         };
//
//         // Convert the chat message object to JSON string
//         const jsonMessage = JSON.stringify(chatMessage);
//
//         // Send the JSON-formatted message to the server
//         chattingSock.send(jsonMessage);
//
//         // Clear the input field after sending the message
//         myChat.value = "";
//
//         // Focus back on the input field
//         myChat.focus();
//     }
// }