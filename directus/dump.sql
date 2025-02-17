toc.dat                                                                                             0000600 0004000 0002000 00000301062 14313655427 0014453 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       !                    z           directus    13.2    13.2    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16761    directus    DATABASE     l   CREATE DATABASE directus WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE directus;
                postgres    false         �            1259    17401    arrays    TABLE     G   CREATE TABLE public.arrays (
    id integer NOT NULL,
    text text
);
    DROP TABLE public.arrays;
       public         heap    postgres    false         �            1259    17399    arrays_id_seq    SEQUENCE     �   CREATE SEQUENCE public.arrays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.arrays_id_seq;
       public          postgres    false    237         �           0    0    arrays_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.arrays_id_seq OWNED BY public.arrays.id;
          public          postgres    false    236         �            1259    17589    arrays_nestedArray    TABLE     �   CREATE TABLE public."arrays_nestedArray" (
    id integer NOT NULL,
    arrays_id integer,
    item character varying(255),
    collection character varying(255)
);
 (   DROP TABLE public."arrays_nestedArray";
       public         heap    postgres    false         �            1259    17587    arrays_nestedArray_id_seq    SEQUENCE     �   CREATE SEQUENCE public."arrays_nestedArray_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."arrays_nestedArray_id_seq";
       public          postgres    false    255         �           0    0    arrays_nestedArray_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."arrays_nestedArray_id_seq" OWNED BY public."arrays_nestedArray".id;
          public          postgres    false    254                    1259    17735    arrays_nested_arrays    TABLE     {   CREATE TABLE public.arrays_nested_arrays (
    id integer NOT NULL,
    arrays_id integer,
    nested_arrays_id integer
);
 (   DROP TABLE public.arrays_nested_arrays;
       public         heap    postgres    false                    1259    17733    arrays_nested_arrays_id_seq    SEQUENCE     �   CREATE SEQUENCE public.arrays_nested_arrays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.arrays_nested_arrays_id_seq;
       public          postgres    false    263         �           0    0    arrays_nested_arrays_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.arrays_nested_arrays_id_seq OWNED BY public.arrays_nested_arrays.id;
          public          postgres    false    262         �            1259    16830    directus_activity    TABLE     �  CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);
 %   DROP TABLE public.directus_activity;
       public         heap    postgres    false         �            1259    16828    directus_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_activity_id_seq;
       public          postgres    false    206         �           0    0    directus_activity_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;
          public          postgres    false    205         �            1259    16762    directus_collections    TABLE       CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL
);
 (   DROP TABLE public.directus_collections;
       public         heap    postgres    false         �            1259    17162    directus_dashboards    TABLE     I  CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);
 '   DROP TABLE public.directus_dashboards;
       public         heap    postgres    false         �            1259    16805    directus_fields    TABLE     �  CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);
 #   DROP TABLE public.directus_fields;
       public         heap    postgres    false         �            1259    16803    directus_fields_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.directus_fields_id_seq;
       public          postgres    false    204         �           0    0    directus_fields_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;
          public          postgres    false    203         �            1259    16855    directus_files    TABLE     �  CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);
 "   DROP TABLE public.directus_files;
       public         heap    postgres    false         �            1259    17282    directus_flows    TABLE       CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
 "   DROP TABLE public.directus_flows;
       public         heap    postgres    false         �            1259    16845    directus_folders    TABLE     z   CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);
 $   DROP TABLE public.directus_folders;
       public         heap    postgres    false         �            1259    17033    directus_migrations    TABLE     �   CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 '   DROP TABLE public.directus_migrations;
       public         heap    postgres    false         �            1259    17226    directus_notifications    TABLE     �  CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);
 *   DROP TABLE public.directus_notifications;
       public         heap    postgres    false         �            1259    17224    directus_notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.directus_notifications_id_seq;
       public          postgres    false    226         �           0    0    directus_notifications_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;
          public          postgres    false    225         �            1259    17300    directus_operations    TABLE     �  CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
 '   DROP TABLE public.directus_operations;
       public         heap    postgres    false         �            1259    17177    directus_panels    TABLE     /  CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
 #   DROP TABLE public.directus_panels;
       public         heap    postgres    false         �            1259    16883    directus_permissions    TABLE     �   CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);
 (   DROP TABLE public.directus_permissions;
       public         heap    postgres    false         �            1259    16881    directus_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.directus_permissions_id_seq;
       public          postgres    false    210         �           0    0    directus_permissions_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;
          public          postgres    false    209         �            1259    16904    directus_presets    TABLE     �  CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark_outline'::character varying NOT NULL,
    color character varying(255)
);
 $   DROP TABLE public.directus_presets;
       public         heap    postgres    false         �            1259    16902    directus_presets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.directus_presets_id_seq;
       public          postgres    false    212         �           0    0    directus_presets_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;
          public          postgres    false    211         �            1259    16931    directus_relations    TABLE     �  CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);
 &   DROP TABLE public.directus_relations;
       public         heap    postgres    false         �            1259    16929    directus_relations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directus_relations_id_seq;
       public          postgres    false    214         �           0    0    directus_relations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;
          public          postgres    false    213         �            1259    16952    directus_revisions    TABLE     �   CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);
 &   DROP TABLE public.directus_revisions;
       public         heap    postgres    false         �            1259    16950    directus_revisions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directus_revisions_id_seq;
       public          postgres    false    216         �           0    0    directus_revisions_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;
          public          postgres    false    215         �            1259    16773    directus_roles    TABLE     }  CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);
 "   DROP TABLE public.directus_roles;
       public         heap    postgres    false         �            1259    16976    directus_sessions    TABLE       CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);
 %   DROP TABLE public.directus_sessions;
       public         heap    postgres    false         �            1259    16991    directus_settings    TABLE     �  CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(50) DEFAULT NULL::character varying,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    translation_strings json,
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json
);
 %   DROP TABLE public.directus_settings;
       public         heap    postgres    false         �            1259    16989    directus_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_settings_id_seq;
       public          postgres    false    219         �           0    0    directus_settings_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;
          public          postgres    false    218         �            1259    17247    directus_shares    TABLE     �  CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64),
    item character varying(255),
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);
 #   DROP TABLE public.directus_shares;
       public         heap    postgres    false         �            1259    16785    directus_users    TABLE     �  CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true
);
 "   DROP TABLE public.directus_users;
       public         heap    postgres    false         �            1259    17021    directus_webhooks    TABLE     �  CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);
 %   DROP TABLE public.directus_webhooks;
       public         heap    postgres    false         �            1259    17019    directus_webhooks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_webhooks_id_seq;
       public          postgres    false    221         �           0    0    directus_webhooks_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;
          public          postgres    false    220         �            1259    17335 	   documents    TABLE     �   CREATE TABLE public.documents (
    id uuid NOT NULL,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    title character varying(255),
    "group" integer
);
    DROP TABLE public.documents;
       public         heap    postgres    false                    1259    17711    documents_arrays    TABLE     p   CREATE TABLE public.documents_arrays (
    id integer NOT NULL,
    documents_id uuid,
    arrays_id integer
);
 $   DROP TABLE public.documents_arrays;
       public         heap    postgres    false                    1259    17709    documents_arrays_id_seq    SEQUENCE     �   CREATE SEQUENCE public.documents_arrays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.documents_arrays_id_seq;
       public          postgres    false    261         �           0    0    documents_arrays_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.documents_arrays_id_seq OWNED BY public.documents_arrays.id;
          public          postgres    false    260                    1259    17620    documents_blocks    TABLE     �   CREATE TABLE public.documents_blocks (
    id integer NOT NULL,
    documents_id uuid,
    item character varying(255),
    collection character varying(255)
);
 $   DROP TABLE public.documents_blocks;
       public         heap    postgres    false                     1259    17618    documents_blocks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.documents_blocks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.documents_blocks_id_seq;
       public          postgres    false    257         �           0    0    documents_blocks_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.documents_blocks_id_seq OWNED BY public.documents_blocks.id;
          public          postgres    false    256         �            1259    17524    documents_hasManyRelations    TABLE     �   CREATE TABLE public."documents_hasManyRelations" (
    id integer NOT NULL,
    documents_id uuid,
    item character varying(255),
    collection character varying(255)
);
 0   DROP TABLE public."documents_hasManyRelations";
       public         heap    postgres    false         �            1259    17522 !   documents_hasManyRelations_id_seq    SEQUENCE     �   CREATE SEQUENCE public."documents_hasManyRelations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."documents_hasManyRelations_id_seq";
       public          postgres    false    247         �           0    0 !   documents_hasManyRelations_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."documents_hasManyRelations_id_seq" OWNED BY public."documents_hasManyRelations".id;
          public          postgres    false    246         �            1259    17545    documents_relationToMany    TABLE     �   CREATE TABLE public."documents_relationToMany" (
    id integer NOT NULL,
    documents_id uuid,
    item character varying(255),
    collection character varying(255)
);
 .   DROP TABLE public."documents_relationToMany";
       public         heap    postgres    false         �            1259    17543    documents_relationToMany_id_seq    SEQUENCE     �   CREATE SEQUENCE public."documents_relationToMany_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."documents_relationToMany_id_seq";
       public          postgres    false    249         �           0    0    documents_relationToMany_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."documents_relationToMany_id_seq" OWNED BY public."documents_relationToMany".id;
          public          postgres    false    248         �            1259    17561    documents_relationToOne    TABLE     �   CREATE TABLE public."documents_relationToOne" (
    id integer NOT NULL,
    documents_id uuid,
    item character varying(255),
    collection character varying(255)
);
 -   DROP TABLE public."documents_relationToOne";
       public         heap    postgres    false         �            1259    17559    documents_relationToOne_id_seq    SEQUENCE     �   CREATE SEQUENCE public."documents_relationToOne_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."documents_relationToOne_id_seq";
       public          postgres    false    251         �           0    0    documents_relationToOne_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."documents_relationToOne_id_seq" OWNED BY public."documents_relationToOne".id;
          public          postgres    false    250                    1259    17636    documents_relationshipA    TABLE        CREATE TABLE public."documents_relationshipA" (
    id integer NOT NULL,
    documents_id uuid,
    "relationshipA_id" uuid
);
 -   DROP TABLE public."documents_relationshipA";
       public         heap    postgres    false                    1259    17634    documents_relationshipA_id_seq    SEQUENCE     �   CREATE SEQUENCE public."documents_relationshipA_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."documents_relationshipA_id_seq";
       public          postgres    false    259         �           0    0    documents_relationshipA_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."documents_relationshipA_id_seq" OWNED BY public."documents_relationshipA".id;
          public          postgres    false    258         �            1259    17498    groups    TABLE     c   CREATE TABLE public.groups (
    id integer NOT NULL,
    "nestedGroups" integer,
    text text
);
    DROP TABLE public.groups;
       public         heap    postgres    false         �            1259    17496    groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public          postgres    false    245         �           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
          public          postgres    false    244         �            1259    17465    hasManyRelations    TABLE     S   CREATE TABLE public."hasManyRelations" (
    id integer NOT NULL,
    text text
);
 &   DROP TABLE public."hasManyRelations";
       public         heap    postgres    false         �            1259    17463    hasManyRelations_id_seq    SEQUENCE     �   CREATE SEQUENCE public."hasManyRelations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."hasManyRelations_id_seq";
       public          postgres    false    241         �           0    0    hasManyRelations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."hasManyRelations_id_seq" OWNED BY public."hasManyRelations".id;
          public          postgres    false    240         �            1259    17476    hasManyRelations_relationToMany    TABLE     �   CREATE TABLE public."hasManyRelations_relationToMany" (
    id integer NOT NULL,
    "hasManyRelations_id" integer,
    item character varying(255),
    collection character varying(255)
);
 5   DROP TABLE public."hasManyRelations_relationToMany";
       public         heap    postgres    false         �            1259    17474 &   hasManyRelations_relationToMany_id_seq    SEQUENCE     �   CREATE SEQUENCE public."hasManyRelations_relationToMany_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public."hasManyRelations_relationToMany_id_seq";
       public          postgres    false    243         �           0    0 &   hasManyRelations_relationToMany_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."hasManyRelations_relationToMany_id_seq" OWNED BY public."hasManyRelations_relationToMany".id;
          public          postgres    false    242         �            1259    17366    nestedGroups    TABLE     X   CREATE TABLE public."nestedGroups" (
    id integer NOT NULL,
    text text NOT NULL
);
 "   DROP TABLE public."nestedGroups";
       public         heap    postgres    false         �            1259    17364    nestedGroups_id_seq    SEQUENCE     �   CREATE SEQUENCE public."nestedGroups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."nestedGroups_id_seq";
       public          postgres    false    233         �           0    0    nestedGroups_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."nestedGroups_id_seq" OWNED BY public."nestedGroups".id;
          public          postgres    false    232         �            1259    17385    nested_arrays    TABLE     a   CREATE TABLE public.nested_arrays (
    id integer NOT NULL,
    text text,
    relation uuid
);
 !   DROP TABLE public.nested_arrays;
       public         heap    postgres    false         �            1259    17383    nested_arrays_id_seq    SEQUENCE     �   CREATE SEQUENCE public.nested_arrays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.nested_arrays_id_seq;
       public          postgres    false    235         �           0    0    nested_arrays_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.nested_arrays_id_seq OWNED BY public.nested_arrays.id;
          public          postgres    false    234         �            1259    17449    relationToOne    TABLE     c   CREATE TABLE public."relationToOne" (
    id integer NOT NULL,
    text text,
    relation uuid
);
 #   DROP TABLE public."relationToOne";
       public         heap    postgres    false         �            1259    17447    relationToOne_id_seq    SEQUENCE     �   CREATE SEQUENCE public."relationToOne_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."relationToOne_id_seq";
       public          postgres    false    239         �           0    0    relationToOne_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."relationToOne_id_seq" OWNED BY public."relationToOne".id;
          public          postgres    false    238         �            1259    17343    relationshipA    TABLE     �   CREATE TABLE public."relationshipA" (
    id uuid NOT NULL,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    title text,
    relation integer
);
 #   DROP TABLE public."relationshipA";
       public         heap    postgres    false         �            1259    17577    relationshipB    TABLE     �   CREATE TABLE public."relationshipB" (
    id integer NOT NULL,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    text text
);
 #   DROP TABLE public."relationshipB";
       public         heap    postgres    false         �            1259    17575    relationshipB_id_seq    SEQUENCE     �   CREATE SEQUENCE public."relationshipB_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."relationshipB_id_seq";
       public          postgres    false    253         �           0    0    relationshipB_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."relationshipB_id_seq" OWNED BY public."relationshipB".id;
          public          postgres    false    252         F           2604    17404 	   arrays id    DEFAULT     f   ALTER TABLE ONLY public.arrays ALTER COLUMN id SET DEFAULT nextval('public.arrays_id_seq'::regclass);
 8   ALTER TABLE public.arrays ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237         O           2604    17592    arrays_nestedArray id    DEFAULT     �   ALTER TABLE ONLY public."arrays_nestedArray" ALTER COLUMN id SET DEFAULT nextval('public."arrays_nestedArray_id_seq"'::regclass);
 F   ALTER TABLE public."arrays_nestedArray" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254    255         S           2604    17738    arrays_nested_arrays id    DEFAULT     �   ALTER TABLE ONLY public.arrays_nested_arrays ALTER COLUMN id SET DEFAULT nextval('public.arrays_nested_arrays_id_seq'::regclass);
 F   ALTER TABLE public.arrays_nested_arrays ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    262    263                     2604    16833    directus_activity id    DEFAULT     |   ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);
 C   ALTER TABLE public.directus_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205    206                    2604    16808    directus_fields id    DEFAULT     x   ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);
 A   ALTER TABLE public.directus_fields ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203    204         ;           2604    17229    directus_notifications id    DEFAULT     �   ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);
 H   ALTER TABLE public.directus_notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226         $           2604    16886    directus_permissions id    DEFAULT     �   ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);
 F   ALTER TABLE public.directus_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210         %           2604    16907    directus_presets id    DEFAULT     z   ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);
 B   ALTER TABLE public.directus_presets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212         (           2604    16934    directus_relations id    DEFAULT     ~   ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);
 D   ALTER TABLE public.directus_relations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214         *           2604    16955    directus_revisions id    DEFAULT     ~   ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);
 D   ALTER TABLE public.directus_revisions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216         +           2604    16994    directus_settings id    DEFAULT     |   ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);
 C   ALTER TABLE public.directus_settings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219         1           2604    17024    directus_webhooks id    DEFAULT     |   ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);
 C   ALTER TABLE public.directus_webhooks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221         R           2604    17714    documents_arrays id    DEFAULT     z   ALTER TABLE ONLY public.documents_arrays ALTER COLUMN id SET DEFAULT nextval('public.documents_arrays_id_seq'::regclass);
 B   ALTER TABLE public.documents_arrays ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260    261         P           2604    17623    documents_blocks id    DEFAULT     z   ALTER TABLE ONLY public.documents_blocks ALTER COLUMN id SET DEFAULT nextval('public.documents_blocks_id_seq'::regclass);
 B   ALTER TABLE public.documents_blocks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    256    257         K           2604    17527    documents_hasManyRelations id    DEFAULT     �   ALTER TABLE ONLY public."documents_hasManyRelations" ALTER COLUMN id SET DEFAULT nextval('public."documents_hasManyRelations_id_seq"'::regclass);
 N   ALTER TABLE public."documents_hasManyRelations" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246    247         L           2604    17548    documents_relationToMany id    DEFAULT     �   ALTER TABLE ONLY public."documents_relationToMany" ALTER COLUMN id SET DEFAULT nextval('public."documents_relationToMany_id_seq"'::regclass);
 L   ALTER TABLE public."documents_relationToMany" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248    249         M           2604    17564    documents_relationToOne id    DEFAULT     �   ALTER TABLE ONLY public."documents_relationToOne" ALTER COLUMN id SET DEFAULT nextval('public."documents_relationToOne_id_seq"'::regclass);
 K   ALTER TABLE public."documents_relationToOne" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250    251         Q           2604    17639    documents_relationshipA id    DEFAULT     �   ALTER TABLE ONLY public."documents_relationshipA" ALTER COLUMN id SET DEFAULT nextval('public."documents_relationshipA_id_seq"'::regclass);
 K   ALTER TABLE public."documents_relationshipA" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    259    259         J           2604    17501 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245         H           2604    17468    hasManyRelations id    DEFAULT     ~   ALTER TABLE ONLY public."hasManyRelations" ALTER COLUMN id SET DEFAULT nextval('public."hasManyRelations_id_seq"'::regclass);
 D   ALTER TABLE public."hasManyRelations" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241         I           2604    17479 "   hasManyRelations_relationToMany id    DEFAULT     �   ALTER TABLE ONLY public."hasManyRelations_relationToMany" ALTER COLUMN id SET DEFAULT nextval('public."hasManyRelations_relationToMany_id_seq"'::regclass);
 S   ALTER TABLE public."hasManyRelations_relationToMany" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243         D           2604    17369    nestedGroups id    DEFAULT     v   ALTER TABLE ONLY public."nestedGroups" ALTER COLUMN id SET DEFAULT nextval('public."nestedGroups_id_seq"'::regclass);
 @   ALTER TABLE public."nestedGroups" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233         E           2604    17388    nested_arrays id    DEFAULT     t   ALTER TABLE ONLY public.nested_arrays ALTER COLUMN id SET DEFAULT nextval('public.nested_arrays_id_seq'::regclass);
 ?   ALTER TABLE public.nested_arrays ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234    235         G           2604    17452    relationToOne id    DEFAULT     x   ALTER TABLE ONLY public."relationToOne" ALTER COLUMN id SET DEFAULT nextval('public."relationToOne_id_seq"'::regclass);
 A   ALTER TABLE public."relationToOne" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239         N           2604    17580    relationshipB id    DEFAULT     x   ALTER TABLE ONLY public."relationshipB" ALTER COLUMN id SET DEFAULT nextval('public."relationshipB_id_seq"'::regclass);
 A   ALTER TABLE public."relationshipB" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    252    253         �          0    17401    arrays 
   TABLE DATA           *   COPY public.arrays (id, text) FROM stdin;
    public          postgres    false    237       3460.dat �          0    17589    arrays_nestedArray 
   TABLE DATA           O   COPY public."arrays_nestedArray" (id, arrays_id, item, collection) FROM stdin;
    public          postgres    false    255       3478.dat �          0    17735    arrays_nested_arrays 
   TABLE DATA           O   COPY public.arrays_nested_arrays (id, arrays_id, nested_arrays_id) FROM stdin;
    public          postgres    false    263       3486.dat e          0    16830    directus_activity 
   TABLE DATA              COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
    public          postgres    false    206       3429.dat _          0    16762    directus_collections 
   TABLE DATA             COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse) FROM stdin;
    public          postgres    false    200       3423.dat v          0    17162    directus_dashboards 
   TABLE DATA           f   COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
    public          postgres    false    223       3446.dat c          0    16805    directus_fields 
   TABLE DATA           �   COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
    public          postgres    false    204       3427.dat g          0    16855    directus_files 
   TABLE DATA           �   COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
    public          postgres    false    208       3431.dat {          0    17282    directus_flows 
   TABLE DATA           �   COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
    public          postgres    false    228       3451.dat f          0    16845    directus_folders 
   TABLE DATA           <   COPY public.directus_folders (id, name, parent) FROM stdin;
    public          postgres    false    207       3430.dat u          0    17033    directus_migrations 
   TABLE DATA           I   COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
    public          postgres    false    222       3445.dat y          0    17226    directus_notifications 
   TABLE DATA           �   COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
    public          postgres    false    226       3449.dat |          0    17300    directus_operations 
   TABLE DATA           �   COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
    public          postgres    false    229       3452.dat w          0    17177    directus_panels 
   TABLE DATA           �   COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
    public          postgres    false    224       3447.dat i          0    16883    directus_permissions 
   TABLE DATA           v   COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
    public          postgres    false    210       3433.dat k          0    16904    directus_presets 
   TABLE DATA           �   COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
    public          postgres    false    212       3435.dat m          0    16931    directus_relations 
   TABLE DATA           �   COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
    public          postgres    false    214       3437.dat o          0    16952    directus_revisions 
   TABLE DATA           a   COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM stdin;
    public          postgres    false    216       3439.dat `          0    16773    directus_roles 
   TABLE DATA           w   COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
    public          postgres    false    201       3424.dat p          0    16976    directus_sessions 
   TABLE DATA           b   COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) FROM stdin;
    public          postgres    false    217       3440.dat r          0    16991    directus_settings 
   TABLE DATA           �  COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, translation_strings, default_language, custom_aspect_ratios) FROM stdin;
    public          postgres    false    219       3442.dat z          0    17247    directus_shares 
   TABLE DATA           �   COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
    public          postgres    false    227       3450.dat a          0    16785    directus_users 
   TABLE DATA           	  COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications) FROM stdin;
    public          postgres    false    202       3425.dat t          0    17021    directus_webhooks 
   TABLE DATA           o   COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
    public          postgres    false    221       3444.dat }          0    17335 	   documents 
   TABLE DATA           S   COPY public.documents (id, date_created, date_updated, title, "group") FROM stdin;
    public          postgres    false    230       3453.dat �          0    17711    documents_arrays 
   TABLE DATA           G   COPY public.documents_arrays (id, documents_id, arrays_id) FROM stdin;
    public          postgres    false    261       3484.dat �          0    17620    documents_blocks 
   TABLE DATA           N   COPY public.documents_blocks (id, documents_id, item, collection) FROM stdin;
    public          postgres    false    257       3480.dat �          0    17524    documents_hasManyRelations 
   TABLE DATA           Z   COPY public."documents_hasManyRelations" (id, documents_id, item, collection) FROM stdin;
    public          postgres    false    247       3470.dat �          0    17545    documents_relationToMany 
   TABLE DATA           X   COPY public."documents_relationToMany" (id, documents_id, item, collection) FROM stdin;
    public          postgres    false    249       3472.dat �          0    17561    documents_relationToOne 
   TABLE DATA           W   COPY public."documents_relationToOne" (id, documents_id, item, collection) FROM stdin;
    public          postgres    false    251       3474.dat �          0    17636    documents_relationshipA 
   TABLE DATA           Y   COPY public."documents_relationshipA" (id, documents_id, "relationshipA_id") FROM stdin;
    public          postgres    false    259       3482.dat �          0    17498    groups 
   TABLE DATA           :   COPY public.groups (id, "nestedGroups", text) FROM stdin;
    public          postgres    false    245       3468.dat �          0    17465    hasManyRelations 
   TABLE DATA           6   COPY public."hasManyRelations" (id, text) FROM stdin;
    public          postgres    false    241       3464.dat �          0    17476    hasManyRelations_relationToMany 
   TABLE DATA           h   COPY public."hasManyRelations_relationToMany" (id, "hasManyRelations_id", item, collection) FROM stdin;
    public          postgres    false    243       3466.dat �          0    17366    nestedGroups 
   TABLE DATA           2   COPY public."nestedGroups" (id, text) FROM stdin;
    public          postgres    false    233       3456.dat �          0    17385    nested_arrays 
   TABLE DATA           ;   COPY public.nested_arrays (id, text, relation) FROM stdin;
    public          postgres    false    235       3458.dat �          0    17449    relationToOne 
   TABLE DATA           =   COPY public."relationToOne" (id, text, relation) FROM stdin;
    public          postgres    false    239       3462.dat ~          0    17343    relationshipA 
   TABLE DATA           Z   COPY public."relationshipA" (id, date_created, date_updated, title, relation) FROM stdin;
    public          postgres    false    231       3454.dat �          0    17577    relationshipB 
   TABLE DATA           O   COPY public."relationshipB" (id, date_created, date_updated, text) FROM stdin;
    public          postgres    false    253       3476.dat �           0    0    arrays_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.arrays_id_seq', 2763, true);
          public          postgres    false    236         �           0    0    arrays_nestedArray_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."arrays_nestedArray_id_seq"', 1, false);
          public          postgres    false    254         �           0    0    arrays_nested_arrays_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.arrays_nested_arrays_id_seq', 1302, true);
          public          postgres    false    262         �           0    0    directus_activity_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.directus_activity_id_seq', 23011, true);
          public          postgres    false    205         �           0    0    directus_fields_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.directus_fields_id_seq', 99, true);
          public          postgres    false    203         �           0    0    directus_notifications_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);
          public          postgres    false    225         �           0    0    directus_permissions_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.directus_permissions_id_seq', 65, true);
          public          postgres    false    209         �           0    0    directus_presets_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.directus_presets_id_seq', 18, true);
          public          postgres    false    211         �           0    0    directus_relations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.directus_relations_id_seq', 31, true);
          public          postgres    false    213         �           0    0    directus_revisions_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.directus_revisions_id_seq', 14614, true);
          public          postgres    false    215         �           0    0    directus_settings_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);
          public          postgres    false    218         �           0    0    directus_webhooks_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);
          public          postgres    false    220         �           0    0    documents_arrays_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.documents_arrays_id_seq', 130, true);
          public          postgres    false    260         �           0    0    documents_blocks_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.documents_blocks_id_seq', 542, true);
          public          postgres    false    256         �           0    0 !   documents_hasManyRelations_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."documents_hasManyRelations_id_seq"', 32, true);
          public          postgres    false    246         �           0    0    documents_relationToMany_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."documents_relationToMany_id_seq"', 1, false);
          public          postgres    false    248         �           0    0    documents_relationToOne_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."documents_relationToOne_id_seq"', 1, true);
          public          postgres    false    250         �           0    0    documents_relationshipA_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."documents_relationshipA_id_seq"', 461, true);
          public          postgres    false    258         �           0    0    groups_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.groups_id_seq', 43, true);
          public          postgres    false    244         �           0    0    hasManyRelations_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."hasManyRelations_id_seq"', 561, true);
          public          postgres    false    240         �           0    0 &   hasManyRelations_relationToMany_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public."hasManyRelations_relationToMany_id_seq"', 401, true);
          public          postgres    false    242         �           0    0    nestedGroups_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."nestedGroups_id_seq"', 43, true);
          public          postgres    false    232         �           0    0    nested_arrays_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.nested_arrays_id_seq', 4871, true);
          public          postgres    false    234         �           0    0    relationToOne_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."relationToOne_id_seq"', 562, true);
          public          postgres    false    238         �           0    0    relationshipB_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."relationshipB_id_seq"', 1290, true);
          public          postgres    false    252         �           2606    17594 *   arrays_nestedArray arrays_nestedArray_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."arrays_nestedArray"
    ADD CONSTRAINT "arrays_nestedArray_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public."arrays_nestedArray" DROP CONSTRAINT "arrays_nestedArray_pkey";
       public            postgres    false    255         �           2606    17740 .   arrays_nested_arrays arrays_nested_arrays_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.arrays_nested_arrays
    ADD CONSTRAINT arrays_nested_arrays_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.arrays_nested_arrays DROP CONSTRAINT arrays_nested_arrays_pkey;
       public            postgres    false    263         �           2606    17406    arrays arrays_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.arrays
    ADD CONSTRAINT arrays_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.arrays DROP CONSTRAINT arrays_pkey;
       public            postgres    false    237         c           2606    16839 (   directus_activity directus_activity_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_activity DROP CONSTRAINT directus_activity_pkey;
       public            postgres    false    206         U           2606    16772 .   directus_collections directus_collections_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);
 X   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_pkey;
       public            postgres    false    200         y           2606    17171 ,   directus_dashboards directus_dashboards_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_pkey;
       public            postgres    false    223         a           2606    16817 $   directus_fields directus_fields_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_fields DROP CONSTRAINT directus_fields_pkey;
       public            postgres    false    204         g           2606    16865 "   directus_files directus_files_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_pkey;
       public            postgres    false    208         �           2606    17294 .   directus_flows directus_flows_operation_unique 
   CONSTRAINT     n   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);
 X   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_operation_unique;
       public            postgres    false    228         �           2606    17292 "   directus_flows directus_flows_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_pkey;
       public            postgres    false    228         e           2606    16849 &   directus_folders directus_folders_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_pkey;
       public            postgres    false    207         w           2606    17041 ,   directus_migrations directus_migrations_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);
 V   ALTER TABLE ONLY public.directus_migrations DROP CONSTRAINT directus_migrations_pkey;
       public            postgres    false    222         }           2606    17235 2   directus_notifications directus_notifications_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_pkey;
       public            postgres    false    226         �           2606    17308 ,   directus_operations directus_operations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_pkey;
       public            postgres    false    229         �           2606    17317 5   directus_operations directus_operations_reject_unique 
   CONSTRAINT     r   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);
 _   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_unique;
       public            postgres    false    229         �           2606    17310 6   directus_operations directus_operations_resolve_unique 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_unique;
       public            postgres    false    229         {           2606    17187 $   directus_panels directus_panels_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_pkey;
       public            postgres    false    224         i           2606    16891 .   directus_permissions directus_permissions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_pkey;
       public            postgres    false    210         k           2606    16913 &   directus_presets directus_presets_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_pkey;
       public            postgres    false    212         m           2606    16939 *   directus_relations directus_relations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_relations DROP CONSTRAINT directus_relations_pkey;
       public            postgres    false    214         o           2606    16960 *   directus_revisions directus_revisions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_pkey;
       public            postgres    false    216         W           2606    16784 "   directus_roles directus_roles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_roles DROP CONSTRAINT directus_roles_pkey;
       public            postgres    false    201         q           2606    16983 (   directus_sessions directus_sessions_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);
 R   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_pkey;
       public            postgres    false    217         s           2606    17003 (   directus_settings directus_settings_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_pkey;
       public            postgres    false    219                    2606    17256 $   directus_shares directus_shares_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_pkey;
       public            postgres    false    227         Y           2606    17215 *   directus_users directus_users_email_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_email_unique;
       public            postgres    false    202         [           2606    17213 8   directus_users directus_users_external_identifier_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);
 b   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_external_identifier_unique;
       public            postgres    false    202         ]           2606    16795 "   directus_users directus_users_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_pkey;
       public            postgres    false    202         _           2606    17223 *   directus_users directus_users_token_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_token_unique;
       public            postgres    false    202         u           2606    17032 (   directus_webhooks directus_webhooks_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_webhooks DROP CONSTRAINT directus_webhooks_pkey;
       public            postgres    false    221         �           2606    17716 &   documents_arrays documents_arrays_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.documents_arrays
    ADD CONSTRAINT documents_arrays_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.documents_arrays DROP CONSTRAINT documents_arrays_pkey;
       public            postgres    false    261         �           2606    17625 &   documents_blocks documents_blocks_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.documents_blocks
    ADD CONSTRAINT documents_blocks_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.documents_blocks DROP CONSTRAINT documents_blocks_pkey;
       public            postgres    false    257         �           2606    17529 :   documents_hasManyRelations documents_hasManyRelations_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public."documents_hasManyRelations"
    ADD CONSTRAINT "documents_hasManyRelations_pkey" PRIMARY KEY (id);
 h   ALTER TABLE ONLY public."documents_hasManyRelations" DROP CONSTRAINT "documents_hasManyRelations_pkey";
       public            postgres    false    247         �           2606    17339    documents documents_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.documents DROP CONSTRAINT documents_pkey;
       public            postgres    false    230         �           2606    17550 6   documents_relationToMany documents_relationToMany_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."documents_relationToMany"
    ADD CONSTRAINT "documents_relationToMany_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY public."documents_relationToMany" DROP CONSTRAINT "documents_relationToMany_pkey";
       public            postgres    false    249         �           2606    17566 4   documents_relationToOne documents_relationToOne_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."documents_relationToOne"
    ADD CONSTRAINT "documents_relationToOne_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY public."documents_relationToOne" DROP CONSTRAINT "documents_relationToOne_pkey";
       public            postgres    false    251         �           2606    17641 4   documents_relationshipA documents_relationshipA_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."documents_relationshipA"
    ADD CONSTRAINT "documents_relationshipA_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY public."documents_relationshipA" DROP CONSTRAINT "documents_relationshipA_pkey";
       public            postgres    false    259         �           2606    17503    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    245         �           2606    17470 &   hasManyRelations hasManyRelations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."hasManyRelations"
    ADD CONSTRAINT "hasManyRelations_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."hasManyRelations" DROP CONSTRAINT "hasManyRelations_pkey";
       public            postgres    false    241         �           2606    17481 D   hasManyRelations_relationToMany hasManyRelations_relationToMany_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."hasManyRelations_relationToMany"
    ADD CONSTRAINT "hasManyRelations_relationToMany_pkey" PRIMARY KEY (id);
 r   ALTER TABLE ONLY public."hasManyRelations_relationToMany" DROP CONSTRAINT "hasManyRelations_relationToMany_pkey";
       public            postgres    false    243         �           2606    17371    nestedGroups nestedGroups_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."nestedGroups"
    ADD CONSTRAINT "nestedGroups_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."nestedGroups" DROP CONSTRAINT "nestedGroups_pkey";
       public            postgres    false    233         �           2606    17390     nested_arrays nested_arrays_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.nested_arrays
    ADD CONSTRAINT nested_arrays_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.nested_arrays DROP CONSTRAINT nested_arrays_pkey;
       public            postgres    false    235         �           2606    17454     relationToOne relationToOne_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."relationToOne"
    ADD CONSTRAINT "relationToOne_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."relationToOne" DROP CONSTRAINT "relationToOne_pkey";
       public            postgres    false    239         �           2606    17347     relationshipA relationshipA_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."relationshipA"
    ADD CONSTRAINT "relationshipA_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."relationshipA" DROP CONSTRAINT "relationshipA_pkey";
       public            postgres    false    231         �           2606    17582     relationshipB relationshipB_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."relationshipB"
    ADD CONSTRAINT "relationshipB_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."relationshipB" DROP CONSTRAINT "relationshipB_pkey";
       public            postgres    false    253         �           2606    17746 ;   arrays_nested_arrays arrays_nested_arrays_arrays_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.arrays_nested_arrays
    ADD CONSTRAINT arrays_nested_arrays_arrays_id_foreign FOREIGN KEY (arrays_id) REFERENCES public.arrays(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY public.arrays_nested_arrays DROP CONSTRAINT arrays_nested_arrays_arrays_id_foreign;
       public          postgres    false    3219    237    263         �           2606    17741 B   arrays_nested_arrays arrays_nested_arrays_nested_arrays_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.arrays_nested_arrays
    ADD CONSTRAINT arrays_nested_arrays_nested_arrays_id_foreign FOREIGN KEY (nested_arrays_id) REFERENCES public.nested_arrays(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY public.arrays_nested_arrays DROP CONSTRAINT arrays_nested_arrays_nested_arrays_id_foreign;
       public          postgres    false    235    263    3217         �           2606    17598 7   arrays_nestedArray arrays_nestedarray_arrays_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."arrays_nestedArray"
    ADD CONSTRAINT arrays_nestedarray_arrays_id_foreign FOREIGN KEY (arrays_id) REFERENCES public.arrays(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY public."arrays_nestedArray" DROP CONSTRAINT arrays_nestedarray_arrays_id_foreign;
       public          postgres    false    3219    255    237         �           2606    17217 7   directus_collections directus_collections_group_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);
 a   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_group_foreign;
       public          postgres    false    200    3157    200         �           2606    17172 <   directus_dashboards directus_dashboards_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_user_created_foreign;
       public          postgres    false    3165    202    223         �           2606    17127 ,   directus_files directus_files_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_folder_foreign;
       public          postgres    false    3173    208    207         �           2606    17057 1   directus_files directus_files_modified_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_modified_by_foreign;
       public          postgres    false    208    3165    202         �           2606    17052 1   directus_files directus_files_uploaded_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_uploaded_by_foreign;
       public          postgres    false    202    3165    208         �           2606    17295 2   directus_flows directus_flows_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_user_created_foreign;
       public          postgres    false    228    202    3165         �           2606    17062 0   directus_folders directus_folders_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);
 Z   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_parent_foreign;
       public          postgres    false    207    207    3173         �           2606    17236 ?   directus_notifications directus_notifications_recipient_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_recipient_foreign;
       public          postgres    false    226    3165    202         �           2606    17241 <   directus_notifications directus_notifications_sender_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);
 f   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_sender_foreign;
       public          postgres    false    3165    202    226         �           2606    17323 4   directus_operations directus_operations_flow_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_flow_foreign;
       public          postgres    false    229    228    3203         �           2606    17318 6   directus_operations directus_operations_reject_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_foreign;
       public          postgres    false    229    3205    229         �           2606    17311 7   directus_operations directus_operations_resolve_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);
 a   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_foreign;
       public          postgres    false    229    229    3205         �           2606    17328 <   directus_operations directus_operations_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_user_created_foreign;
       public          postgres    false    3165    229    202         �           2606    17188 1   directus_panels directus_panels_dashboard_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_dashboard_foreign;
       public          postgres    false    223    224    3193         �           2606    17193 4   directus_panels directus_panels_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_user_created_foreign;
       public          postgres    false    3165    224    202         �           2606    17132 6   directus_permissions directus_permissions_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_role_foreign;
       public          postgres    false    3159    201    210         �           2606    17142 .   directus_presets directus_presets_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_role_foreign;
       public          postgres    false    201    3159    212         �           2606    17137 .   directus_presets directus_presets_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_user_foreign;
       public          postgres    false    3165    212    202         �           2606    17147 6   directus_revisions directus_revisions_activity_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_activity_foreign;
       public          postgres    false    3171    216    206         �           2606    17087 4   directus_revisions directus_revisions_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);
 ^   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_parent_foreign;
       public          postgres    false    3183    216    216         �           2606    17272 1   directus_sessions directus_sessions_share_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_share_foreign;
       public          postgres    false    3199    217    227         �           2606    17152 0   directus_sessions directus_sessions_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_user_foreign;
       public          postgres    false    3165    217    202         �           2606    17097 8   directus_settings directus_settings_project_logo_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);
 b   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_project_logo_foreign;
       public          postgres    false    219    208    3175         �           2606    17107 =   directus_settings directus_settings_public_background_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_background_foreign;
       public          postgres    false    208    219    3175         �           2606    17102 =   directus_settings directus_settings_public_foreground_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_foreground_foreign;
       public          postgres    false    208    3175    219         �           2606    17205 B   directus_settings directus_settings_storage_default_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_storage_default_folder_foreign;
       public          postgres    false    3173    207    219         �           2606    17257 2   directus_shares directus_shares_collection_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_collection_foreign;
       public          postgres    false    227    3157    200         �           2606    17262 ,   directus_shares directus_shares_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_role_foreign;
       public          postgres    false    227    201    3159         �           2606    17267 4   directus_shares directus_shares_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_user_created_foreign;
       public          postgres    false    202    3165    227         �           2606    17157 *   directus_users directus_users_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_role_foreign;
       public          postgres    false    201    3159    202         �           2606    17717 3   documents_arrays documents_arrays_arrays_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.documents_arrays
    ADD CONSTRAINT documents_arrays_arrays_id_foreign FOREIGN KEY (arrays_id) REFERENCES public.arrays(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public.documents_arrays DROP CONSTRAINT documents_arrays_arrays_id_foreign;
       public          postgres    false    237    3219    261         �           2606    17722 6   documents_arrays documents_arrays_documents_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.documents_arrays
    ADD CONSTRAINT documents_arrays_documents_id_foreign FOREIGN KEY (documents_id) REFERENCES public.documents(id) ON DELETE SET NULL;
 `   ALTER TABLE ONLY public.documents_arrays DROP CONSTRAINT documents_arrays_documents_id_foreign;
       public          postgres    false    230    261    3211         �           2606    17629 6   documents_blocks documents_blocks_documents_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.documents_blocks
    ADD CONSTRAINT documents_blocks_documents_id_foreign FOREIGN KEY (documents_id) REFERENCES public.documents(id) ON DELETE SET NULL;
 `   ALTER TABLE ONLY public.documents_blocks DROP CONSTRAINT documents_blocks_documents_id_foreign;
       public          postgres    false    257    3211    230         �           2606    17512 !   documents documents_group_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_group_foreign FOREIGN KEY ("group") REFERENCES public.groups(id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.documents DROP CONSTRAINT documents_group_foreign;
       public          postgres    false    245    230    3227         �           2606    17533 J   documents_hasManyRelations documents_hasmanyrelations_documents_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."documents_hasManyRelations"
    ADD CONSTRAINT documents_hasmanyrelations_documents_id_foreign FOREIGN KEY (documents_id) REFERENCES public.documents(id) ON DELETE SET NULL;
 v   ALTER TABLE ONLY public."documents_hasManyRelations" DROP CONSTRAINT documents_hasmanyrelations_documents_id_foreign;
       public          postgres    false    3211    230    247         �           2606    17647 D   documents_relationshipA documents_relationshipa_documents_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."documents_relationshipA"
    ADD CONSTRAINT documents_relationshipa_documents_id_foreign FOREIGN KEY (documents_id) REFERENCES public.documents(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY public."documents_relationshipA" DROP CONSTRAINT documents_relationshipa_documents_id_foreign;
       public          postgres    false    230    3211    259         �           2606    17642 H   documents_relationshipA documents_relationshipa_relationshipa_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."documents_relationshipA"
    ADD CONSTRAINT documents_relationshipa_relationshipa_id_foreign FOREIGN KEY ("relationshipA_id") REFERENCES public."relationshipA"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY public."documents_relationshipA" DROP CONSTRAINT documents_relationshipa_relationshipa_id_foreign;
       public          postgres    false    3213    259    231         �           2606    17554 F   documents_relationToMany documents_relationtomany_documents_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."documents_relationToMany"
    ADD CONSTRAINT documents_relationtomany_documents_id_foreign FOREIGN KEY (documents_id) REFERENCES public.documents(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY public."documents_relationToMany" DROP CONSTRAINT documents_relationtomany_documents_id_foreign;
       public          postgres    false    230    249    3211         �           2606    17570 D   documents_relationToOne documents_relationtoone_documents_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."documents_relationToOne"
    ADD CONSTRAINT documents_relationtoone_documents_id_foreign FOREIGN KEY (documents_id) REFERENCES public.documents(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY public."documents_relationToOne" DROP CONSTRAINT documents_relationtoone_documents_id_foreign;
       public          postgres    false    251    230    3211         �           2606    17504 "   groups groups_nestedgroups_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_nestedgroups_foreign FOREIGN KEY ("nestedGroups") REFERENCES public."nestedGroups"(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_nestedgroups_foreign;
       public          postgres    false    245    233    3215         �           2606    17485 [   hasManyRelations_relationToMany hasmanyrelations_relationtomany_hasmanyrelations_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."hasManyRelations_relationToMany"
    ADD CONSTRAINT hasmanyrelations_relationtomany_hasmanyrelations_id_foreign FOREIGN KEY ("hasManyRelations_id") REFERENCES public."hasManyRelations"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY public."hasManyRelations_relationToMany" DROP CONSTRAINT hasmanyrelations_relationtomany_hasmanyrelations_id_foreign;
       public          postgres    false    243    241    3223         �           2606    17394 ,   nested_arrays nested_arrays_relation_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nested_arrays
    ADD CONSTRAINT nested_arrays_relation_foreign FOREIGN KEY (relation) REFERENCES public."relationshipA"(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.nested_arrays DROP CONSTRAINT nested_arrays_relation_foreign;
       public          postgres    false    235    3213    231         �           2606    17759 ,   relationshipA relationshipa_relation_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."relationshipA"
    ADD CONSTRAINT relationshipa_relation_foreign FOREIGN KEY (relation) REFERENCES public."relationshipB"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public."relationshipA" DROP CONSTRAINT relationshipa_relation_foreign;
       public          postgres    false    3235    253    231         �           2606    17458 ,   relationToOne relationtoone_relation_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."relationToOne"
    ADD CONSTRAINT relationtoone_relation_foreign FOREIGN KEY (relation) REFERENCES public."relationshipA"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public."relationToOne" DROP CONSTRAINT relationtoone_relation_foreign;
       public          postgres    false    3213    239    231                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      3460.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3478.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3486.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3429.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3423.dat                                                                                            0000600 0004000 0002000 00000002476 14313655427 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        documents	\N	\N	{{id}}	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
relationshipA	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
nestedGroups	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
nested_arrays	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
arrays	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
relationToOne	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
hasManyRelations	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
hasManyRelations_relationToMany	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
groups	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
documents_hasManyRelations	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
documents_relationToMany	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
documents_relationToOne	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
relationshipB	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
arrays_nestedArray	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
documents_blocks	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
documents_relationshipA	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
documents_arrays	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
arrays_nested_arrays	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
\.


                                                                                                                                                                                                  3446.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3427.dat                                                                                            0000600 0004000 0002000 00000012525 14313655427 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        56	documents_hasManyRelations	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
57	documents_hasManyRelations	documents_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
58	documents_hasManyRelations	item	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
59	documents_hasManyRelations	collection	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
76	arrays_nestedArray	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
62	documents_relationToMany	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
63	documents_relationToMany	documents_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
64	documents_relationToMany	item	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
65	documents_relationToMany	collection	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
77	arrays_nestedArray	arrays_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
78	arrays_nestedArray	item	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
79	arrays_nestedArray	collection	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
21	nestedGroups	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
22	nestedGroups	text	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
24	nested_arrays	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
25	nested_arrays	text	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
26	nested_arrays	relation	m2o	select-dropdown-m2o	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
27	arrays	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
28	arrays	text	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
81	documents_blocks	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
82	documents_blocks	documents_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
38	relationToOne	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
39	relationToOne	text	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
40	relationToOne	relation	m2o	select-dropdown-m2o	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
41	hasManyRelations	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
42	hasManyRelations	text	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
43	hasManyRelations	relationToMany	m2a	list-m2a	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
44	hasManyRelations_relationToMany	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
45	hasManyRelations_relationToMany	hasManyRelations_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
46	hasManyRelations_relationToMany	item	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
47	hasManyRelations_relationToMany	collection	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
50	groups	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
52	groups	text	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
51	groups	nestedGroups	m2o	select-dropdown-m2o	{"template":"{{text}}"}	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
83	documents_blocks	item	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
84	documents_blocks	collection	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
90	documents_arrays	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
67	documents_relationToOne	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
68	documents_relationToOne	documents_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
69	documents_relationToOne	item	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
70	documents_relationToOne	collection	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
91	documents_arrays	documents_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
92	documents_arrays	arrays_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
1	documents	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
4	documents	title	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
89	documents	array	m2m	list-m2m	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
53	documents	group	m2o	select-dropdown-m2o	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
80	documents	blocks	m2a	list-m2a	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
85	documents	relation	m2m	list-m2m	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
2	documents	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
3	documents	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	8	half	\N	\N	\N	f	\N	\N	\N
93	arrays	nestedArrays	m2m	list-m2m	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
86	documents_relationshipA	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
87	documents_relationshipA	documents_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
88	documents_relationshipA	relationshipA_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
94	arrays_nested_arrays	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
95	arrays_nested_arrays	arrays_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
96	arrays_nested_arrays	nested_arrays_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
12	relationshipA	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
15	relationshipA	title	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
97	relationshipA	relation	m2o	select-dropdown-m2o	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
13	relationshipA	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
14	relationshipA	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
99	relationshipB	text	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
72	relationshipB	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
73	relationshipB	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
71	relationshipB	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
\.


                                                                                                                                                                           3431.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3451.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3430.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3445.dat                                                                                            0000600 0004000 0002000 00000007541 14313655427 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        20201028A	Remove Collection Foreign Keys	2022-09-21 14:54:36.209073-04
20201029A	Remove System Relations	2022-09-21 14:54:36.211888-04
20201029B	Remove System Collections	2022-09-21 14:54:36.214167-04
20201029C	Remove System Fields	2022-09-21 14:54:36.219776-04
20201105A	Add Cascade System Relations	2022-09-21 14:54:36.269716-04
20201105B	Change Webhook URL Type	2022-09-21 14:54:36.27265-04
20210225A	Add Relations Sort Field	2022-09-21 14:54:36.275549-04
20210304A	Remove Locked Fields	2022-09-21 14:54:36.27833-04
20210312A	Webhooks Collections Text	2022-09-21 14:54:36.281181-04
20210331A	Add Refresh Interval	2022-09-21 14:54:36.282799-04
20210415A	Make Filesize Nullable	2022-09-21 14:54:36.28655-04
20210416A	Add Collections Accountability	2022-09-21 14:54:36.290264-04
20210422A	Remove Files Interface	2022-09-21 14:54:36.291899-04
20210506A	Rename Interfaces	2022-09-21 14:54:36.309436-04
20210510A	Restructure Relations	2022-09-21 14:54:36.32455-04
20210518A	Add Foreign Key Constraints	2022-09-21 14:54:36.331362-04
20210519A	Add System Fk Triggers	2022-09-21 14:54:36.355556-04
20210521A	Add Collections Icon Color	2022-09-21 14:54:36.357118-04
20210525A	Add Insights	2022-09-21 14:54:36.372477-04
20210608A	Add Deep Clone Config	2022-09-21 14:54:36.373904-04
20210626A	Change Filesize Bigint	2022-09-21 14:54:36.383381-04
20210716A	Add Conditions to Fields	2022-09-21 14:54:36.385096-04
20210721A	Add Default Folder	2022-09-21 14:54:36.387913-04
20210802A	Replace Groups	2022-09-21 14:54:36.390546-04
20210803A	Add Required to Fields	2022-09-21 14:54:36.392409-04
20210805A	Update Groups	2022-09-21 14:54:36.394394-04
20210805B	Change Image Metadata Structure	2022-09-21 14:54:36.396525-04
20210811A	Add Geometry Config	2022-09-21 14:54:36.398131-04
20210831A	Remove Limit Column	2022-09-21 14:54:36.39975-04
20210903A	Add Auth Provider	2022-09-21 14:54:36.408671-04
20210907A	Webhooks Collections Not Null	2022-09-21 14:54:36.411626-04
20210910A	Move Module Setup	2022-09-21 14:54:36.413601-04
20210920A	Webhooks URL Not Null	2022-09-21 14:54:36.416275-04
20210924A	Add Collection Organization	2022-09-21 14:54:36.418792-04
20210927A	Replace Fields Group	2022-09-21 14:54:36.42421-04
20210927B	Replace M2M Interface	2022-09-21 14:54:36.425676-04
20210929A	Rename Login Action	2022-09-21 14:54:36.42767-04
20211007A	Update Presets	2022-09-21 14:54:36.431458-04
20211009A	Add Auth Data	2022-09-21 14:54:36.432979-04
20211016A	Add Webhook Headers	2022-09-21 14:54:36.434299-04
20211103A	Set Unique to User Token	2022-09-21 14:54:36.437483-04
20211103B	Update Special Geometry	2022-09-21 14:54:36.438847-04
20211104A	Remove Collections Listing	2022-09-21 14:54:36.440172-04
20211118A	Add Notifications	2022-09-21 14:54:36.450403-04
20211211A	Add Shares	2022-09-21 14:54:36.461018-04
20211230A	Add Project Descriptor	2022-09-21 14:54:36.462585-04
20220303A	Remove Default Project Color	2022-09-21 14:54:36.464924-04
20220308A	Add Bookmark Icon and Color	2022-09-21 14:54:36.466377-04
20220314A	Add Translation Strings	2022-09-21 14:54:36.467662-04
20220322A	Rename Field Typecast Flags	2022-09-21 14:54:36.469208-04
20220323A	Add Field Validation	2022-09-21 14:54:36.470742-04
20220325A	Fix Typecast Flags	2022-09-21 14:54:36.472254-04
20220325B	Add Default Language	2022-09-21 14:54:36.475272-04
20220402A	Remove Default Value Panel Icon	2022-09-21 14:54:36.4782-04
20220429A	Add Flows	2022-09-21 14:54:36.503382-04
20220429B	Add Color to Insights Icon	2022-09-21 14:54:36.504818-04
20220429C	Drop Non Null From IP of Activity	2022-09-21 14:54:36.506144-04
20220429D	Drop Non Null From Sender of Notifications	2022-09-21 14:54:36.507386-04
20220614A	Rename Hook Trigger to Event	2022-09-21 14:54:36.508805-04
20220801A	Update Notifications Timestamp Column	2022-09-21 14:54:36.512174-04
20220802A	Add Custom Aspect Ratios	2022-09-21 14:54:36.51376-04
20220826A	Add Origin to Accountability	2022-09-21 14:54:36.515654-04
\.


                                                                                                                                                               3449.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3452.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3447.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3433.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3435.dat                                                                                            0000600 0004000 0002000 00000001731 14313655427 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        14	\N	7260aafa-d279-4509-b64c-5199debfe653	\N	relationToOne	\N	\N	{"tabular":{"page":1,"limit":1000}}	\N	\N	\N	bookmark_outline	\N
13	\N	7260aafa-d279-4509-b64c-5199debfe653	\N	nested_arrays	\N	\N	{"tabular":{"limit":1000,"page":1}}	\N	\N	\N	bookmark_outline	\N
17	\N	7260aafa-d279-4509-b64c-5199debfe653	\N	documents	\N	\N	\N	\N	\N	\N	bookmark_outline	\N
15	\N	7260aafa-d279-4509-b64c-5199debfe653	\N	relationshipA	\N	\N	{"tabular":{"page":1,"limit":1000}}	\N	\N	\N	bookmark_outline	\N
16	\N	7260aafa-d279-4509-b64c-5199debfe653	\N	relationshipB	\N	\N	{"tabular":{"page":1,"limit":1000}}	\N	\N	\N	bookmark_outline	\N
11	\N	7260aafa-d279-4509-b64c-5199debfe653	\N	hasManyRelations	\N	\N	{"tabular":{"limit":1000,"page":1}}	\N	\N	\N	bookmark_outline	\N
12	\N	7260aafa-d279-4509-b64c-5199debfe653	\N	nestedGroups	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark_outline	\N
18	\N	7260aafa-d279-4509-b64c-5199debfe653	\N	arrays	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark_outline	\N
\.


                                       3437.dat                                                                                            0000600 0004000 0002000 00000003432 14313655427 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	nested_arrays	relation	relationshipA	\N	\N	\N	\N	\N	nullify
7	relationToOne	relation	relationshipA	\N	\N	\N	\N	\N	nullify
8	hasManyRelations_relationToMany	item	\N	\N	collection	relationshipA	hasManyRelations_id	\N	nullify
9	hasManyRelations_relationToMany	hasManyRelations_id	hasManyRelations	relationToMany	\N	\N	item	\N	nullify
11	groups	nestedGroups	nestedGroups	\N	\N	\N	\N	\N	nullify
12	documents	group	groups	\N	\N	\N	\N	\N	nullify
14	documents_hasManyRelations	item	\N	\N	collection	relationshipA	documents_id	\N	nullify
17	documents_relationToMany	item	\N	\N	collection	relationshipA	documents_id	\N	nullify
18	documents_relationToMany	documents_id	documents	\N	\N	\N	item	\N	nullify
19	documents_relationToOne	item	\N	\N	collection	relationshipA	documents_id	\N	nullify
21	arrays_nestedArray	item	\N	\N	collection	nested_arrays	arrays_id	\N	nullify
22	arrays_nestedArray	arrays_id	arrays	\N	\N	\N	item	\N	nullify
23	documents_blocks	item	\N	\N	collection	hasManyRelations,relationToOne	documents_id	\N	nullify
24	documents_blocks	documents_id	documents	blocks	\N	\N	item	\N	nullify
15	documents_hasManyRelations	documents_id	documents	\N	\N	\N	item	\N	nullify
20	documents_relationToOne	documents_id	documents	\N	\N	\N	item	\N	nullify
25	documents_relationshipA	relationshipA_id	relationshipA	\N	\N	\N	documents_id	\N	nullify
26	documents_relationshipA	documents_id	documents	relation	\N	\N	relationshipA_id	\N	nullify
27	documents_arrays	arrays_id	arrays	\N	\N	\N	documents_id	\N	nullify
28	documents_arrays	documents_id	documents	array	\N	\N	arrays_id	\N	nullify
29	arrays_nested_arrays	nested_arrays_id	nested_arrays	\N	\N	\N	arrays_id	\N	nullify
30	arrays_nested_arrays	arrays_id	arrays	nestedArrays	\N	\N	nested_arrays_id	\N	nullify
31	relationshipA	relation	relationshipB	\N	\N	\N	\N	\N	nullify
\.


                                                                                                                                                                                                                                      3439.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3424.dat                                                                                            0000600 0004000 0002000 00000000137 14313655427 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        ea206604-6f32-4b32-a49d-6bf2eb697d08	Administrator	verified	$t:admin_description	\N	f	t	t
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                 3440.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3442.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3450.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3425.dat                                                                                            0000600 0004000 0002000 00000000455 14313655427 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        7260aafa-d279-4509-b64c-5199debfe653	Admin	User	dev@payloadcms.com	$argon2id$v=19$m=4096,t=3,p=1$tn2okD5XPbG9pJKrwRXPyQ$svfgWKjcrh+rmxtZbTnXBeJwRHio8gYnJ9kwHBqXdd8	\N	\N	\N	\N	\N	\N	auto	\N	active	ea206604-6f32-4b32-a49d-6bf2eb697d08	\N	2022-09-24 15:04:11.654-04	/content/arrays	default	\N	\N	t
\.


                                                                                                                                                                                                                   3444.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3453.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3484.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3480.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3470.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3472.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3474.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3482.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3468.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3464.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3466.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3456.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3458.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3462.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3454.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3476.dat                                                                                            0000600 0004000 0002000 00000000005 14313655427 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000232205 14313655427 0015402 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE directus;
--
-- Name: directus; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE directus WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE directus OWNER TO postgres;

\connect directus

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: arrays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arrays (
    id integer NOT NULL,
    text text
);


ALTER TABLE public.arrays OWNER TO postgres;

--
-- Name: arrays_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arrays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arrays_id_seq OWNER TO postgres;

--
-- Name: arrays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arrays_id_seq OWNED BY public.arrays.id;


--
-- Name: arrays_nestedArray; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."arrays_nestedArray" (
    id integer NOT NULL,
    arrays_id integer,
    item character varying(255),
    collection character varying(255)
);


ALTER TABLE public."arrays_nestedArray" OWNER TO postgres;

--
-- Name: arrays_nestedArray_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."arrays_nestedArray_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."arrays_nestedArray_id_seq" OWNER TO postgres;

--
-- Name: arrays_nestedArray_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."arrays_nestedArray_id_seq" OWNED BY public."arrays_nestedArray".id;


--
-- Name: arrays_nested_arrays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arrays_nested_arrays (
    id integer NOT NULL,
    arrays_id integer,
    nested_arrays_id integer
);


ALTER TABLE public.arrays_nested_arrays OWNER TO postgres;

--
-- Name: arrays_nested_arrays_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arrays_nested_arrays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arrays_nested_arrays_id_seq OWNER TO postgres;

--
-- Name: arrays_nested_arrays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arrays_nested_arrays_id_seq OWNED BY public.arrays_nested_arrays.id;


--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO postgres;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO postgres;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);


ALTER TABLE public.directus_files OWNER TO postgres;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO postgres;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO postgres;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO postgres;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO postgres;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_notifications_id_seq OWNER TO postgres;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO postgres;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO postgres;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


ALTER TABLE public.directus_permissions OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark_outline'::character varying NOT NULL,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);


ALTER TABLE public.directus_revisions OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO postgres;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);


ALTER TABLE public.directus_sessions OWNER TO postgres;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(50) DEFAULT NULL::character varying,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    translation_strings json,
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json
);


ALTER TABLE public.directus_settings OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64),
    item character varying(255),
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO postgres;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true
);


ALTER TABLE public.directus_users OWNER TO postgres;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);


ALTER TABLE public.directus_webhooks OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id uuid NOT NULL,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    title character varying(255),
    "group" integer
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: documents_arrays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents_arrays (
    id integer NOT NULL,
    documents_id uuid,
    arrays_id integer
);


ALTER TABLE public.documents_arrays OWNER TO postgres;

--
-- Name: documents_arrays_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_arrays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_arrays_id_seq OWNER TO postgres;

--
-- Name: documents_arrays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_arrays_id_seq OWNED BY public.documents_arrays.id;


--
-- Name: documents_blocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents_blocks (
    id integer NOT NULL,
    documents_id uuid,
    item character varying(255),
    collection character varying(255)
);


ALTER TABLE public.documents_blocks OWNER TO postgres;

--
-- Name: documents_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_blocks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_blocks_id_seq OWNER TO postgres;

--
-- Name: documents_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_blocks_id_seq OWNED BY public.documents_blocks.id;


--
-- Name: documents_hasManyRelations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."documents_hasManyRelations" (
    id integer NOT NULL,
    documents_id uuid,
    item character varying(255),
    collection character varying(255)
);


ALTER TABLE public."documents_hasManyRelations" OWNER TO postgres;

--
-- Name: documents_hasManyRelations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."documents_hasManyRelations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."documents_hasManyRelations_id_seq" OWNER TO postgres;

--
-- Name: documents_hasManyRelations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."documents_hasManyRelations_id_seq" OWNED BY public."documents_hasManyRelations".id;


--
-- Name: documents_relationToMany; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."documents_relationToMany" (
    id integer NOT NULL,
    documents_id uuid,
    item character varying(255),
    collection character varying(255)
);


ALTER TABLE public."documents_relationToMany" OWNER TO postgres;

--
-- Name: documents_relationToMany_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."documents_relationToMany_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."documents_relationToMany_id_seq" OWNER TO postgres;

--
-- Name: documents_relationToMany_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."documents_relationToMany_id_seq" OWNED BY public."documents_relationToMany".id;


--
-- Name: documents_relationToOne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."documents_relationToOne" (
    id integer NOT NULL,
    documents_id uuid,
    item character varying(255),
    collection character varying(255)
);


ALTER TABLE public."documents_relationToOne" OWNER TO postgres;

--
-- Name: documents_relationToOne_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."documents_relationToOne_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."documents_relationToOne_id_seq" OWNER TO postgres;

--
-- Name: documents_relationToOne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."documents_relationToOne_id_seq" OWNED BY public."documents_relationToOne".id;


--
-- Name: documents_relationshipA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."documents_relationshipA" (
    id integer NOT NULL,
    documents_id uuid,
    "relationshipA_id" uuid
);


ALTER TABLE public."documents_relationshipA" OWNER TO postgres;

--
-- Name: documents_relationshipA_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."documents_relationshipA_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."documents_relationshipA_id_seq" OWNER TO postgres;

--
-- Name: documents_relationshipA_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."documents_relationshipA_id_seq" OWNED BY public."documents_relationshipA".id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    "nestedGroups" integer,
    text text
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: hasManyRelations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."hasManyRelations" (
    id integer NOT NULL,
    text text
);


ALTER TABLE public."hasManyRelations" OWNER TO postgres;

--
-- Name: hasManyRelations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."hasManyRelations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."hasManyRelations_id_seq" OWNER TO postgres;

--
-- Name: hasManyRelations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."hasManyRelations_id_seq" OWNED BY public."hasManyRelations".id;


--
-- Name: hasManyRelations_relationToMany; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."hasManyRelations_relationToMany" (
    id integer NOT NULL,
    "hasManyRelations_id" integer,
    item character varying(255),
    collection character varying(255)
);


ALTER TABLE public."hasManyRelations_relationToMany" OWNER TO postgres;

--
-- Name: hasManyRelations_relationToMany_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."hasManyRelations_relationToMany_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."hasManyRelations_relationToMany_id_seq" OWNER TO postgres;

--
-- Name: hasManyRelations_relationToMany_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."hasManyRelations_relationToMany_id_seq" OWNED BY public."hasManyRelations_relationToMany".id;


--
-- Name: nestedGroups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."nestedGroups" (
    id integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public."nestedGroups" OWNER TO postgres;

--
-- Name: nestedGroups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."nestedGroups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."nestedGroups_id_seq" OWNER TO postgres;

--
-- Name: nestedGroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."nestedGroups_id_seq" OWNED BY public."nestedGroups".id;


--
-- Name: nested_arrays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nested_arrays (
    id integer NOT NULL,
    text text,
    relation uuid
);


ALTER TABLE public.nested_arrays OWNER TO postgres;

--
-- Name: nested_arrays_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nested_arrays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nested_arrays_id_seq OWNER TO postgres;

--
-- Name: nested_arrays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nested_arrays_id_seq OWNED BY public.nested_arrays.id;


--
-- Name: relationToOne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."relationToOne" (
    id integer NOT NULL,
    text text,
    relation uuid
);


ALTER TABLE public."relationToOne" OWNER TO postgres;

--
-- Name: relationToOne_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."relationToOne_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."relationToOne_id_seq" OWNER TO postgres;

--
-- Name: relationToOne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."relationToOne_id_seq" OWNED BY public."relationToOne".id;


--
-- Name: relationshipA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."relationshipA" (
    id uuid NOT NULL,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    title text,
    relation integer
);


ALTER TABLE public."relationshipA" OWNER TO postgres;

--
-- Name: relationshipB; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."relationshipB" (
    id integer NOT NULL,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    text text
);


ALTER TABLE public."relationshipB" OWNER TO postgres;

--
-- Name: relationshipB_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."relationshipB_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."relationshipB_id_seq" OWNER TO postgres;

--
-- Name: relationshipB_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."relationshipB_id_seq" OWNED BY public."relationshipB".id;


--
-- Name: arrays id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrays ALTER COLUMN id SET DEFAULT nextval('public.arrays_id_seq'::regclass);


--
-- Name: arrays_nestedArray id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."arrays_nestedArray" ALTER COLUMN id SET DEFAULT nextval('public."arrays_nestedArray_id_seq"'::regclass);


--
-- Name: arrays_nested_arrays id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrays_nested_arrays ALTER COLUMN id SET DEFAULT nextval('public.arrays_nested_arrays_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: documents_arrays id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_arrays ALTER COLUMN id SET DEFAULT nextval('public.documents_arrays_id_seq'::regclass);


--
-- Name: documents_blocks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_blocks ALTER COLUMN id SET DEFAULT nextval('public.documents_blocks_id_seq'::regclass);


--
-- Name: documents_hasManyRelations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_hasManyRelations" ALTER COLUMN id SET DEFAULT nextval('public."documents_hasManyRelations_id_seq"'::regclass);


--
-- Name: documents_relationToMany id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_relationToMany" ALTER COLUMN id SET DEFAULT nextval('public."documents_relationToMany_id_seq"'::regclass);


--
-- Name: documents_relationToOne id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_relationToOne" ALTER COLUMN id SET DEFAULT nextval('public."documents_relationToOne_id_seq"'::regclass);


--
-- Name: documents_relationshipA id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_relationshipA" ALTER COLUMN id SET DEFAULT nextval('public."documents_relationshipA_id_seq"'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: hasManyRelations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."hasManyRelations" ALTER COLUMN id SET DEFAULT nextval('public."hasManyRelations_id_seq"'::regclass);


--
-- Name: hasManyRelations_relationToMany id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."hasManyRelations_relationToMany" ALTER COLUMN id SET DEFAULT nextval('public."hasManyRelations_relationToMany_id_seq"'::regclass);


--
-- Name: nestedGroups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."nestedGroups" ALTER COLUMN id SET DEFAULT nextval('public."nestedGroups_id_seq"'::regclass);


--
-- Name: nested_arrays id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nested_arrays ALTER COLUMN id SET DEFAULT nextval('public.nested_arrays_id_seq'::regclass);


--
-- Name: relationToOne id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."relationToOne" ALTER COLUMN id SET DEFAULT nextval('public."relationToOne_id_seq"'::regclass);


--
-- Name: relationshipB id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."relationshipB" ALTER COLUMN id SET DEFAULT nextval('public."relationshipB_id_seq"'::regclass);


--
-- Data for Name: arrays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.arrays (id, text) FROM stdin;
\.
COPY public.arrays (id, text) FROM '$$PATH$$/3460.dat';

--
-- Data for Name: arrays_nestedArray; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."arrays_nestedArray" (id, arrays_id, item, collection) FROM stdin;
\.
COPY public."arrays_nestedArray" (id, arrays_id, item, collection) FROM '$$PATH$$/3478.dat';

--
-- Data for Name: arrays_nested_arrays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.arrays_nested_arrays (id, arrays_id, nested_arrays_id) FROM stdin;
\.
COPY public.arrays_nested_arrays (id, arrays_id, nested_arrays_id) FROM '$$PATH$$/3486.dat';

--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
\.
COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM '$$PATH$$/3429.dat';

--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse) FROM stdin;
\.
COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse) FROM '$$PATH$$/3423.dat';

--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.
COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM '$$PATH$$/3446.dat';

--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
\.
COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM '$$PATH$$/3427.dat';

--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
\.
COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM '$$PATH$$/3431.dat';

--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.
COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM '$$PATH$$/3451.dat';

--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.
COPY public.directus_folders (id, name, parent) FROM '$$PATH$$/3430.dat';

--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
\.
COPY public.directus_migrations (version, name, "timestamp") FROM '$$PATH$$/3445.dat';

--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.
COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM '$$PATH$$/3449.dat';

--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.
COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM '$$PATH$$/3452.dat';

--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.
COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM '$$PATH$$/3447.dat';

--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
\.
COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM '$$PATH$$/3433.dat';

--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
\.
COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM '$$PATH$$/3435.dat';

--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
\.
COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM '$$PATH$$/3437.dat';

--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM stdin;
\.
COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM '$$PATH$$/3439.dat';

--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
\.
COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM '$$PATH$$/3424.dat';

--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) FROM stdin;
\.
COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) FROM '$$PATH$$/3440.dat';

--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, translation_strings, default_language, custom_aspect_ratios) FROM stdin;
\.
COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, translation_strings, default_language, custom_aspect_ratios) FROM '$$PATH$$/3442.dat';

--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.
COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM '$$PATH$$/3450.dat';

--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications) FROM stdin;
\.
COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications) FROM '$$PATH$$/3425.dat';

--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
\.
COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM '$$PATH$$/3444.dat';

--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (id, date_created, date_updated, title, "group") FROM stdin;
\.
COPY public.documents (id, date_created, date_updated, title, "group") FROM '$$PATH$$/3453.dat';

--
-- Data for Name: documents_arrays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents_arrays (id, documents_id, arrays_id) FROM stdin;
\.
COPY public.documents_arrays (id, documents_id, arrays_id) FROM '$$PATH$$/3484.dat';

--
-- Data for Name: documents_blocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents_blocks (id, documents_id, item, collection) FROM stdin;
\.
COPY public.documents_blocks (id, documents_id, item, collection) FROM '$$PATH$$/3480.dat';

--
-- Data for Name: documents_hasManyRelations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."documents_hasManyRelations" (id, documents_id, item, collection) FROM stdin;
\.
COPY public."documents_hasManyRelations" (id, documents_id, item, collection) FROM '$$PATH$$/3470.dat';

--
-- Data for Name: documents_relationToMany; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."documents_relationToMany" (id, documents_id, item, collection) FROM stdin;
\.
COPY public."documents_relationToMany" (id, documents_id, item, collection) FROM '$$PATH$$/3472.dat';

--
-- Data for Name: documents_relationToOne; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."documents_relationToOne" (id, documents_id, item, collection) FROM stdin;
\.
COPY public."documents_relationToOne" (id, documents_id, item, collection) FROM '$$PATH$$/3474.dat';

--
-- Data for Name: documents_relationshipA; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."documents_relationshipA" (id, documents_id, "relationshipA_id") FROM stdin;
\.
COPY public."documents_relationshipA" (id, documents_id, "relationshipA_id") FROM '$$PATH$$/3482.dat';

--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, "nestedGroups", text) FROM stdin;
\.
COPY public.groups (id, "nestedGroups", text) FROM '$$PATH$$/3468.dat';

--
-- Data for Name: hasManyRelations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."hasManyRelations" (id, text) FROM stdin;
\.
COPY public."hasManyRelations" (id, text) FROM '$$PATH$$/3464.dat';

--
-- Data for Name: hasManyRelations_relationToMany; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."hasManyRelations_relationToMany" (id, "hasManyRelations_id", item, collection) FROM stdin;
\.
COPY public."hasManyRelations_relationToMany" (id, "hasManyRelations_id", item, collection) FROM '$$PATH$$/3466.dat';

--
-- Data for Name: nestedGroups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."nestedGroups" (id, text) FROM stdin;
\.
COPY public."nestedGroups" (id, text) FROM '$$PATH$$/3456.dat';

--
-- Data for Name: nested_arrays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nested_arrays (id, text, relation) FROM stdin;
\.
COPY public.nested_arrays (id, text, relation) FROM '$$PATH$$/3458.dat';

--
-- Data for Name: relationToOne; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."relationToOne" (id, text, relation) FROM stdin;
\.
COPY public."relationToOne" (id, text, relation) FROM '$$PATH$$/3462.dat';

--
-- Data for Name: relationshipA; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."relationshipA" (id, date_created, date_updated, title, relation) FROM stdin;
\.
COPY public."relationshipA" (id, date_created, date_updated, title, relation) FROM '$$PATH$$/3454.dat';

--
-- Data for Name: relationshipB; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."relationshipB" (id, date_created, date_updated, text) FROM stdin;
\.
COPY public."relationshipB" (id, date_created, date_updated, text) FROM '$$PATH$$/3476.dat';

--
-- Name: arrays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arrays_id_seq', 2763, true);


--
-- Name: arrays_nestedArray_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."arrays_nestedArray_id_seq"', 1, false);


--
-- Name: arrays_nested_arrays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arrays_nested_arrays_id_seq', 1302, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 23011, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 99, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 65, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 18, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 31, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 14614, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: documents_arrays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_arrays_id_seq', 130, true);


--
-- Name: documents_blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_blocks_id_seq', 542, true);


--
-- Name: documents_hasManyRelations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."documents_hasManyRelations_id_seq"', 32, true);


--
-- Name: documents_relationToMany_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."documents_relationToMany_id_seq"', 1, false);


--
-- Name: documents_relationToOne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."documents_relationToOne_id_seq"', 1, true);


--
-- Name: documents_relationshipA_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."documents_relationshipA_id_seq"', 461, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 43, true);


--
-- Name: hasManyRelations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."hasManyRelations_id_seq"', 561, true);


--
-- Name: hasManyRelations_relationToMany_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."hasManyRelations_relationToMany_id_seq"', 401, true);


--
-- Name: nestedGroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."nestedGroups_id_seq"', 43, true);


--
-- Name: nested_arrays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nested_arrays_id_seq', 4871, true);


--
-- Name: relationToOne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."relationToOne_id_seq"', 562, true);


--
-- Name: relationshipB_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."relationshipB_id_seq"', 1290, true);


--
-- Name: arrays_nestedArray arrays_nestedArray_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."arrays_nestedArray"
    ADD CONSTRAINT "arrays_nestedArray_pkey" PRIMARY KEY (id);


--
-- Name: arrays_nested_arrays arrays_nested_arrays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrays_nested_arrays
    ADD CONSTRAINT arrays_nested_arrays_pkey PRIMARY KEY (id);


--
-- Name: arrays arrays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrays
    ADD CONSTRAINT arrays_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: documents_arrays documents_arrays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_arrays
    ADD CONSTRAINT documents_arrays_pkey PRIMARY KEY (id);


--
-- Name: documents_blocks documents_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_blocks
    ADD CONSTRAINT documents_blocks_pkey PRIMARY KEY (id);


--
-- Name: documents_hasManyRelations documents_hasManyRelations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_hasManyRelations"
    ADD CONSTRAINT "documents_hasManyRelations_pkey" PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: documents_relationToMany documents_relationToMany_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_relationToMany"
    ADD CONSTRAINT "documents_relationToMany_pkey" PRIMARY KEY (id);


--
-- Name: documents_relationToOne documents_relationToOne_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_relationToOne"
    ADD CONSTRAINT "documents_relationToOne_pkey" PRIMARY KEY (id);


--
-- Name: documents_relationshipA documents_relationshipA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_relationshipA"
    ADD CONSTRAINT "documents_relationshipA_pkey" PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: hasManyRelations hasManyRelations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."hasManyRelations"
    ADD CONSTRAINT "hasManyRelations_pkey" PRIMARY KEY (id);


--
-- Name: hasManyRelations_relationToMany hasManyRelations_relationToMany_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."hasManyRelations_relationToMany"
    ADD CONSTRAINT "hasManyRelations_relationToMany_pkey" PRIMARY KEY (id);


--
-- Name: nestedGroups nestedGroups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."nestedGroups"
    ADD CONSTRAINT "nestedGroups_pkey" PRIMARY KEY (id);


--
-- Name: nested_arrays nested_arrays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nested_arrays
    ADD CONSTRAINT nested_arrays_pkey PRIMARY KEY (id);


--
-- Name: relationToOne relationToOne_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."relationToOne"
    ADD CONSTRAINT "relationToOne_pkey" PRIMARY KEY (id);


--
-- Name: relationshipA relationshipA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."relationshipA"
    ADD CONSTRAINT "relationshipA_pkey" PRIMARY KEY (id);


--
-- Name: relationshipB relationshipB_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."relationshipB"
    ADD CONSTRAINT "relationshipB_pkey" PRIMARY KEY (id);


--
-- Name: arrays_nested_arrays arrays_nested_arrays_arrays_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrays_nested_arrays
    ADD CONSTRAINT arrays_nested_arrays_arrays_id_foreign FOREIGN KEY (arrays_id) REFERENCES public.arrays(id) ON DELETE SET NULL;


--
-- Name: arrays_nested_arrays arrays_nested_arrays_nested_arrays_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arrays_nested_arrays
    ADD CONSTRAINT arrays_nested_arrays_nested_arrays_id_foreign FOREIGN KEY (nested_arrays_id) REFERENCES public.nested_arrays(id) ON DELETE SET NULL;


--
-- Name: arrays_nestedArray arrays_nestedarray_arrays_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."arrays_nestedArray"
    ADD CONSTRAINT arrays_nestedarray_arrays_id_foreign FOREIGN KEY (arrays_id) REFERENCES public.arrays(id) ON DELETE SET NULL;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: documents_arrays documents_arrays_arrays_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_arrays
    ADD CONSTRAINT documents_arrays_arrays_id_foreign FOREIGN KEY (arrays_id) REFERENCES public.arrays(id) ON DELETE SET NULL;


--
-- Name: documents_arrays documents_arrays_documents_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_arrays
    ADD CONSTRAINT documents_arrays_documents_id_foreign FOREIGN KEY (documents_id) REFERENCES public.documents(id) ON DELETE SET NULL;


--
-- Name: documents_blocks documents_blocks_documents_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_blocks
    ADD CONSTRAINT documents_blocks_documents_id_foreign FOREIGN KEY (documents_id) REFERENCES public.documents(id) ON DELETE SET NULL;


--
-- Name: documents documents_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_group_foreign FOREIGN KEY ("group") REFERENCES public.groups(id) ON DELETE SET NULL;


--
-- Name: documents_hasManyRelations documents_hasmanyrelations_documents_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_hasManyRelations"
    ADD CONSTRAINT documents_hasmanyrelations_documents_id_foreign FOREIGN KEY (documents_id) REFERENCES public.documents(id) ON DELETE SET NULL;


--
-- Name: documents_relationshipA documents_relationshipa_documents_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_relationshipA"
    ADD CONSTRAINT documents_relationshipa_documents_id_foreign FOREIGN KEY (documents_id) REFERENCES public.documents(id) ON DELETE SET NULL;


--
-- Name: documents_relationshipA documents_relationshipa_relationshipa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_relationshipA"
    ADD CONSTRAINT documents_relationshipa_relationshipa_id_foreign FOREIGN KEY ("relationshipA_id") REFERENCES public."relationshipA"(id) ON DELETE SET NULL;


--
-- Name: documents_relationToMany documents_relationtomany_documents_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_relationToMany"
    ADD CONSTRAINT documents_relationtomany_documents_id_foreign FOREIGN KEY (documents_id) REFERENCES public.documents(id) ON DELETE SET NULL;


--
-- Name: documents_relationToOne documents_relationtoone_documents_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."documents_relationToOne"
    ADD CONSTRAINT documents_relationtoone_documents_id_foreign FOREIGN KEY (documents_id) REFERENCES public.documents(id) ON DELETE SET NULL;


--
-- Name: groups groups_nestedgroups_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_nestedgroups_foreign FOREIGN KEY ("nestedGroups") REFERENCES public."nestedGroups"(id) ON DELETE SET NULL;


--
-- Name: hasManyRelations_relationToMany hasmanyrelations_relationtomany_hasmanyrelations_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."hasManyRelations_relationToMany"
    ADD CONSTRAINT hasmanyrelations_relationtomany_hasmanyrelations_id_foreign FOREIGN KEY ("hasManyRelations_id") REFERENCES public."hasManyRelations"(id) ON DELETE SET NULL;


--
-- Name: nested_arrays nested_arrays_relation_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nested_arrays
    ADD CONSTRAINT nested_arrays_relation_foreign FOREIGN KEY (relation) REFERENCES public."relationshipA"(id) ON DELETE SET NULL;


--
-- Name: relationshipA relationshipa_relation_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."relationshipA"
    ADD CONSTRAINT relationshipa_relation_foreign FOREIGN KEY (relation) REFERENCES public."relationshipB"(id) ON DELETE SET NULL;


--
-- Name: relationToOne relationtoone_relation_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."relationToOne"
    ADD CONSTRAINT relationtoone_relation_foreign FOREIGN KEY (relation) REFERENCES public."relationshipA"(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           