function main() {
  let FACTS = [
	"I earned the rank of Eagle Scout in May 2010",
	"I can chirp like a bird; it confuses most dogs and people at first",
	"I have a pet ball python named Siouxsie",
	"I shoot film photography and used to volunteer at a community darkroom",
	"I'll almost always prefer an application that will run within my terminal to a GUI",
	"I play a fair amount of Brogue, despite never coming close to winning"
  ]

  const button = document.querySelector('#funfact-button');
  const div = document.querySelector('#funfact-div');

  function click() {
	const randIdx = Math.floor(Math.random() * FACTS.length);
	const randomFact = FACTS[randIdx];
	div.textContent = randomFact;
	FACTS.splice(randIdx, 1);
	if (FACTS.length === 0) {
	  FACTS = [
		"I earned the rank of Eagle Scout in May 2010",
		"I can chirp like a bird; it confuses most dogs and people at first",
		"I have a pet ball python named Siouxsie",
		"I shoot film photography and used to volunteer at a community darkroom",
		"I'll almost always prefer an application that will run within my terminal to a GUI",
		"I play a fair amount of Brogue, despite never coming close to winning"
	  ];
	}
	if (button.textContent === 'Yes please!') {
	  button.textContent = 'Another!';
	}
  }
  button.addEventListener('click', click);
}

window.addEventListener('load', main);
