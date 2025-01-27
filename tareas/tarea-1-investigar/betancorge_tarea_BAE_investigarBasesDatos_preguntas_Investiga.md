# Respuestas a las preguntas sobre los SGBD. 2º DAWs betancort_encinoso_gueton

## MySQL
- **Modelo de datos principal:** Relacional.
- **Principales características técnicas:** Open source, soporte completo para SQL, transacciones ACID, compatible con múltiples plataformas.
- **Casos de uso recomendados:** Aplicaciones web, sistemas ERP y CRM.
- **Ventajas frente a otros SGBD similares:** Amplia documentación, fácil de aprender y usar, buena integración con diversas herramientas.
- **Limitaciones o desventajas:** Menor soporte para datos no estructurados, no es ideal para escalabilidad horizontal.

## PostgreSQL
- **Modelo de datos principal:** Relacional.
- **Principales características técnicas:** Soporte avanzado para consultas, extensiones, manejo de datos JSON, transacciones ACID, alta personalización.
- **Casos de uso recomendados:** Análisis de datos, aplicaciones empresariales, sistemas de almacenamiento de datos.
- **Ventajas frente a otros SGBD similares:** Robusto, personalizable, soporte para múltiples tipos de datos.
- **Limitaciones o desventajas:** Requiere mayor experiencia técnica para configuración.

## MongoDB
- **Modelo de datos principal:** NoSQL (documentos JSON).
- **Principales características técnicas:** Sin esquema fijo, escalabilidad horizontal, soporte para consultas complejas en documentos.
- **Casos de uso recomendados:** Aplicaciones Big Data, aplicaciones móviles, IoT.
- **Ventajas frente a otros SGBD similares:** Flexibilidad en datos no estructurados, manejo eficiente de grandes volúmenes de datos.
- **Limitaciones o desventajas:** Menos eficiente en transacciones complejas, mayor uso de almacenamiento.

## Neo4j
- **Modelo de datos principal:** Grafos.
- **Principales características técnicas:** Lenguaje Cypher, optimización para consultas de relaciones, almacenamiento basado en nodos y aristas.
- **Casos de uso recomendados:** Redes sociales, motores de recomendación, análisis de grafos complejos.
- **Ventajas frente a otros SGBD similares:** Alto rendimiento en relaciones complejas, consultas rápidas.
- **Limitaciones o desventajas:** No es eficiente para datos tabulares, curva de aprendizaje en su lenguaje.

## Amazon RDS
- **Modelo de datos principal:** Depende del SGBD utilizado (relacional, NoSQL, etc.).
- **Principales características técnicas:** Gestión automática, alta disponibilidad, integración con AWS, soporte para varios motores como MySQL, PostgreSQL, etc.
- **Casos de uso recomendados:** Soluciones empresariales, aplicaciones en la nube.
- **Ventajas frente a otros SGBD similares:** Gestión simplificada, alta confiabilidad, escalabilidad.
- **Limitaciones o desventajas:** Dependencia de AWS, costos adicionales.

## Google BigQuery
- **Modelo de datos principal:** Relacional.
- **Principales características técnicas:** Analítica a gran escala, consultas SQL, integración con herramientas de Google Cloud.
- **Casos de uso recomendados:** Análisis de big data, generación de informes.
- **Ventajas frente a otros SGBD similares:** Velocidad en procesamiento de grandes volúmenes de datos, altamente escalable.
- **Limitaciones o desventajas:** Costos altos para uso continuo, requiere experiencia técnica.

## Cassandra
- **Modelo de datos principal:** NoSQL (clave-valor).
- **Principales características técnicas:** Alta disponibilidad, escalabilidad horizontal, tolerancia a fallos.
- **Casos de uso recomendados:** IoT, gestión de datos a gran escala, aplicaciones críticas.
- **Ventajas frente a otros SGBD similares:** Escritura rápida, resistente a fallos.
- **Limitaciones o desventajas:** Consultas más limitadas, menos soporte para transacciones complejas.

## ArangoDB
- **Modelo de datos principal:** Mixto (documentos y grafos).
- **Principales características técnicas:** Soporte para múltiples modelos de datos, consultas flexibles, escalabilidad.
- **Casos de uso recomendados:** Aplicaciones híbridas, grafos complejos.
- **Ventajas frente a otros SGBD similares:** Versatilidad en modelos de datos, manejo eficiente de grafos y documentos.
- **Limitaciones o desventajas:** Comunidad más pequeña, menos extensiones disponibles.

