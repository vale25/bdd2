--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-04-05 09:25:03 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 110708)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 110709)
-- Name: AnnoAccademico; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "AnnoAccademico" (
    "NomeAnnoX" integer,
    "NomeAnnoX-1" integer,
    "NomeAnnoX-1/X" text,
    "KAnnoAccademico" integer NOT NULL
);


ALTER TABLE "AnnoAccademico" OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 110712)
-- Name: Corso; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Corso" (
    "KCorso" integer NOT NULL,
    "CfuCorso" integer,
    "CodiceCorso" text,
    "NomeCorso" text,
    "SettoreDisciplinare" text
);


ALTER TABLE "Corso" OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 119647)
-- Name: CorsoDiStudi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "CorsoDiStudi" (
    "CodiceCorso" bigint,
    "NomeDipartimento" text,
    "CodiceDipartimento" integer,
    "DataInizioValidità" integer,
    "DataFineValidità" integer,
    "NomeCorso" text,
    "TipoCds" text,
    "KCorsoDiStudi" double precision NOT NULL
);


ALTER TABLE "CorsoDiStudi" OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 110724)
-- Name: Esami; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Esami" (
    "CfuCorso" integer,
    "Voto" integer,
    "KStudente" integer NOT NULL,
    "KCorsoDiStudi" integer NOT NULL,
    "KCorso" integer NOT NULL,
    "KTempo" integer NOT NULL,
    "KAnnoAccademico" integer NOT NULL
);


ALTER TABLE "Esami" OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 110727)
-- Name: Ingressi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Ingressi" (
    "KStudente" integer NOT NULL,
    "KTempo" integer NOT NULL,
    "KAnnoAccademico" integer NOT NULL,
    "KCorsoDiStudi" integer NOT NULL,
    "Immatricolato" integer,
    "KTipoImmatricolazione" integer NOT NULL,
    "EsitoIngresso" text
);


ALTER TABLE "Ingressi" OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 110730)
-- Name: Lauree; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Lauree" (
    "KStudente" integer NOT NULL,
    "KAnnoAccademico" integer NOT NULL,
    "KTempo" integer NOT NULL,
    "VotazioneFinale" text,
    "KCorsoDiStudi" integer NOT NULL
);


ALTER TABLE "Lauree" OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 111230)
-- Name: Studente; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Studente" (
    "KStudente" integer NOT NULL,
    "CodiceFiscale" text,
    "Sesso" text,
    "Coorte" integer,
    "Cittadinanza" text,
    "StatoResidenza" text,
    "Comune" text,
    "AnnoDiploma" integer,
    "TitoloDiStudio" text,
    "TipoScuola" text,
    "IstitutoScuola" text,
    "VotoDiploma" text,
    "NazioneDiploma" text,
    "Provincia" text,
    "Regione" text,
    "DataNascita" date
);


ALTER TABLE "Studente" OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 110739)
-- Name: Tempo; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Tempo" (
    "Anno" integer,
    "Mese" integer,
    "Giorno" integer,
    "KTempo" integer NOT NULL
);


ALTER TABLE "Tempo" OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 110742)
-- Name: TipoImmatricolazione; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "TipoImmatricolazione" (
    "TipoIngresso" text,
    "KTipoImmatricolazione" integer NOT NULL
);


ALTER TABLE "TipoImmatricolazione" OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 110748)
-- Name: TipoIscrizione; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "TipoIscrizione" (
    "AnniFuoriCorso" integer,
    "AnnoCorso" integer,
    "InCorso" integer,
    "KTipoIscrizione" integer NOT NULL
);


ALTER TABLE "TipoIscrizione" OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 110751)
-- Name: TipoUscita; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "TipoUscita" (
    "Descrizione" text,
    "KTipoUscita" integer NOT NULL
);


ALTER TABLE "TipoUscita" OWNER TO postgres;

--
-- TOC entry 2295 (class 2606 OID 111010)
-- Name: AnnoAccademico_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "AnnoAccademico"
    ADD CONSTRAINT "AnnoAccademico_pkey" PRIMARY KEY ("KAnnoAccademico");


--
-- TOC entry 2315 (class 2606 OID 119654)
-- Name: CorsoDiStudi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "CorsoDiStudi"
    ADD CONSTRAINT "CorsoDiStudi_pkey" PRIMARY KEY ("KCorsoDiStudi");


--
-- TOC entry 2297 (class 2606 OID 110760)
-- Name: Corso_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Corso"
    ADD CONSTRAINT "Corso_pkey" PRIMARY KEY ("KCorso");


--
-- TOC entry 2299 (class 2606 OID 111019)
-- Name: Esami_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_pkey" PRIMARY KEY ("KStudente", "KAnnoAccademico", "KCorsoDiStudi", "KCorso", "KTempo");


--
-- TOC entry 2301 (class 2606 OID 111119)
-- Name: Ingressi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_pkey" PRIMARY KEY ("KStudente", "KTempo", "KAnnoAccademico", "KCorsoDiStudi", "KTipoImmatricolazione");


--
-- TOC entry 2303 (class 2606 OID 111121)
-- Name: Lauree_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT "Lauree_pkey" PRIMARY KEY ("KStudente", "KAnnoAccademico", "KTempo", "KCorsoDiStudi");


--
-- TOC entry 2313 (class 2606 OID 111237)
-- Name: Studente_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Studente"
    ADD CONSTRAINT "Studente_pkey" PRIMARY KEY ("KStudente");


--
-- TOC entry 2305 (class 2606 OID 110766)
-- Name: Tempo_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Tempo"
    ADD CONSTRAINT "Tempo_pkey" PRIMARY KEY ("KTempo");


--
-- TOC entry 2307 (class 2606 OID 110768)
-- Name: TipoImmatricolazione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "TipoImmatricolazione"
    ADD CONSTRAINT "TipoImmatricolazione_pkey" PRIMARY KEY ("KTipoImmatricolazione");


--
-- TOC entry 2309 (class 2606 OID 111123)
-- Name: TipoIscrizione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "TipoIscrizione"
    ADD CONSTRAINT "TipoIscrizione_pkey" PRIMARY KEY ("KTipoIscrizione");


--
-- TOC entry 2311 (class 2606 OID 110770)
-- Name: TipoUscita_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "TipoUscita"
    ADD CONSTRAINT "TipoUscita_pkey" PRIMARY KEY ("KTipoUscita");


--
-- TOC entry 2317 (class 2606 OID 111327)
-- Name: Esami_KAnnoAccademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_KAnnoAccademico_fkey" FOREIGN KEY ("KAnnoAccademico") REFERENCES "AnnoAccademico"("KAnnoAccademico");


--
-- TOC entry 2316 (class 2606 OID 111317)
-- Name: Esami_KCorso_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_KCorso_fkey" FOREIGN KEY ("KCorso") REFERENCES "Corso"("KCorso");


--
-- TOC entry 2318 (class 2606 OID 111332)
-- Name: Esami_KStudente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_KStudente_fkey" FOREIGN KEY ("KStudente") REFERENCES "Studente"("KStudente");


--
-- TOC entry 2319 (class 2606 OID 111337)
-- Name: Esami_KTempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_KTempo_fkey" FOREIGN KEY ("KTempo") REFERENCES "Tempo"("KTempo");


--
-- TOC entry 2323 (class 2606 OID 111366)
-- Name: Ingressi_KAnnoAccademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_KAnnoAccademico_fkey" FOREIGN KEY ("KAnnoAccademico") REFERENCES "AnnoAccademico"("KAnnoAccademico");


--
-- TOC entry 2320 (class 2606 OID 111342)
-- Name: Ingressi_KStudente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_KStudente_fkey" FOREIGN KEY ("KStudente") REFERENCES "Studente"("KStudente");


--
-- TOC entry 2321 (class 2606 OID 111356)
-- Name: Ingressi_KTempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_KTempo_fkey" FOREIGN KEY ("KTempo") REFERENCES "Tempo"("KTempo");


--
-- TOC entry 2322 (class 2606 OID 111361)
-- Name: Ingressi_KTipoImmatricolazione_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_KTipoImmatricolazione_fkey" FOREIGN KEY ("KTipoImmatricolazione") REFERENCES "TipoImmatricolazione"("KTipoImmatricolazione");


--
-- TOC entry 2325 (class 2606 OID 111435)
-- Name: Lauree_KAnnoAccademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT "Lauree_KAnnoAccademico_fkey" FOREIGN KEY ("KAnnoAccademico") REFERENCES "AnnoAccademico"("KAnnoAccademico");


--
-- TOC entry 2324 (class 2606 OID 111430)
-- Name: Lauree_KStudente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT "Lauree_KStudente_fkey" FOREIGN KEY ("KStudente") REFERENCES "Studente"("KStudente");


--
-- TOC entry 2326 (class 2606 OID 111440)
-- Name: Lauree_KTempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT "Lauree_KTempo_fkey" FOREIGN KEY ("KTempo") REFERENCES "Tempo"("KTempo");


-- Completed on 2016-04-05 09:25:04 CEST

--
-- PostgreSQL database dump complete
--

