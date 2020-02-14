function main() {
  let retryCount = 0;
  const codemirrorDiv = document.querySelector('#codemirror');

  function load() {
	require(['../assets/codemirror/lib/codemirror', `../assets/codemirror/mode/${codemirrorLang}/${codemirrorLang}`], function(CodeMirror, _) {
	  CodeMirror(codemirrorDiv, {
		value: codemirrorSnippet.replace(/&quot;/g, '\"'),
		mode: codemirrorLang
	  });
	});
  }

  function checkLoaded() {
	if (codemirrorDiv.innerHTML.length === 0) {
	  if (retryCount > 3) {
		//TODO: take action when can't load
	  } else {
		retryCount++;
		load();
	  }
	}
  }

  checkLoaded();
}

window.addEventListener('load', main);
