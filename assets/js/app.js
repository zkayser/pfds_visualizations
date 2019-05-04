// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import { Socket } from 'phoenix';
import LiveSocket from "phoenix_live_view";
import hljs from 'highlight.js/lib/highlight';
import elixir from 'highlight.js/lib/languages/elixir';
import "../css/dracula.css";

let socket = new Socket("/socket", {});
socket.connect();
let channel = socket.channel("listeners:lobby", {});

const highlightBlocks = () => {
  document.querySelectorAll('code').forEach((block) => {
    console.log(`Highlighting a block`);
    hljs.highlightBlock(block);
  });
}

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })
channel.on("refresh_highlighting", (payload) => {
  console.log('refreshing highlighting');
  highlightBlocks();
});


let liveSocket = new LiveSocket("/live");
liveSocket.connect();
hljs.registerLanguage('elixir', elixir);
hljs.initHighlightingOnLoad();