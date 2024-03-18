<template>
    <div>
        <h1 class="alert alert-info">SecondApp 입니다</h1>
        <h2>{{ couter }}</h2>
        <button @click="countIncer">증가</button>
        
        <h2>{{ message }}</h2>
        <button @click="msgIncre">메세지 증가</button>
    </div>
</template>

<script>
import { ref } from 'vue';

export default {
    setup () {
        
        const couter=ref(0);
        const countIncer=()=>{
            couter.value++;
        }

        const message=ref("껄껄");
        const msgIncre=()=>{
            message.value=message.value+"껄";
        }

        return {
            couter,
            countIncer,
            message,
            msgIncre
        }
    }
}
</script>

<style lang="scss" scoped>

</style>