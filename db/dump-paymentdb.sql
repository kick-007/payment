PGDMP                     
    x         	   paymentdb    13.0    13.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16395 	   paymentdb    DATABASE     m   CREATE DATABASE paymentdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE paymentdb;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    16404    account    TABLE     |   CREATE TABLE public.account (
    id bigint NOT NULL,
    acc_no character varying,
    amount bigint,
    bic_id bigint
);
    DROP TABLE public.account;
       public         heap    postgres    false    3            �            1259    16396    bic    TABLE     P   CREATE TABLE public.bic (
    id bigint NOT NULL,
    code character varying
);
    DROP TABLE public.bic;
       public         heap    postgres    false    3            �            1259    24587    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public          postgres    false    3            �            1259    16417    transaction    TABLE     �   CREATE TABLE public.transaction (
    id bigint NOT NULL,
    amount bigint,
    currency_type character varying,
    date_time character(50),
    from_acc bigint,
    to_acc bigint,
    status character varying(50)
);
    DROP TABLE public.transaction;
       public         heap    postgres    false    3            �          0    16404    account 
   TABLE DATA           =   COPY public.account (id, acc_no, amount, bic_id) FROM stdin;
    public          postgres    false    201            �          0    16396    bic 
   TABLE DATA           '   COPY public.bic (id, code) FROM stdin;
    public          postgres    false    200            �          0    16417    transaction 
   TABLE DATA           e   COPY public.transaction (id, amount, currency_type, date_time, from_acc, to_acc, status) FROM stdin;
    public          postgres    false    202            �           0    0    hibernate_sequence    SEQUENCE SET     @   SELECT pg_catalog.setval('public.hibernate_sequence', 5, true);
          public          postgres    false    203            0           2606    16411    account account_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pk;
       public            postgres    false    201            .           2606    16403 
   bic bic_pk 
   CONSTRAINT     H   ALTER TABLE ONLY public.bic
    ADD CONSTRAINT bic_pk PRIMARY KEY (id);
 4   ALTER TABLE ONLY public.bic DROP CONSTRAINT bic_pk;
       public            postgres    false    200            2           2606    16424    transaction transaction_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_pk;
       public            postgres    false    202            3           2606    16470 "   account fkvqcp8gycpcdq64spytde07s4    FK CONSTRAINT     ~   ALTER TABLE ONLY public.account
    ADD CONSTRAINT fkvqcp8gycpcdq64spytde07s4 FOREIGN KEY (bic_id) REFERENCES public.bic(id);
 L   ALTER TABLE ONLY public.account DROP CONSTRAINT fkvqcp8gycpcdq64spytde07s4;
       public          postgres    false    200    201    2862            4           2606    16425    transaction transaction_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_fk FOREIGN KEY (from_acc) REFERENCES public.account(id);
 D   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_fk;
       public          postgres    false    201    202    2864            5           2606    16430    transaction transaction_fk_1    FK CONSTRAINT     |   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_fk_1 FOREIGN KEY (to_acc) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_fk_1;
       public          postgres    false    2864    201    202            �   %   x�3�tt600�4�42�4�2s�8�,@�=... h�{      �      x�3䌈������� ��      �   Q   x�3�42�*-HM-�tt�����@������e�i7l�4C+c"��4B5��4$���eZ� �&*          �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16395 	   paymentdb    DATABASE     m   CREATE DATABASE paymentdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE paymentdb;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    16404    account    TABLE     |   CREATE TABLE public.account (
    id bigint NOT NULL,
    acc_no character varying,
    amount bigint,
    bic_id bigint
);
    DROP TABLE public.account;
       public         heap    postgres    false    3            �            1259    16396    bic    TABLE     P   CREATE TABLE public.bic (
    id bigint NOT NULL,
    code character varying
);
    DROP TABLE public.bic;
       public         heap    postgres    false    3            �            1259    24587    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public          postgres    false    3            �            1259    16417    transaction    TABLE     �   CREATE TABLE public.transaction (
    id bigint NOT NULL,
    amount bigint,
    currency_type character varying,
    date_time character(50),
    from_acc bigint,
    to_acc bigint,
    status character varying(50)
);
    DROP TABLE public.transaction;
       public         heap    postgres    false    3            �          0    16404    account 
   TABLE DATA           =   COPY public.account (id, acc_no, amount, bic_id) FROM stdin;
    public          postgres    false    201   �       �          0    16396    bic 
   TABLE DATA           '   COPY public.bic (id, code) FROM stdin;
    public          postgres    false    200   /        �          0    16417    transaction 
   TABLE DATA           e   COPY public.transaction (id, amount, currency_type, date_time, from_acc, to_acc, status) FROM stdin;
    public          postgres    false    202           �           0    0    hibernate_sequence    SEQUENCE SET     @   SELECT pg_catalog.setval('public.hibernate_sequence', 5, true);
          public          postgres    false    203            0           2606    16411    account account_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pk;
       public            postgres    false    201            .           2606    16403 
   bic bic_pk 
   CONSTRAINT     H   ALTER TABLE ONLY public.bic
    ADD CONSTRAINT bic_pk PRIMARY KEY (id);
 4   ALTER TABLE ONLY public.bic DROP CONSTRAINT bic_pk;
       public            postgres    false    200            2           2606    16424    transaction transaction_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_pk;
       public            postgres    false    202            3           2606    16470 "   account fkvqcp8gycpcdq64spytde07s4    FK CONSTRAINT     ~   ALTER TABLE ONLY public.account
    ADD CONSTRAINT fkvqcp8gycpcdq64spytde07s4 FOREIGN KEY (bic_id) REFERENCES public.bic(id);
 L   ALTER TABLE ONLY public.account DROP CONSTRAINT fkvqcp8gycpcdq64spytde07s4;
       public          postgres    false    200    201    2862            4           2606    16425    transaction transaction_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_fk FOREIGN KEY (from_acc) REFERENCES public.account(id);
 D   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_fk;
       public          postgres    false    201    202    2864            5           2606    16430    transaction transaction_fk_1    FK CONSTRAINT     |   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_fk_1 FOREIGN KEY (to_acc) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_fk_1;
       public          postgres    false    2864    201    202           