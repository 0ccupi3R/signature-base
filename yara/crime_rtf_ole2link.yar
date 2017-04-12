rule malrtf_ole2link : exploit {
	meta:
		author = "@h3x2b <tracker _AT h3x.eu>"
		date = "2017/04/12"
		description = "Detect weaponized RTF documents with OLE2Link exploit"
	strings:
		//having objdata structure
		$rtf_olelink_01 = "\\objdata" nocase
		//hex encoded OLE2Link
		$rtf_olelink_02 = "4f4c45324c696e6b" nocase
		//hex encoded docfile magic - doc file albilae
		$rtf_olelink_03 = "d0cf11e0a1b11ae1" nocase
		//hex encoded "http://"
		$rtf_payload_01 = "68007400740070003a002f002f00" nocase
		//hex encoded "https://"
		$rtf_payload_02 = "680074007400700073003a002f002f00" nocase
		//hex encoded "ftp://"
		$rtf_payload_03 = "6600740070003a002f002f00" nocase
	condition:
		uint32be(0) == 0x7B5C7274
		and all of ($rtf_olelink_*)
		and any of ($rtf_payload_*)
}

rule rtf_objdata_urlmoniker_http {
	meta:
		author = "@nvisio_labs"
		description = "Detects malicious RTF / OLE2link plus URL Moniker"
		date = "2017/04/12"
		reference = "https://blog.nviso.be/2017/04/12/analysis-of-a-cve-2017-0199-malicious-rtf-document/"
	strings:
		$objdata = "objdata 0105000002000000" nocase
		$urlmoniker = "E0C9EA79F9BACE118C8200AA004BA90B" nocase
		$http = "68007400740070003a002f002f00" nocase
	condition:
		uint32be(0) == 0x7B5C7274 and $objdata and $urlmoniker and $http
}
