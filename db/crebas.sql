PGDMP         "                q            rankea_devel    8.4.13    9.0.1 (    !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            "           0    0 
   STDSTRINGS 
   STDSTRINGS     )   SET standard_conforming_strings = 'off';
                       false            #           1262    685781    rankea_devel    DATABASE     ~   CREATE DATABASE rankea_devel WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_CL.UTF-8' LC_CTYPE = 'es_CL.UTF-8';
    DROP DATABASE rankea_devel;
             maraya    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            $           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'Standard public schema';
                  postgres    false    6            %           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6            �           1259    687377    estadisticas    TABLE     �   CREATE TABLE estadisticas (
    proc_id integer NOT NULL,
    poli_id integer NOT NULL,
    fuen_id integer NOT NULL,
    esta_cant_titulares integer NOT NULL
);
     DROP TABLE public.estadisticas;
       public         maraya    false    6            �           1259    687363    fuentes    TABLE     �   CREATE TABLE fuentes (
    fuen_id integer NOT NULL,
    fuen_desc character varying(255) NOT NULL,
    fuen_url character varying NOT NULL,
    fuen_activa boolean NOT NULL
);
    DROP TABLE public.fuentes;
       public         maraya    false    6            �           1259    688838    lugares    TABLE     v   CREATE TABLE lugares (
    proc_id integer NOT NULL,
    poli_id integer NOT NULL,
    luga_lugar integer NOT NULL
);
    DROP TABLE public.lugares;
       public         maraya    false    6            �           1259    687508    notas    TABLE     �   CREATE TABLE notas (
    nota_id integer NOT NULL,
    proc_id integer NOT NULL,
    poli_id integer NOT NULL,
    nota_nota numeric NOT NULL,
    nota_fecha timestamp without time zone
);
    DROP TABLE public.notas;
       public         maraya    false    6            �           1259    685782 	   politicos    TABLE     j   CREATE TABLE politicos (
    poli_id integer NOT NULL,
    poli_nombre character varying(255) NOT NULL
);
    DROP TABLE public.politicos;
       public         maraya    false    6            �           1259    685812    procesos    TABLE     �   CREATE TABLE procesos (
    proc_id integer NOT NULL,
    proc_desde timestamp without time zone NOT NULL,
    proc_hasta timestamp without time zone NOT NULL
);
    DROP TABLE public.procesos;
       public         maraya    false    6            �           1259    688856 	   titulares    TABLE     R  CREATE TABLE titulares (
    titu_id integer NOT NULL,
    proc_id integer NOT NULL,
    poli_id integer NOT NULL,
    fuen_id integer NOT NULL,
    titu_titulo character varying NOT NULL,
    titu_contenido character varying NOT NULL,
    titu_link character varying NOT NULL,
    titu_post_fecha timestamp without time zone NOT NULL
);
    DROP TABLE public.titulares;
       public         maraya    false    6                      0    687377    estadisticas 
   TABLE DATA               O   COPY estadisticas (proc_id, poli_id, fuen_id, esta_cant_titulares) FROM stdin;
    public       maraya    false    1508   8-                 0    687363    fuentes 
   TABLE DATA               E   COPY fuentes (fuen_id, fuen_desc, fuen_url, fuen_activa) FROM stdin;
    public       maraya    false    1507   �-                 0    688838    lugares 
   TABLE DATA               8   COPY lugares (proc_id, poli_id, luga_lugar) FROM stdin;
    public       maraya    false    1510   /                 0    687508    notas 
   TABLE DATA               J   COPY notas (nota_id, proc_id, poli_id, nota_nota, nota_fecha) FROM stdin;
    public       maraya    false    1509   o/                 0    685782 	   politicos 
   TABLE DATA               2   COPY politicos (poli_id, poli_nombre) FROM stdin;
    public       maraya    false    1505   �/                 0    685812    procesos 
   TABLE DATA               <   COPY procesos (proc_id, proc_desde, proc_hasta) FROM stdin;
    public       maraya    false    1506   �0                  0    688856 	   titulares 
   TABLE DATA               y   COPY titulares (titu_id, proc_id, poli_id, fuen_id, titu_titulo, titu_contenido, titu_link, titu_post_fecha) FROM stdin;
    public       maraya    false    1511   �0                  2606    687370    fuen_pk 
   CONSTRAINT     K   ALTER TABLE ONLY fuentes
    ADD CONSTRAINT fuen_pk PRIMARY KEY (fuen_id);
 9   ALTER TABLE ONLY public.fuentes DROP CONSTRAINT fuen_pk;
       public         maraya    false    1507    1507            	           2606    687372    fuen_uk1 
   CONSTRAINT     I   ALTER TABLE ONLY fuentes
    ADD CONSTRAINT fuen_uk1 UNIQUE (fuen_desc);
 :   ALTER TABLE ONLY public.fuentes DROP CONSTRAINT fuen_uk1;
       public         maraya    false    1507    1507                       2606    687374    fuen_uk2 
   CONSTRAINT     H   ALTER TABLE ONLY fuentes
    ADD CONSTRAINT fuen_uk2 UNIQUE (fuen_url);
 :   ALTER TABLE ONLY public.fuentes DROP CONSTRAINT fuen_uk2;
       public         maraya    false    1507    1507                       2606    687515    nota_pk 
   CONSTRAINT     I   ALTER TABLE ONLY notas
    ADD CONSTRAINT nota_pk PRIMARY KEY (nota_id);
 7   ALTER TABLE ONLY public.notas DROP CONSTRAINT nota_pk;
       public         maraya    false    1509    1509            �           2606    685786    poli_pk 
   CONSTRAINT     M   ALTER TABLE ONLY politicos
    ADD CONSTRAINT poli_pk PRIMARY KEY (poli_id);
 ;   ALTER TABLE ONLY public.politicos DROP CONSTRAINT poli_pk;
       public         maraya    false    1505    1505                        2606    685788    poli_uk 
   CONSTRAINT     L   ALTER TABLE ONLY politicos
    ADD CONSTRAINT poli_uk UNIQUE (poli_nombre);
 ;   ALTER TABLE ONLY public.politicos DROP CONSTRAINT poli_uk;
       public         maraya    false    1505    1505                       2606    685842    proc_pk 
   CONSTRAINT     L   ALTER TABLE ONLY procesos
    ADD CONSTRAINT proc_pk PRIMARY KEY (proc_id);
 :   ALTER TABLE ONLY public.procesos DROP CONSTRAINT proc_pk;
       public         maraya    false    1506    1506                       2606    685844    proc_uk 
   CONSTRAINT     V   ALTER TABLE ONLY procesos
    ADD CONSTRAINT proc_uk UNIQUE (proc_desde, proc_hasta);
 :   ALTER TABLE ONLY public.procesos DROP CONSTRAINT proc_uk;
       public         maraya    false    1506    1506    1506                       2606    688863    titu_pk 
   CONSTRAINT     M   ALTER TABLE ONLY titulares
    ADD CONSTRAINT titu_pk PRIMARY KEY (titu_id);
 ;   ALTER TABLE ONLY public.titulares DROP CONSTRAINT titu_pk;
       public         maraya    false    1511    1511                       1259    688837    proc_idx_01    INDEX     ?   CREATE INDEX proc_idx_01 ON procesos USING btree (proc_desde);
    DROP INDEX public.proc_idx_01;
       public         maraya    false    1506                       2606    687392    esta_fk_fuen    FK CONSTRAINT     �   ALTER TABLE ONLY estadisticas
    ADD CONSTRAINT esta_fk_fuen FOREIGN KEY (fuen_id) REFERENCES fuentes(fuen_id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.estadisticas DROP CONSTRAINT esta_fk_fuen;
       public       maraya    false    1508    1507    1798                       2606    687385    esta_fk_poli    FK CONSTRAINT     �   ALTER TABLE ONLY estadisticas
    ADD CONSTRAINT esta_fk_poli FOREIGN KEY (poli_id) REFERENCES politicos(poli_id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.estadisticas DROP CONSTRAINT esta_fk_poli;
       public       maraya    false    1505    1789    1508                       2606    687380    esta_fk_proc    FK CONSTRAINT     �   ALTER TABLE ONLY estadisticas
    ADD CONSTRAINT esta_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.estadisticas DROP CONSTRAINT esta_fk_proc;
       public       maraya    false    1794    1508    1506                       2606    688846    luga_fk_poli    FK CONSTRAINT     n   ALTER TABLE ONLY lugares
    ADD CONSTRAINT luga_fk_poli FOREIGN KEY (poli_id) REFERENCES politicos(poli_id);
 >   ALTER TABLE ONLY public.lugares DROP CONSTRAINT luga_fk_poli;
       public       maraya    false    1510    1505    1789                       2606    688841    luga_fk_proc    FK CONSTRAINT     �   ALTER TABLE ONLY lugares
    ADD CONSTRAINT luga_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) ON UPDATE CASCADE ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.lugares DROP CONSTRAINT luga_fk_proc;
       public       maraya    false    1510    1794    1506                       2606    687521    nota_fk_poli    FK CONSTRAINT     �   ALTER TABLE ONLY notas
    ADD CONSTRAINT nota_fk_poli FOREIGN KEY (poli_id) REFERENCES politicos(poli_id) MATCH FULL ON UPDATE RESTRICT ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.notas DROP CONSTRAINT nota_fk_poli;
       public       maraya    false    1789    1505    1509                       2606    687516    nota_fk_proc    FK CONSTRAINT     �   ALTER TABLE ONLY notas
    ADD CONSTRAINT nota_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) MATCH FULL ON UPDATE RESTRICT ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.notas DROP CONSTRAINT nota_fk_proc;
       public       maraya    false    1506    1794    1509                       2606    688874    titu_fk_fuen    FK CONSTRAINT     �   ALTER TABLE ONLY titulares
    ADD CONSTRAINT titu_fk_fuen FOREIGN KEY (fuen_id) REFERENCES fuentes(fuen_id) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.titulares DROP CONSTRAINT titu_fk_fuen;
       public       maraya    false    1798    1507    1511                       2606    688864    titu_fk_poli    FK CONSTRAINT     �   ALTER TABLE ONLY titulares
    ADD CONSTRAINT titu_fk_poli FOREIGN KEY (poli_id) REFERENCES politicos(poli_id) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.titulares DROP CONSTRAINT titu_fk_poli;
       public       maraya    false    1505    1511    1789                       2606    688869    titu_fk_proc    FK CONSTRAINT     �   ALTER TABLE ONLY titulares
    ADD CONSTRAINT titu_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.titulares DROP CONSTRAINT titu_fk_proc;
       public       maraya    false    1511    1506    1794               j   x�5���@ߦ�(��&�\�u�=���m,Y�B��0�7D�7������P�l����J��!/�O��d7�?p�e#�"�q���5���N"X�,#��	<�V��w���V �         A  x��Q�j�0<�_�Sh/VܦyL��-mM�S�l%Ȓ��|TO���XW61q��T�;���Y��3tVLS��s5ʕq���-�	)�2`�����l[�$l���c�"mL��h'�k�4��Х�>��q�b�V�#�Qϳ���J��5`XWʮ SL(��(Dr��f:}��D�4��He9�`��R(m	����!�vӊ�P���/Y�}4�s��=hmZaZ̲4Yfq�������v�E��;/�C�d۽\7���AcSÍ3�G�b�!xάV��E��-����8F�0?�8֯a�${I{#�-�}�n���         \   x��� 1ߦ�U9{I�u�)b1��H�,���.T�:���r �����9��ml)E�&S�6Q�v����y~���E�B�            x������ � �           x�-��q�0D�@j����_`�hQ�BJ�D���C�����s�o1�Ϟ���!�3D��T�r��KB��A�����b���Lw�D�@b�4PՌEz)v�%JGh��������tCx���p%�p�<�AI���3ׂ'�RT��&<�o���E��I��]���o�$48��1�.$�=�P���đ�W��54��+2�#p�%�qEB�Ь�ɴ|'�[�e=�H�y�7^ZFk�	i�yP:�OR)R�\�����xF�閯�VG��CT�O.o���0�         &   x�3�4204�5 "3C3+ B��2!�=... �{]             x�̽[s��u.�<�P�3�vD�]�l���di�%{lm��},�$8(�(p��o�q�A1o�����Kf��I�}�&��\�����j�ٜ��쳯��?�K�/���K\�u���*���L���WS��ͳ�N�<��M�:q����(]�EY���}��b{������zR�W�IrY7Y���d6I������f�߽}���nNJ���Dw���o��r��-������z�o����vw=�����d��}��v�[�\��Y2���%+��$y�7�g�=�}���K����povuY�O����l��l}�����,�HwEEoHm[R��d[ҼJ�2m�?�Y�ꮤ�+�EI�]9io������E:_��y��������:�ch���j�'�/]�/��=����_���]�n]��N�v�~���n�jOgR&��/�����������������U���hSU����yۺ]Y��}Sl�5}Z���iq6[,...V���t����3�/��v��]؊6lŮ/�?&�v�n��������X�U��+!�7�u�ln�����w�+����k��,�496��8�rڪ�m��������ۼr�9>1+�x��w��U��7��N�>�����fK��v�kz�$��=��Օ�w��N���V�y��*��/��e�W��Kz,���ч�b7$Uמ���c����ƻd���m����������rZ�� ��L�"�҇��h�M���3��D{q�ʺ�Ї�L�hu�'v\خ�������nmX�Lj����}=l�t�	ʝ���"�>|O[v��ײ����w}�?p����?�����tx��69�ĢnE�ʦ%��د!�&|����E����I􈤧j�#~��ز�ئ�.2>h����U	�qS���y#;�����'��e�7��iS��_ggo�ǥ�q�2UK�MZV�;�v��ݩmw��MJ5��N��lw�{\�^����5%��W$T���8�ȑ��M�\,�]�$�"��¸�k������j\�}�>wM��F��{��v��kQ��U�����r��X��X�f|�K״,�EuU7�\-9=Aђ�V��6��~ ـ����=���,6�C�A!U�	wtTŵ�Q�!�IbW�a���[�l�2盺y�~�\�=m.��z/��ч
_E��X�MH�3RP�t��Mqىnsx߶+i_�,3���7U[W'�A�4I�캇�����}`o��]��sf����5kB�	�ʂ�T����͉F��锇�B�H�Fr��U�o��
VX��n��)t4��%���K�m/I`��7lG��kyc���=�3��Bm���p]E�_�;�F� �����_�8�e>��}��}��/�����y��㎞�n��˖����'��.�9L>��M�yd�࿶t�2'�iHlZ֛����w�wկL��Զ8q7u�;��pۑ�i鑂|nJ��0���䮆������[�Jz]���d��^x���CH���2��HK�KIYՉ�Z����,�f�^�pv��m^j��!�捪۳ٱck��7�]��.o�q��Jt�k8���}������670��GmG� �]��Zvq�>==[�^�e'�z�e�O��.����n)J/<$�S���UQ%��ힴ$}��U-93l�w�k�뮉�*�9�����������W�/Ε��ܛ�9�>�v�������D9�\}���lN_[C`]� �u�g��Bҧ���dc�uBZ��9�Z�Nv���[k���}���n�������y>�K7���ī���H�*8y$(����̣�O��8N���VCѥˠ��=uwx>���D�-����e�ee���:�]�I	�۷sd!�T���@U�v��� /���^G�ɖ)\R/{=��'(��>p���orhQ�]I=�L�`�X��z�`����L���M���v��C��EU��4��+w��{��KGo"tݺOPӫ�)VWX����Q%U*B������W��:�3e���s�����br6�|G�Ń�_ck؅(��x]�&�#������������V\LX�����r��d�[����>��$�O��G-˺�����V��$�:�`�=���Z"�&]!�:��p�}|��b��,�;�r�ԕ :��K�o:x;r���HV����X�^�,�����ĺƕ�*o>��G��WP:���}�<�6ta���Ct괏x��cs�L׸k�+�/+����j���Go�]�XA3�������/��~�O�M������Y��GƱ�z�~;����H��^�{$�d9�
�/Wd�J�$���	K�nˁ
��&ߧ�����2�e�E9�%��:v�Y�\���v�4-X�ֽ�na5o�M��p�dW�P�� �ԍ����x���������~�ړ&)S�'��+��,k����U$U$�G���j�iK��������-d���%��e���U.��z6?�X�X��pSp���2�t�>k:u_ho��Ss��#A�(#hs85'�x�h?���� ��ݎ�ʎv������M���Mן����.9U��
': ��u�h-�r�`t�ړ���N�R�B�B��/�?
�(��E�l5=��/}�ß)�K8_$ۼE�4.`tUd�XG��M#F��e>�=�����LK�+H���3X���@�/a�+s����K<%�1G^{ȴ��G���\��,v8��!#TEJ�8u!W��M�NG\�i/�P��t�yM�vGgx��t[�~���$��ð9��H���.gk�YC��"#���6]������n�En{Y<�P�}bam�o�.��*�w�D�Q-2���Nh��5������I[-v�� �K�%�W|���j�1ZI~Ȋ��Rs/v>5S�z�pܔ*��Hꬼdj ���2*Q�X�R�NS���ȇ~-�U�&��ɾ�=�}~H� [F[��'�X�.I2	�e����~yUW{�Ҡ{r�-
2HG� ���K���(�&�˖��)]�;m���-]�ݻ_L��mĤ��Y�©��F���88�Ƒ#�h��_���w��:��{�^
f��<&�K��(��U��N�I�N~���7�|�����MC����K��s�mwS�]v�������"�Ҧ���K��}�r�X|���MO��񻢺����s��s�E�	��"�ˢ���|�1�#,GǸ ɿ�+�O)��O�m]����n�9�m~z�X,z���"����d��=a�WC�ڿ�o����*+6�ϫ�/�x�Ydd��_��]��+����;H������ �o�c���Գ�|�~�W����tvə����n���$%�U*E�����������%���M�����G��ӕ���.}Nǧ{�r5[�f�l��Β��������gK�Պ��ױA)���(U:��X�zt�X-K�w�g||�Q��bެ<�Y��q>��q� �l�@ը]�sޠl�!�N�Wɾ��\�dwj.q��OSlH��y��C��9,fq�e�kS�M�BG�'�Hx3���f�J�@�V��^�H�Z|r|˷��oW�?;�������˯�J�%���-$����$%��Cm�ad-�ϖ�;J����8���͗�����/x)f�y!�'Сr�vA`�ŧ�oH�������<��k����7���i_>��.��ȱ
y��	��b�����<+��t}�EC���c*�ѱs�l�ȑ Ph���l��3�<�����oU���c����9\ډ�\���p�c�y����/�Dhy��xr�?2~�(uQ��/B]u��ۜ�Zʕ7&��R�� ��yI)R8\A�H��!;h�R?���W�X!�`��mm5�wz­(4d1%��������a���ui|�Qќ�g�	J+J1���b�v��ٙ��o~�/�¦/w���\)��ڊ|�r��	rZq	��M���kz8X嬸�-�L�T���jŁ�%�!Iݒ�Jϵ�-p�b���t;}.u-��pT��BH�ѿ��ۓ�+(�~�)��yץ�j��&�U�����/:X�p�88��7��b5_�V�_'�����ڶ�f�µ���^cY�}�L���%8�rz�i��b�����Y    4?����o1;�ӚWg��j=���m~�>.�k��{��u�vH��ӗ�\p�nPC:�eS�C+П8�*S�[�Lޞ���5�����Œbۥ4����f���Kߪ��&0iۥ�'�sSx*�{)�Âo�2�՘��䨢��"�/F$�?��3� ����r�f��X��V����]w����o��m~Ŗ�1D�d�O�T~�?,�����_J�3G�����1k�]޴�D����!ɬ)jh�O�b}x�\�8=��nh[��h�Qr��^f�K�=�4���r9;'����`@��0����B�����^�H^�H���������&��GBDJ�^D�|C_䱏��9�O���cU\M%���k����ʊ���m菊@�,��u͑��t��}����;y��W����6������-����]V���o�|���W��X�2pW\~r�D�/���Z{8?]�1�V��-�8�le�u�4�E}^�����Di�%�On!'L`�A������-����7?�|�	�Ǜ[�Jd%x:�����ݖ���jh)`��ϖ��h9�݂I��4�:�Ϲ�;�*6�����P&ƣ<;�������bA����5�җe�	:�����_wy�C3"d�PQe�ـ����|0Y(�"%��閂ť�}���P�W2�#@& �l�3�����5�K����n�3�������9�?B�sX�ǰw��دZ ��9=L���˽kc5ᩤ����,. ����y|�W�k�0�?�5�3m�?�Ҷ�on}��K���]Q�s_���J*$��u�� �m��3e��Ph�ډ#���-a4��3�+�w�����ĵݶh$�n�M�ʶ�ˮ3���K�y��oE|[R��|O
�a�Q(˺��$Le�|���X{<J���l1LՐ#򗱖�+�f�#�K@О�? ��~m�����|~��x�:3Tt�5�ڢ�Yez��5H�0�I�a������[�cT|�BЕ��e�A�e�=֍�,U���=�}����%d4�
���.�{�G���@�B�iQ�E�ƣ�e=�tN�/ ��L�7�_�gz�0�u�Q+���n�h>��?�](ku)�K�Sc͠�kV9�C?�H7�}���ҮJ���ד����K�k#�[�������]��J����)7���rX�(����彠�j���}aO�ƞ���^��<�~pU2ĉ��mp�X���Z�t���Əx �E�Ԓd=�r���.ܶƝ�m��@��?h���x
�p%�#���k�w��KR�w�)��s����/�d�vt��Ǻ���f��%�d/�ܵ5љ�oߴozȀ�mHO�^����״�m�/���mWH���&��0؂�^F���)m�����zr8�I��7@�Bue����w�+�Nd}rC���Zg�T����Ն���N�L���?g�d�SA�"9�@�{����5%��H�㙛�ۙǇ�
ڔ����(x�{��v�4?@�����>���.�E�sp&�	t�!`� qˑz����e��b���Ň�d�1�#)�;�'T����W'���_�X��H�{��_M�n�Ô���C���}��C�U!�;�*�yyfB�c���t5;_��_���y��_��|�V��#c�����������ch���"�t���N$`�{mp�5�Z������eB/Yw�֍��6���. ���c�0���E�it#=��.��jＭ[��+ڤ��>
��{�Cn��ƎM�mw�FܡĆD�&o��SM%�4$<����s�������q�췷�N20�� �+�e���UZ.=�┑���V� a�\g�6B�ў�������GGܦ�ZF��I�t�!	I��߰u��P��O�U�0#�Q����NR��*>vҮ�+��^�(oȵ��E��~W|S�9�O'�+��y�}�����k}J�4��� ���s�P ���S
l�0�&z��H���S�>�S�VȨ9�^ٸz���?R�����#ikjI�~����S�/osr�k6��ȫaX����_�f7��:��^�Aw=_�狋��]���L��C�3Ɍ�tns�l[Пk��� �����xj�[G�f�C�e� ��B�А$f���鿰��y�̢����2��M�n�G�eG��W�U�p��Vh��D>�}�@�����ۮ�Ձ4"j}�=��a����+ѯLX�R̂n	H ���tM��o|�IS!����(� 9A�bu͕�N{�~(��Av���wŶ~<*�4�x4��p🷫�B�a�v<��i
n�&f��%�N<H8Zw�����ə.V�V����h97�:8Zۆ�����R̍]�~���fo��F�g8���CDpI�2�h���x�Wd��.�h|��~�ri��o:Q�x��U�NU���E*�������-eU�������.x����,ʠ���Qb�%��b ),=��5��zq���B�F�0��%�C�����c�����q�wI"/�|�}��*���@�Q�I���,�'2�Z�b'���{J�¯��r�d�J�Vs:0�$;79���%�,h���[N��Qͱ�Eai3��K�?�����I����'�E������w�~��}k� N�F1uÝ}���r���jp�����Ib���dd
�aC���Q­斂Bp������%������~���f��g%_��z_ +��\��0�55�w�q�o�?��vH�,�����[B�'+u`}��$��}��,��
�}�����A�M�յ�� 9�0�۠yl#�.����V"㪏N�r{�S���e63��^.K_�1��u��ҫP���B�� �N0��Ϩ��A�����v�ͽ�	SR)��-�[���p5G����up`����� o��~�(4�!Y���U��Nt�'��o��$A�Z@z��7@��]�۵�R�5g�&Q7'�Z*�:,�6�����ꨆ��/���*���%٣ -ZJ���(*x2ʍ�N~  nOZ�%w-�䥠[�ս����	�S&xI��`������L/�� W�#��ث��6Q�#��CJ)�c{jY��B��9t{���i�*K�Knj��%~�ˊ�����~���B�	�D&�����:aOj�=�h�o�B�]TWZR���/9EA��&�-_�zm�/2Ip�q�(�($Z�ԋ���;W��#�.��VZ<��k���!�����QJ��(D:)���)��0�5��f�he=���L"ϊ��Oא�w�yѻD�Q2�eʫ��UL<�,�gL����Z���~s�H=�~��9��K(�}W�e��� �4H*�h6]����u���j�Ƌu�Η5[&0���H��R0�a��we�-'�"��t݉4�A�'��^��.+��Ȅjk/�$<��,�z��k���h�OD��vE4���;|C�|��P�fP����rѴ����0Ю3,4#ݼ��i���b6[�}��_v�Mrמ��⁮;p��߹�Frx�W7���-�K<���0�Wd��r����@N����O�m��	WA���i��a�Ա�:�ˡn��W|��+ Gn���(���<T>��=�F"�^}8�w\��������M��
"p_A��ޢ�� ���.�J2�(O{�:=�d�U� �`|5"�ZA�Ha �/�z�RC�CZh��R�5>��hk�x�A���H����E�I Q�B���VJ�P6E���?Ym�\2q�r���DV����HOuU��᪸,7�z$�q�DY�]�q����V��$*!ᜧ�.�M|���_0]� ��)�W������ �K/\R�?�~��mI}�v�~�u|�b�v�p
k �ڨcA4��5�l����jХ}��겾F$�EIo� �m�/�-5�9mD��Lhi���CZG��YMc��C%��*3��*���Dі&�����i��&�*�=���	�ʜ��]#U�t���]����>)��s�]����=O�(��Cڣ��(�{���h�{���RWݾk�頟���^������/����r/Z�Q�p�@x�c}%�����Pl��}�e���	����m�    ���ݺ�AO�(��o�xp�'�r8�y:���|�K�Wb�Z̓3��ˢ/υ�s�7pr"*L�PD�ݐ��M}H�F
c}�Q���Pl��XB%�|�яb�+�4u�4H8�9ӳnOq[{�̒����C@Ґ�S��Qƒq��v{���k�"Ѱy����ӊ� lRL�-�y�
E%r����n�놋Y�B<v���~"��F�ޯ�Z�kz�����$H �['yZ�ˋ�<��d�Oy���R`�~�S�a��
�Qp�ẃ
�E�l�7�t5}�o<�OV��^)���ǧ'1�N�}>>��ɐ*�g�>"��,/~J���NeeT�r�i��$��w�
iɫ*$��4)�W���i]#ܪ�2��>TP��=���	h����<�b�;z�,t��Iـ��F�S}��,E	u��͒0�#�����蠎�R��֮���{aI�C^�^�y��WsHq�H�5�j�B�8���2�G��m��~M�c�⽿�B7����-�2�$GҒ�V��V�(ݚ��������kz�|D0r�@j@5��?�|r*� ���<�G���R�|n�T��r�F(�t��p�v%Pu�:~:7�by~��l��:����q��"����JNzΏ��dZ#h֥�2D!��X���&��f�з�zd��������
5�r�p�]B�2� 	Ǖ��[��0���̕���Y�.�k�S�h'�8�#��?�S�٥Tܔ����:p��)P>h���n�2N��"�W6��������5<�^�Պl�nV�v�!�TdZ#�
���0~j�d���s�5��>��{��K u�	�z���7��G8:�LV�ɀ
����Cb�79��%=[�O���m%U�&a�ު}tX�����z�
_�j� �(/oս��S!��!6����m�01��8�D��b� w�y��`�#zΊm�R'�%��Ĵ�>+4���9)�X�;��,@�	�z��c�ޑ�+�7�@�w !�<���"Ǟ=��x� b\�,c8��1���Ov��4��������5���N��Ň��>L_��?PB/����d9�y,���Y�p����E^߼�)0O�h��7x:I�Ö��50�C�b���ME`�H�؋xZ?}�fL!5����==h5,�3R�<F�L���@+3����k5�i��ǳGI
iA~5�t撓s��hc�j��p��^��[fO����ҿ�A�o��m���p�BK���	c���9~|[XŢ�����C1��17�i�ɧrp
��Ϡǘ�d��S������<��OK ���)e���8\_��������l������h�q8ö�Z�zu.>g�zt���Zx�Ւ�:����#���	Nɖ!�*?\
�ZL��Ϡ�8.n���#K� ?)�\傗h�:�e��ў{�Yr�O����� Y�i��ϤN�U����<�����q�I(z�3��F�ѶҒ)�$�8O�s:�L��V�.Ǝ�W1���	SQ
+��n��x�ջ>�Q�.cԵ�%�S�;�H_G^ZS����=�t�"���q���_�
��:�$���-����T�)�=�1�5���#�<TkJC��1+t|��b��~f/GPBQC�IG��f��|��*�5�j�D4�ͦȾ��ǉY&I�RT��O��һ����QѠ�۴�L�������|={�ǥu�HQ�$l@� ����N��h�iB A������l�4iܕcU��>�w� d�h�(�=����в���zr2H݆{�^[����a�L��k͹��i�P���/PE�H��A�\����[�-�ݲ����.�V`+�n[y�h^�S{?M��C9�Bf�^'?Db
=�&=YU(1���	��qi�z"�pf�����LM���P���@��>��m��e�� ����?d�%w���D^�7S�ǎ��$�z͏����.��ƻ��ve\����PR��~���ruz�<�����K2s�)�K�Mí~>��Ø>u5(+����H�5|�� O������3BZ�0j�"�c�̛{]�<�fϩv�v�t����6��E\�b#�u�)�܈t��.�	Oyŧ]�?�f��EГ}��s�j�F{no�[7���QI����R��IS��p��w-�L�����Az�C��	O�r��u6��9���DZ�d��� 2���B��\E��;v�ۯI��G�":e��7-��5g·&,)B�J?���lE�x��o$`E[mƤ�+n��'�+�k�2�����r��Ki��{ə��KW�TF�VF���AL�c�5��ɼӉ�p�<:�F0�4|J���Fǁ�7�I�4|a꿐I��e��#�B��r�J�v}�eBT�6�����o$� �/0p��j�zeEzzz6[��_���և��j���]v)����*�n7/�ӓVp�������g�(ż�7��� c���D,��V�s6�Og�R�}��Z�&%�l�D���Y��9w0��n�f@��J�ѯBQ1�5�u``����S��e�����7j!�� z���0����$�W����=���ɨw���&�Fю��_���ɾ��t �_u���N��_�=�[��Z)`�*�J���0�� S�V�8 G�I�1��ɂhuquҏ2C8��ZD�T��'.0+��nf�Y�o�C�ic�B��6T
�_�[�	R(!�/�C���~��-	��I�\����jsi��z���M	�4�dĺ!�e�"��v`Rg�4��#%��'�r{P���qg����c�.ʒcF���4tNS)���ٻ(��LB�4s���`,o]���8�ٰ9�����Q�V��&�������;M��a"�*q:�ݝ���s6Gg3�Mў�Ps<�Di�9�=�4��so��6�'�g�}������c���d�eW�k��q��Q�>uC̿kX���? ��P�F�'ź{kR=bh7�ϝwB�M^�YN�ie0�.¤e��Rt}?[�K3f0�UZӜ<��#���@�"G3��2[.g����}5֥Nnf�{�I�'��\���O<�<Nb|�����
��F�X����a���,$2B�B*�/�G"ǓF�]�iw �~�V,&���ï�6L����ܘ��b!
��%<ٸ��Q�w��G%�$r��ґc(��}�J�!fQ*�9��p��3l�4�5�]NQ�Sηw�O��3�@k_y��<%w����'�x��T�F�\5�L"RHD�/��h��������ֱS��a�Ϳ�+?H���[HP��L���4����b�z�F	l�� ��c ���{df�0eNq?�7�O�@��Ӯ9��� R�$C�wc̉*�Vb�X��� q����'S��<�0���Arc��L�u���g�r��TG~�)���m@e^!jhi�3Ğ�q�Y.xص�t�Dc�^��T����6�;#�* ����*�1H��Yza[���ٍ#ع�i\[�?�$�@-�֦k����Y�e�\��R&(�Z����-j�{D�_�K(O�
5HM��Lj��\7�K�cR\z��K@�y �`t���2 �}�P]��~�l�@��ر~�pdq>[�O��_��V���΍�K�u���q��+�~\�}������CAo���3��M5������j�6�6�$�A>�zS���j]g�Pkx�7Mj���b��#��LiF�p��W�Ѥ+������y�V@\��(��"�a9�3U�9����F��!�#�������`����pn�Aʁ�Z�0)(d�J�K7pZ>Y�x9��E:k��=��U?&��@s���g��(���=��T@�z.QN"���*M�k���U��l����^��Q�S��8c_i��)��٬��ɶu�V�ZS�L[����
�����+=�3��J-��o��.����z�#=��@dX:kp0ֆۮ,j{�dD3ڢ7G���{Ca=ڹ}d�-�Y�X������8e��u��W&�'�'���{�8sz�<����N��[�j��L�pS�Ѥ�p����<��w'<\    ���uy�-��nʪl*���Ӕ��F�!��y�nJ�6Ϲ��o�0S��ܦZF��2I���R���H�.���ݢ��;l�6�_�N�L�|]˾X,��󋳗7A>�>�ip�,r�{oD��3`�^���Hiq!rK���6�����R�X�� h{���W�Q��l5Ѵi�Uj;R �d�t�߹�w���	O2���oYb��rY����� Nu��0 M*�x��]�FB�V7$A��.�9a�U5���;�j敖�5d���F��\��Ԡ:���>�T Ҝ�������*B;�t�Ǣ�#S��|�m���\hhrFϡ��;�7Z-S�)!����1RH�Y3ۘP>���n�����N�W�oW�޶нp���oq��/�y��w��N`\m�'�5	�
6�b�m��)T@hw�z�#܂i���'݅(�� ��&�0:�$`X@mHN��Y3�B��X����،�q=��_��sIq�Oa��5�M�e��:�.N?�n\���(��Z�o�D��y[g\oh����>Ƴ����(o2���r?��/�Iul�c��qk�8m��)N�m]�/�,��:g1I@^ZR�i�Q��~t��3��V�+w���N�g@^��������y����9�YѨb3����D1�>����'��#U�z#9-_@��jS~l���'�|�Cs@p7}�N��h��ȗ68�q��tr�zvx�{��E��\����#Y��4�	��u�dL�U6�¾���qscX�����uB�u����Źd6<.˛�Ӵ��=F&�L66O2�pb�Cr��eE[��-�TrX\ ��ؠ˷{�7��+���+� 0a�3wS����'���^���`n�>H��P�]i��`K���33/h�
s���:Ua@PWrc �
?<�	z�V^���x,���S���z�R���ZY�$���w�n�TK�T)��l��V�������'��;;i��ö��P�tM���ԛ³;�v��jE��#���L���]�ú�cW2�pzD� ���mY:u[�~xp����v¨ua��*��M@9�qq~:)����a�p@5�W��QX�n�0��6�l�#�Bc��+_ϋ�
0���`if��\��%��i{ɖ����OU�����	�`�u���O$���M��KI���'�v5~!�X�3��x�B��S�51ގYh0�z��~�׬ښB��8,���]��Q��Lѝ�Ծ+N	~��xW�yo��p�T���+�������̏���๶S��a>݋�E���b��ܨzZ���?RB
H�&; �Sh0`��+!��)7k�I�n������kd/�>�hAg2��^ι/ϳ�|P.�K�ӟ��:c�׸Y�%R��ô�6K�O	]�����AV������-L���㳐��m
×~6�5N
D[�9F��xҦ�8͗����/�x��'�̎Mk�7Q[����G&C9��{���U�~�pz(��i��k��õ~E��q���̀��sR�<
���p��r��		V�����+��u����_��˅�X�3D��ٟ�-�Ɯ�vh�A��+�N�VG��C��6!��!���K�s聂���I9}���%&u1r��FZ�L0�?I��*Y�R�\�b�q����uuT����/!�����b��X߰ϺA�d1{����i�|)a��P�?�{���0�@y#-���nq�G��?�q��	�[̅�;\�+��L�u� ��ɴ����f��:��2���8v3���H�e�l�FL��WdWٴ�T3!�F�B��L��U�1��+��-Y��O�-�ƔY0m�f0�k[Zv��Q�͇��hs�頗�
��b�v�"�2�����]~��q���1�-Ӊ�Q�:1r]���;EO?O���'1�����JyF:6����e�oJ�m��`Zn�|���#h����X���ꇛz5�F��a����KԿ��($
y|Y���Fo�;e�5��o}u8�b���r�%��ƥvI��b��:�W�<9Q2ʪ�9����b�{�<��M�>�Ε��B����`�@b4ۘG�k_��@q�4��VX�E����?�rDZ�3U��=v�o12}l��QH<������Ũp����M�<v�~�
>n�lSg-�v�򎻵�����ܱ:�ݿ�ց�Q��v�D�'��B]�*��!_�4�26yq�Z,OW�0���H#��w���t\��|!�'h���+���q�{<�)F�ws��hhbxX�G��#���hz���[�p�臦\L�~������WF���~aV��.(����-�dE�vG{Fk�p�N�TpI��&%�"�H�5z�0\tPnDo�<�G>��RX��8^� �x�[U�#+�I��������bON��=�,Y}c��%1�49n���B�. ��->R���ђfh<쟎E~�S+Y{Jn��#�Se<�a T���t�z�a@��y�:T�T���*+�֠��s!������g�8t��,����Ɔ��0�$������f���A?�\�a.Zor/��� �8����3A��ӑ+R�p��M��y%�Q������|e[�������W��	]O�a0#a�DC%)�Q7u x�N����'�I�́*s]uDa���`���/=oz"��<��{B��\!!:9DB�ݖ*1,d�)���*&xf������V�d�$%@\rAwYru�6G�ep���Czj�-xS&S[����V��J�38�Gkd<&�RdD\���ta+벮�z�����b�9M�9i�3��o%���P�iڛ��z��U`�B|�׫6�1magin���S�eb�ĺ���\q�d˽P,7ʄjo�>-���;��q�J��<Ҙw?��4r�2Y�n������+s�c�hs�9���O��i�ډ�{h�.ٵ5r@Ȭ�D��t�2UR�H�hK���lܢIyC!���m���!iC�ZC6d�'v零��O�d�2n�6�|&^�t��8�T%̏']^���8h9�����A���GD�A�������h�z�� �~�6����3N�ʿ/�c��Ǹh�6�F������e�J�ӻ[���?�����1̭�g-�G*�m�5PKR�i{��C!�(�	���Pv�[���6�}���<o �$:q]�@#�m����*֘���
�q��#��-��f93�r1��U�hR�LRd����\u�?�����/�����2i�xos��aP��ܮ/t"Wf>�vVUu�ȷA}l�?I�y�M�R�x���A�Ԝ��x�'?���~s�T[Gs���C�׫����gE�Q���E�=0Κ�>�Z��	�`%i�~Bkyj��������s����,��ا��0�vˠ���8lz:^P���Mm�@}�o�!9/��  ^�^���7_��h�A� n{�z�Q�P�Vp�D$�_����5�j89��W.������ �����m���+�zԔ���}w�I�%j�R���JK{_����Xi�"7Р�a=2C����+��Q�I�#y6`��/#c�gO��>������+4�~ ?5���#25
����ػ"Э0="�(W�μ��� �e]� HF�	�qB��/�$X�m�cAe�BM'��M)���m�����c����p$��xx�N��ɨ��4���fH�߉i�'''�f�]��/Loo�C�j��l\c�X���J�������=)�-dO�JrExh�c)M�����@Iq$�Ao; L�����)���+}�+��.t�n	?9G��Z8e�,�����j��s�J�)2!ď��<e�kr�cw#�.`�|���}�,8>:��*�˱i�����(�q˲~�zTP4Ǽ^�D��΃�%*V=6�#=]�o��n����� �/C�i����(��st�|=_��b��jy�~�Y�4��Z����U9{�}[Vs�Q�f���㮨�u4�o�Y�^fEsZ�7�M��/��q�v�̽�	�D�k�-���o�n���aE�`����|#�
-���&��!�    �w�;�86~��~�����5o,��t[�	��I^l��6a뷪ͣ5y$�T��a5~��0 ۧ�]pbU++���Ku�����'�%l���o�F�I|������tՖ�C�ǝ@�YKa�Ti�������Y���k�*Iv�=t��S}z���
yc:��db�������c���ů-r�NL���r��O&g'���S���_��E'ɬ�ZX|^�����ǧr��#tU�uʺ1=��SՍu��T�^�����}���(���
Z��Kj?���r}:?[]�_^/�$?�do7��Qg%�)����9�ީ�3��"��՗���({�'S�Oh�~�"6�;�C�=ᇝkLK/]�n� �E�^-E6�Y�OH�R�f�x�*`���\�.Uip���5�c#����;}鶎=v��\�w���_M{"[�sc��t7
PrE� ��6�БcS	��M�;��g��J
j�|Қ�jl�!��Y(� ��/J��HOW>�xM��U�UΟ�H�(���,��@��j�ɘ�&TBr�nL�\�jd�z{��<!�<�c� )����/��q,����J^�$d�a`�����1-�;�X���+�L��f&��]�~k�Wf�^����.�4L�k�T&�bc��t�v�
>���]yU��5��'_�@��7`���<~|3�yX�߂}Qժ�G������҃&�������m ���<��?0��������{�-�T���n-��Z������ȏ����_��^tBI�v�Vk�ٟ�&Ao%-+|sˇ�����{)��9�\f��vx����\6^E�<�9�$��*��.�;�O���� c睚t� ͠ǆ���2-�Z���W����ǻ��$��`�E����r�B�Kp��	��BhZ�hd�"�hc�i�gܚAM�	Tg�-��i�$B>k���Jɐ�v�8ͩ^���N����o��y�mtf���Ϥ����Ï7�Fc�Įhc�d�9##�W>z��'	�p������{~>;[�O��//Y'�b�@!|y$V{E�תEq
QF�މ\�jr��������՟��q�w�U��F��F�λ\	h	�Vaʨ�>�p�	��~eP�{������^�������+�Y7&�� b�^1��F�0������_����&���r�D��xiӼY�4O�5�P�#�:�4� ��3{���W���5<�x��)z�P�[Ҍ^�8]��-�թƣ��L�>"7�p߶xvD��U
��tx����E��Q�p4�L:�ULB ǞFz�JR�R�Վ��U4��h?l��ҳυ�	?1������Y�k�a�,&���*0@�Q�XLFT}cf���GJ��w@�F���pP45�B�%I>����q���:� XƭY��3f�ΣV�K�@���j`�<<o`gj�7�6t��05K1�1�Afj����	���?� ��nW���&8ۘ	�y�ׂ�#�w?�N�)������w׵p˰麥u�L έ��Y�Ŏ}\iz�wӵjG�ۣI�j�Ԏv�ל�	����)\h�'ᄰ&�Օ������KN��]�ߣz�e���]E:E��U�C�ɓ�2��>Y�-�,�1���!�F�F\��_}����w���]���uo`�?�拷ɤϢ��x]��l6_-Vg�/�VǨ m��?�������M@�p�]G0ɐ��c�XW��g�!c�z�����ơ)A�Ѩ>���)�|�!�Oo���ѝ�"��O�;ZIA3���깎�GC�5��T��rU����]�`�)�:��f��Bsr�r=N�֗��A�Ə�#�VBK�mf�c9Y�g
R՚�	�$KK�X�����T�Dfzs�t����l�Ve; (s�~M����<=��9�Q�w�h��jQ��ʽ�O$�ȕ�!9���;�ms�l��~��5��:Z�T����=�#��'��\��e�a
�cW�k��5��<��
�b��]��"ǲ̷GZXz
"��?��M���/:Kȩ:VA��V	��x����K��hw�yܣ֤xnS�/�|�k%L�� �;����ј1L�R��8� %ǌ^�?���s� +�d�J��?���/�.�{�`.dE&�k����̴w�]������Y�s+���z9��Wb�8�W� ��A;�/�/Ζ����1c�NO���l]i���r���ʘ�G��و�b+<���"��@��o�!d���O0c"v��q܀�\�����9"V3� �R��u��b{Fa�8R;��Y�\ޚ��"s����B��#)�bh#P���b��sFk�__���9f���h��h7Z�v�x���$� �c��r �a�����HN���,ȃ�Y	Β2�P���9����v�H��pe���Z�A��ST�~�h�t�pA�sϑy��u���a��o;>��?Tg0)PΰX�d�}MBq��l�^�f/'��&�kW��{���.'��Ľ�ڮ�),]�1D�6�o�����M��C@���`�٤���G��ڥ��|VnQU5@y�e݉����˟]�bd���%�?��(�֊�["��ȩ�c]�vWt��o4(- Y1�����uU�f��Jɽy�f�~[�$?�ό�������zf�ʽ͏�c&�Y^�xA���X��e��pm�XN��xǛ�����~:1�;nS%q����o�o,؇0�+��o+�v27?F�fV�Զ��&�Xˁ�#z0`Dު���0A�0.jf���$:�	�ıb@x#��/���] �U��9n81�G�u�I�$ >D�j��E�|a-U�v{#c/��;ۧ�T��;"�k2���\5����W�D�)���*���m�n�S�>�S�%X(�Śs:1W���T�ʌZ3�W�"�z_ON�Bo���-?'�x6�����X:h�@oS�s��қ�A�o_n-�YJO�態#��c�"v��wLd�G��U4X��۬En0�L�8��#=��_?ZPl�42��5�'����������_�����ki�^��7Pk�n��ט���h�19�gG�Ѓ�8��ҏrH]rŧ�Y���g���8wy�xv��@����6��;�$���dSb'���^�:��E�a��-��4�E�)?_�����?��K�y��?m7W?����~��o��au��7������Y2?;��]�vz ��^Z��sJ23h���eT��O	Sh0_��o'�m��G�����jo��.����駧���� �Ǉ3
�?�{���m��&l� w�듛����������j���o+�Z �h�m����E�c�Xl�O�)F�}�}l�����q�M�@?d��VB��%�P��>A�vx���1���e`:w~7)$NJ�`�t������û����vm�|�X�l�~_�˘˦�$18����7�p�?���D;u�v^>�q��㞟�O��6_͞_��lXrEq,�u�\a^�ͮ��¦C���_�7�|?���|0�)�6G�F(��>���l�����շ��sy�K����Ljɪ�$��������$Hw�~�~���ި�)��A�_,����$� 0�����" �Wd�Γ�o阹X@=_}vF���9@���_��&�p��N�E�����j�;�e��Nj�s�v"m짪��e�~J*He�t�?pl;i���bN��|y��"9�����~�͉ѧ^�1�K,��Mm�� F��9Zr��ø/��r�P=�)*#��C�����|����Mn���߄�����l�����lz��"�>MW��b�&!��J�ӂx���z����V�����%�� $�^"H\�����K����q��dI�tU�Iһ2Z�kŚ�|�� g������|y��G�`��Kn�xR�M�cH9i���`Xt(��z�!�lܞ�$5�K�F����HyJ7%>��Sv��SD/�P�R^@��@x��O*
2�R>`��ta�/UtwI�Xr��Y��Y�r�i��N�����\ާ�����7����,_�����    r�%xqǅ<᳨jF�ɢ=�jLF��B��ɭo������lq~����'�eZ�4Y�A����͝����@C�w��JZ���F��鏈m-׭�q'7�}�����=���w�BH��2����`�ues���x}O�ɘ?��KF$��J��7eX���ro�/����6f����ym��ʾҽybg�{z�Y�#i�4���X �ᐙ�Y��k����l�8!��6.��g�x���
�]!?㐐j��-o�������wJ�Sk1:�\IYT�+'<�qO��Ǿ}r��J�(�{���ހ�J�5٦4��[��59�X�V������ߣ]�-Z���Y7Ze�,�M��q��E�%�ț.s��i5'K�X���J��_�U�SI��xGR��N�d��Q���s��kWU��|{�>V�P�mW�[&����pq$�S��K~l�4�8 �*�֩��˨;�Cs��b��d@|�=q�J��e1mI������e��u�$zy��Q��i6h��r_ӔR�Y�=9:������p*�ߎșl�$��DeI;M�	zıH���²n����Sׇ���� �%���������dٮX�0���- @�{���Y��Y�ykh�<� ����Ï��P
���Ö�,��9a�r��CU��1�ʿ�5$D�%G�����$���#���o���e�g�@e�'��{	uu�Y(���g��#ɂ���I�W�,�c�K��!�W�g�ޘw��ֽ/l��V'��5��ٞ�����g����E���=7�}g)�^�~������{�R=�����c7*�o���.�����:T�Y�R�	�G��>JW�}�'�ŷ�=���<��ڦ�|�<��ۄ��KEX8Gɹ[K�e���l���/2�曷��i��s����8�g��<���=���l~�^����rJ�R+@R`����\Q��0La�ù��}�uSfl�N6�)�\�6G3�P&"5�p]v�롼.V7"��g�[�\��E�\�Y��������oFJ_�Z�kW�ϧ�=Bf���G`�ݬi�_��avy�1'���l����鯦�䧟:�W���,��`�Tz���Vs�����Y*�?ZeJaj��<?����6f+�=�rZo ,7�2�:��g��|X�{-�V(����)NJe�e~ %�"G� �/����a���F_�A���<�&���AY��O֎�t)P�`���:%�Y��VL?ց/��R4ժs�~.��O�"�i�x���b�}\9�7���\h�-X�c�� ����#5\�[,>��J�e�R 8������_O��s��_�Uy�g����nR�![�z�U�@h���M�Q��槪���#w�8��^��}�����m2�cZ>�*���)Nh�`��g\�a!%��6�����̦zq�^�r�:h�|�N,�)�P�7�/������ [
e�\D:����8fy�A��c*�Uo�[��1�!<�A�ZB�R|c���#S�m�~!'Z1���%q�a�AGXeB���PS��Q8�ɤb�	�w��nWl2�V����^���ĞC�	�&�%���nzL�S�qS�*����*�6�f����}%[�?��r�+=Ki]�e��ד��
�+lg�B���	w���ʕm=Q��%`�_��f��*��1�l�)4iB9��� �
�i4_�<�7�`����Lx�����g:H�Xg��߉�M�oGZ�u�d�ǘ�A =<g�_mw��.��j����g��K��m��LIXJI��b)9Ѐ��!-��@�6D�� ��2S~��Y��Ԗ�,&��$�_��{���r����Ky<�U{�)o�#��ʐ���>?H>�
�Nw�gT��|Y_�\E�����ӳ�|�^,^N!%w#��x�Ug��0�&,�����!g���#t	)':�S�8p�NI�E���Pj>^!?O�	����T%�HL����'ݞ֮�?�I���~�����ȣ���T2N���<%�r�:8!��L��ł�$�L��t�K����8�A��m���-㐦�X)�jՅ����	�v�� ���B�$�ON��qϹLU���+ZO�����L�4[��A��5l���?o-Ȃ�C�����޲|��D�CۺR^X��6��8r_HCgy?,~��d�27�j\VZͨ��*������֣��o�ap� u������K���,FΏ����\ڊevm������ӱ�5w�ж
��.^�Y����#�:���O	�7QG���{ϱ�˂�N�S��U�Hxku�������__����j���b}v�x��G`�>�cěf���\������`�V^ĝnz	��b�7�~hf�ɸ�?���-���Bq�>&�x�y���}{iNj�#,>�=�V% ��<yL� 7=ͽ��+\��x龗<L\�C]I�	o�֏!&�M�*2^K��vh�r�G����Rn���rO��U��s�捰�N�6٨�F��PWyL��T௘����"���G��<��Oz�_21:��$j?��\4s��@�ƀ*�Re����THy�M�w�F�a�� ҇��ZA�Xꃚ��b�T��x�$GA�,�I����MIM֦.+��#)�����B����ͲD��.M����#+`�Fª�,��1�F�L1�Gϣ�{��_�RO#��:�үEQ��HM-��x���V�%k�%_�f�s���������JjbLom��������b���-������Mdx�D*#e���5r��b�D���B���)%�u��0�2��t(�8{H�G���Y��>���z�u|�-X�p�7ȸfbQ�k}q��0�3bԞ�!%��haR����>F�'�� 3A:�GJ�.�Ij��Z�.sG�$�rO��[*ø�o�o�?`�
NH��@G4B���Y��r׎��6��_0�i!�b3^�mT��S���.Ċ�}D-������|Qa�{�*i�������5��jKOfT>���;iF@�>����;�^�Gn�.j�?�� N�(
V�Q�~�-h�[|��!��1����2	��g��R�ZP�zw��řk�Yi��FU䅪��{��`Y��}<hſ��u	W/���b�xy���O�+�x�{	b{����t?�y��o�W��ޗ4�!�n���-�� �2�@I/q1ikO<�o)���З>HV$8X��F@rR[�[,eQ�2qQ�-�r??u[\
�����e�ų'�b���DcF=�@/��ӂb�|ߧ��SB�\����4�yFz�u%m:�M$k�	dI'�W���FNH~�#h$�*t��>�{=R�
����P��&Ϭ�wm:j�[���
���
i��qWt죄&f�|�3(N]e���(2*>K_!�g�QQ!�C}�/�(��:i=S��� _#���"�Z�t����O<��-~�3��չ��u�G-��q\��/�����U�:&C,*?j���Q�d����b�5!w�*[!��(���9!9�lg��~zD�1����A�]I����J˯��J���2sÆ�b��szz����E)�V�P�7f{��)�+�s�p���M�*�%���Ȁ,)DsJ��+>�L+i>Ok�#���Jd#c�S��zb�����;6�Ge��E���}"J�U�A�{���*����vҌm�ｈ)j�\�Wo+�w�z�x=�6j�{fN�i�]y��s�#I��,%�J�].���J콕r[�AE��v�c�Y1�D�M�*$C�P��3�p�)���Pa�\:��Dg2����<�%Hi ɔ�E�q�7�I\6$4гz�iô���
�F�C�}��0�Hz�� i$�E(��R���0n	��;�@�Z$����<S��2�S��#�,%�ĺ^�vz}>���/�_�v�]Iƴp<��CoG"Xcb��+n6�L�9����0���Ӓ��=��Y�1��("�m���`=?
�cPxF"Vk���dLN�1��KѸ�Z��:��2l�g�<X���䮶xW�����^�W��dw    �K��%�Ip�#�T�[2L��7�%[����^!ʞG;9�����u^"̢���5�϶�]Tw�3c
���>�0�� ��٪��f��D2;��oJ~�8j5m)�צ<�e��6&ū/2�VZN߫�a���q��JV�p�=|���;�dy��B�bg9�_����B`��d�.e"i�E����<�v�4�TMj�^� y��5����D��v[�'�W�^�t���Ǹ���\��lrN����+f�}e�vv���-_a
4�Y%YzW�$�Vo:�8�����f����x`�}^=o�:���dh���j��.��jfHR��I1�'I��D�+}�S���G�6t�Z��v�c����܎˺�����c�ð��JY^V�j�èc���̱�U�C�Xp��Yi�.<h
~IV����a����{�ґ|��p�b�eT�3�o;^7J��喲��9�"�A%*�A:�D�U-<�	{6Lܶ����v)6�r����$0Z:S��v�"�����4 ��x 7�0B^m̂������"/�ݾ<!�0/�Z���٩^Iù��W@	���� 8���g%H��3oB\[�t�Gÿ�5#��|�PAp��Y]^�����8U^�:;�/�/�˳W�\��J�R\��������3�y�,]CVh1�(�!FޓE>���e��l]��m̮CQ�(���mZ���|��p��I{�|n%L�2bZ�G@�����:���-0�����*���ݍ���Y��%4�~>A���H�O�g5"3QX궰�
�P�=jy�UVF۷�F�h�&o���q͍vRjKw<�@�X��PD�W�6�1��<�K��6�����H q�t� �jGn8��~�Hz
�������.�ڠ�����?2���9�S�����4m����"�V��h3�6��Wa[L���ǯ�
s"�NP���j�ga_yR��tAZi�
Y��&p��m�[�*�K�����a/�
�9q�]�P��6��C�hԖ��0L�2���x��ӟχ���,�������N���@H���� ���w��|�Z."Q� ��Oq
<?�E�.��������pxxV�1>p���]��r]o5zp<���W�	�i�^�d�I��K\HOn��)>������Cp�"��� ѝ��"��/c�+>��`̇�#,�k���a�a��-nU�j��2u[�v��3��y]�s�X�͖gg/�᳒���`��:Dqô�>����I����q����[��>�1����2��[�3�ϣ�F���+ŴE�[�1��*� ao�=�p�^�#'�.ǲN�W	u�-q䏡��/%g^�]�A ��>�F'��Z��$MN������B,��.B�'�ʾ�s�<���p�ݟ�n�~���%Ӂ����|�$�t ��]��3~���&����?z	2���v�!�X�Y�D�K���d�,K|#J��3�9�j�F��s��gɘ�4�T�/W/0N�;teL?��Q́���$�%RNΑy-�1$�)9�)d��0���DX��Y�( d}�8FN�RLah�v�I_p�S��o�R�����|ӿ{]�5_��V����[.}^Is�' ���=���ً�ApT��\��g�#*b�i$��}�%�W``��Q�'t���9ڥ��2`���(89�0eE��m�+Ȩ���?�.��r��J��N+��J��$�"��S�,Ҙ��_�=^Q(l��p�J�̍T���N��6��Z���Aخ�}����kc���}��DM�K���%Ǟ����de򞾀��aRЖ3�'��|3���5D�`��OU6��Hm��,��I[zHM9�������q�� h7��w��J�3���@���l�:�x9[�'��H��I��}\�P"`&߄|�NJF�y���S]�ל�E���Ɨ덧���|jYc�l��[&5�H�D�Gn�HKN�l{�m�P��s��eyY��bZ3�1�"\���R��!�T���
���߻���1a��6/x8�pxL� �Mo@?�97}&� Eqmw�$��IC���?P��il-	���ߧnӘJ�'&AWܕq$)ӈ߁��w�'����}A� 䭅�ὉL���`t\^�<�'�x|�L8E?�3�l"��G�.�0�PX��ҁ_��FA��u�����%����ILG,eC_�)Bo8�d���+P��W�Z7̾�i}�#e���D�����7�	ۮE-[�=�������cV-u)�B�2(�2%���k�&����6l
V|u�	����*0.X��� ��)��H���#��ql�=�
��22^��S��"q/)��Wvͩt�_7�Uʔ	���(�I��2��-L9E	�5�&R�lV�
�O��i~�8zM���63�7���u����J�C?5����S�dHi �a鵃��z�Z�)[������˚�8��<��Xp�풌����ZK�O�7Ut�yɵ��'�tU�hxI-ז4��=S����?����g�*dQ��9u)qx<��Q�y��\����ߏ�Jz�ǲ1���wT��ȸ
b�3��<G��4:&Ce���VLX�V�0������G�'�|�����yj�T��=e������s,��H��;j�R��n�ݭ����ŉ���;����in�����|��Y� �;��ֹ���X@��^Ԏ�U 2�#��5=�W�l�A�SQߙ䧼�Jݙ�5�u@�MR��H(a����?�`tQ}M2>>�}r��5��fX��@aw���������Aq#RRϽ�����N���Q�y�����(���,���˖u���sn���8��F�"�x���Ϧ?��q, jփMD�kv�<��QL�RTC�~�V�hF �e��V���DV$�[7O�~!@飋�qw�S�.�7$2�>3z��[S�VD�gҦ��[y��'WO�q��e45P��V�
�U����9���;H1m�>i�Gt�,.����˵R��;u :Z��V7��팵��i�+tb�Ƶ�&�V�[j���@�#-3 ^�>�%�'t���bd���i�T����
�������:��$��,fQtmC�E��½��8ȧge������4Fk=	}���p���n܁n:?���"�!�H�탼g�Ot�0�#����e�X�
qW���Ue�苿˺|��Y��)���~PE�+o� �g�ۊ�5����&�JaaJ��A��q�\q��OM.�\���������D��\�AA�#.��v�ކ٠Hm��+��_a�ڴ����n�@��z�,�TWĂDF��p����P[觧�ɶt���n������Ǉ,#K���jvd��6058�B���~��}�F�k�~��	<��	H�]�M�z>ǆ���7�0wM'��NS%����z�_�/=x��I��n-b2�44-h�ա�^b��.c|��F�g����Ê���]1g�����L�P����e����#��(y��A)�|x/p ����&�z�S���]/�k��K�c29`��L6��:�>FC�:��.����Ѯ��W�
I���g����w�3�nM��ˀp�4�m�/(��AӕvO�D0�Uʝ��L�
���ɵ�|�<__��_�㉆��TU�3�]�c��NP3c�r��a�N q�c��Kܠi_Q��וIvL�)��يJ���T��-Ȳ�J���7[���0�[5,g{L����h����g^����R�T��M�1q�>��ۚ����m�>�R:'�Y-��v��q���A3�捉[�s�H���XB��uyw�Ȃ�HqD�s����i�R��o��|�����~�OOzZ(��$�mYD��X,ξqw�@ȷ��z��K'��O��۸�x������D�ٓ:A&^�a�Z��i�"
�l�5Đ���7
5�]m�%�hD	�{�t��xE��[:�?I���(����k����~��<��S��պ����~;�b$Z��E�O�eO�H�nH=?�X���W!��p�'l�{?~�KXJ��7�?�+��Klk��+v�
��D�jVK�qS    �����7"^�@��qu8y��eS��6Қ�ū�ʟds�|��4�[;k���F�E�3�s0�u������}I��5��XT�K:�e�!�]:f�6�]�Ʌ'X�w�IV���f��d\����V6��1�ҕ���;ᅽ�K�?���1�#�>�_�>@�uI�=w������E�;���y���.-��.�M�4%��{�i��l���B�����~nR�S�pUd��t��I����S,&�HI#�[C�M��^�����D>;2��uz1p�u6�'�M:��Mё-�e��L�3Li)6eG�@�rx���H�>w�7���v�v��P�i�H����#�ٺ�a�}Y_N{�(��r���L�4}Ռ�f4v���Q��0�~!�{�r��Sz�������d�9cmP�QX�q��`�?ޖ�̖�!�4��:w��<�z��oV���K���x�g,���_)\0W��$�e*Y�4���؛���t��y��]�5�_o���Hz]��"�m��H�{���c;�`�)�%��b�PE���y��1�^xa��[���s�ߣH�tK��t��b}���ǹ�Cl��ݹ��-湧Q⡒m7���l�#C?1�����{�*z֭� �O�?�X��Obx�:�N���$��vn��4��ehJ�钞�ܲ�Ӥ�\�e"Ӥ]��s7�K_�ʨx$�v� ���H�)�?���;fx��42�t���1�u����(�	$ʾ�^'���7L��N�3u���ш
�aP3�M��\r�O������.Vi�ș��L| ⎁5U6�:b3�2�/��"��U���Wki^�h�Z�����=��H��6O�>�O%����zx�LNþ��
�WKy�M�ѨZɝ�芼u�|=/���9z�U�o��|�x+�jPiAq��O�<h��O�h��_�_�	6Cb!�m��u+/�-�
��g��^���n�6j��a�5��iq2�A�MK:cb,��U��E\�^����U/:g$i�<�c"ܱ�.����?�����5&.��7{Q��g®�UE�%;�9o�\u��(�$�q���d�p���a{�7e�k��D�b$'f�֔[�{b�X޵�Q1Y�4XK�9�.UX.P��lZ��䛦��|��4�C��?�L�Uk��ɼ��-�m��Ă�R�� SF��D$�U�J#�m$�v=�W�8!�&��l��e��Q�y�n�y$K�>mK�����o*M-j�4�m�ej ���f`E�e��J�"3+�m4+��4e�M��T��a�~{?N�m�a��#E��Ɛ�n��e ���[�@T��!3��W��e��y#QA��	��22#�*!݉`qfÞ�5�dȫ��Ip���{kG*phL�/�;�?�aS<#����m D��`�o"�ѷ�ڦ`�7Xީ�x����k��꧲�ٔ�`��KV��ˠ���cn1Ȍ��H�Q��4� �����g~�hS��a�%DCN�[k,�r���,�E�A��0�#����4ؖ���I=���������>W��!�͈�3����@YJ��6�Z9��'�IZ����;{�k\�OSQC�7�BrV�q�;��:���V,ȆB#�c��+�F�,-�I����B�4$3u-����HrG�0赎5�Dc���E��M5]S� م�&�5 �C>�n�M��M���aNM�@�7Ey��x;�o�]Xc[�����m�#��=�|��x6^Ik6}�NcȮ[�y��$�̻�~�Lj�-�ES�f��+C�u7����a��E��Sݔ���#�;��C��Q*��N�P-6���l��̸���M���jRxˈ��=���o�5L<�Lx����470���_o��r���]�e{5�޹R�����o�P;�>?���|{=��d��@�jT2;=F�*�c�(TM��K@��
�0���N�v^��M\��J�;�{�Ȍ$dɻK
n�j߅��,ޥ5��;�_��Ӄ���f<˚�SG�4����5\��ycy�ej��L��"7NcT�	@�j�n��ݹ�D>	��Y�l�oo��!��#�S�k*��`ͬ��k�󌝋Жu0&_l�Bݶ�P�v)���&��L�ov��5?F3�F�߰��g���]�B��Z�<ZP���nߙؕ�����@Lέ��ˣ�_~�J<|�&$T�K;������Yhϕ}�$�<�6�*76�v�K�$P�����qa3��S>��4X���Ɨ�h�e%ʒ�m7�������rBM���t���l4L�mƥA��L��h���,��1��Tv ��Yz.Q��J�G��b�D��~�,SZ�X[��n�F�f
b��	��^��`��Ly5m���@�C��,�����E���hk�a:i_����u���,X�<��n�*y�ƗN���O�����;E�J��+5�c�ն�^��`�f��������5��3B�	��^Kr�&2*'S�N�>��l�d��Z*��X������Z��#��G�ϟ@Cg��	��z/�6W�"���9��a����U<�*�k�������p�m~Ń���*[��(j�]n�@��`�Z7|� u;��<w{-�|��uQ�E�8���(���!]l؊�����vl�2ŘN�z-�W�ΒA��^�\�Q����s<C��sS�d���ZP��e�o��� )F�F/���o2?�OL���Z�4����7���\U�u1�r����p�:�\�il�xDޚjra6������ t�U\P��Abihvg4�\I�d��s���G�֗�@q-�@׸����7r��(�ɽW�y���\S޴A�*l�0O�b�����s�>��6v��=�;)JO���H6���?C�p��?�′>��6LI�T�c?�-D�SQf ��Xj(A�5Rn�] H�}��.�~����ٿ��ɻj��И	!RS��Km��☰Shӆ�CjK����I����D�3q#��H<��"�K���9��o��Ȫ�q~�kJ���l��&������x�����}߁@/�����^�PSu�>������Mن>���_l��/���$o���3BMj	���@(���2��[�#%�c���Ŗ��6*�ܕ�����<��d����e/�(K����k�S��hފ�fk�0~���,�����nz5n������)Iy�@��X
�i��(���*bF,��.���_5am���)�����5ї����N����`��S�?����e��4ׄ��qӄ������4���ӷ3�6<]ng����٫#%�PW1mX.�ʨ'���`����$��Mn���!�ǈ�-��e�&�%��hL{S�1�S�S������i��]$^-�����Q&���w�gW.��4��wm* �¯�u�93���｀��<(=z�\j9i����_G�E�,{�H�0?�<�~;p/K96��Y9�Q�Twl��{�6ܒx6�-1�H4�G�h��L��Uz�З%�5���!یhb��e>Y��4$.6�V��b���c�&�K:7���۝D,��rk,8}�	ɤ/pԥj�0ミ��~���o���X��a���B���<a���T��������|̝[�+R�P�~Mz<R�@C+�z�iȌ�E6�H�+ú�����ǉQ	q&v�k�mC>w�a��OeFF�j��hFo�8�#��C��O�iEEO9����4�HT��I���ok����-�=���͇��o����u�N��w�k�N/��.�N��,Ks��Ѓ w��4�no���IY��GXE�]�p�289k�89�r9g�A��s��+�d���a�K����M�U��)��L���M������$f3��!�A@&���^<�� �;����*�SQ(vO�eZo��5�=���ḱK��@G�eC]���p�8Fةc��/\l- �,���X�Wg�,�䎤�;ޖ
�1��=j�t��dD��+wI��B���b��u}�a5Ku�O��g�)T������ߟQ r��J!ߍ5�]�^w�AhX��L�=��_��5)�c�)    �ԉMN��� �I���Rc�vl�T��gy��w�iv����{�Q�[�G�>&d�`W����ʁ�"*Lj�f	e���>.���S��nQ���2R&6Qw�Ia����P�<���������!��9�D�CAv�<Cڭj��2ݡ�E1	��ٵ�_c��a�x:ּ��AG2�T�~�V:�;�¯��R��pO�FBv�� �{�h���_�iy_ÛJ���0�b1^��y���ӱ%����X{/�`��WHpX�R*�}�1��t��R1��S�;!o��fy�Z\�;Lx�iyKױ�g���΁�oR&5c�$���,�����c���S
8����!�1��hGt_���w���u���N��ON��^\]��/���H�Q�UrCZیP=G�æ�l��Zx��M#�u)�Z'�c��l�6r2��%~S���Ţ�Ƃ�@�l�8��g���b�Z�Q$�2֗�:��)_�"���?b��l������j����T�������4	I�2�e�[# }DmJq*8;�b��,W����
T�d��M_[����@�4��`��)�\��Y������f���:@������r�.�!h5`�Fl'�˵�����#����F)����]�w���6I����-�uj�`�XP�`���ۨ��L4�a�-�5�蠬���nv?��(�W[�*IАI�X bs_�@-7K˾�t"����\M��3���nh�g�h���bbm�����TS�>�s����+t�j=!C}�N�6[u� ��{��r�Yi�!�������R|?�J�=�i5l�P��{#:K8���&6t��F��)@?��[�>�6����D��ޭ7i�#&�7=<��Z����������K:�Ҳ�(,0��Ur+����Z5��td�R��h�uw���N2N!D<F�,��JfY{/t���Q�}?T^��r�ך�L
�F�c��S�#`$��5E�7��V	Y�E�/�o(�j����@2�����ұ���%���4���-��\�Z�� R��)�7��t�
���ds�gu�6I±�ei��2��V��� � �*�r�d�q(Kt�'��<�m��Pַ�PMf:�-�G7Ԩ�ʩ�J욢{,?tS︍~�K+�;|�����lF�=Y9?Y�# ������bkj'����A�yO�LO��Yڻ�8�f��Z����%g���M)n���FgO?��|(e3���i�R�M�;�3d��z����������=v��y-��g�`B{�1^�`�L�*x&Y�D�)�r�l��։�3�Eh�|�8�)�nЉ}�Į>5�/��#ˇ��*#<L*�~��(��g������D)���itPNw{�2H���u��]F2��%q���F�o��p��}z�U���Q�Ot��t��X=�G9�X6����M���v��:q΀1��v�5�&��\�;F� ��D����S�W(F�6���Q��.�x�������*�#��2%��=vV�#]O^:�W��f�b� �i�OW
ύ+?�x- ����;c���`bഽ. .�L����MT7K-�)���;i��Hg<G��Y���NiXz��.���L�����/�K��l�o�f^�������l>?9��<H�∡$"��k�$(����@	UU����q尊���k�����};�����K�6�{����}�<U3�.>��B�6�D@��!��a���I��!���L54IW5꺥�|�f��8I�jn���@�.�٥��vr+e���=ި�6T�2z�1Ǌy��˪��3<ե��3R=R3��X�M�mZ��G����)AoI�u��[Y�b7�q�j�[�d}�_V&��͡Bܐ�"��{���[yC��̮Q�U�e��|?���ۿ�K6�rTO��}�]�V��U�,����[�9J�#9J@�[�&���ƾ{w`y�ӫc�A]�]
n�0�$�	!��\�\}�'���=�<��>}�Mɱ�v��]kI�@f:�5���#<��.ۣ���ԉ#��J4�ۭ�MCuȽ��*4�#�L��q���A���^�O��JB�t�G�H����k�݀��mݒ��Yģ��[~���7�����eI��bh`��36}`R4Lr�*ܐ]���S����e~�S��%���<��pw��:o��-z��Yn��k7�
�D0o����ˎ�V��k�4I_~0���Q�$yՒ�#Ոu�������t�jh�L���������7Ӈΐ�q�lD���g-����[��/��O���GM�?PN����;���)�O j_�I���kܯϏ����oo,ר�Q{��HH"sZH`�����K����"iG[�X�S��)����;N�4t,1�v#��8hrE��E�P�Sy���!0K�!:E�ʛ"�h����!��1���zхr<b��E��B�W�3񵟚�EO��``�w��@kҁif�b�2�{���M
�Fe��V���·DO�Zې��j��Q\9s��P�j6�A2�)���ix�&f<���V�q�H!�P��x�@iݓ&fVT�զ#T�jY�����&�� 7��M�T�L,�����C�~���2��nb�į'\\�ܒ���͒�f|��[��Y�{����nE`i𤷍�¿���Z���f�/���O���j��vᛊ�c�0E�:�;7��9��+S�/*����2���G��%�}�Y�Ĭ9lG#*ge�H�ݰA4�MI � 3��9m
�M�9Ϭ�E�25���[y���g�3\�d^���J��w���oǔ/��H+�rt~��ɷi�;`�L�Ӧj�ĺ)�:p�#Z�r4r�s��f��T��Q��t����u����-?�;�H��t��t�Rk`z3�Ǚ^^�${XH&�}|K^w�zH�����E�a�+a��� 6b�y������S��傍����{��@�z�pq~*��v�s��vh��lNa��(\ݖO�|ߺ�[�����P��J���ز:���Wi���xFwsۻ�Z8�Eeu��.��O ��z�z��ª_j�-w;��՘L�[IL2	(?j#��<�\� 殒���C��.Kƈ����B��5h�%��I\������\8 3
Q��Z�)Ȗ�.|*̩رn4����e!��.����a)��v��N3&�F:dt��!�l�����95�bEl��6�֨q#qR퓧��*��\W2�`C6��N�+�%{�鿃@��y��T�N�8���'�Y���ް�B�@��C�B���r���Y�_�"���b���7�opS�������_���|_���۲&��(���L� X�:l�m~~yvyyzvv�f�C�%�ȶWZ �ދ9��n�$��I�����Rp��w>;�d�%n�^i��z�=����ƅ@SB�P*�Bi��]v�2��[8d�F$�=e����h�6 ��~*P��g�0����x� �������(���K:U*�X�ؠ�v�C�ð��`�N�3X�w �*G Ȩ�j -n�4�w�Ӹ6^�US����z�/����9�u�DRLA��/�s�g-L,JB�BC�8�Mlq�{X�s�[1JGtq��W�Eq�>�!��$.���f�B{�i��I�Rd/Z��\vG1����d��#�����{?��H�����cҏM���xU�d����3.��8V�c�J�١�a3��x��:���Κn��?��{��Qyr�ظ�3t��n�w��e&���,ޙ ���ER�W-�Y��r}zvuruz �u�p��=>-�,�<'�A��xv)��`���Fha�|�ɵ�ٺ^.�����tKڊE�� w��ZN�e�|��{���l�so}�]���`���]y ��pi����oh'Lc�P'koT�8����|���/���v�A 4�F��?-u0�f��`vW�4�y,��6�;�)eqG��������y`��I%�e�J)�)�+���;�)�Kku�ŧK�t�s_�.cS�OP�+�lF��������;DS��jK�����\����j��:z����'G'�/o�.��M���m" �  �2�k��5,��#�����yb�����`��ۈ��>���A������N.��:��;�ߑ9�6�U�T;I� ����	T��n���nLȅO4}:#wW���|ι��Cq��^�?��B/�պS�t.���|�u��/�?׳pz�Wq�`é�+*�r�|m���ڽ�Q�]��z(��|R�W/5� �Tr|u~q}zy|~�f�j�pp��a0��+�Pl���ąl�j���֬�xV�8Fk]@!�����?�8�o���y6�$U ���J�Z�� ^��Č��t8�x�g����%oSY�plDYA�B��8w��e�l?�3��9�OQ��O��(�珜IxX�$k�V�os��J�)W���	P�*e
+o�J�?��
@%.��)��ͫ~U��?P�6���5��[��xU��X�P*.Z����ZiϓA�^m*ů`� j��0	Vd�2)��Ǚ���r�R�*C��l�t���4��Z���&��<Hk3^�5i�5�B�2[�/�Ͽ�_}�[�#���֌[w��z� ��f�8���~K��E҆�?���S�]L�Yv�m�"2��@W�ȏ{'&I���#Dr+��a���Wb����NwaY�Ia����R��eJA �À�����T�]> ^�8���\�k�|>	����T�LT-J^��vBK��_�����v��en���CJ]��Ӕ��'�lr1��Z�����)� ��ߛV��M� V����d�C��6�Iה5p"6<l��I�@3İ��HJ�vvx���*>A����j��W�-�V/�ݠ�L��y�9LMP���v���a�ǌ 6Z���ȁ��P��B�y��PR�%
�*.�}NJ��䯨e0���a�cf]9y��jk�%�5$�L�v<�A�����6Q�(2���x����s��^�Tp#��r��E�n;	�׹�F�z��ph�dG�>4���/���{���1���κ����|.gq.��	��2��~���1��Na׿�cZ�w���rqN0���j>����,�� �"�&&�� �ؾ����\�]���oU�sbX�Uł��h����Gp�	m��mAi���b��X*�����T��]\+�x\��bE�墨mU��U����<þ�x�XJ3IP��b����0�@}�rkN�h�Ϋ�7iᭃ���a%�\X:�U�[Moj`�|A����Erc��>}2�Q�Ks��!�L�MC�=O�.o�G�펊�ȶ�]��n*����S/-�FP ��H��=����r����[IA�^\�[EK�r��:�1R
B� �6���k�U��*oJ^?���	�5�	���#>�����\��O#��HL�Z)����(;��r����|T��̾J��e�:�����ՏM�ej?J���L#�:�o�w��eyi=��Yһ �x6a��.3}����\�.{o��=���~���D��     