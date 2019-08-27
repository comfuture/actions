# write file

simply write some text content into file.

```
# ...
steps:
  - uses: comfuture/actions/writefile@master
    with:
      filename: hello.txt
      content: |
        Hello and, again, welcome to the Aperture Science computer-aided enrichment center.
        We hope your brief detention in the relaxation vault has been a pleasant one.
        Your specimen has been processed and we are now ready to begin the test proper.
```