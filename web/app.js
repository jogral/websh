'use strict';

new Vue({});

var term = new Terminal({
  cursorBlink: true,
  scrollback: 500
}),
    protocol = (location.protocol === 'https:') ? 'wss://' : 'ws://',
    socketURL = protocol + location.hostname + ((location.port) ? (':' + location.port) : '') + "/ws";
var sock = new WebSocket(socketURL);
sock.addEventListener('open', function () {
  term.terminadoAttach(sock);
});
term.open(document.getElementById('#terminal'));
term.fit();
