<script lang="ts">
    import LeftBar from './components/LeftBar.svelte';
    import RightBar from './components/RightBar.svelte';
    import FaArrowRight from 'svelte-icons/fa/FaArrowRight.svelte'
</script>

<style lang="scss">

    * {
        padding: 0;
        margin: 0;
    }

    img {
        top: 0;
        left: 0;
        width: 100%;
        height: 100vh;
        position: absolute;
    }

    .lead {
        position: absolute;
        display: inline-block;
        color: white;
        max-width: 400px;
        font-size: 2em;
        top: 40%;
        left: 55%;
        padding: 30px;
        background: rgba(255, 255, 255, 0.2);
        backdrop-filter: blur(5px);
    }
    
    .subtext {
        font-size: 16px;
        display: inline-block;
    }

    .grid {
        top: 0;
        left: 0;
        width: 100%;
        position: absolute;
        display: grid;
        grid-template-columns: 0.02fr 1fr 0.1fr;
        grid-template-rows: 1fr;
        grid-template-areas: "one . two";

        .side-one {
            top: 0;
            grid-area: one;
        }

        .side-two {
            top: 0;
            grid-area: two;
        }
    }

    .icon {
        width: 32px;
        height: 32px;
        display: inline-block;
    }


    a {
        background: none;
        border: 0.5rem solid #fff;
        padding: 0 10px;
        color: yellow;
        border-radius: 20rem;
    }
</style>

<img src="assets/images/silly.jpg" alt="no"/>

<div class="lead"> 
    <h2> <span style="color: yellow"> Party a little </span> and say goodbye to bad vibes</h2>
    <p class="subtext"> We are the new generation of event organization </p>

    <a href="# ">
        Rock it
        <span class="icon">
            <FaArrowRight />
        </span>
    </a>
</div>

<div class="grid"> 
    <div class="side-one">
        <LeftBar />
    </div>
    <div class="side-two">
        <RightBar />
    </div>
</div>
