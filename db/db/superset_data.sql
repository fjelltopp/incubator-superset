--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-1.pgdg90+1)
-- Dumped by pg_dump version 10.5 (Debian 10.5-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ab_permission; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_permission (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ab_permission OWNER TO superset;

--
-- Name: ab_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_id_seq OWNER TO superset;

--
-- Name: ab_permission_view; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_permission_view (
    id integer NOT NULL,
    permission_id integer,
    view_menu_id integer
);


ALTER TABLE public.ab_permission_view OWNER TO superset;

--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_permission_view_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_id_seq OWNER TO superset;

--
-- Name: ab_permission_view_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_permission_view_role (
    id integer NOT NULL,
    permission_view_id integer,
    role_id integer
);


ALTER TABLE public.ab_permission_view_role OWNER TO superset;

--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_permission_view_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_role_id_seq OWNER TO superset;

--
-- Name: ab_register_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_register_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    email character varying(64) NOT NULL,
    registration_date timestamp without time zone,
    registration_hash character varying(256)
);


ALTER TABLE public.ab_register_user OWNER TO superset;

--
-- Name: ab_register_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_register_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_register_user_id_seq OWNER TO superset;

--
-- Name: ab_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_role (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.ab_role OWNER TO superset;

--
-- Name: ab_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_role_id_seq OWNER TO superset;

--
-- Name: ab_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    active boolean,
    email character varying(64) NOT NULL,
    last_login timestamp without time zone,
    login_count integer,
    fail_login_count integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.ab_user OWNER TO superset;

--
-- Name: ab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_id_seq OWNER TO superset;

--
-- Name: ab_user_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_user_role (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.ab_user_role OWNER TO superset;

--
-- Name: ab_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_role_id_seq OWNER TO superset;

--
-- Name: ab_view_menu; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_view_menu (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ab_view_menu OWNER TO superset;

--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_view_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_view_menu_id_seq OWNER TO superset;

--
-- Name: access_request; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.access_request (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    datasource_type character varying(200),
    datasource_id integer,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.access_request OWNER TO superset;

--
-- Name: access_request_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.access_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_request_id_seq OWNER TO superset;

--
-- Name: access_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.access_request_id_seq OWNED BY public.access_request.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO superset;

--
-- Name: annotation; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.annotation (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    layer_id integer,
    short_descr character varying(500),
    long_descr text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.annotation OWNER TO superset;

--
-- Name: annotation_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.annotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_id_seq OWNER TO superset;

--
-- Name: annotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.annotation_id_seq OWNED BY public.annotation.id;


--
-- Name: annotation_layer; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.annotation_layer (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    descr text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.annotation_layer OWNER TO superset;

--
-- Name: annotation_layer_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.annotation_layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_layer_id_seq OWNER TO superset;

--
-- Name: annotation_layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.annotation_layer_id_seq OWNED BY public.annotation_layer.id;


--
-- Name: clusters; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.clusters (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    cluster_name character varying(250),
    coordinator_host character varying(255),
    coordinator_port integer,
    coordinator_endpoint character varying(255),
    broker_host character varying(255),
    broker_port integer,
    broker_endpoint character varying(255),
    metadata_last_refreshed timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    cache_timeout integer,
    verbose_name character varying(250)
);


ALTER TABLE public.clusters OWNER TO superset;

--
-- Name: clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.clusters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_id_seq OWNER TO superset;

--
-- Name: clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.clusters_id_seq OWNED BY public.clusters.id;


--
-- Name: columns; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.columns (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    column_name character varying(255),
    is_active boolean,
    type character varying(32),
    groupby boolean,
    count_distinct boolean,
    sum boolean,
    max boolean,
    min boolean,
    filterable boolean,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    avg boolean,
    dimension_spec_json text,
    verbose_name character varying(1024),
    datasource_id integer
);


ALTER TABLE public.columns OWNER TO superset;

--
-- Name: columns_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.columns_id_seq OWNER TO superset;

--
-- Name: columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.columns_id_seq OWNED BY public.columns.id;


--
-- Name: css_templates; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.css_templates (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    template_name character varying(250),
    css text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.css_templates OWNER TO superset;

--
-- Name: css_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.css_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.css_templates_id_seq OWNER TO superset;

--
-- Name: css_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.css_templates_id_seq OWNED BY public.css_templates.id;


--
-- Name: dashboard_slices; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboard_slices (
    id integer NOT NULL,
    dashboard_id integer,
    slice_id integer
);


ALTER TABLE public.dashboard_slices OWNER TO superset;

--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboard_slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_slices_id_seq OWNER TO superset;

--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboard_slices_id_seq OWNED BY public.dashboard_slices.id;


--
-- Name: dashboard_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboard_user (
    id integer NOT NULL,
    user_id integer,
    dashboard_id integer
);


ALTER TABLE public.dashboard_user OWNER TO superset;

--
-- Name: dashboard_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboard_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_user_id_seq OWNER TO superset;

--
-- Name: dashboard_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboard_user_id_seq OWNED BY public.dashboard_user.id;


--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    dashboard_title character varying(500),
    position_json text,
    created_by_fk integer,
    changed_by_fk integer,
    css text,
    description text,
    slug character varying(255),
    json_metadata text
);


ALTER TABLE public.dashboards OWNER TO superset;

--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboards_id_seq OWNER TO superset;

--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboards_id_seq OWNED BY public.dashboards.id;


--
-- Name: datasources; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.datasources (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    datasource_name character varying(255),
    is_featured boolean,
    is_hidden boolean,
    description text,
    default_endpoint text,
    user_id integer,
    cluster_name character varying(250),
    created_by_fk integer,
    changed_by_fk integer,
    "offset" integer,
    cache_timeout integer,
    perm character varying(1000),
    filter_select_enabled boolean,
    params character varying(1000),
    fetch_values_from character varying(100)
);


ALTER TABLE public.datasources OWNER TO superset;

--
-- Name: datasources_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.datasources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.datasources_id_seq OWNER TO superset;

--
-- Name: datasources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.datasources_id_seq OWNED BY public.datasources.id;


--
-- Name: dbs; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dbs (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_name character varying(250),
    sqlalchemy_uri character varying(1024),
    created_by_fk integer,
    changed_by_fk integer,
    password bytea,
    cache_timeout integer,
    extra text,
    select_as_create_table_as boolean,
    allow_ctas boolean,
    expose_in_sqllab boolean,
    force_ctas_schema character varying(250),
    allow_run_async boolean,
    allow_run_sync boolean,
    allow_dml boolean,
    perm character varying(1000),
    verbose_name character varying(250),
    impersonate_user boolean,
    allow_multi_schema_metadata_fetch boolean,
    allow_csv_upload boolean DEFAULT true NOT NULL
);


ALTER TABLE public.dbs OWNER TO superset;

--
-- Name: dbs_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dbs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbs_id_seq OWNER TO superset;

--
-- Name: dbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dbs_id_seq OWNED BY public.dbs.id;


--
-- Name: favstar; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.favstar (
    id integer NOT NULL,
    user_id integer,
    class_name character varying(50),
    obj_id integer,
    dttm timestamp without time zone
);


ALTER TABLE public.favstar OWNER TO superset;

--
-- Name: favstar_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.favstar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favstar_id_seq OWNER TO superset;

--
-- Name: favstar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.favstar_id_seq OWNED BY public.favstar.id;


--
-- Name: keyvalue; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.keyvalue (
    id integer NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.keyvalue OWNER TO superset;

--
-- Name: keyvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.keyvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keyvalue_id_seq OWNER TO superset;

--
-- Name: keyvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.keyvalue_id_seq OWNED BY public.keyvalue.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    action character varying(512),
    user_id integer,
    json text,
    dttm timestamp without time zone,
    dashboard_id integer,
    slice_id integer,
    duration_ms integer,
    referrer character varying(1024)
);


ALTER TABLE public.logs OWNER TO superset;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO superset;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.metrics (
    id integer NOT NULL,
    metric_name character varying(255),
    verbose_name character varying(1024),
    metric_type character varying(32),
    json text,
    description text,
    changed_by_fk integer,
    changed_on timestamp without time zone,
    created_by_fk integer,
    created_on timestamp without time zone,
    is_restricted boolean,
    d3format character varying(128),
    warning_text text,
    datasource_id integer
);


ALTER TABLE public.metrics OWNER TO superset;

--
-- Name: metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metrics_id_seq OWNER TO superset;

--
-- Name: metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.metrics_id_seq OWNED BY public.metrics.id;


--
-- Name: query; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.query (
    id integer NOT NULL,
    client_id character varying(11) NOT NULL,
    database_id integer NOT NULL,
    tmp_table_name character varying(256),
    tab_name character varying(256),
    sql_editor_id character varying(256),
    user_id integer,
    status character varying(16),
    schema character varying(256),
    sql text,
    select_sql text,
    executed_sql text,
    "limit" integer,
    limit_used boolean,
    select_as_cta boolean,
    select_as_cta_used boolean,
    progress integer,
    rows integer,
    error_message text,
    start_time numeric(20,6),
    changed_on timestamp without time zone,
    end_time numeric(20,6),
    results_key character varying(64),
    start_running_time numeric(20,6),
    end_result_backend_time numeric(20,6),
    tracking_url text
);


ALTER TABLE public.query OWNER TO superset;

--
-- Name: query_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.query_id_seq OWNER TO superset;

--
-- Name: query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.query_id_seq OWNED BY public.query.id;


--
-- Name: saved_query; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.saved_query (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    db_id integer,
    label character varying(256),
    schema character varying(128),
    sql text,
    description text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.saved_query OWNER TO superset;

--
-- Name: saved_query_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.saved_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saved_query_id_seq OWNER TO superset;

--
-- Name: saved_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.saved_query_id_seq OWNED BY public.saved_query.id;


--
-- Name: slice_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.slice_user (
    id integer NOT NULL,
    user_id integer,
    slice_id integer
);


ALTER TABLE public.slice_user OWNER TO superset;

--
-- Name: slice_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.slice_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slice_user_id_seq OWNER TO superset;

--
-- Name: slice_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.slice_user_id_seq OWNED BY public.slice_user.id;


--
-- Name: slices; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.slices (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    slice_name character varying(250),
    druid_datasource_id integer,
    table_id integer,
    datasource_type character varying(200),
    datasource_name character varying(2000),
    viz_type character varying(250),
    params text,
    created_by_fk integer,
    changed_by_fk integer,
    description text,
    cache_timeout integer,
    perm character varying(2000),
    datasource_id integer
);


ALTER TABLE public.slices OWNER TO superset;

--
-- Name: slices_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slices_id_seq OWNER TO superset;

--
-- Name: slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.slices_id_seq OWNED BY public.slices.id;


--
-- Name: sql_metrics; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sql_metrics (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    metric_name character varying(512),
    verbose_name character varying(1024),
    metric_type character varying(32),
    table_id integer,
    expression text,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    is_restricted boolean,
    d3format character varying(128),
    warning_text text
);


ALTER TABLE public.sql_metrics OWNER TO superset;

--
-- Name: sql_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.sql_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sql_metrics_id_seq OWNER TO superset;

--
-- Name: sql_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.sql_metrics_id_seq OWNED BY public.sql_metrics.id;


--
-- Name: table_columns; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.table_columns (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_id integer,
    column_name character varying(255),
    is_dttm boolean,
    is_active boolean,
    type character varying(32),
    groupby boolean,
    count_distinct boolean,
    sum boolean,
    max boolean,
    min boolean,
    filterable boolean,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    expression text,
    verbose_name character varying(1024),
    python_date_format character varying(255),
    database_expression character varying(255),
    avg boolean
);


ALTER TABLE public.table_columns OWNER TO superset;

--
-- Name: table_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.table_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_columns_id_seq OWNER TO superset;

--
-- Name: table_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.table_columns_id_seq OWNED BY public.table_columns.id;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tables (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_name character varying(250),
    main_dttm_col character varying(250),
    default_endpoint text,
    database_id integer NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    "offset" integer,
    description text,
    is_featured boolean,
    user_id integer,
    cache_timeout integer,
    schema character varying(255),
    sql text,
    params text,
    perm character varying(1000),
    filter_select_enabled boolean,
    fetch_values_predicate character varying(1000),
    is_sqllab_view boolean DEFAULT false,
    template_params text
);


ALTER TABLE public.tables OWNER TO superset;

--
-- Name: tables_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tables_id_seq OWNER TO superset;

--
-- Name: tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tables_id_seq OWNED BY public.tables.id;


--
-- Name: url; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.url (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    url text,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.url OWNER TO superset;

--
-- Name: url_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.url_id_seq OWNER TO superset;

--
-- Name: url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.url_id_seq OWNED BY public.url.id;


--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.user_attribute (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    welcome_dashboard_id integer,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.user_attribute OWNER TO superset;

--
-- Name: user_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.user_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_attribute_id_seq OWNER TO superset;

--
-- Name: user_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.user_attribute_id_seq OWNED BY public.user_attribute.id;


--
-- Name: access_request id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.access_request ALTER COLUMN id SET DEFAULT nextval('public.access_request_id_seq'::regclass);


--
-- Name: annotation id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation ALTER COLUMN id SET DEFAULT nextval('public.annotation_id_seq'::regclass);


--
-- Name: annotation_layer id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer ALTER COLUMN id SET DEFAULT nextval('public.annotation_layer_id_seq'::regclass);


--
-- Name: clusters id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters ALTER COLUMN id SET DEFAULT nextval('public.clusters_id_seq'::regclass);


--
-- Name: columns id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns ALTER COLUMN id SET DEFAULT nextval('public.columns_id_seq'::regclass);


--
-- Name: css_templates id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates ALTER COLUMN id SET DEFAULT nextval('public.css_templates_id_seq'::regclass);


--
-- Name: dashboard_slices id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices ALTER COLUMN id SET DEFAULT nextval('public.dashboard_slices_id_seq'::regclass);


--
-- Name: dashboard_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user ALTER COLUMN id SET DEFAULT nextval('public.dashboard_user_id_seq'::regclass);


--
-- Name: dashboards id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards ALTER COLUMN id SET DEFAULT nextval('public.dashboards_id_seq'::regclass);


--
-- Name: datasources id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources ALTER COLUMN id SET DEFAULT nextval('public.datasources_id_seq'::regclass);


--
-- Name: dbs id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs ALTER COLUMN id SET DEFAULT nextval('public.dbs_id_seq'::regclass);


--
-- Name: favstar id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.favstar ALTER COLUMN id SET DEFAULT nextval('public.favstar_id_seq'::regclass);


--
-- Name: keyvalue id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.keyvalue ALTER COLUMN id SET DEFAULT nextval('public.keyvalue_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: metrics id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics ALTER COLUMN id SET DEFAULT nextval('public.metrics_id_seq'::regclass);


--
-- Name: query id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query ALTER COLUMN id SET DEFAULT nextval('public.query_id_seq'::regclass);


--
-- Name: saved_query id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query ALTER COLUMN id SET DEFAULT nextval('public.saved_query_id_seq'::regclass);


--
-- Name: slice_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user ALTER COLUMN id SET DEFAULT nextval('public.slice_user_id_seq'::regclass);


--
-- Name: slices id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices ALTER COLUMN id SET DEFAULT nextval('public.slices_id_seq'::regclass);


--
-- Name: sql_metrics id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics ALTER COLUMN id SET DEFAULT nextval('public.sql_metrics_id_seq'::regclass);


--
-- Name: table_columns id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns ALTER COLUMN id SET DEFAULT nextval('public.table_columns_id_seq'::regclass);


--
-- Name: tables id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables ALTER COLUMN id SET DEFAULT nextval('public.tables_id_seq'::regclass);


--
-- Name: url id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.url ALTER COLUMN id SET DEFAULT nextval('public.url_id_seq'::regclass);


--
-- Name: user_attribute id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute ALTER COLUMN id SET DEFAULT nextval('public.user_attribute_id_seq'::regclass);


--
-- Data for Name: ab_permission; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_permission (id, name) FROM stdin;
1	can_this_form_get
2	can_this_form_post
3	can_userinfo
4	can_show
5	can_edit
6	can_add
7	can_delete
8	can_download
9	can_list
10	resetmypassword
11	resetpasswords
12	userinfoedit
13	menu_access
14	Copy Role
15	can_chart
16	muldelete
17	yaml_export
18	mulexport
19	can_cached_key
20	can_created_dashboards
21	can_annotation_json
22	can_sql_json
23	can_sync_druid_source
24	can_slice
25	can_created_slices
26	can_tables
27	can_datasources
28	can_copy_dash
29	can_slice_json
30	can_override_role_permissions
31	can_fetch_datasource_metadata
32	can_results
33	can_fave_dashboards
34	can_filter
35	can_stop_query
36	can_profile
37	can_approve
38	can_csrf_token
39	can_schemas
40	can_search_queries
41	can_csv
42	can_add_slices
43	can_extra_table_metadata
44	can_dashboard
45	can_slice_query
46	can_explorev2
47	can_fave_dashboards_by_username
48	can_checkbox
49	can_sqllab
50	can_save_dash
51	can_fave_slices
52	can_warm_up_cache
53	can_cache_key_exist
54	can_explore
55	can_import_dashboards
56	can_recent_activity
57	can_select_star
58	can_table
59	can_request_access
60	can_explore_json
61	can_sqllab_viz
62	can_testconn
63	can_user_slices
64	can_save
65	refresh
66	can_scan_new_datasources
67	can_refresh_datasources
68	datasource_access
69	all_datasource_access
70	all_database_access
71	database_access
\.


--
-- Data for Name: ab_permission_view; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_permission_view (id, permission_id, view_menu_id) FROM stdin;
1	1	4
2	2	4
3	1	5
4	2	5
5	1	6
6	2	6
7	3	8
8	4	8
9	5	8
10	6	8
11	7	8
12	8	8
13	9	8
14	10	8
15	11	8
16	12	8
17	13	9
18	13	10
19	4	11
20	5	11
21	6	11
22	7	11
23	8	11
24	9	11
25	14	11
26	13	12
27	15	13
28	13	14
29	9	15
30	13	16
31	9	17
32	13	18
33	9	19
34	13	20
35	13	21
36	13	22
37	4	23
38	5	23
39	6	23
40	7	23
41	8	23
42	9	23
43	16	23
44	17	23
45	13	24
46	13	25
47	4	26
48	5	26
49	6	26
50	7	26
51	8	26
52	9	26
53	16	26
54	17	26
55	1	27
56	2	27
57	4	28
58	5	28
59	6	28
60	7	28
61	8	28
62	9	28
63	16	28
64	17	28
65	4	29
66	5	29
67	6	29
68	7	29
69	8	29
70	9	29
71	16	29
72	13	30
73	4	31
74	5	31
75	6	31
76	7	31
77	8	31
78	9	31
79	16	31
80	4	32
81	5	32
82	6	32
83	7	32
84	8	32
85	9	32
86	16	32
87	4	33
88	5	33
89	6	33
90	7	33
91	8	33
92	9	33
93	16	33
94	18	33
95	13	34
96	4	35
97	5	35
98	6	35
99	7	35
100	8	35
101	9	35
102	16	35
103	18	35
104	4	36
105	5	36
106	6	36
107	7	36
108	8	36
109	9	36
110	16	36
111	18	36
112	4	37
113	5	37
114	6	37
115	7	37
116	8	37
117	9	37
118	13	38
119	19	41
120	20	41
121	21	41
122	22	41
123	23	41
124	24	41
125	25	41
126	26	41
127	27	41
128	28	41
129	29	41
130	30	41
131	31	41
132	32	41
133	33	41
134	34	41
135	35	41
136	36	41
137	37	41
138	38	41
139	39	41
140	40	41
141	41	41
142	42	41
143	43	41
144	44	41
145	45	41
146	46	41
147	47	41
148	48	41
149	49	41
150	50	41
151	51	41
152	52	41
153	53	41
154	54	41
155	55	41
156	56	41
157	57	41
158	58	41
159	59	41
160	60	41
161	61	41
162	62	41
163	63	41
164	4	42
165	5	42
166	6	42
167	7	42
168	8	42
169	9	42
170	16	42
171	13	43
172	4	44
173	5	44
174	6	44
175	7	44
176	8	44
177	9	44
178	16	44
179	13	45
180	13	46
181	13	47
182	13	48
183	4	49
184	5	49
185	6	49
186	7	49
187	8	49
188	9	49
189	13	50
190	4	51
191	5	51
192	6	51
193	7	51
194	8	51
195	9	51
196	16	51
197	4	52
198	5	52
199	6	52
200	7	52
201	8	52
202	9	52
203	16	52
204	13	53
205	4	55
206	5	55
207	6	55
208	7	55
209	8	55
210	9	55
211	16	55
212	13	56
213	4	57
214	5	57
215	6	57
216	7	57
217	8	57
218	9	57
219	16	57
220	13	58
221	64	59
222	4	60
223	5	60
224	6	60
225	7	60
226	8	60
227	9	60
228	4	61
229	5	61
230	6	61
231	7	61
232	8	61
233	9	61
234	4	62
235	5	62
236	6	62
237	7	62
238	8	62
239	9	62
240	16	62
241	65	62
242	17	62
243	13	63
244	4	64
245	5	64
246	6	64
247	7	64
248	8	64
249	9	64
250	4	65
251	5	65
252	6	65
253	7	65
254	8	65
255	9	65
256	4	66
257	5	66
258	6	66
259	7	66
260	8	66
261	9	66
262	16	66
263	17	66
264	13	67
265	4	68
266	5	68
267	6	68
268	7	68
269	8	68
270	9	68
271	16	68
272	17	68
273	13	69
274	66	70
275	67	70
276	13	71
277	13	72
278	68	73
279	69	74
280	70	75
281	71	73
\.


--
-- Data for Name: ab_permission_view_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_permission_view_role (id, permission_view_id, role_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	6	1
7	7	1
8	8	1
9	9	1
10	10	1
11	11	1
12	12	1
13	13	1
14	14	1
15	15	1
16	16	1
17	17	1
18	18	1
19	19	1
20	20	1
21	21	1
22	22	1
23	23	1
24	24	1
25	25	1
26	26	1
27	27	1
28	28	1
29	29	1
30	30	1
31	31	1
32	32	1
33	33	1
34	34	1
35	35	1
36	36	1
37	37	1
38	38	1
39	39	1
40	40	1
41	41	1
42	42	1
43	43	1
44	44	1
45	45	1
46	46	1
47	47	1
48	48	1
49	49	1
50	50	1
51	51	1
52	52	1
53	53	1
54	54	1
55	55	1
56	56	1
57	57	1
58	58	1
59	59	1
60	60	1
61	61	1
62	62	1
63	63	1
64	64	1
65	65	1
66	66	1
67	67	1
68	68	1
69	69	1
70	70	1
71	71	1
72	72	1
73	73	1
74	74	1
75	75	1
76	76	1
77	77	1
78	78	1
79	79	1
80	80	1
81	81	1
82	82	1
83	83	1
84	84	1
85	85	1
86	86	1
87	87	1
88	88	1
89	89	1
90	90	1
91	91	1
92	92	1
93	93	1
94	94	1
95	95	1
96	96	1
97	97	1
98	98	1
99	99	1
100	100	1
101	101	1
102	102	1
103	103	1
104	104	1
105	105	1
106	106	1
107	107	1
108	108	1
109	109	1
110	110	1
111	111	1
112	112	1
113	113	1
114	114	1
115	115	1
116	116	1
117	117	1
118	118	1
119	119	1
120	120	1
121	121	1
122	122	1
123	123	1
124	124	1
125	125	1
126	126	1
127	127	1
128	128	1
129	129	1
130	130	1
131	131	1
132	132	1
133	133	1
134	134	1
135	135	1
136	136	1
137	137	1
138	138	1
139	139	1
140	140	1
141	141	1
142	142	1
143	143	1
144	144	1
145	145	1
146	146	1
147	147	1
148	148	1
149	149	1
150	150	1
151	151	1
152	152	1
153	153	1
154	154	1
155	155	1
156	156	1
157	157	1
158	158	1
159	159	1
160	160	1
161	161	1
162	162	1
163	163	1
164	164	1
165	165	1
166	166	1
167	167	1
168	168	1
169	169	1
170	170	1
171	171	1
172	172	1
173	173	1
174	174	1
175	175	1
176	176	1
177	177	1
178	178	1
179	179	1
180	180	1
181	181	1
182	182	1
183	183	1
184	184	1
185	185	1
186	186	1
187	187	1
188	188	1
189	189	1
190	190	1
191	191	1
192	192	1
193	193	1
194	194	1
195	195	1
196	196	1
197	197	1
198	198	1
199	199	1
200	200	1
201	201	1
202	202	1
203	203	1
204	204	1
205	205	1
206	206	1
207	207	1
208	208	1
209	209	1
210	210	1
211	211	1
212	212	1
213	213	1
214	214	1
215	215	1
216	216	1
217	217	1
218	218	1
219	219	1
220	220	1
221	221	1
222	222	1
223	223	1
224	224	1
225	225	1
226	226	1
227	227	1
228	228	1
229	229	1
230	230	1
231	231	1
232	232	1
233	233	1
234	234	1
235	235	1
236	236	1
237	237	1
238	238	1
239	239	1
240	240	1
241	241	1
242	242	1
243	243	1
244	244	1
245	245	1
246	246	1
247	247	1
248	248	1
249	249	1
250	250	1
251	251	1
252	252	1
253	253	1
254	254	1
255	255	1
256	256	1
257	257	1
258	258	1
259	259	1
260	260	1
261	261	1
262	262	1
263	263	1
264	264	1
265	265	1
266	266	1
267	267	1
268	268	1
269	269	1
270	270	1
271	271	1
272	272	1
273	273	1
274	274	1
275	275	1
276	276	1
277	277	1
278	279	1
279	280	1
280	3	3
281	4	3
282	5	3
283	6	3
284	17	3
285	26	3
286	27	3
287	28	3
288	29	3
289	30	3
290	31	3
291	32	3
292	33	3
293	34	3
294	35	3
295	37	3
296	42	3
297	45	3
298	46	3
299	47	3
300	52	3
301	55	3
302	56	3
303	57	3
304	58	3
305	59	3
306	60	3
307	61	3
308	62	3
309	63	3
310	64	3
311	65	3
312	66	3
313	67	3
314	68	3
315	69	3
316	70	3
317	71	3
318	72	3
319	73	3
320	74	3
321	75	3
322	76	3
323	77	3
324	78	3
325	79	3
326	80	3
327	81	3
328	82	3
329	83	3
330	84	3
331	85	3
332	86	3
333	87	3
334	88	3
335	89	3
336	90	3
337	91	3
338	92	3
339	93	3
340	94	3
341	95	3
342	96	3
343	97	3
344	98	3
345	99	3
346	100	3
347	101	3
348	102	3
349	103	3
350	104	3
351	105	3
352	106	3
353	107	3
354	108	3
355	109	3
356	110	3
357	111	3
358	112	3
359	113	3
360	114	3
361	115	3
362	116	3
363	117	3
364	118	3
365	119	3
366	120	3
367	121	3
368	124	3
369	125	3
370	126	3
371	127	3
372	128	3
373	129	3
374	131	3
375	132	3
376	133	3
377	134	3
378	135	3
379	136	3
380	138	3
381	139	3
382	140	3
383	141	3
384	142	3
385	143	3
386	144	3
387	145	3
388	146	3
389	147	3
390	148	3
391	149	3
392	150	3
393	151	3
394	152	3
395	153	3
396	154	3
397	155	3
398	156	3
399	157	3
400	158	3
401	159	3
402	160	3
403	161	3
404	162	3
405	163	3
406	164	3
407	165	3
408	166	3
409	167	3
410	168	3
411	169	3
412	170	3
413	171	3
414	172	3
415	173	3
416	174	3
417	175	3
418	176	3
419	177	3
420	178	3
421	179	3
422	181	3
423	182	3
424	183	3
425	184	3
426	185	3
427	186	3
428	187	3
429	188	3
430	190	3
431	191	3
432	192	3
433	193	3
434	194	3
435	195	3
436	196	3
437	197	3
438	198	3
439	199	3
440	200	3
441	201	3
442	202	3
443	203	3
444	204	3
445	205	3
446	206	3
447	207	3
448	208	3
449	209	3
450	210	3
451	211	3
452	212	3
453	213	3
454	214	3
455	215	3
456	216	3
457	217	3
458	218	3
459	219	3
460	220	3
461	221	3
462	222	3
463	223	3
464	224	3
465	225	3
466	226	3
467	227	3
468	228	3
469	229	3
470	230	3
471	231	3
472	232	3
473	233	3
474	234	3
475	235	3
476	236	3
477	237	3
478	238	3
479	239	3
480	240	3
481	241	3
482	242	3
483	243	3
484	244	3
485	245	3
486	246	3
487	247	3
488	248	3
489	249	3
490	250	3
491	251	3
492	252	3
493	253	3
494	254	3
495	255	3
496	256	3
497	261	3
498	264	3
499	265	3
500	266	3
501	267	3
502	268	3
503	269	3
504	270	3
505	271	3
506	272	3
507	273	3
508	274	3
509	275	3
510	276	3
511	279	3
512	3	4
513	4	4
514	5	4
515	6	4
516	17	4
517	26	4
518	27	4
519	28	4
520	29	4
521	30	4
522	31	4
523	32	4
524	33	4
525	34	4
526	35	4
527	37	4
528	42	4
529	45	4
530	46	4
531	47	4
532	52	4
533	55	4
534	56	4
535	57	4
536	58	4
537	59	4
538	60	4
539	61	4
540	62	4
541	64	4
542	65	4
543	66	4
544	67	4
545	68	4
546	69	4
547	70	4
548	72	4
549	73	4
550	74	4
551	75	4
552	76	4
553	77	4
554	78	4
555	80	4
556	81	4
557	82	4
558	83	4
559	84	4
560	85	4
561	87	4
562	88	4
563	89	4
564	90	4
565	91	4
566	92	4
567	94	4
568	95	4
569	96	4
570	97	4
571	98	4
572	99	4
573	100	4
574	101	4
575	103	4
576	104	4
577	105	4
578	106	4
579	107	4
580	108	4
581	109	4
582	111	4
583	112	4
584	113	4
585	114	4
586	115	4
587	116	4
588	117	4
589	118	4
590	119	4
591	120	4
592	121	4
593	124	4
594	125	4
595	126	4
596	127	4
597	128	4
598	129	4
599	131	4
600	132	4
601	133	4
602	134	4
603	135	4
604	136	4
605	138	4
606	139	4
607	140	4
608	141	4
609	142	4
610	143	4
611	144	4
612	145	4
613	146	4
614	147	4
615	148	4
616	149	4
617	150	4
618	151	4
619	152	4
620	153	4
621	154	4
622	155	4
623	156	4
624	157	4
625	158	4
626	159	4
627	160	4
628	161	4
629	162	4
630	163	4
631	164	4
632	165	4
633	166	4
634	167	4
635	168	4
636	169	4
637	171	4
638	172	4
639	173	4
640	174	4
641	175	4
642	176	4
643	177	4
644	179	4
645	181	4
646	183	4
647	184	4
648	185	4
649	186	4
650	187	4
651	188	4
652	190	4
653	191	4
654	192	4
655	193	4
656	194	4
657	195	4
658	197	4
659	198	4
660	199	4
661	200	4
662	201	4
663	202	4
664	204	4
665	205	4
666	206	4
667	207	4
668	208	4
669	209	4
670	210	4
671	212	4
672	213	4
673	214	4
674	215	4
675	216	4
676	217	4
677	218	4
678	220	4
679	221	4
680	222	4
681	227	4
682	228	4
683	233	4
684	234	4
685	239	4
686	243	4
687	244	4
688	249	4
689	250	4
690	255	4
691	256	4
692	261	4
693	264	4
694	265	4
695	270	4
696	273	4
697	274	4
698	275	4
699	276	4
700	130	5
701	137	5
702	122	6
703	140	6
704	141	6
705	149	6
706	161	6
707	179	6
708	180	6
709	181	6
710	204	6
\.


--
-- Data for Name: ab_register_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_register_user (id, first_name, last_name, username, password, email, registration_date, registration_hash) FROM stdin;
\.


--
-- Data for Name: ab_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_role (id, name) FROM stdin;
1	Admin
2	Public
3	Alpha
4	Gamma
5	granter
6	sql_lab
\.


--
-- Data for Name: ab_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_user (id, first_name, last_name, username, password, active, email, last_login, login_count, fail_login_count, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
1	admin	user	admin	pbkdf2:sha256:50000$1MrntM09$fba3548d9b8a5b147970e99e986254e21d0d0cd36290f4b9455b39457e4b5323	t	jonathan@fjelltopp.org	\N	\N	\N	2018-08-24 14:46:33.153526	2018-08-24 14:46:33.153532	\N	\N
\.


--
-- Data for Name: ab_user_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_user_role (id, user_id, role_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: ab_view_menu; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_view_menu (id, name) FROM stdin;
1	MyIndexView
2	UtilView
3	LocaleView
4	ResetPasswordView
5	ResetMyPasswordView
6	UserInfoEditView
7	AuthDBView
8	UserDBModelView
9	List Users
10	Security
11	RoleModelView
12	List Roles
13	UserStatsChartView
14	User's Statistics
15	PermissionModelView
16	Base Permissions
17	ViewMenuModelView
18	Views/Menus
19	PermissionViewModelView
20	Permission on Views/Menus
21	Import Dashboards
22	Manage
23	DatabaseView
24	Databases
25	Sources
26	DatabaseAsync
27	CsvToDatabaseView
28	DatabaseTablesAsync
29	SliceModelView
30	Charts
31	SliceAsync
32	SliceAddView
33	DashboardModelView
34	Dashboards
35	DashboardModelViewAsync
36	DashboardAddView
37	LogModelView
38	Action Log
39	KV
40	R
41	Superset
42	CssTemplateModelView
43	CSS Templates
44	CssTemplateAsyncModelView
45	SQL Editor
46	SQL Lab
47	Query Search
48	Upload a CSV
49	QueryView
50	Queries
51	SavedQueryViewApi
52	SavedQueryView
53	Saved Queries
54	SqlLab
55	AnnotationLayerModelView
56	Annotation Layers
57	AnnotationModelView
58	Annotations
59	Datasource
60	TableColumnInlineView
61	SqlMetricInlineView
62	TableModelView
63	Tables
64	DruidColumnInlineView
65	DruidMetricInlineView
66	DruidClusterModelView
67	Druid Clusters
68	DruidDatasourceModelView
69	Druid Datasources
70	Druid
71	Scan New Datasources
72	Refresh Druid Metadata
73	[main].(id:1)
74	all_datasource_access
75	all_database_access
\.


--
-- Data for Name: access_request; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.access_request (created_on, changed_on, id, datasource_type, datasource_id, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.alembic_version (version_num) FROM stdin;
1a1d627ebd8e
\.


--
-- Data for Name: annotation; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.annotation (created_on, changed_on, id, start_dttm, end_dttm, layer_id, short_descr, long_descr, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: annotation_layer; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.annotation_layer (created_on, changed_on, id, name, descr, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: clusters; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.clusters (created_on, changed_on, id, cluster_name, coordinator_host, coordinator_port, coordinator_endpoint, broker_host, broker_port, broker_endpoint, metadata_last_refreshed, created_by_fk, changed_by_fk, cache_timeout, verbose_name) FROM stdin;
\.


--
-- Data for Name: columns; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.columns (created_on, changed_on, id, column_name, is_active, type, groupby, count_distinct, sum, max, min, filterable, description, created_by_fk, changed_by_fk, avg, dimension_spec_json, verbose_name, datasource_id) FROM stdin;
\.


--
-- Data for Name: css_templates; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.css_templates (created_on, changed_on, id, template_name, css, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: dashboard_slices; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboard_slices (id, dashboard_id, slice_id) FROM stdin;
\.


--
-- Data for Name: dashboard_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboard_user (id, user_id, dashboard_id) FROM stdin;
\.


--
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboards (created_on, changed_on, id, dashboard_title, position_json, created_by_fk, changed_by_fk, css, description, slug, json_metadata) FROM stdin;
\.


--
-- Data for Name: datasources; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.datasources (created_on, changed_on, id, datasource_name, is_featured, is_hidden, description, default_endpoint, user_id, cluster_name, created_by_fk, changed_by_fk, "offset", cache_timeout, perm, filter_select_enabled, params, fetch_values_from) FROM stdin;
\.


--
-- Data for Name: dbs; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dbs (created_on, changed_on, id, database_name, sqlalchemy_uri, created_by_fk, changed_by_fk, password, cache_timeout, extra, select_as_create_table_as, allow_ctas, expose_in_sqllab, force_ctas_schema, allow_run_async, allow_run_sync, allow_dml, perm, verbose_name, impersonate_user, allow_multi_schema_metadata_fetch, allow_csv_upload) FROM stdin;
2018-08-24 14:47:03.17711	2018-08-24 14:47:03.239577	1	main	postgresql://superset:XXXXXXXXXX@postgres:5432/superset	\N	\N	\\x30413647424f4d74384f574c362f56636d39416265673d3d	\N	{\n    "metadata_params": {},\n    "engine_params": {}\n}\n	f	f	t	\N	f	t	f	[main].(id:1)	\N	f	t	t
\.


--
-- Data for Name: favstar; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.favstar (id, user_id, class_name, obj_id, dttm) FROM stdin;
\.


--
-- Data for Name: keyvalue; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.keyvalue (id, value) FROM stdin;
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.logs (id, action, user_id, json, dttm, dashboard_id, slice_id, duration_ms, referrer) FROM stdin;
\.


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.metrics (id, metric_name, verbose_name, metric_type, json, description, changed_by_fk, changed_on, created_by_fk, created_on, is_restricted, d3format, warning_text, datasource_id) FROM stdin;
\.


--
-- Data for Name: query; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.query (id, client_id, database_id, tmp_table_name, tab_name, sql_editor_id, user_id, status, schema, sql, select_sql, executed_sql, "limit", limit_used, select_as_cta, select_as_cta_used, progress, rows, error_message, start_time, changed_on, end_time, results_key, start_running_time, end_result_backend_time, tracking_url) FROM stdin;
\.


--
-- Data for Name: saved_query; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.saved_query (created_on, changed_on, id, user_id, db_id, label, schema, sql, description, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: slice_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.slice_user (id, user_id, slice_id) FROM stdin;
\.


--
-- Data for Name: slices; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.slices (created_on, changed_on, id, slice_name, druid_datasource_id, table_id, datasource_type, datasource_name, viz_type, params, created_by_fk, changed_by_fk, description, cache_timeout, perm, datasource_id) FROM stdin;
\.


--
-- Data for Name: sql_metrics; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sql_metrics (created_on, changed_on, id, metric_name, verbose_name, metric_type, table_id, expression, description, created_by_fk, changed_by_fk, is_restricted, d3format, warning_text) FROM stdin;
\.


--
-- Data for Name: table_columns; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.table_columns (created_on, changed_on, id, table_id, column_name, is_dttm, is_active, type, groupby, count_distinct, sum, max, min, filterable, description, created_by_fk, changed_by_fk, expression, verbose_name, python_date_format, database_expression, avg) FROM stdin;
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tables (created_on, changed_on, id, table_name, main_dttm_col, default_endpoint, database_id, created_by_fk, changed_by_fk, "offset", description, is_featured, user_id, cache_timeout, schema, sql, params, perm, filter_select_enabled, fetch_values_predicate, is_sqllab_view, template_params) FROM stdin;
\.


--
-- Data for Name: url; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.url (created_on, changed_on, id, url, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.user_attribute (created_on, changed_on, id, user_id, welcome_dashboard_id, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Name: ab_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_id_seq', 71, true);


--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_view_id_seq', 281, true);


--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_view_role_id_seq', 710, true);


--
-- Name: ab_register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_register_user_id_seq', 1, false);


--
-- Name: ab_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_role_id_seq', 6, true);


--
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_user_id_seq', 1, true);


--
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 1, true);


--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_view_menu_id_seq', 75, true);


--
-- Name: access_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.access_request_id_seq', 1, false);


--
-- Name: annotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.annotation_id_seq', 1, false);


--
-- Name: annotation_layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.annotation_layer_id_seq', 1, false);


--
-- Name: clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.clusters_id_seq', 1, false);


--
-- Name: columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.columns_id_seq', 1, false);


--
-- Name: css_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.css_templates_id_seq', 1, false);


--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboard_slices_id_seq', 1, false);


--
-- Name: dashboard_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboard_user_id_seq', 1, false);


--
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboards_id_seq', 1, false);


--
-- Name: datasources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.datasources_id_seq', 1, false);


--
-- Name: dbs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dbs_id_seq', 1, true);


--
-- Name: favstar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.favstar_id_seq', 1, false);


--
-- Name: keyvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.keyvalue_id_seq', 1, false);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.logs_id_seq', 1, false);


--
-- Name: metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.metrics_id_seq', 1, false);


--
-- Name: query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.query_id_seq', 1, false);


--
-- Name: saved_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.saved_query_id_seq', 1, false);


--
-- Name: slice_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.slice_user_id_seq', 1, false);


--
-- Name: slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.slices_id_seq', 1, false);


--
-- Name: sql_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.sql_metrics_id_seq', 1, false);


--
-- Name: table_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.table_columns_id_seq', 1, false);


--
-- Name: tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tables_id_seq', 1, false);


--
-- Name: url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.url_id_seq', 1, false);


--
-- Name: user_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.user_attribute_id_seq', 1, false);


--
-- Name: tables _customer_location_uc; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT _customer_location_uc UNIQUE (database_id, schema, table_name);


--
-- Name: ab_permission ab_permission_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_name_key UNIQUE (name);


--
-- Name: ab_permission ab_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view ab_permission_view_permission_id_view_menu_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_view_menu_id_key UNIQUE (permission_id, view_menu_id);


--
-- Name: ab_permission_view ab_permission_view_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_role_id_key UNIQUE (permission_view_id, role_id);


--
-- Name: ab_permission_view_role ab_permission_view_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_username_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_username_key UNIQUE (username);


--
-- Name: ab_role ab_role_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_name_key UNIQUE (name);


--
-- Name: ab_role ab_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user ab_user_email_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_email_key UNIQUE (email);


--
-- Name: ab_user ab_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_user_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- Name: ab_user ab_user_username_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_username_key UNIQUE (username);


--
-- Name: ab_view_menu ab_view_menu_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_name_key UNIQUE (name);


--
-- Name: ab_view_menu ab_view_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_pkey PRIMARY KEY (id);


--
-- Name: access_request access_request_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.access_request
    ADD CONSTRAINT access_request_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: annotation_layer annotation_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_pkey PRIMARY KEY (id);


--
-- Name: annotation annotation_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_pkey PRIMARY KEY (id);


--
-- Name: query client_id; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT client_id UNIQUE (client_id);


--
-- Name: clusters clusters_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_cluster_name_key UNIQUE (cluster_name);


--
-- Name: clusters clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_pkey PRIMARY KEY (id);


--
-- Name: clusters clusters_verbose_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_verbose_name_key UNIQUE (verbose_name);


--
-- Name: columns columns_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_pkey PRIMARY KEY (id);


--
-- Name: css_templates css_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_pkey PRIMARY KEY (id);


--
-- Name: dashboard_slices dashboard_slices_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_pkey PRIMARY KEY (id);


--
-- Name: dashboard_user dashboard_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_pkey PRIMARY KEY (id);


--
-- Name: dashboards dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: datasources datasources_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT datasources_pkey PRIMARY KEY (id);


--
-- Name: dbs dbs_database_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_database_name_key UNIQUE (database_name);


--
-- Name: dbs dbs_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_pkey PRIMARY KEY (id);


--
-- Name: dbs dbs_verbose_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_verbose_name_key UNIQUE (verbose_name);


--
-- Name: favstar favstar_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_pkey PRIMARY KEY (id);


--
-- Name: dashboards idx_unique_slug; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT idx_unique_slug UNIQUE (slug);


--
-- Name: keyvalue keyvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.keyvalue
    ADD CONSTRAINT keyvalue_pkey PRIMARY KEY (id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: metrics metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (id);


--
-- Name: query query_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_pkey PRIMARY KEY (id);


--
-- Name: saved_query saved_query_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_pkey PRIMARY KEY (id);


--
-- Name: slice_user slice_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_pkey PRIMARY KEY (id);


--
-- Name: slices slices_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_pkey PRIMARY KEY (id);


--
-- Name: sql_metrics sql_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_pkey PRIMARY KEY (id);


--
-- Name: table_columns table_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_pkey PRIMARY KEY (id);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- Name: columns uq_columns_column_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT uq_columns_column_name UNIQUE (column_name, datasource_id);


--
-- Name: datasources uq_datasources_cluster_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT uq_datasources_cluster_name UNIQUE (cluster_name, datasource_name);


--
-- Name: metrics uq_metrics_metric_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT uq_metrics_metric_name UNIQUE (metric_name, datasource_id);


--
-- Name: url url_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);


--
-- Name: user_attribute user_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_pkey PRIMARY KEY (id);


--
-- Name: ix_query_results_key; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_query_results_key ON public.query USING btree (results_key);


--
-- Name: ti_dag_state; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ti_dag_state ON public.annotation USING btree (layer_id, start_dttm, end_dttm);


--
-- Name: ti_user_id_changed_on; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ti_user_id_changed_on ON public.query USING btree (user_id, changed_on);


--
-- Name: ab_permission_view ab_permission_view_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.ab_permission(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_fkey FOREIGN KEY (permission_view_id) REFERENCES public.ab_permission_view(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_permission_view ab_permission_view_view_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_view_menu_id_fkey FOREIGN KEY (view_menu_id) REFERENCES public.ab_view_menu(id);


--
-- Name: ab_user ab_user_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user ab_user_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user_role ab_user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_user_role ab_user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: access_request access_request_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.access_request
    ADD CONSTRAINT access_request_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: access_request access_request_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.access_request
    ADD CONSTRAINT access_request_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation_layer annotation_layer_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation_layer annotation_layer_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_layer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_layer_id_fkey FOREIGN KEY (layer_id) REFERENCES public.annotation_layer(id);


--
-- Name: clusters clusters_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: clusters clusters_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: columns columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: columns columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: css_templates css_templates_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: css_templates css_templates_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboard_slices dashboard_slices_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: dashboard_slices dashboard_slices_slice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_slice_id_fkey FOREIGN KEY (slice_id) REFERENCES public.slices(id);


--
-- Name: dashboard_user dashboard_user_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: dashboard_user dashboard_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dashboards dashboards_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboards dashboards_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: datasources datasources_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT datasources_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: datasources datasources_cluster_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT datasources_cluster_name_fkey FOREIGN KEY (cluster_name) REFERENCES public.clusters(cluster_name);


--
-- Name: datasources datasources_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT datasources_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: datasources datasources_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT datasources_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dbs dbs_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dbs dbs_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: favstar favstar_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: columns fk_columns_datasource_id_datasources; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT fk_columns_datasource_id_datasources FOREIGN KEY (datasource_id) REFERENCES public.datasources(id);


--
-- Name: metrics fk_metrics_datasource_id_datasources; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT fk_metrics_datasource_id_datasources FOREIGN KEY (datasource_id) REFERENCES public.datasources(id);


--
-- Name: logs logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: metrics metrics_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: metrics metrics_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: query query_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: query query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_db_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_db_id_fkey FOREIGN KEY (db_id) REFERENCES public.dbs(id);


--
-- Name: saved_query saved_query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: slice_user slice_user_slice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_slice_id_fkey FOREIGN KEY (slice_id) REFERENCES public.slices(id);


--
-- Name: slice_user slice_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: slices slices_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_druid_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_druid_datasource_id_fkey FOREIGN KEY (druid_datasource_id) REFERENCES public.datasources(id);


--
-- Name: slices slices_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: sql_metrics sql_metrics_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: table_columns table_columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: tables tables_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tables tables_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tables tables_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: url url_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: url url_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_welcome_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_welcome_dashboard_id_fkey FOREIGN KEY (welcome_dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: tables user_id; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- PostgreSQL database dump complete
--

