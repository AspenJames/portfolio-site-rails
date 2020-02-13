function main() {
	require(['../assets/codemirror/lib/codemirror', `../assets/codemirror/mode/${codemirrorLang}/${codemirrorLang}`], function(CodeMirror, _) {
		const codemirrorDiv = document.querySelector('#codemirror');
		CodeMirror(codemirrorDiv, {
			value: codemirrorSnippet.replace(/&quot;/g, '\"'),
			mode: codemirrorLang
		})
	});
}

window.addEventListener('load', main);