function main() {
  let retryCount = 0;
  const codemirrorDiv = document.querySelector('#codemirror');

  async function load() {
	require(['../assets/codemirror/lib/codemirror', `../assets/codemirror/mode/${codemirrorLang}/${codemirrorLang}`], function(CodeMirror, _) {
	  CodeMirror(codemirrorDiv, {
		value: codemirrorSnippet.replace(/&quot;/g, '\"'),
		mode: codemirrorLang
	  });
	});
  }

  function checkLoaded() {
	const codemirrorPresent = document.querySelector('.CodeMirror');
	if (!codemirrorPresent) {
	  // codemirrorDiv is empty, loading has not happened
	  if (retryCount > 3) {
		// Retry count exceeded
		codemirrorDiv.innerHTML = "";
		codemirrorDiv.classList.add('error');
		codemirrorDiv.textContent = "There was an error loading the JavaScript library to display this code snippet. Refresh the page, and if this problem persists, ";
		const link = document.createElement('a');
		link.textContent = "view on GitHub";
		link.href = codemirrorSnippetUrl;
		codemirrorDiv.append(link);
	  } else {
		// Retry load - inc. count; load; checkLoaded;
		retryCount++;
		try {
		  load();
		  window.addEventListener('load', checkLoaded);
		} catch(e) {
		  console.error("error caught during load()", e);
		}
	  }
	}
  }

  checkLoaded();
}

window.addEventListener('load', main);
