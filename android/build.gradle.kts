
// 1. Konfigurasi Repositori
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// 2. Relokasi Direktori Build ke Root Proyek
afterEvaluate {
    // Tentukan direktori 'build' baru: 'root_proyek/build'
    val newBuildDir = rootProject.layout.projectDirectory.dir("build")
    
    // Set direktori build proyek root
    rootProject.layout.buildDirectory.set(newBuildDir)
    
    // Set direktori build untuk semua subproyek (misalnya: 'root_proyek/build/app')
    subprojects {
        project.layout.buildDirectory.set(newBuildDir.dir(project.name))
    }
}

// 3. Task 'clean'
tasks.register<Delete>("clean") {
    // Menghapus direktori 'build' yang telah direlokasi di root proyek
    delete(rootProject.layout.buildDirectory) 
}