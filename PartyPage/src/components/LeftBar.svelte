<script>
    import MdApps from 'svelte-icons/md/MdApps.svelte';
    import BackgroundBlur from './BackgroundBlur.svelte';
</script>

<style>
    div {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 100vh;
    }
</style>

<BackgroundBlur>
    <div>
        <MdApps />
        <p> yo </p>
        <p> yo </p>
    </div>
</BackgroundBlur>
