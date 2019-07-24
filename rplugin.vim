" node plugins


" python3 plugins
call remote#host#RegisterPlugin('python3', '/home/sasha/.local/share/nvim/plugged/deoplete.nvim/rplugin/python3/deoplete', [
      \ {'sync': v:false, 'name': '_deoplete_init', 'type': 'function', 'opts': {}},
     \ ])
call remote#host#RegisterPlugin('python3', '/home/sasha/.local/share/nvim/plugged/semshi/rplugin/python3/semshi', [
      \ {'sync': v:true, 'name': 'Semshi', 'type': 'command', 'opts': {'complete': 'customlist,SemshiComplete', 'nargs': '*'}},
      \ {'sync': v:true, 'name': 'BufEnter', 'type': 'autocmd', 'opts': {'pattern': '*.py'}},
      \ {'sync': v:false, 'name': 'CursorMoved', 'type': 'autocmd', 'opts': {'pattern': '*.py'}},
      \ {'sync': v:false, 'name': 'CursorMovedI', 'type': 'autocmd', 'opts': {'pattern': '*.py'}},
      \ {'sync': v:false, 'name': 'TextChanged', 'type': 'autocmd', 'opts': {'pattern': '*.py'}},
      \ {'sync': v:false, 'name': 'TextChangedI', 'type': 'autocmd', 'opts': {'pattern': '*.py'}},
      \ {'sync': v:true, 'name': 'VimLeave', 'type': 'autocmd', 'opts': {'pattern': '*.py'}},
      \ {'sync': v:false, 'name': 'VimResized', 'type': 'autocmd', 'opts': {'pattern': '*.py'}},
      \ {'sync': v:true, 'name': 'SemshiComplete', 'type': 'function', 'opts': {}},
     \ ])


" ruby plugins


" python plugins


