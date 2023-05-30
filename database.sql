PGDMP     3    8                {           postgres    15.2    15.2     -           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            .           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            /           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            0           1262    5    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            1           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3376                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            2           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2                        3079    16470 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            3           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    3            �            1259    24645    cart    TABLE     �   CREATE TABLE public.cart (
    cart_id uuid NOT NULL,
    price integer NOT NULL,
    product_id uuid,
    quantity integer NOT NULL,
    title character varying(255) NOT NULL,
    user_id uuid
);
    DROP TABLE public.cart;
       public         heap    postgres    false            �            1259    16399    category    TABLE     k   CREATE TABLE public.category (
    category_id uuid NOT NULL,
    title character varying(100) NOT NULL
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16404    customer    TABLE       CREATE TABLE public.customer (
    id uuid NOT NULL,
    avatar character varying(200) NOT NULL,
    first_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    username character varying(255)
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    16441    product    TABLE     �  CREATE TABLE public.product (
    id uuid NOT NULL,
    brand character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    is_removed boolean NOT NULL,
    price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    thumbnail character varying(200) NOT NULL,
    title character varying(100) NOT NULL,
    category_category_id uuid NOT NULL,
    statics_stat_id uuid
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16438    product_images    TABLE     q   CREATE TABLE public.product_images (
    product_id uuid NOT NULL,
    images character varying(255) NOT NULL
);
 "   DROP TABLE public.product_images;
       public         heap    postgres    false            �            1259    16458    statics    TABLE     �   CREATE TABLE public.statics (
    stat_id uuid NOT NULL,
    clicks integer DEFAULT 0,
    created_at timestamp(6) without time zone,
    rating integer DEFAULT 0
);
    DROP TABLE public.statics;
       public         heap    postgres    false            *          0    24645    cart 
   TABLE DATA           T   COPY public.cart (cart_id, price, product_id, quantity, title, user_id) FROM stdin;
    public          postgres    false    221   �"       %          0    16399    category 
   TABLE DATA           6   COPY public.category (category_id, title) FROM stdin;
    public          postgres    false    216   �$       &          0    16404    customer 
   TABLE DATA           T   COPY public.customer (id, avatar, first_name, password, role, username) FROM stdin;
    public          postgres    false    217   Q%       (          0    16441    product 
   TABLE DATA           �   COPY public.product (id, brand, description, is_removed, price, quantity, thumbnail, title, category_category_id, statics_stat_id) FROM stdin;
    public          postgres    false    219   �)       '          0    16438    product_images 
   TABLE DATA           <   COPY public.product_images (product_id, images) FROM stdin;
    public          postgres    false    218   S6       )          0    16458    statics 
   TABLE DATA           F   COPY public.statics (stat_id, clicks, created_at, rating) FROM stdin;
    public          postgres    false    220   �9       �           2606    24649    cart cart_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    221            �           2606    16403    category category_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    216            �           2606    16410    customer customer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    217            �           2606    16447    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    219            �           2606    16464    statics statics_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.statics
    ADD CONSTRAINT statics_pkey PRIMARY KEY (stat_id);
 >   ALTER TABLE ONLY public.statics DROP CONSTRAINT statics_pkey;
       public            postgres    false    220            �           2606    16424 %   customer uk_irnrrncatp2fvw52vp45j7rlw 
   CONSTRAINT     d   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT uk_irnrrncatp2fvw52vp45j7rlw UNIQUE (username);
 O   ALTER TABLE ONLY public.customer DROP CONSTRAINT uk_irnrrncatp2fvw52vp45j7rlw;
       public            postgres    false    217            �           2606    16422 %   category uk_lnmf77qvjnr2lmyxrrydom9hd 
   CONSTRAINT     a   ALTER TABLE ONLY public.category
    ADD CONSTRAINT uk_lnmf77qvjnr2lmyxrrydom9hd UNIQUE (title);
 O   ALTER TABLE ONLY public.category DROP CONSTRAINT uk_lnmf77qvjnr2lmyxrrydom9hd;
       public            postgres    false    216            �           2606    16453 *   product_images fki8jnqq05sk5nkma3pfp3ylqrt    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT fki8jnqq05sk5nkma3pfp3ylqrt FOREIGN KEY (product_id) REFERENCES public.product(id);
 T   ALTER TABLE ONLY public.product_images DROP CONSTRAINT fki8jnqq05sk5nkma3pfp3ylqrt;
       public          postgres    false    218    219    3215            �           2606    16465 #   product fkla0h79g6773422w81qhws0ufy    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fkla0h79g6773422w81qhws0ufy FOREIGN KEY (statics_stat_id) REFERENCES public.statics(stat_id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fkla0h79g6773422w81qhws0ufy;
       public          postgres    false    219    3217    220            �           2606    16448 #   product fkle1pobdrc8a2uw97gukfmvan4    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fkle1pobdrc8a2uw97gukfmvan4 FOREIGN KEY (category_category_id) REFERENCES public.category(category_id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fkle1pobdrc8a2uw97gukfmvan4;
       public          postgres    false    216    219    3207            *   �  x��ҽn1���z ��I�לE� AӡC������qM�}�>A���"~��#G��d��@������)�)���� ���y�PK���&��N����)�.�e\���������ޝ�Η����AK��Q�~f��(�v�L;���t�E,P�Z1\#ṷ	S���uF�����J�+I��I$6�z��;-���b��tZ�7ww�r�^/K��h���BG�З����ʊ��Jn�4h9E��S��̻Dʾ�]�YB-@�pTn-cH��:�eFRLc7�
l�q�Ϲk��)��{^�EwOW�P{w���.b��^�L[���m�7wwT����$�?c7����0�V sP�H�ƽ�N���b������ÖXi��Y[��"f��b��i���~���      %   �   x�νj1��~[�?Ձ���i$Y�r�����q�M1�)S���� !g�:*ԒxK�m�q\w�r��>�c4���eɠ���Z7��}=y^���ͷ�D�B�:�c�9��(-naw�6�"���["Hb��	�-%�q�Fp���\���;���,����HWPJ�0������zM��o��?��E`      &   %  x�u�]o�8����1���`�#U�4I����n&�J�1v�0�NH�뗴��J�{����D���J(�K8�\� &}��Q����v֖�;�GV)a��9�K�uaEa��4K�.�!8�����=�p1`D��9�N�Ŷ��Ӭ��o�����?[���d���J��ޱU��N�;��K�p��Gc�z�PƤ�:�x��bi��6�4L�� �T$ ~ GA@,%
>�ˬ�N���9��Z�p
a�+˅�ͥ҅aGfYUζ�@�����|���gq��R��8�L�kcE弖[X��2J0cV��'7Wa�=L]ښW�P�`,'Kr����G'����b.��)_ݻk3��I<�Ch��-��ە^ܷ����o8�)�i"}	�B�sJ � W�\�	!	������[���ҩ���a/I��N��#��QQ�|�1����$+~y�EY1�q޹���)	49�,�*k ��o�){�#"B��C*��X�������hp�~Z���`ڙ�ܯW�^|?�{�_�+�V�}q[�Vi�ftp*_:}/.��"Yl��$2�m'�^{Oo�R�S��qt��ni�+],h�A�.�$ �(�cϣ>I�e�R��r�0�9�k���,����yk�3Ul2�����MH�_��(���h�`y,}�홾ޮ��^?���LY�㬦��k7�I���	�Pb߿�F�"�0��&�!��1@\)������"��ulnT��#��%���M�9F��y�;��cL&Q����`׻��ۓ�v2��G�T��˒�C�	�^Γ����nR�]J�Q|��(����K��eԺ��L�	�u�fV�eY&�3�;D�6�Z��������S�5�E
Ua+����7A]Ϲ�/�9�]Pw��u�3zZ�'��[[S�����ذ��r獾�6!"~D��	(���r/%J�������Eڔ����*�+؈̛ށJ;v�
���T׬���;���vJ:3\ʑ3�9���B��흪'��=e{܉�)7A�g럳����_N����"��      (   �  x��Y�r�ȵ}&��_N��*��74��&�fe,K%i�v*/}1&	 G�|I�"/���;�Aʶ&���Ա�D���^km�$��w�z�8U^[jD�T�:�$s*L��r9KM����,�v������%���j�.SOb�7����%i�.�=��7d�u��d���v��4K2�nѓ6�~�B:$'ah����d�=�vE-.Y�(*�Ф~�'�2��M4�̆a�5���f��ss��ڸÑ���Qmc���?����n�K�9ѓ~�u�z���qF��˗NLe|�SV�HUb���em��V�IJ<���x�d����i`)��]YNgIxg�59S�+F���VI�l�����j5O��?	%>�����D�<4��}j�ݷ��дK@�6�Ȍp]��ڂ�&@ �J��%@�Is[vM�$\��W���iR1�3�a��36P[�����Z�Z�JO��6K�IZ�T8��6R����IUs9�QTU��F'U�jꨩ��J�X��]r�ռɛ�u��1��:%wW�7g(d�vdج�1��_�&�	�2�8�{�V�z�N?���-�f�~?�/ҭ� :.��.6m�`U ŷG�H��
��b_���zɢ	];�i?.զr���J�
�\Q�h흶`���Lu\	ᩍ5�$P�}j%,��X=9m��5^趁�_��oHiG��(^���U��z�r]�J/�� �L�4�rl��v]�j� l�c6�j9�_O�y�HH���&,E��Q}�WF��r�t�c�����`����?I�y/l�>y�Ź�N{4Y�]b�e6���"	06IU-��М��t�U���R��ڡ1�:5�d��T�����N��`��n{r� hPɍ�/��%����[��%ڏV�2��04b;� ׷U�4� �b&WS���Qt����S��j�d����m�!Qn~�#oϯ._���{}�_�]��=#��Wg�w���-yuw����?|xsNn���w7w?ܾ99=�q9O�l�u���ma{���v=�Ц� NUv��4Gm��a/�[���ԓ�[��[��?-�%��&��^���W)40��ؔN���U�I	0�V#�N>Փdc�5�hH��l�r���SS˄�L� �4���͙�9ڊy�w��)��5��u.´H��ݶ?���-�->.�Y�9��w�a6��؄��?Y�������-����]!x�����!)�\�Ml�"zUU�'~���w7����A�������.d���C�U.�3)�5�YV"�<�5W.��l�N@
�ב3�c�br�7۟�'��'�&�-Hq�b*�F�l�ܾz H�)�!yݗmO-��M�(�}�|h��~��X �A_�F��Y4��V������h2�ߘ�W[ gn�a9Ȣa� ����v�"��_�'�h��x��4�^Gs]9�T��iT�e^i����d���@����0s�ePLk+�jmw�~��aX�'�o�a�A�~M�y���<�d�����$�E���]�0�~d��?��a*C18}3�Rɐhb��p���fcUH3�֎�[0�qøܩ		5�q3f��x�iƠ��wZ�:��V����<��׭���7���6[+H��rx&��X)t�L��El�0W���QD�8�Y�����������OWgW'��7r�.��q����s�&��[�
��!bq?��X�G�()�n@�'Om��\��l[�}�2�4�3>_�`~�lm;��+w�b,�z>t��R��t�Jry�b�(��0kđu�Jʭ��Q��(i�xY �������˓k�y_��~�"� u����(e�"|5�h����XO���+�5�+e�G Phf���B��{ߧ�u��Cm?��R<�,0y�Em0?��=�;��}�`�&��D���b��W�a.�q�~)-�Jȩ���4�y@�P�j���2��&�_ƾ9Q�)���{�AMks�5�+�*�\��z���drS3���Y��dkN��N����՟�Y4>:��
%�-�b\3߉@?��PA��O�g��~��M�|���=p�7���?�$)<��>(�îG5Y��򜌷B���ӳ��+$�R<��g��ߦ++tE`f/麽�k��z�-Jr�G�|����~�\4�B�*f����,��t�螅OAN�ᩎ �p�!N&(K�e�3)�l���&{�7��}z�?��$:����'���!�	�]�l=|u���p��1yU�	Pڼt�Y�m�#^�0eͿ0��T���^��p�#�~hY��01�	��ʠ�<��:%��ކ�R��@�ƕ\��8��)c0��G��8\���o�f��%3�力��!!>�N����S��S�̫`��Z��U%K�6gᦉW��9Q��W1�J�����*�ⓓ~�O�����,�ln2����c����c�B	r��<������D0�£��Ak�3�'컼�#wº�ƌ��n�U�����d`ȃ��Ǉ0{ԁà0�j�2O�}!��J��V0����S�i4��=>��I�0>ɩ����*
���jfS+�)&$� �X�'�0��X�U��L�e@�쥹mS��h,��2��ysy�k�ʳ�׿�7}��F��.K�EK��u��՜�l��YS��bԺ"$Y��4��r�!ד;�+����P"&��%|� �7˃Q(9����LEF�q[w�����G���i�-\\|''�#��/7�"?4���X�nz8�J�~�F�*b0��m��
֒R%R`��!L=�ܗ�.�����I�T�V��r�J�$��"T�\7��.�c�܂�I������|�Գvy���>���Cv��Sqv$�Y굋������x�rَƆ�0���^���o�l�Z�Mq�݃01>U��W��H ��&��ӎ�_K�~e���:*^̖T��K'	��Fz��)J�L��
�b�1�hn����\��e���t�}���sc_hy�=�.e�'��1-A�1T~��rih�r���x�i�#�.�K�`���w��_@��n��슜���xOn�n��ٝ:Q�W�\���'��� G�d\�
 �4Y����� 4�*���Z[!(��u���E��`|�XP�����-����Tz�v�l��H�%�vo���]�}�~B���R�o�Y@�������$��u��d���J�? s$�uWV��_|��	đ�NBĤF	Fe��;�WJO�|8�N���.      '   �  x���Kn$7 �u|�)���9K6�:`#��?���^�Q�A`�ۣǈ:+�L
lA{ A�ԡ63���������{{��������������o�|�#?�����"�����x{�ߕ���n�.�vy���F��s.@���3����X4j���8ĠO�q�r����C��5�(�ZL���P5FH#����Y�֕�DY�i7o��{e�񴛶{��$�$AJ)7�!(Up�T��ݺa�[T
�]�n<����i�kWfL�}�g�nԫ�ՋCGm&����Ɓ���K�ͧ]���8����^�N��f%����.s㑰7��M]�G�D"�]�n>��W[�Q:��v��M�Ҡ�*J=��<d���}_��>���nخ�u���r�~/��^�bi#�	5���t�MA��ݺyE�s��|�(��yܴ$��*���`���|��G����vy����+�]��������-*Z�'��hl@8��5S�7����쬋.��O���pڕ�^�<��к�U;p��7w��BK{�~?��܌����9p� ��w���|i�P�����g�}�3B���K�w��!N--�X��~��_1�ݼ]:��v�i7m�O���tڍ۽��6�wJ(×v���g��,f�����-=��n�����v�i7lWϺ������]�I'z���7n���l�
Mf�����qXǉ�vq�v�����O�=��v���O.�N�i��~J$*�dZ����f�Z}_%z��U�=ʇ?�Q�f�a~���8A�/��~��I���W���5���5��3k)P��Ч������7s~����YH��9@j[����7�H0��~�.���ݼ]:��v�q�H3N/��+��h�I�`��&�s(}��Q^�?__^^�c@gX      )   Y  x�u�K�#9Dי��А���:�lDJ��&܋iWO%`�Z���K�|ب瘝�ƌBŸ�-=���|G�����u�m��-�T�tR/���ږ9x��.�qXo�89O
i���R�)2�k��ǯj_���Խ�q�{�\ڤ%#H�8EdP��ۉ���U��|(`?�ݙ\��r@A��Z���ч�/�&Z}�Bn�(Wr�>�]�~�2}��3��T[/T���j��gS�c�>'��Y��C�술���g>�r���8g/�óZ��:��l��c��R{4�s���SRځq,;I�>4L8ky��s�~����]�;�^~��N_p�&jD����B��\>�W;s/7c���ct�M2t����]�����1l��$�8�L3��8����	�u� wY4�v����Q�4v烯c�2���j��������z{_�6�1�f3��K��-wo{>�ݗ���t\
�L��$�>�0�M�Yv�҃V������i{M��ڲr���hh%�'M�4�B�%��*߂�v��Q�-�����A{�,a�y�?���[��sz�ގ*4ۜ�Xv�c�|;9r���h#hO�Q��X�nM4_ۧ��yr6m�#�����]���%n=����f� B��VG�IEz=��<X����ig��m��zh��ސ��>��[��E�``�t4+�O�T9՚b�.�ro_[Yכ���Iv6���:S/{����#�p��e�/y��~�D�S�W�U�O/)\ú�f��0r�m�Qc��ݰv��#����?2�We��o(ǰ "p��6\��Jk`�i�p^��X����	����W<�p6��?�����_Y�B     