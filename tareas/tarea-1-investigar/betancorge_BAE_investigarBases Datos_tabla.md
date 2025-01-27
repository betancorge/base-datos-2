# Investigar sobre las bases de datos. 2º DAWs betancort_encinoso_gueton:

## Cuadro Comparativo

| **Nombre del SGBD** | **Tipo**        | **Modelo de datos**       | **Características principales**                                  | **Ventajas**                                    | **Limitaciones**                               | **Casos de uso**                        |
|----------------------|-----------------|---------------------------|------------------------------------------------------------------|------------------------------------------------|----------------------------------------------|-----------------------------------------|
| MySQL               | Relacional      | Tablas relacionales       | Open source, soporte a SQL, amplia comunidad, transacciones ACID | Fácil de usar, escalable, amplia documentación | Menor soporte para datos no estructurados   | Aplicaciones web, ERP, CRM             |
| PostgreSQL          | Relacional      | Tablas relacionales       | Soporte avanzado para consultas, extensiones, soporte JSON       | Altamente personalizable, muy robusto          | Configuración más compleja que MySQL         | Analítica, almacenamiento de datos      |
| MongoDB             | NoSQL           | Documentos (JSON)         | Flexible, sin esquema fijo, escalabilidad horizontal             | Manejo eficiente de datos no estructurados     | Menos eficiente en transacciones complejas   | Big Data, aplicaciones móviles          |
| Neo4j               | Orientado a grafos | Nodos y relaciones       | Lenguaje Cypher, optimizado para relaciones complejas            | Ideal para grafos complejos, consultas rápidas | No tan eficiente para datos tabulares        | Redes sociales, recomendaciones         |
| Amazon RDS          | Almacenamiento en la nube | Depende del SGBD usado | Gestión automática, alta disponibilidad, escalabilidad           | Fácil integración con AWS, manejo simplificado | Dependencia de AWS, costos adicionales      | Soluciones empresariales en la nube     |
| Google BigQuery     | Almacenamiento en la nube | Tablas relacionales    | Analítica a gran escala, consultas SQL, altamente escalable      | Muy rápido para grandes volúmenes de datos     | Costoso para uso continuo                  | Análisis de big data, reporting          |
| Cassandra           | NoSQL           | Clave-valor               | Alta disponibilidad, escalabilidad horizontal                    | Resistente a fallos, escritura rápida          | Consultas más limitadas                     | IoT, gestión de grandes volúmenes de datos |
| ArangoDB            | Orientado a grafos y documentos | Mixto         | Compatible con documentos, grafos y consultas flexibles          | Soporte para múltiples modelos de datos        | Comunidad más pequeña que otras opciones    | Grafos complejos, aplicaciones híbridas |

## Conclusión Personal

De los SGBD investigados, Neo4j me parece el más interesante debido a su especialización en grafos. Su capacidad para gestionar relaciones complejas y realizar consultas rápidas lo hace ideal para aplicaciones como redes sociales, donde las conexiones entre usuarios son clave. Además, su lenguaje Cypher es intuitivo y está optimizado para este tipo de datos, lo que facilita el desarrollo. Aunque no es tan eficiente para datos tabulares, su enfoque único lo convierte en una herramienta poderosa para casos de uso específicos.

