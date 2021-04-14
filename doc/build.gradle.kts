plugins {
    id("org.asciidoctor.jvm.convert") version "3.1.0"
}

tasks {
    "asciidoctor"(org.asciidoctor.gradle.jvm.AsciidoctorTask::class) {
        sourceDir("src")
    }
}
