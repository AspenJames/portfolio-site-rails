<script>
import CodeMirror from 'codemirror';
import 'codemirror/theme/erlang-dark.css';


export let project;

(function renderCodeMirror(project) {
  if (!project) return; // no data, nothing to do

  function render() {
    const el = document.querySelector('#codemirror')
    CodeMirror(el, {
      value: project.snippet,
      mode: project.lang,
      readOnly: true,
      inputStyle: "contenteditable",
      theme: "erlang-dark",
    });
  }

  try {
    // Loading this mode can fail.
    // In case of failure, we can still show the CodeMirror snippet
    // without any syntax highlighting instead of crashing.
    require([`codemirror/mode/${project.lang}/${project.lang}`], _ => render());
  } catch(e) {
    console.error(`error caught while loading language mode: ${e}`);
  }
})(project);
</script>

<style>
h1 {
  color: aliceblue;
  margin-bottom: 10px;
  font-size: 4em;
}

p {
  color: aliceblue;
  font-size: 1.2em;
  line-height: 1.5;
  width: 80%;
  margin: 10px auto;
}

div.links {
  margin-bottom: 10px;
  font-size: 1.5em;
}

a {
  text-decoration: none;
  color: aqua;
}

a:hover {
  text-decoration: underline;
  cursor: pointer;
}

span {
  font-size: inherit;
  color: aliceblue;
}

@media only screen and (max-width: 900px) {
  h1 {
    font-size: 2.5em;
  }

  p {
    font-size: 1em;
    line-height: 1.3;
  }

  span {
    font-size: inherit;
    color: aliceblue;
  }

  div.links {
    font-size: 1em;
  }
}
</style>

{#if project}
  <h1>{project.name}</h1>

  <div class='links'>
  {#if project.url}
    <a href={project.url}>Hosted Project</a> <span> | </span>
  {/if}

  {#if project.git_url}
    <a href={project.git_url}>GitHub Repository</a>
  {/if}
  </div>

  <p>{project.description}</p>
{/if}
<div id='codemirror'></div>
