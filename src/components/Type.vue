<script setup lang="ts">
import { onMounted, ref } from "vue";

interface Props {
    text: string,
    speed?: number,
    delay?: number
}

const props = withDefaults(defineProps<Props>(), {
    speed: 100
})

let displayedText = ref("");
let isTyping = ref(true);

const typeEffect = () => {
    if (displayedText.value.length < props.text.length) {
        displayedText.value += props.text.charAt(
            displayedText.value.length,
        );
        setTimeout(typeEffect, props.speed);
        return;
    }

    isTyping.value = false;
};

onMounted(() => {
    if (props.delay) {
        setTimeout(typeEffect, props.delay);
    } else {
        typeEffect();
    }
});
</script>

<template>
    <span>{{ displayedText }}</span>
    <span class="transition-all" :class="{ 'opacity-0': !isTyping }" aria-hidden="true">&#x2588;</span>
</template>
