/*
Ejercicio: Generador de reportes

Descripción

En una empresa de procesamiento de documentos, se necesita implementar un sistema para generar reportes en diferentes formatos (PDF y HTML).
Todos los reportes siguen un proceso similar: conectar a la base de datos, recolectar datos, procesar la información y generar el archivo final.
Sin embargo, la forma de procesar los datos y el formato de salida varían según el tipo de reporte. 
Implementa el patrón Template Method para estandarizar el proceso de generación de reportes, 
permitiendo que las clases concretas definan las partes específicas del procesamiento y formato de salida.

Requisitos

1. Crea dos clases concretas: ReportePDF y ReporteHTML, que implementen los métodos abstractos según su formato.
2. Demuestra el uso de ambas clases.
*/

class GeneradorReporte {
    final func generarReporte() {
        conectarDB()
        recolectarDatos()
        procesarDatos()
        generarArchivo()
    }

    func conectarDB() {
        print("Conectando a la base de datos")
    }

    func recolectarDatos() {
        print("Recolectando datos de la base de datos")
    }

    func procesarDatos() {
        fatalError("Este método debe ser implementado por una subclase")
    }

    func generarArchivo() {
        fatalError("Este método debe ser implementado por una subclase")
    }
}

class ReportePDF: GeneradorReporte {
    // TODO: Implementar procesamiento de datos para PDF
    // TODO: Implementar generación de archivo PDF
}

class ReporteHTML: GeneradorReporte {
    // TODO: Implementar procesamiento de datos para HTML
    // TODO: Implementar generación de archivo HTML
}

print("Generando Reporte PDF:")
let reportePDF = ReportePDF()
reportePDF.generarReporte()

print("\nGenerando Reporte HTML:")
let reporteHTML = ReporteHTML()
reporteHTML.generarReporte()
