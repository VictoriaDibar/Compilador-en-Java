# Compilador en Java

Proyecto académico desarrollado en el marco de la materia **Diseño de Compiladores I** (UNICEN).

## Descripción general

Este proyecto implementa un **compilador completo en Java**, que cubre las etapas clásicas de compilación:

* Análisis léxico
* Análisis sintáctico ascendente **LALR(1)**
* Análisis semántico
* Generación de **código intermedio en notación polaca inversa**
* Generación de **código Assembler x86 (32 bits)**

El compilador procesa un lenguaje diseñado por la cátedra, incorporando distintos **temas particulares** asignados al grupo.

---

## Tecnologías utilizadas

* **Lenguaje**: Java
* **Parser**: BYACC/J (YACC para Java)
* **Ejecución**: Aplicación de consola
* **Arquitectura**: Compilador monolítico por etapas

---

## Etapas del compilador

### 1. Analizador Léxico

* Implementado mediante **matriz de transición de estados** y **matriz de acciones semánticas**.
* Reconoce identificadores, constantes, palabras reservadas, operadores y símbolos especiales.
* Elimina espacios en blanco, saltos de línea y comentarios.
* Construye y mantiene una **Tabla de Símbolos dinámica**.
* Detecta y reporta errores léxicos con número de línea.

### 2. Analizador Sintáctico

* Implementado como **parser ascendente LALR(1)** usando BYACC/J.
* Verifica que el código fuente cumpla con la sintaxis del lenguaje.
* Reconoce sentencias declarativas y ejecutables.
* Reporta errores sintácticos con información de línea.

### 3. Análisis Semántico

* Manejo de **ámbitos (scope)** mediante name mangling.
* Chequeo de:

  * Variables y funciones no declaradas
  * Redeclaraciones
  * Compatibilidad de tipos
  * Uso correcto de prefijado
  * Semántica de pasaje de parámetros
* Inferencia de tipos según los temas asignados.

### 4. Generación de Código Intermedio

* Representación mediante **Polaca Inversa**.
* Generación de código para:

  * Asignaciones simples y múltiples
  * Sentencias de control
  * Invocaciones a funciones
  * Retornos simples y múltiples
  * Expresiones lambda

### 5. Generación de Código Assembler

* Traducción de la polaca inversa a **Assembler x86 (32 bits)**.
* Uso de registros para enteros y coprocesador **80x87** para punto flotante.
* Implementación de **chequeos en tiempo de ejecución**.

---

## Temas particulares implementados

El compilador implementa los siguientes temas asignados por la cátedra:

* **Tema 2** – Enteros sin signo (16 bits)
* **Tema 6** – Punto flotante de 64 bits
* **Tema 8** – Cadenas multilínea
* **Tema 11** – Reserva de nombre de variables
* **Tema 14** – Sentencia de control `do while`
* **Tema 19** – Asignaciones múltiples (sin expresiones)
* **Tema 21** – Retornos múltiples (más retornos que variables)
* **Tema 22** – Prefijado obligatorio
* **Tema 26** – Copia-Valor y Copia-Resultado
* **Tema 28** – Expresiones Lambda como parámetros
* **Tema 29** – Conversiones explícitas entero → flotante

Además:
  * Overflow en sumas de enteros
  * Overflow en productos de enteros
  * Resultados negativos en restas de enteros sin signo

---

## Entradas y salidas

### Entrada

* Archivo de código fuente pasado como parámetro al ejecutar el compilador.

### Salidas

* Errores léxicos, sintácticos y semánticos (con número de línea)
* Tabla de Símbolos
* Código intermedio (Polaca Inversa)
* Archivo con código Assembler x86

---

## Notas

* Proyecto desarrollado con fines **académicos**.
* El lenguaje compilado no corresponde a un lenguaje comercial.
* El repositorio **no incluye** binarios generados ni archivos temporales.
