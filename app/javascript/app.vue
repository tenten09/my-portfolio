<template>
  <div id="app">
    <p>{{ message }}</p>
    <ul>
      <li v-for="post in posts" :key="post.id">
        {{ post.user_id }}
        {{ post.title }}： {{ post.content }}
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      message: "Hello Vue!",
      posts: "posts"
    }
  },
   mounted () {
    this.setPost();
  },
  methods: {
    setPost: function () {
      axios.get('/api/posts')
      .then(response => (
        this.posts = response.data
      ))
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
