/* supabase.js - small initializer for Supabase client
   Usage:
   1) Include the Supabase CDN in your HTML: <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js"></script>
   2) Include this file: <script src="supabase.js"></script>
   3) Call window.initSupabase(SUPABASE_URL, SUPABASE_KEY) and use window.supabaseClient

   SECURITY: Never commit service_role keys. For public client-side apps use anon/public keys and restrict
   access via RLS/policies. For production, inject secrets via environment or GitHub Secrets during build.
*/

(function(){
  // default safe stub (returns empty dataset) so other code won't crash if not initialized
  function makeStub(){
    return {
      from: function(){ return { select: async ()=> ({ data: [], error: null }) }; },
    };
  }

  window.supabaseClient = makeStub();

  // Initialize a real Supabase client when url/key provided
  window.initSupabase = function(url, key){
    if(!url || !key){
      console.warn('initSupabase: missing url/key — using stub client');
      window.supabaseClient = makeStub();
      return window.supabaseClient;
    }
    if(typeof supabase === 'undefined' || !supabase.createClient){
      console.warn('Supabase library not loaded. Make sure to include https://cdn.jsdelivr.net/npm/@supabase/supabase-js');
      window.supabaseClient = makeStub();
      return window.supabaseClient;
    }
    try{
      window.supabaseClient = supabase.createClient(url, key);
      return window.supabaseClient;
    }catch(e){
      console.error('initSupabase error', e);
      window.supabaseClient = makeStub();
      return window.supabaseClient;
    }
  };

})();
