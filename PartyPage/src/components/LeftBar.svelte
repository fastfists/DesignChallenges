<script>
    import MdApps from 'svelte-icons/md/MdApps.svelte';
    import IoMdArrowDropup from 'svelte-icons/io/IoMdArrowDropup.svelte'
    import IoMdArrowDropdown from 'svelte-icons/io/IoMdArrowDropdown.svelte'
    import BackgroundBlur from './BackgroundBlur.svelte';
    import FaTwitter from 'svelte-icons/fa/FaTwitter.svelte'
    import FaYoutube from 'svelte-icons/fa/FaYoutube.svelte'
    import FaInstagram from 'svelte-icons/fa/FaInstagram.svelte'
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
        display: inline-block;
        width: 32px;
        height: 32px;
    }

    .sideways {
        transform: rotate(270deg);
    }

    h1 {
        font-size: 50px;
        margin: 0.25em 0;
    }

    .sub {
        font-size: 25px;
        margin: 0.2em 0;
    }
</style>

<BackgroundBlur>
    <div class='container'>
        <div style="margin-top: 20px" class="icon">
            <MdApps />
        </div>
        <div>
            <div class="icon">
                <IoMdArrowDropup/>
            </div>
            <p class="sideways">
                prev
            </p>
            <h1 style="color: yellow;"> 03 </h1>
            <p class="sub"> 05 </p>

            <p class="sideways">
                next
            </p>
            <div class="icon">
                <IoMdArrowDropdown/>
            </div>
        </div>
        <div style="margin-bottom: 40px;">
            <div class="icon">
                <FaTwitter />
            </div>
            <div class="icon">
                <FaYoutube />
            </div>
            <div class="icon">
                <FaInstagram />
            </div>
        </div>
    </div>
</BackgroundBlur>
