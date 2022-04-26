USE UPCCommon; 
GO 

update upccommon.dbo.EndPointModulePolicyItem
set EPMPolicyItemDefault='<filter type="regex" regex="&lt;RegExFilter&gt;
&lt;RegExRule keep=&quot;0&quot;&gt;&lt;RegExObject field=&quot;1&quot; keep=&quot;1&quot; expression=&quot;EXEC-GRANTED&quot;/&gt;&lt;/RegExRule&gt;
&lt;RegExRule keep=&quot;0&quot;&gt;&lt;RegExObject field=&quot;1&quot; keep=&quot;1&quot; expression=&quot;TRUSTER-UPDATER-ADD&quot;/&gt;&lt;/RegExRule&gt;
&lt;RegExRule keep=&quot;0&quot;&gt;&lt;RegExObject field=&quot;1&quot; keep=&quot;1&quot; expression=&quot;TRUSTED-UPDATER-SOT&quot;/&gt;&lt;/RegExRule&gt;
&lt;RegExRule keep=&quot;0&quot;&gt;&lt;RegExObject field=&quot;1&quot; keep=&quot;1&quot; expression=&quot;DETECTED&quot;/&gt;&lt;/RegExRule&gt;
&lt;/RegExFilter&gt;" >
</filter>'
where EPMPolicyItemName='ApplicationControlLogMgrFilters';