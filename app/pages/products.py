import streamlit as st
from models import ProductModel
from functions import hide_menu, redirect_with
import streamlit_pydantic as sp
from services import productServices as ps
from services import departmentServices as ds
import pandas as pd
from time import sleep

if 'wide_mode' in st.session_state:
    st.set_page_config(page_title='Produtos', layout=st.session_state.wide_mode)
else:
    st.set_page_config(page_title='Produtos', layout='centered')

hide_menu(st)
redirect_with(st)

departments = ds.get_departments()
if departments.json()['data'] == []:
    st.write('')
    st.write('Nenhum departamento cadastrado, por favor cadastre um departamento antes de criar um produto.')
    if st.button('Cadastrar Departamento'):
        st.switch_page('pages/departments.py')
else:
    data = sp.pydantic_form(key="my_form", model=ProductModel, submit_label='Criar Produto', clear_on_submit=True)
    if data:
        if data.product_name != '' or data.product_description != '':
            response = ps.add_product(data)
            if response.status_code == 201:
                st.success('Produto criado com sucesso')
            else:
                st.error('Erro ao criar produto')
        else:
            st.error('Preencha os campos obrigatórios')
            sleep(0.5)
            st.rerun()
    products = ps.get_products()
    if products.json()['data'] == []:
        st.warning('Nenhum produto cadastrado')
    else:
        st.subheader('Produtos')
        st.write('Aqui estão todos os produtos cadastrados, para editar altere o valor na tabela abaixo e clique em Atualizar Produtos')
        st.write('')

        df = pd.DataFrame(products.json()['data'], columns=['id', 'product_name', 'product_description', 'buy_price', 'sale_price', 'stock'])
        edited_df = st.data_editor(df, column_config={  'id': {'editable': False, 'label': 'ID', 'disabled': True},
                                                        'product_name': {'editable': True, 'label': 'Nome'},
                                                        'product_description': {'editable': True, 'label': 'Descrição'},
                                                        'buy_price': {'editable': True, 'label': 'Preço de Compra'},
                                                        'sale_price': {'editable': True, 'label': 'Preço de Venda'},
                                                        'stock': {'editable': True, 'label': 'Estoque'}
                                                    },
                                use_container_width=True,
                                hide_index=True
                                    )

        if st.button('Atualizar Produtos'):
            with st.status("Atualizando Produtos..."):
                update = False
                for index, row in edited_df.iterrows():
                    if not row.equals(df.iloc[index]):
                        update = True
                        response = ps.update_product(row, index+1)
                        if response.status_code == 200:
                            st.toast(f"Produto {row['name']} atualizado com sucesso")
                        else:
                            st.error('Erro ao atualizar produto')
                if not update:
                    st.toast('Nenhum produto foi alterado')
            sleep(2)
            st.rerun()