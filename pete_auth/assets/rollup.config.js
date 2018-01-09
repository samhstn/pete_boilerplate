export default [
  'app', 'home', 'none'
].map((file) => {
  return {
    input: `js/${file}.js`,
    output: {
      file: `../priv/static/js/${file}.js`,
      format: 'cjs',
      sourcemap: true
    }
  };
}).concat([
  {
    input: '../deps/phoenix_html/priv/static/phoenix_html.js',
    output: {
      file: '../priv/static/js/phoenix_html.js',
      format: 'cjs',
      sourcemap: true
    }
  }
])
