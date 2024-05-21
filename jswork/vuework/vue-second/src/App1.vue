<template>
    <div>
        <!-- <a v-for="header in 3" :key="">Home</a> -->
        <a v-for="(menu,i) in menus" :key="i">{{ menu }}</a>
        <a>Celeb</a>
        <a>About</a>
    </div>

    <div>
        <h3>{{ celeb[0] }}</h3>
        <p>소속사: 하이브</p>
    </div>
    <div>
        <h3>{{ celeb[1] }}</h3>
        <p>소속사: SM</p>
    </div>
    <div>
        <h3>{{ celeb[2] }}</h3>
        <p>소속사: YG</p>
    </div>
    <div>
        <h3>{{ celeb[3] }}</h3>
        <p>소속사: JYP</p>
    </div>
</template>

<script>
export default {
    data () {
        

        return {

            menus:['Home','Celeb','About'],
            celeb:['여진구','최지우','박보영','박신혜','유아인']
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
</style>