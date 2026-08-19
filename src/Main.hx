import js.Browser;

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
		title.textContent = "HAXE-MOSH";

		var message = document.createParagraphElement();
		message.textContent = "Let's make something together!";

		card.appendChild(title);
		card.appendChild(message);
		root.appendChild(card);
	}
}
