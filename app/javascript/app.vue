<template>
  <div id="app" style="width: 900px; margin: auto;">
    <p>{{ message }}</p>
     <el-button>Default</el-button>
    <ul>
      <li v-for="post in posts" :key="post.id" style="margin-bottom: 30px; font-size: 20px;">
        {{ post.user_id }}
        {{ post.title }}： {{ post.content }}
      </li>
    </ul>
    <div>
      <input v-model="title" placeholder="title">
      <input v-model="content" placeholder="content">
      <button @click="addPost">メモを追加</button>
    </div>
  </div>
</template>

<script>
import axios from "axios";


export default {
  data: function () {
    return {
      message: "Hello Vue!",
      posts: "posts",
       title: "",
      content: "",
      currentUserId: "",
    }
  },
   mounted () {
    this.setPost();
  },
  methods: {
    setPost: function () {
      axios.get("/api/posts")
      .then(response => (
        console.log(response.data),
        this.posts = response.data.posts,
        this.currentUserId = response.data.current_user_id
      ))
    },
     addPost: function() {
       console.log(this.current_user_id)
       axios.post("/api/posts", {
        title: this.title,
        content: this.content,
        user_id: this.currentUserId
      })
      .then(response => (
        this.setPost()
      ));
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
