<script lang="ts">
    import Button from './components/Button.svelte';
    import LeftBar from './components/LeftBar.svelte';
</script>

<style>

    img {
        top: 0;
        left: 0;
        width: 100%;
        height: 100vh;
        position: absolute;
    }

    .lead {
        position: absolute;
        color: white;
        max-width: 400px;
        font-size: 2em;
        top: 20%;
        left: 60%;
    }
    
    .subtext {
        font-size: 16px;
        margin-bottom: 50px;
    }

    .yellow {
        color: yellow;
    }

    .grid {
        top: 0;
        left: 0;
        position: absolute;
        display: grid;
        grid-template-columns: 0.5fr 1fr 0.5fr;
        grid-template-rows: 1fr;
        gap: 0px 0px;
        grid-template-areas:
        "one . two";
    }


    .side-one { top: 0; grid-area: one; }
    .side-two { top: 0; grid-area: two; }

</style>

<img src="assets/images/silly.jpg" alt="no"/>
<div class="lead"> 
    <h2> <span class="yellow"> Party a little </span> and say goodbye to bad vibes</h2>
    <p class="subtext"> We are the new generation of event organization </p>
    <Button src="# ">
        Rock it
    </Button>
</div>
<div class="grid"> 
    <div class="side-one">
        <LeftBar />
    </div>
    <div class="side-two">
    </div>
</div>
