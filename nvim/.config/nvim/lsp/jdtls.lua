return {
  cmd = { 'jdtls', '-configuration', '/home/user/.cache/jdtls/config', '-data', '/home/user/.cache/jdtls/workspace' },
  -- Files/directories that indicate the root of a Java project
  root_markers = {
    'pom.xml',        -- Maven project file
    'build.gradle',   -- Gradle build file (Groovy)
    'build.gradle.kts',-- Gradle build file (Kotlin)
    'settings.gradle', -- Gradle settings file (Groovy)
    'settings.gradle.kts', -- Gradle settings file (Kotlin)
    '.git',           -- Common version control root marker (fallback)
    -- '.project',    -- Eclipse project file (less common marker outside Eclipse IDE)
   },
  -- Filetypes this language server should activate for
  filetypes = {
    'java'
   },
}
