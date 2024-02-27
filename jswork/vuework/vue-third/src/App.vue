<template>
<div>
  <div class="menu">
      <!-- <a v-for="header in 3" :key="">Home</a> -->
      <a v-for="(menu,i) in menus" :key="i">{{ menu }}</a>
  </div>

  <div class="celeb" v-for="agency in agencys" :key="agency">
    <img src=":src='agency.imgSrc'" class="img">
      <h3>{{ agency.name }}</h3>
      <p>{{ agency.company }}</p>
      <button @click="onClickLikes(key)">좋아유</button>
      <span>좋아요:{{ agency.likes }}</span>
  </div>
</div>
</template>

<script>
export default {
  data () {
      

      return {

          menus:['Home','Celeb','About'],
          agencys:[{name:'여진구',company:'하이브',like:0,imgSrc:require('./assets/images/1.jpg')},
          {name:'최지우',company:'SM',like:0,imgSrc:require('./assets/images/5.jpg')},
          {name:'박보영',company:'하이브',like:0,imgSrc:require('./assets/images/12.jpg')},
          {name:'박신혜',company:'JYP',like:0,imgSrc:require('./assets/images/13.jpg')},
          {name:'유아인',company:'YG',like:0,imgSrc:require('./assets/images/20.jpg')}
        ],
      }
  },
  methods:{
    onClickLikes(num) {
      this.agencys[num].likes++;
    }
  }
}
</script>

<style lang="scss" scoped>

  .menu{
      background-color: blueviolet;
      padding: 10px;
      border-radius: 5px;
  }

  .menu a{
      color: white;
      padding: 10px;
  }

  .img{
      width: 200px;
      border-radius: 30px;
  }
</style>