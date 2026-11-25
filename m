Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626649;
	b=42ObVeeh3YlLohoqYw0SIrCr+aDJAH3rIddNBYaOi8dja5GyqDtmUH9jJQA5iLFiHlst
	 gR7XU0Q9elZeJVp5obr66OY+8zByVVMO4uW+5IS2GAb2A8l9l+8l+ADahCc+pQkbdS6zm
	 5UdtQydgDJNWPSqDu4ZuqREat08QUEieCCqF7pGlqWjM4AVT1rqBFGpwoCNLL79Oqrn7H
	 wsSgy+0WZrxt6Pmc7csXYWyoY9HQTER0icd0GaejiAs9Q3txoPJjAFi0bZ97mD5YL7T0d
	 c652dymZ3HYjQSiaSZ2D/PdWw40dorF3NtV2Ut0INUThrR1GIa5foLghnIWBoUakm6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626649;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=33+hlTd7sXFh0H9xaJfX0SbHl/ODzGiINsXMee5VZJ8=;
	b=KGvMpiVO51WFJZPa5ibTlS/t7ctWHAFFDYD8rcWDcznh7JJvsop+xu4PUU1NxzcnuC9u
	 AcA6uKP0PfBvUSZ0VIfkhz0P+X5PkU37hxJQdTJl+/olEJBrAjpEl9zTKPsn3zs8WZ8AH
	 deqhf5Z3d38m02C797+8U16OUhM+PQm9Hu9eRuWgr561M8cfHanANJEZUFPFYtOWEA03x
	 CrHx/uRftBQiYAUyymn5+QUdsO3GazA48uH9Hy+7PDT32+vxLzz26Ix46lLC9oUuqF0m9
	 tQRnoLdbE1gAYfmVkJdVkQploffGhC4o4hr2U81nea3MX5mxThzWMW37UhQ4GvXAX9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=aloebbert@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=kNiHrmW9;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E9B606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 17:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13E9B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=aloebbert@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=kNiHrmW9
DKIM2-Signature:  i=1; m=1; t=1795626646;
 mf=PGFsb2ViYmVydEBnbXguZGU+;
 rt=PGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:fN3wSu9hJYbqrYgXpapNtk8/W8Tl
   i6ZTpxeG3V7GBs5dm7NKYNUqGktPiNo+SK2JMX+vARvReNuqfzo9TlfhEWj8PFUF5JyFm5y6SjS
   FP5JVpax1L0GztIZJh3sdjXjlEy+1V0XaX6JdQW4eL0DMbvWBpu1UH4OZJr02TpPfShH6MOX3HU
   XO3NlD6H1bn7gF9y07LRzDiLCWvCS2/g6ynRcGFzdad3Y/fojHvXk2CstBe4dkfZYlZyH5+XQhM
   SpBnMAMdvHzUXIeQsvAmSiBwwhnjayPyAutu9VU6aXc0OPnmhQB5HLqzqwgeoUomgK5Nk6Njjkc
   a7oqFcXAhDtghA==;
Message-Instance:  m=1;
 h=sha256:
   DmD425gOtRiUmKcBgTWc+D9JZbAXx7SCvxHLTdN4IgY=:
   VUysFklNfa454jXpwLYyjnko+rDTEJdTT6y8iqKyMgw=,
  sha512:
   eMGe7q4YGp3ddTMpGvMj7UN/FGEtP/Jx0tAX2MaGBeCGyQccT8odYqb4Ytg1vZ3Gmt/dbDVysoBICZI1K5As6A==:
   CQtsKXTEwmhCefFJXEj1krlJDuOszpt2QhhEnOKUPzrmQ92u1AuTH26jR69FsBsDQCz3VYHwKA+Vetj9gSGLtA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795626646; x=1796231446; i=aloebbert@gmx.de;
	bh=33+hlTd7sXFh0H9xaJfX0SbHl/ODzGiINsXMee5VZJ8=;
	h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kNiHrmW9su73bLbbots7PfDnKtuOIiKcUNMNuHVEKablVFoBTSH6PZ6hIkFoFtdR
	 SNIZNKTf1NI0pHvWKerbw3EYRH9mPfu0u4tQ4iA8pzDt0sq3X0EG6IsvBCIQp62s7
	 ulr9MPiDmgqdQUfc2N769m94V1V0gKrn2Use4BYLzWjhq2mzLymTF1tarksrJzTI9
	 7Amy/jBHwxRS72XHmRJwTeezXm/2IAaqKF9XDjNpDNnv2lShjV+8/Ynf9Coe1g8fk
	 ISo78RSMeQ4NsJJ/o+F19rf5QFhao7ivQ5i3dYOIzYWPqVo/lCwQ8zLvwAsldx7OU
	 rEOqeqQIm0p/Op99Sg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmDIu-1yEQyL3RU8-00a8Qa for
 <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 18:10:45 +0100
From: Achim =?UTF-8?B?TMO2YmJlcnQ=?= <aloebbert@gmx.de>
To: linux-usb@vger.kernel.org
Subject:
 [REGRESSION/BUG] thunderbolt: ASM4242 fails to restore DP tunnel after resume
 on Ryzen 8700G (7.4-rc4)
Date: Wed, 25 Nov 2026 18:10:45 +0100
Message-ID: <UCVQtIkrSxeOKGOgiChTpA@gmx.de>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPartJt7E9vfgRhKej04ODNBNNw"
Content-Transfer-Encoding: 7Bit
X-Provags-ID: V03:K1:ChUhkH9eIomJNN/NN7Sr+StKqLG2IeOhLXcMCoYZvLB4GL3cwWN
 IKqT2oN1Xd2BnHUG1wGJSSeXPioKRVJT8ipiu36K5X2L1mBwXKLgXG3njHC1M5vlcsE6VIq
 sLCqjvJ/EgsVDYp208Wi+f7Q55HxpnLYhQKyL0pSmyPIul+CgQYSOg8v/kKXsnEz/UqcGOE
 Ud1SgOWyndT1Hf9nsy/jw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:h+8oYB4jsJk=;wnaVhc2FGBYZpTFJ+d145kGtO3U
 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
 ZwB5Ou

This is a multi-part message in MIME format.

--nextPartJt7E9vfgRhKej04ODNBNNw
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

(re-sent because previous HTML formatted message was rejected on the list)

Hi Mika, Mario,

On a desktop system with an ASMedia ASM4242 USB4 host controller
(Gigabyte X870/X870E AORUS ELITE WIFI7, BIOS F13e) paired with an
AMD Ryzen 7 8700G (Radeon 780M iGPU) and a Dell U3225QE USB4/TB4
monitor, resuming from suspend leaves the DisplayPort tunnel
unestablished (all amdgpu DP-* connectors stay "disconnected").

Workaround that reliably restores the DP tunnel:
Unbinding 0000:71:00.0 from the thunderbolt driver before suspend
and re-binding it on resume brings the DP tunnel and display back up.
Setting thunderbolt.host_reset=0 or amdgpu.dcdebugmask=0x10/0x610
does not resolve the issue.

System details:
- Kernel: 7.4.0-rc4 (Gentoo, customized)
- Board: Gigabyte X870/X870E AORUS ELITE WIFI7 (BIOS F13e)
- Host Router: ASMedia ASM4242 [0000:71:00.0], NVM version: 200011.240521
- GPU: AMD Ryzen 7 8700G [0000:72:00.0]
- Monitor: Dell U3225QE (USB4 40Gbps)

Detailed dmesg (with module thunderbolt +p) and lspci -nnvvv are
attached.

Best regards,
Achim

--nextPartJt7E9vfgRhKej04ODNBNNw
Content-Disposition: attachment; filename="tb-resume-bug-dmesg.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="tb-resume-bug-dmesg.txt"

[    0.000000] Linux version 7.4.0-rc4-x86_64 (root@localhost) (x86_64-pc-linux-gnu-gcc (Gentoo 16.2.1_p20260926 p1) 16.2.1 20260926, GNU ld (Gentoo 2.47 p1) 2.47.0) #2 SMP PREEMPT_DYNAMIC Tue Nov 24 17:48:32 CET 2026
[    0.000000] Command line:  dolvm crypt_root=LABEL=localhost-luks root=LABEL=localhost-root resume=LABEL=localhost-swap acpi_enforce_resources=lax amdgpu.dcdebugmask=0x610 thunderbolt.host_reset=0
[... part deleted]
[    0.644203] ACPI: PM: (supports S0 S3 S4 S5)
[... part deleted]
[  185.368350] PM: suspend entry (deep)
[  185.385922] Filesystems sync: 0.017 seconds
[  185.397217] Freezing user space processes
[  185.423474] Bluetooth: hci0: ACL packet for unknown connection handle 512
[  185.458694] Freezing user space processes completed (elapsed 0.061 seconds)
[  185.458706] OOM killer disabled.
[  185.458708] Freezing remaining freezable tasks
[  185.459927] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[  185.459956] printk: Suspending console(s) (use no_console_suspend to debug)
[  185.473225] queueing ieee80211 work while going to suspend
[  185.533577] sd 1:0:0:0: [sda] Synchronizing SCSI cache
[  185.533935] ata2.00: Entering standby power mode
[  185.565466] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event trb
[  185.565862] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event trb
[  185.583882] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event trb
[  185.603921] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event trb
[  186.868741] PM: suspend devices took 1.410 seconds
[  187.065157] thunderbolt 0000:71:00.0: suspending...
[  187.065160] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): deactivating
[  187.065736] thunderbolt 0000:71:00.0: deactivating Video path from 0:10 to 1:13
[  187.066231] thunderbolt 0000:71:00.0: 1:1: adding -18 NFC credits to 38
[  187.066287] thunderbolt 0000:71:00.0: deactivating AUX TX path from 0:10 to 1:13
[  187.066696] thunderbolt 0000:71:00.0: deactivating AUX RX path from 1:13 to 0:10
[  187.067185] thunderbolt 0000:71:00.0: 0:10: detached from bandwidth group 1
[  187.067587] thunderbolt 0000:71:00.0: 0: released DP resource for port 10
[  187.067591] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): reclaiming unused bandwidth
[  187.067820] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000/36000 Mb/s
[  187.067948] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000/36000 Mb/s
[  187.068002] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): available bandwidth 36000/36000 Mb/s
[  187.068619] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 2198/2198, scale 0
[  187.069031] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
[  187.069039] thunderbolt 0000:71:00.0: 0: suspending switch
[  187.069041] thunderbolt 0000:71:00.0: 1: suspending switch
[  187.069044] thunderbolt 0000:71:00.0: 1: enabling wakeup: 0x1f
[  187.069679] thunderbolt 0000:71:00.0: 0: enabling wakeup: 0x1f
[  187.070717] thunderbolt 0000:71:00.0: suspend finished
[  187.070719] thunderbolt 0000:71:00.0: stopping RX ring 0
[  187.070724] thunderbolt 0000:71:00.0: disabling interrupt at register 0x38200 bit 21 (0x200001 -> 0x1)
[  187.070739] thunderbolt 0000:71:00.0: stopping TX ring 0
[  187.070743] thunderbolt 0000:71:00.0: disabling interrupt at register 0x38200 bit 0 (0x1 -> 0x0)
[  187.070754] thunderbolt 0000:71:00.0: control channel stopped
[  187.254505] ACPI: PM: Preparing to enter system sleep state S3
[  187.565267] ACPI: PM: Saving platform NVS memory
[  187.565735] Disabling non-boot CPUs ...
[  187.567800] smpboot: CPU 15 is now offline
[  187.569955] smpboot: CPU 14 is now offline
[  187.571930] smpboot: CPU 13 is now offline
[  187.574040] smpboot: CPU 12 is now offline
[  187.575990] smpboot: CPU 11 is now offline
[  187.577965] smpboot: CPU 10 is now offline
[  187.579861] smpboot: CPU 9 is now offline
[  187.581843] smpboot: CPU 8 is now offline
[  187.582152] Spectre V2 : Update user space SMT mitigation: STIBP off
[  187.583714] smpboot: CPU 7 is now offline
[  187.585557] smpboot: CPU 6 is now offline
[  187.587392] smpboot: CPU 5 is now offline
[  187.589181] smpboot: CPU 4 is now offline
[  187.591016] smpboot: CPU 3 is now offline
[  187.592904] smpboot: CPU 2 is now offline
[  187.594936] smpboot: CPU 1 is now offline
[  187.595928] ACPI: PM: Low-level resume complete
[  187.595956] ACPI: PM: Restoring platform NVS memory
[  187.601134] AMD-Vi: Virtual APIC enabled
[  187.677184] AMD-Vi: Virtual APIC enabled
[  187.677230] LVT offset 0 assigned for vector 0x400
[  187.677915] Enabling non-boot CPUs ...
[  187.677950] smpboot: Booting Node 0 Processor 1 APIC 0x2
[  187.680634] CPU1 is up
[  187.680651] smpboot: Booting Node 0 Processor 2 APIC 0x4
[  187.683267] CPU2 is up
[  187.683282] smpboot: Booting Node 0 Processor 3 APIC 0x6
[  187.685891] CPU3 is up
[  187.685905] smpboot: Booting Node 0 Processor 4 APIC 0x8
[  187.688635] CPU4 is up
[  187.688649] smpboot: Booting Node 0 Processor 5 APIC 0xa
[  187.691314] CPU5 is up
[  187.691328] smpboot: Booting Node 0 Processor 6 APIC 0xc
[  187.693955] CPU6 is up
[  187.693970] smpboot: Booting Node 0 Processor 7 APIC 0xe
[  187.696753] CPU7 is up
[  187.696770] smpboot: Booting Node 0 Processor 8 APIC 0x1
[  187.699522] Spectre V2 : Update user space SMT mitigation: STIBP always-on
[  187.699554] CPU8 is up
[  187.699573] smpboot: Booting Node 0 Processor 9 APIC 0x3
[  187.701696] Spurious APIC interrupt (vector 0xFF) on CPU#9, should never happen.
[  187.702228] CPU9 is up
[  187.702242] smpboot: Booting Node 0 Processor 10 APIC 0x5
[  187.704367] Spurious APIC interrupt (vector 0xFF) on CPU#10, should never happen.
[  187.704902] CPU10 is up
[  187.704919] smpboot: Booting Node 0 Processor 11 APIC 0x7
[  187.707045] Spurious APIC interrupt (vector 0xFF) on CPU#11, should never happen.
[  187.707841] CPU11 is up
[  187.707872] smpboot: Booting Node 0 Processor 12 APIC 0x9
[  187.710006] Spurious APIC interrupt (vector 0xFF) on CPU#12, should never happen.
[  187.710835] CPU12 is up
[  187.710865] smpboot: Booting Node 0 Processor 13 APIC 0xb
[  187.712998] Spurious APIC interrupt (vector 0xFF) on CPU#13, should never happen.
[  187.713617] CPU13 is up
[  187.713647] smpboot: Booting Node 0 Processor 14 APIC 0xd
[  187.715780] Spurious APIC interrupt (vector 0xFF) on CPU#14, should never happen.
[  187.716360] CPU14 is up
[  187.716385] smpboot: Booting Node 0 Processor 15 APIC 0xf
[  187.718515] Spurious APIC interrupt (vector 0xFF) on CPU#15, should never happen.
[  187.719116] CPU15 is up
[  187.720799] ACPI: PM: Waking up from system sleep state S3
[  188.124774] thunderbolt 0000:71:00.0: control channel starting...
[  188.124777] thunderbolt 0000:71:00.0: starting TX ring 0
[  188.124784] thunderbolt 0000:71:00.0: enabling interrupt at register 0x38200 bit 0 (0x0 -> 0x1)
[  188.124787] thunderbolt 0000:71:00.0: starting RX ring 0
[  188.124793] thunderbolt 0000:71:00.0: enabling interrupt at register 0x38200 bit 21 (0x1 -> 0x200001)
[  188.124801] thunderbolt 0000:71:00.0: resuming...
[  188.124802] thunderbolt 0000:71:00.0: 0: resuming switch
[  188.124804] thunderbolt 0000:71:00.0: restoring Switch at 0x0 (depth: 0, up port: 5)
[  188.124968] thunderbolt 0000:71:00.0: acking hot plug event on 0:1
[  188.126331] thunderbolt 0000:71:00.0: acking hot plug event on 0:2
[  188.126385] thunderbolt 0000:71:00.0: 0:1: USB4 wake: no, connection wake: no, disconnection wake: no
[  188.127387] thunderbolt 0000:71:00.0: 0:3: USB4 wake: no, connection wake: no, disconnection wake: no
[  188.127394] thunderbolt 0000:71:00.0: 0: disabling wakeup
[  188.130046] thunderbolt 0000:71:00.0: 0: TMU: supports uni-directional mode
[  188.130128] thunderbolt 0000:71:00.0: 0: TMU: current mode: off
[  188.130209] thunderbolt 0000:71:00.0: 0:1: is connected, link is up (state: 2)
[  188.130399] thunderbolt 0000:71:00.0: 1: resuming switch
[  188.130506] thunderbolt 0000:71:00.0: restoring Switch at 0x1 (depth: 1, up port: 1)
[  188.130700] thunderbolt 0000:71:00.0: 1: link: USB4
[  188.130703] thunderbolt 0000:71:00.0: 1: TBT3 support: yes, xHCI: no
[  188.130917] thunderbolt 0000:71:00.0: 1: PCIe wake: no, USB3 wake: no
[  188.130971] thunderbolt 0000:71:00.0: 1:1: USB4 wake: yes, connection wake: no, disconnection wake: no
[  188.131026] thunderbolt 0000:71:00.0: 1:3: USB4 wake: no, connection wake: no, disconnection wake: no
[  188.131030] thunderbolt 0000:71:00.0: 1: disabling wakeup
[  188.133844] thunderbolt 0000:71:00.0: 1: TMU: supports uni-directional mode
[  188.133955] thunderbolt 0000:71:00.0: 1: TMU: current mode: off
[  188.133962] thunderbolt 0000:71:00.0: 0: TMU: mode change off -> bi-directional, HiFi requested
[  188.134282] thunderbolt 0000:71:00.0: 0: TMU: mode set to: bi-directional, HiFi
[  188.134716] thunderbolt 0000:71:00.0: 0:2: is connected, link is up (state: 2)
[  188.136188] thunderbolt 0000:71:00.0: 0:2: total credits changed 174 -> 174
[  188.136243] thunderbolt 0000:71:00.0: 1:1: total credits changed 120 -> 120
[  188.136407] thunderbolt 0000:71:00.0: 1: link width set to symmetric, dual lanes
[  188.136450] thunderbolt 0000:71:00.0: acking hot unplug event on 0:2
[  188.137731] thunderbolt 0000:71:00.0: 1:1: CLx: CL0s/CL1 supported
[  188.137734] thunderbolt 0000:71:00.0: 0:1: CLx: CL0s/CL1 not supported
[  188.137736] thunderbolt 0000:71:00.0: 1: TMU: mode change off -> bi-directional, HiFi requested
[  188.137812] thunderbolt 0000:71:00.0: 0: TMU: local_time[0]=0x89ffe000
[  188.137815] thunderbolt 0000:71:00.0: 0: TMU: local_time[1]=0x000090a5
[  188.137818] thunderbolt 0000:71:00.0: 0: TMU: local_time[2]=0x00100000
[  188.138162] thunderbolt 0000:71:00.0: 1: TMU: updated local time to 0x90a589ff
[  188.139037] thunderbolt 0000:71:00.0: 1: TMU: mode set to: bi-directional, HiFi
[  188.139979] thunderbolt 0000:71:00.0: 0:6 <-> 1:9 (PCI): activating
[  188.139982] thunderbolt 0000:71:00.0: deactivating PCIe Down path from 1:9 to 0:6
[  188.140109] thunderbolt 0000:71:00.0: deactivating PCIe Up path from 0:6 to 1:9
[  188.140236] thunderbolt 0000:71:00.0: activating PCIe Down path from 1:9 to 0:6
[  188.140354] thunderbolt 0000:71:00.0: 1:9: Writing hop 0
[  188.140356] thunderbolt 0000:71:00.0: 1:9:  In HopID: 8 => Out port: 1 Out HopID: 8
[  188.140359] thunderbolt 0000:71:00.0: 1:9:   Weight: 1 Priority: 3 Credits: 7 Drop: 0 PM: 0
[  188.140362] thunderbolt 0000:71:00.0: 1:9:    Counter enabled: 0 Counter index: 2047
[  188.140364] thunderbolt 0000:71:00.0: 1:9:   Flow Control (In/Eg): 1/1 Shared Buffer (In/Eg): 0/0
[  188.140367] thunderbolt 0000:71:00.0: 1:9:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  188.140574] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[  188.140577] thunderbolt 0000:71:00.0: 0:1:  In HopID: 8 => Out port: 6 Out HopID: 8
[  188.140579] thunderbolt 0000:71:00.0: 0:1:   Weight: 1 Priority: 3 Credits: 64 Drop: 0 PM: 0
[  188.140582] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counter index: 2047
[  188.140584] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
[  188.140587] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  188.140681] thunderbolt 0000:71:00.0: PCIe Down path activation complete
[  188.140683] thunderbolt 0000:71:00.0: activating PCIe Up path from 0:6 to 1:9
[  188.140835] thunderbolt 0000:71:00.0: 0:6: Writing hop 0
[  188.140837] thunderbolt 0000:71:00.0: 0:6:  In HopID: 8 => Out port: 1 Out HopID: 8
[  188.140839] thunderbolt 0000:71:00.0: 0:6:   Weight: 1 Priority: 3 Credits: 0 Drop: 0 PM: 0
[  188.140842] thunderbolt 0000:71:00.0: 0:6:    Counter enabled: 0 Counter index: 2047
[  188.140844] thunderbolt 0000:71:00.0: 0:6:   Flow Control (In/Eg): 0/1 Shared Buffer (In/Eg): 0/0
[  188.140847] thunderbolt 0000:71:00.0: 0:6:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  188.140864] thunderbolt 0000:71:00.0: acking hot plug event on 1:13
[  188.141830] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[  188.141833] thunderbolt 0000:71:00.0: 1:1:  In HopID: 8 => Out port: 9 Out HopID: 8
[  188.141835] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 3 Credits: 32 Drop: 0 PM: 0
[  188.141837] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counter index: 2047
[  188.141840] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
[  188.141842] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  188.141900] thunderbolt 0000:71:00.0: PCIe Up path activation complete
[  188.142074] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): activating
[  188.142077] thunderbolt 0000:71:00.0: deactivating USB3 Down path from 0:8 to 1:16
[  188.142334] thunderbolt 0000:71:00.0: deactivating USB3 Up path from 1:16 to 0:8
[  188.142465] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): allocating initial bandwidth 9000/9000 Mb/s
[  188.142982] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 2198/2198, scale 0
[  188.143400] thunderbolt 0000:71:00.0: activating USB3 Down path from 0:8 to 1:16
[  188.143555] thunderbolt 0000:71:00.0: 0:8: Writing hop 0
[  188.143558] thunderbolt 0000:71:00.0: 0:8:  In HopID: 8 => Out port: 1 Out HopID: 15
[  188.143560] thunderbolt 0000:71:00.0: 0:8:   Weight: 2 Priority: 3 Credits: 0 Drop: 0 PM: 0
[  188.143562] thunderbolt 0000:71:00.0: 0:8:    Counter enabled: 0 Counter index: 2047
[  188.143565] thunderbolt 0000:71:00.0: 0:8:   Flow Control (In/Eg): 0/1 Shared Buffer (In/Eg): 0/0
[  188.143567] thunderbolt 0000:71:00.0: 0:8:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  188.143768] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[  188.143770] thunderbolt 0000:71:00.0: 1:1:  In HopID: 15 => Out port: 16 Out HopID: 8
[  188.143773] thunderbolt 0000:71:00.0: 1:1:   Weight: 2 Priority: 3 Credits: 14 Drop: 0 PM: 0
[  188.143775] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counter index: 2047
[  188.143777] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
[  188.143779] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  188.143839] thunderbolt 0000:71:00.0: USB3 Down path activation complete
[  188.143842] thunderbolt 0000:71:00.0: activating USB3 Up path from 1:16 to 0:8
[  188.143962] thunderbolt 0000:71:00.0: 1:16: Writing hop 0
[  188.143964] thunderbolt 0000:71:00.0: 1:16:  In HopID: 8 => Out port: 1 Out HopID: 15
[  188.143967] thunderbolt 0000:71:00.0: 1:16:   Weight: 2 Priority: 3 Credits: 2 Drop: 0 PM: 0
[  188.143969] thunderbolt 0000:71:00.0: 1:16:    Counter enabled: 0 Counter index: 2047
[  188.143971] thunderbolt 0000:71:00.0: 1:16:   Flow Control (In/Eg): 1/1 Shared Buffer (In/Eg): 0/0
[  188.143974] thunderbolt 0000:71:00.0: 1:16:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  188.144187] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[  188.144189] thunderbolt 0000:71:00.0: 0:1:  In HopID: 15 => Out port: 8 Out HopID: 8
[  188.144191] thunderbolt 0000:71:00.0: 0:1:   Weight: 2 Priority: 3 Credits: 64 Drop: 0 PM: 0
[  188.144194] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counter index: 2047
[  188.144196] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
[  188.144198] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  188.144294] thunderbolt 0000:71:00.0: USB3 Up path activation complete
[  188.144457] thunderbolt 0000:71:00.0: tunnels restarted, sleeping for 100ms
[  188.246025] thunderbolt 0000:71:00.0: resume finished
[  188.246061] thunderbolt 0000:71:00.0: 0:1: got plug event for connected port, ignoring
[  188.246083] thunderbolt 0000:71:00.0: 0:2: got plug event for connected port, ignoring
[  188.246089] thunderbolt 0000:71:00.0: 0:2: got unplug event for disconnected port, ignoring
[  188.246213] thunderbolt 0000:71:00.0: 1:13: DP OUT resource available after hotplug
[  188.246220] thunderbolt 0000:71:00.0: looking for DP IN <-> DP OUT pairs:
[  188.246223] thunderbolt 0000:71:00.0: no suitable DP IN adapter available, not tunneling
[  188.419275] pcieport 0000:00:02.2: PME: Spurious native interrupt!
[  188.420368] pci 0000:00:00.0: enhanced atomics disabled
[  188.422064] amdgpu 0000:72:00.0: [drm] PCIE GART of 512M enabled (table at 0x000000807FD00000).
[  188.422091] amdgpu 0000:72:00.0: PSP is resuming...
[  188.423041] nvme nvme0: D3 entry latency set to 10 seconds
[  188.427705] nvme nvme0: 16/0/0 default/read/poll queues
[  188.445535] amdgpu 0000:72:00.0: reserve 0x4a00000 from 0x8070000000 for PSP TMR
[  188.747944] ata3: SATA link down (SStatus 0 SControl 300)
[  188.747996] ata4: SATA link down (SStatus 0 SControl 300)
[  188.748183] ata1: SATA link down (SStatus 0 SControl 300)
[  188.905706] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[  188.912239] sd 1:0:0:0: [sda] Starting disk
[  188.918784] ata2.00: configured for UDMA/133
[  189.074254] amdgpu 0000:72:00.0: RAS: optional ras ta ucode is not available
[  189.082707] amdgpu 0000:72:00.0: RAP: optional rap ta ucode is not available
[  189.082709] amdgpu 0000:72:00.0: SECUREDISPLAY: optional securedisplay ta ucode is not available
[  189.082712] amdgpu 0000:72:00.0: SMU is resuming...
[  189.108738] amdgpu 0000:72:00.0: SMU is resumed successfully!
[  189.116296] amdgpu 0000:72:00.0: [drm] DMUB hardware initialized: version=0x08006500
[  189.136369] amdgpu 0000:72:00.0: [drm] *ERROR* lttpr_caps phy_repeater_cnt is 0x0, forcing it to 0x80.
[  189.136373] amdgpu 0000:72:00.0: [drm] *ERROR* LTTPR count is nonzero but invalid lane count reported. Assuming no LTTPR present.
[  189.156693] amdgpu 0000:72:00.0: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
[  189.156696] amdgpu 0000:72:00.0: ring gfx_0.1.0 uses VM inv eng 1 on hub 0
[  189.156698] amdgpu 0000:72:00.0: ring comp_1.0.0 uses VM inv eng 4 on hub 0
[  189.156700] amdgpu 0000:72:00.0: ring comp_1.1.0 uses VM inv eng 6 on hub 0
[  189.156702] amdgpu 0000:72:00.0: ring comp_1.2.0 uses VM inv eng 7 on hub 0
[  189.156704] amdgpu 0000:72:00.0: ring comp_1.3.0 uses VM inv eng 8 on hub 0
[  189.156706] amdgpu 0000:72:00.0: ring comp_1.0.1 uses VM inv eng 9 on hub 0
[  189.156708] amdgpu 0000:72:00.0: ring comp_1.1.1 uses VM inv eng 10 on hub 0
[  189.156710] amdgpu 0000:72:00.0: ring comp_1.2.1 uses VM inv eng 11 on hub 0
[  189.156712] amdgpu 0000:72:00.0: ring comp_1.3.1 uses VM inv eng 12 on hub 0
[  189.156714] amdgpu 0000:72:00.0: ring sdma0 uses VM inv eng 13 on hub 0
[  189.156716] amdgpu 0000:72:00.0: ring vcn_unified_0 uses VM inv eng 0 on hub 8
[  189.156718] amdgpu 0000:72:00.0: ring jpeg_dec uses VM inv eng 1 on hub 8
[  189.156720] amdgpu 0000:72:00.0: ring mes_kiq_3.1.0 uses VM inv eng 14 on hub 0
[  189.187202] PM: resume devices took 0.770 seconds
[  189.187489] OOM killer enabled.
[  189.187491] Restarting tasks: Starting
[  189.188666] Restarting tasks: Done
[  189.188675] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event trb
[  189.188677] efivarfs: resyncing variable state
[  189.188984] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event trb
[  189.192084] efivarfs: finished resyncing variable state
[  189.211574] PM: suspend exit
[  189.325750] r8169 0000:05:00.0 enp5s0: PHY [r8169-0-500:00] driver [Realtek Internal NBASE-T PHY] (irq=MAC)
[  195.743124] r8169 0000:05:00.0 enp5s0: configuring for phy/internal link mode
[  198.832626] r8169 0000:05:00.0 enp5s0: Link is Up - 1Gbps/Full - flow control off
[  202.326308] input: M720 Triathlon Keyboard as /devices/virtual/misc/uhid/0005:046D:B015.0008/input/input17
[  202.326463] input: M720 Triathlon Mouse as /devices/virtual/misc/uhid/0005:046D:B015.0008/input/input18
[  202.326759] hid-generic 0005:046D:B015.0008: input,hidraw6: BLUETOOTH HID v0.13 Keyboard [M720 Triathlon] on 44:fa:66:66:18:84
[  202.489881] elogind-daemon[2888]: Watching system buttons on /dev/input/event14 (M720 Triathlon Keyboard)

--nextPartJt7E9vfgRhKej04ODNBNNw
Content-Disposition: attachment; filename="tb-lspci.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="tb-lspci.txt"

71:00.0 USB controller [0c03]: ASMedia Technology Inc. ASM4242 USB 4 / Thunderbolt 3 Host Router [1b21:2425] (rev 01) (prog-if 40 [USB4 Host Interface])
	Subsystem: ASMedia Technology Inc. ASM4242 USB 4 / Thunderbolt 3 Host Router [1b21:2425]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupts: pin B disabled, MSI(X) routed to IRQ 33-48
	IOMMU group: 29
	Region 0: Memory at dc000000 (64-bit, non-prefetchable) [size=256K]
	Region 2: Memory at dc040000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: thunderbolt
	Kernel modules: thunderbolt

72:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Phoenix1 [Radeon 740M / 760M / 780M Graphics] [1002:15bf] (rev 06) (prog-if 00 [VGA controller])
	Subsystem: Gigabyte Technology Co., Ltd Device [1458:d000]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupts: pin B disabled, MSI(X) routed to IRQ 71
	IOMMU group: 30
	Region 0: Memory at f800000000 (64-bit, prefetchable) [size=256M]
	Region 2: Memory at dd200000 (64-bit, prefetchable) [size=2M]
	Region 4: I/O ports at e000 [size=256]
	Region 5: Memory at dd700000 (32-bit, non-prefetchable) [size=512K]
	Capabilities: <access denied>
	Kernel driver in use: amdgpu
	Kernel modules: amdgpu


--nextPartJt7E9vfgRhKej04ODNBNNw--



