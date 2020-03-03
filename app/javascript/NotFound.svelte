<script>
  export let slug;
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
}

a {
  color: aqua;
  text-decoration: none;
  font-size: 1.2em;
}

a:hover {
  text-decoration: underline;
  cursor: pointer;
}
</style>

<h1>Project Not Found</h1>

<p>There's no project located at "/{slug}"</p>
<a href='/projects'>Go back to all projects</a>
