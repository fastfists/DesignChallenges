
<script>
    import BackgroundBlur from './BackgroundBlur.svelte';
    import MdPerson from 'svelte-icons/md/MdPerson.svelte'
</script>

<style>
    .container {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
        align-content: center;
        text-align: center;
        height: 100vh;
        width: 100%;
        color: white;
    }

    .icon {
        width: 32px;
        height: 32px;
    }
</style>

<BackgroundBlur>
    <div class="container">
        <div class="icon">
            <MdPerson/>
        </div>
    </div>
</BackgroundBlur>
