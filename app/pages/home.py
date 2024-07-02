import streamlit as st
from functions import hide_menu, redirect_with

if 'wide_mode' in st.session_state:
    st.set_page_config(page_title='Início', layout=st.session_state.wide_mode)
else:
    st.set_page_config(page_title='Início', layout='centered')

hide_menu(st)
redirect_with(st)

st.title('Gestor de Produtos e Departamentos')
st.write('')
st.write('''Com este aplicativo, você pode gerenciar produtos
          e departamentos de maneira eficiente, gerando relatórios 
          e controlando o estoque. Além disso, ele oferece uma interface
          intuitiva para facilitar a administração e o acompanhamento 
          de todos os seus itens.''')

st.subheader('')

col1, col2 = st.columns(2)

if col1.button('Produtos'):
    st.switch_page('pages/products.py')
if col2.button('Departamentos'):
    st.switch_page('pages/departments.py')