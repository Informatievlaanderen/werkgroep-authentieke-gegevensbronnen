<template>
  <data-table v-if="result.length > 0" :sources="result" />
</template>

<script>
export default {
  data: () => {
    return {
      result: []
    }
  },
  mounted() {
    this.$root.$on('onResult', (data) => {
      this.$forceUpdate()
      this.result = data
    })
  }
}
</script>
