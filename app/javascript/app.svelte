<script>
import { onMount } from 'svelte';
import { CodeMirror } from 'codemirror';

import ProjectDetail from './ProjectDetail.svelte';
import NotFound from './NotFound.svelte';

let project;
let slug;

onMount(async () => {
  // window.location.pathname //=> '/projects/:slug/'
  const pathname = window.location.pathname
  // pathname.split('/') //=> ['', 'projects', ':slug']
  slug = pathname.split('/').pop()

  try {
    const res = await fetch(`${slug}.json`);
    try {
      project = await res.json();
    } catch(e) {
      console.error("error caught during JSON parse", e);
    }
  } catch(e) {
    console.error("error caught during fetch", e);
  }

});
</script>

{#if project}
  <ProjectDetail { project } />
{:else}
  <NotFound { slug } />
{/if}

