import js.Browser;
import js.html.ButtonElement;
import js.html.DivElement;

class Main {
	static function main() {
		var document = Browser.document;
		var root = document.getElementById("app");

		if (root == null) {
			trace("Missing #app element");
			return;
		}

		root.innerHTML = "";

		var card = document.createDivElement();
		card.className = "card";

		var title = document.createElement("h1");
		title.textContent = "Hello from Haxe";

		var message = document.createParagraphElement();
		message.textContent = "This page was compiled from Haxe to JavaScript.";

		var counter:DivElement = document.createDivElement();
		counter.className = "counter";

		var count = 0;
		function updateCounter() {
			counter.textContent = 'Clicks: $count';
		}
		updateCounter();

		var button:ButtonElement = document.createButtonElement();
		button.textContent = "Click me";
		button.onclick = function(_) {
			count++;
			updateCounter();
		};

		card.appendChild(title);
		card.appendChild(message);
		card.appendChild(counter);
		card.appendChild(button);
		root.appendChild(card);
	}
}
