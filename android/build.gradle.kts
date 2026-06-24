import com.android.build.gradle.BaseExtension

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// 👈 ده الكود بتاعنا السحري.. نقلناه هنا فوق عشان يشتغل صح قبل ما التقييم يخلص
subprojects {
    afterEvaluate {
        if (project.hasProperty("android")) {
            val androidExt = project.extensions.getByName("android") as BaseExtension
            if (androidExt.namespace == null) {
                androidExt.namespace = project.group.toString()
            }
        }
    }
}

// 👈 السطر ده هو اللي بيقفل التقييم، فكان لازم كودنا يبقى فوقيه
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}