<script lang="ts">
    export let src: string;
</script>

<style>
    a {
        background: none;
        border: 0.5rem solid #fff;
        padding: 10px 20px;
        color: yellow;
        border-radius: 20rem;
    }
</style>

<a href={src}>
    <slot />
</a>
