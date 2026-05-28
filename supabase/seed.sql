-- Seed generado por scripts/gen-seed.mjs — NO editar a mano.
-- Espeja los cursos/lecciones del Markdown a las tablas courses/lessons.
-- Idempotente: se puede correr varias veces (en el panel SQL o supabase db reset).

-- Curso: automatizar-con-claude
insert into public.courses (slug, titulo, descripcion, orden, publicado) values ('automatizar-con-claude', 'Automatizar con Claude', 'El curso avanzado. Aprendés a conectar Claude con tus archivos y servicios usando MCP, y a automatizar trabajo de verdad: que programe en tu proyecto, que trabaje con tu GitHub y que corra tareas por vos. Al terminar tenés un setup de agente potente y seguro.', 3, true)
  on conflict (slug) do update set titulo = excluded.titulo, descripcion = excluded.descripcion, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ensenanzas/automatizar-codigo-con-claude-code', 'Automatizar tareas de código con Claude Code', 1 from public.courses where slug = 'automatizar-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'mcps/filesystem', 'MCP de sistema de archivos', 2 from public.courses where slug = 'automatizar-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ensenanzas/conectar-claude-con-mcp', 'Conectar Claude a tus herramientas con MCP', 3 from public.courses where slug = 'automatizar-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'mcps/github', 'MCP de GitHub', 4 from public.courses where slug = 'automatizar-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ensenanzas/automatizar-github-con-claude', 'Automatizar tu repo de GitHub con Claude', 5 from public.courses where slug = 'automatizar-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/superpowers', 'Superpowers (plugin)', 6 from public.courses where slug = 'automatizar-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/archivo-de-instrucciones', 'Usá un archivo de instrucciones para tu agente', 7 from public.courses where slug = 'automatizar-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ensenanzas/equipar-claude-code-skills-mcps', 'Equipá tu Claude Code con skills, MCPs y plugins', 8 from public.courses where slug = 'automatizar-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/open-design', 'Open Design', 9 from public.courses where slug = 'automatizar-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;

-- Curso: automatizar-con-render
insert into public.courses (slug, titulo, descripcion, orden, publicado) values ('automatizar-con-render', 'Automatizar con Render', 'Render es una plataforma cloud para publicar tus apps, sitios, workers y bases de datos. En este curso aprendés a automatizar el despliegue: que cada push a Git publique solo, a definir tu infraestructura con un archivo render.yaml y a programar tareas con cron jobs.', 9, true)
  on conflict (slug) do update set titulo = excluded.titulo, descripcion = excluded.descripcion, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/render', 'Render', 1 from public.courses where slug = 'automatizar-con-render'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ensenanzas/automatizar-deploy-en-render', 'Automatizar tus despliegues en Render', 2 from public.courses where slug = 'automatizar-con-render'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;

-- Curso: automatizar-finanzas-con-claude
insert into public.courses (slug, titulo, descripcion, orden, publicado) values ('automatizar-finanzas-con-claude', 'Claude para finanzas y contabilidad', 'El curso para contadores, analistas y equipos financieros. Aprendés cómo Claude trabaja dentro de tus herramientas de Office y cómo usar sus agentes para cerrar el mes, conciliar, auditar y construir modelos, sin perder tu criterio profesional (que sigue siendo el centro).', 10, true)
  on conflict (slug) do update set titulo = excluded.titulo, descripcion = excluded.descripcion, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/claude', 'Claude', 1 from public.courses where slug = 'automatizar-finanzas-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/que-es-una-skill', '¿Qué es una "skill"?', 2 from public.courses where slug = 'automatizar-finanzas-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/claude-finanzas', 'Claude para servicios financieros', 3 from public.courses where slug = 'automatizar-finanzas-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ensenanzas/automatizar-finanzas-con-claude', 'Automatizar finanzas con Claude (cierre, conciliación y auditoría)', 4 from public.courses where slug = 'automatizar-finanzas-con-claude'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;

-- Curso: automatizar-whatsapp-negocios
insert into public.courses (slug, titulo, descripcion, orden, publicado) values ('automatizar-whatsapp-negocios', 'Automatizar WhatsApp para negocios', 'WhatsApp es el canal donde están tus clientes. En este curso ves todas las vías para automatizarlo: la Cloud API oficial de Meta (la directa), Twilio (vía un proveedor con SDKs) y plataformas no-code como WATI o respond.io. Aprendés cuál te conviene según si programás o no, y mandás tu primer mensaje automatizado.', 8, true)
  on conflict (slug) do update set titulo = excluded.titulo, descripcion = excluded.descripcion, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ensenanzas/automatizar-whatsapp-meta-cloud-api', 'Mandá tu primer mensaje con la WhatsApp Cloud API de Meta', 1 from public.courses where slug = 'automatizar-whatsapp-negocios'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/whatsapp-cloud-api', 'WhatsApp Cloud API (Meta)', 2 from public.courses where slug = 'automatizar-whatsapp-negocios'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/twilio-whatsapp', 'Twilio para WhatsApp', 3 from public.courses where slug = 'automatizar-whatsapp-negocios'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/360dialog', '360dialog', 4 from public.courses where slug = 'automatizar-whatsapp-negocios'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/wati', 'WATI', 5 from public.courses where slug = 'automatizar-whatsapp-negocios'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/respond-io', 'respond.io', 6 from public.courses where slug = 'automatizar-whatsapp-negocios'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/whatsapp-agentkit', 'WhatsApp AgentKit', 7 from public.courses where slug = 'automatizar-whatsapp-negocios'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;

-- Curso: crear-webs-con-ia
insert into public.courses (slug, titulo, descripcion, orden, publicado) values ('crear-webs-con-ia', 'Crear webs con IA', 'Aprendé a construir webs reales combinando IAs: generadores de UI como v0, plataformas full-stack como Lovable y Bolt, editores con agente como Claude Code y Cursor, y el deploy en Vercel. Lo importante no es una sola herramienta, sino cómo encadenarlas de la idea a la web online.', 6, true)
  on conflict (slug) do update set titulo = excluded.titulo, descripcion = excluded.descripcion, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/v0', 'v0', 1 from public.courses where slug = 'crear-webs-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/lovable', 'Lovable', 2 from public.courses where slug = 'crear-webs-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/bolt-new', 'Bolt.new', 3 from public.courses where slug = 'crear-webs-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/cursor', 'Cursor', 4 from public.courses where slug = 'crear-webs-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/claude-code', 'Claude Code', 5 from public.courses where slug = 'crear-webs-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/vercel-agent-skills', 'Vercel Agent Skills', 6 from public.courses where slug = 'crear-webs-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ensenanzas/crear-web-vinculando-ias', 'Crear una web usando varias IAs juntas', 7 from public.courses where slug = 'crear-webs-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;

-- Curso: diseno-de-imagenes-con-ia
insert into public.courses (slug, titulo, descripcion, orden, publicado) values ('diseno-de-imagenes-con-ia', 'Diseño de imágenes con IA', 'Un recorrido por las mejores herramientas de imagen con IA (Midjourney, GPT Image, Nano Banana, Ideogram y FLUX) y, sobre todo, por cómo escribir buenos prompts de imagen. Al terminar vas a saber qué herramienta usar para cada necesidad y cómo lograr el resultado que buscás.', 5, true)
  on conflict (slug) do update set titulo = excluded.titulo, descripcion = excluded.descripcion, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/prompts-de-imagen', 'Para imágenes, describí estilo, encuadre y luz', 1 from public.courses where slug = 'diseno-de-imagenes-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/canva', 'Canva', 2 from public.courses where slug = 'diseno-de-imagenes-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/midjourney', 'Midjourney', 3 from public.courses where slug = 'diseno-de-imagenes-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/gpt-image', 'GPT Image (ChatGPT / OpenAI)', 4 from public.courses where slug = 'diseno-de-imagenes-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/nano-banana', 'Nano Banana (Google Gemini)', 5 from public.courses where slug = 'diseno-de-imagenes-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/ideogram', 'Ideogram', 6 from public.courses where slug = 'diseno-de-imagenes-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/flux', 'FLUX (Black Forest Labs)', 7 from public.courses where slug = 'diseno-de-imagenes-con-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;

-- Curso: fundamentos-de-ia
insert into public.courses (slug, titulo, descripcion, orden, publicado) values ('fundamentos-de-ia', 'Fundamentos de IA', 'El curso de entrada. Aprendés qué es la IA generativa, cómo darle buenas instrucciones y a usar las herramientas más importantes (ChatGPT, Claude, Gemini). Al terminar vas a poder resolver tareas reales con IA sin sentirte perdido.', 1, true)
  on conflict (slug) do update set titulo = excluded.titulo, descripcion = excluded.descripcion, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/dar-contexto', 'Dale contexto antes de pedir', 1 from public.courses where slug = 'fundamentos-de-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/mostrar-ejemplo', 'Mostrá un ejemplo del formato que querés', 2 from public.courses where slug = 'fundamentos-de-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/chatgpt', 'ChatGPT', 3 from public.courses where slug = 'fundamentos-de-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/claude', 'Claude', 4 from public.courses where slug = 'fundamentos-de-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/gemini', 'Gemini', 5 from public.courses where slug = 'fundamentos-de-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/que-es-una-skill', '¿Qué es una "skill"?', 6 from public.courses where slug = 'fundamentos-de-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'mcps/que-es-mcp', '¿Qué es un MCP?', 7 from public.courses where slug = 'fundamentos-de-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/verificar-datos', 'Verificá siempre los datos importantes', 8 from public.courses where slug = 'fundamentos-de-ia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;

-- Curso: herramientas-gratis-google
insert into public.courses (slug, titulo, descripcion, orden, publicado) values ('herramientas-gratis-google', 'Herramientas gratis de Google', 'Google regala herramientas de IA potentes que casi nadie conoce, y todas funcionan con tu cuenta de Google, gratis y desde el navegador. En este curso vas a conocer y aplicar cada una, y a combinarlas en un flujo de trabajo: investigar, aprender, crear, probar y difundir.', 7, true)
  on conflict (slug) do update set titulo = excluded.titulo, descripcion = excluded.descripcion, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/notebooklm', 'NotebookLM', 1 from public.courses where slug = 'herramientas-gratis-google'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/illuminate', 'Google Illuminate', 2 from public.courses where slug = 'herramientas-gratis-google'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/learn-about', 'Google Learn About', 3 from public.courses where slug = 'herramientas-gratis-google'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/google-ai-studio', 'Google AI Studio', 4 from public.courses where slug = 'herramientas-gratis-google'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/google-vids', 'Google Vids', 5 from public.courses where slug = 'herramientas-gratis-google'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/google-flow', 'Google Flow', 6 from public.courses where slug = 'herramientas-gratis-google'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/google-stitch', 'Google Stitch', 7 from public.courses where slug = 'herramientas-gratis-google'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;

-- Curso: ia-en-el-dia-a-dia
insert into public.courses (slug, titulo, descripcion, orden, publicado) values ('ia-en-el-dia-a-dia', 'IA en el día a día', 'Una vez que sabés lo básico, este curso te enseña a escribir mejores prompts y a usar las herramientas que de verdad cambian tu productividad: Perplexity para investigar con fuentes, NotebookLM para estudiar, y Claude Code o Cursor para programar con un agente.', 2, true)
  on conflict (slug) do update set titulo = excluded.titulo, descripcion = excluded.descripcion, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/dividir-en-pasos', 'Dividí las tareas grandes en pasos', 1 from public.courses where slug = 'ia-en-el-dia-a-dia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/iterar-no-empezar-de-cero', 'Iterá; no empieces de cero cada vez', 2 from public.courses where slug = 'ia-en-el-dia-a-dia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/perplexity', 'Perplexity', 3 from public.courses where slug = 'ia-en-el-dia-a-dia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ias/notebooklm', 'NotebookLM', 4 from public.courses where slug = 'ia-en-el-dia-a-dia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/claude-code', 'Claude Code', 5 from public.courses where slug = 'ia-en-el-dia-a-dia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'skills/cursor', 'Cursor', 6 from public.courses where slug = 'ia-en-el-dia-a-dia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/comparar-dos-ias', 'Para lo importante, compará dos IAs', 7 from public.courses where slug = 'ia-en-el-dia-a-dia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/guardar-tus-prompts', 'Armá tu biblioteca de prompts', 8 from public.courses where slug = 'ia-en-el-dia-a-dia'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;

-- Curso: ingenieria-de-prompts
insert into public.courses (slug, titulo, descripcion, orden, publicado) values ('ingenieria-de-prompts', 'Ingeniería de prompts', 'El arte de pedirle bien a la IA. Este curso te lleva por las técnicas que de verdad cambian los resultados: dar contexto y rol, mostrar ejemplos, pedir razonamiento paso a paso y acotar el formato. Al terminar vas a armar prompts profesionales para cualquier tarea.', 4, true)
  on conflict (slug) do update set titulo = excluded.titulo, descripcion = excluded.descripcion, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/anatomia-del-prompt', 'La anatomía de un buen prompt', 1 from public.courses where slug = 'ingenieria-de-prompts'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/dar-contexto', 'Dale contexto antes de pedir', 2 from public.courses where slug = 'ingenieria-de-prompts'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/rol-y-persona', 'Asigná un rol o persona a la IA', 3 from public.courses where slug = 'ingenieria-de-prompts'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/mostrar-ejemplo', 'Mostrá un ejemplo del formato que querés', 4 from public.courses where slug = 'ingenieria-de-prompts'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/few-shot-ejemplos', 'Enseñá con ejemplos (few-shot)', 5 from public.courses where slug = 'ingenieria-de-prompts'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/cadena-de-pensamiento', 'Pedí que piense paso a paso', 6 from public.courses where slug = 'ingenieria-de-prompts'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/restricciones-y-formato', 'Acotá con restricciones y pedí un formato exacto', 7 from public.courses where slug = 'ingenieria-de-prompts'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'trucos/iterar-no-empezar-de-cero', 'Iterá; no empieces de cero cada vez', 8 from public.courses where slug = 'ingenieria-de-prompts'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;
insert into public.lessons (course_id, ref, titulo, orden) select id, 'ensenanzas/ingenieria-de-prompts-fundamentos', 'Fundamentos de la ingeniería de prompts', 9 from public.courses where slug = 'ingenieria-de-prompts'
  on conflict (course_id, ref) do update set titulo = excluded.titulo, orden = excluded.orden;

