Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BB82D7DFE;
	Mon, 27 Jul 2026 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161134; cv=none; b=JcjfGmsKlNLYk0vcm/gwNBe7z9l/4igdRvRdAtqc3U5rpzrayJHzXWdT9GlyzaHdgNsdaJhtHx23CidGxXnyQ6D/WnkbTcwf16tHPATBr3Jhnv0GWleZwuXACQUuYEdCzPftw2v1nG2u91Ep9mZf4ReJfc5dS2qzjjIaSvKSADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161134; c=relaxed/simple;
	bh=OQZeGKXUsu6TQIwOm3acXa7uOWFnMsujkHgHXwsfREI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGjcxNyHW/MCCqD1Ya/9ygBDs5dPzHotiaXc54rKD+6KamGGcbizHyZGIwueROEyBFha0Ou7bnGFwuuP8YFzC6PW5mF/yIZc+e31Z+rAY/PTSRJ/3+3R6gPpPhp0pS5X14QcaCxR9mLDdLGTsz08h7h9deW7dLTbeA9zdfPPng0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Apy2MLan; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Apy2MLan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785161133; x=1816697133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OQZeGKXUsu6TQIwOm3acXa7uOWFnMsujkHgHXwsfREI=;
  b=Apy2MLannQT8pYnz2NuZdGXsdP7m3fAQbL9kzEzDAGXNgcr74kxRvngb
   48IhRgYOwgtEzBf/spDKO4MZZuKO5AHA0wgvmbDeoddBelZaXTI4FlXj6
   pKl38/Wtd5CYoqB1tz1KE5vr5KjkBL08qWlr0kinACvE/SEZIHiiIS5Ix
   HJdr+abFi2761lT9NNWlQCIiDq9YHvr5JGt5DVodCqvH3p3LbSFWaDdzn
   h4vIqt/8Dh5GWpKGD3jnwZRUfsjCD36aH2KAO2zQzDMq6HqqaddtGoAjE
   Uwi3EkM4HMGVsGdmZ9/WQ4dyXio6oC9itRokPj01DO4zvGFygrkeIgkoc
   Q==;
X-CSE-ConnectionGUID: TR73UmH9RgGAB498rpWUXw==
X-CSE-MsgGUID: ZswzuU05QXiwTUbaHXTk9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85492371"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="85492371"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 07:05:32 -0700
X-CSE-ConnectionGUID: CY5ccKtFTr6pdgPK+Y7zEg==
X-CSE-MsgGUID: xqtZObY8TBChdCJJf9sC2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="257631886"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 27 Jul 2026 07:05:29 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5A13C99; Mon, 27 Jul 2026 16:05:27 +0200 (CEST)
Date: Mon, 27 Jul 2026 16:05:27 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Woody Suwalski <terraluna977@gmail.com>
Subject: Re: Kernel panic in nhi_probe()->icm_probe() - Linux 7.2-rc
Message-ID: <20260727140527.GM2365036@black.igk.intel.com>
References: <amdezCBiW4fd_DuB@mail-itl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amdezCBiW4fd_DuB@mail-itl>

Hi,

On Mon, Jul 27, 2026 at 03:36:12PM +0200, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> While testing Linux 7.2-rc5 (but it happens also with -rc1), I get the following panic:
> 
>     [    4.614392] xhci_hcd 0000:00:06.0: xHCI Host Controller
>     [    4.615892] BUG: unable to handle page fault for address: fffffffffffffff8
>     [    4.615913] #PF: supervisor read access in kernel mode
>     [    4.615929] #PF: error_code(0x0000) - not-present page
>     [    4.615936] PGD de2f067 P4D de2f067 PUD de31067 PMD 0 
>     [    4.615945] Oops: Oops: 0000 [#1] SMP NOPTI
>     [    4.615954] CPU: 1 UID: 0 PID: 321 Comm: (udev-worker) Not tainted 7.2.0-0.rc5.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full) 
>     [    4.615971] Hardware name: Xen HVM domU, BIOS 4.19.5 06/19/2026
>     [    4.615983] RIP: 0010:complete+0x43/0x80
>     [    4.616002] Code: a9 1e 01 48 89 c5 8b 03 83 f8 ff 74 05 83 c0 01 89 03 48 8b 53 10 48 8d 43 10 48 39 c2 74 35 48 8b 5b 10 31 d2 be 03 00 00 00 <48> 8b 7b f8 e8 34 a0 fc ff 48 89 df e8 5c 2f 8d 00 84 c0 74 0e 48
>     [    4.616024] RSP: 0018:ffffd573c07fb5e8 EFLAGS: 00010046
>     [    4.616032] RAX: ffff8f28c7f140b0 RBX: 0000000000000000 RCX: ffff8f28c2841e00
>     [    4.616041] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff8f28c7f140a8
>     [    4.616050] RBP: 0000000000000286 R08: ffff8f28c38e3000 R09: ffff8f28c38e3000
>     [    4.616062] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8f28c7f140a8
>     [    4.616072] R13: 0000000000000000 R14: 0000000000000000 R15: ffff8f28c87e0a20
>     [    4.616082] FS:  000077634a9b2c40(0000) GS:ffff8f293f34f000(0000) knlGS:0000000000000000
>     [    4.616092] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [    4.616103] CR2: fffffffffffffff8 CR3: 000000000fe89003 CR4: 0000000000770ef0
>     [    4.616115] PKRU: 55555554
>     [    4.616120] Call Trace:
>     [    4.616124]  <TASK>
>     [    4.616127]  device_release+0x43/0x90
>     [    4.616135]  kobject_cleanup+0x3c/0x180
>     [    4.616142]  icm_probe+0x19c/0x550 [thunderbolt]
>     [    4.616172]  nhi_probe+0x1a4/0x370 [thunderbolt]
>     [    4.616193]  local_pci_probe+0x41/0x90
>     [    4.616201]  pci_call_probe+0x5b/0x1a0
>     [    4.616207]  ? kernfs_activate+0x4c/0x60
>     [    4.616213]  ? kernfs_add_one+0x15a/0x160
>     [    4.616219]  ? _raw_spin_unlock+0xe/0x30
>     [    4.616225]  ? pci_match_device+0x155/0x170
>     [    4.616231]  pci_device_probe+0x9b/0x170
>     [    4.616237]  ? sysfs_do_create_link_sd+0x6e/0xe0
>     [    4.616245]  call_driver_probe+0x27/0x110
>     [    4.616250]  really_probe+0xcc/0x2c0
>     [    4.616256]  ? _raw_spin_unlock_irq+0xe/0x50
>     [    4.616263]  ? __pfx___driver_attach+0x10/0x10
>     [    4.616270]  __driver_probe_device+0x85/0x150
>     [    4.616277]  driver_probe_device+0x1f/0x90
>     [    4.616283]  __driver_attach+0xba/0x1f0
>     [    4.616288]  bus_for_each_dev+0x8e/0xe0
>     [    4.616295]  bus_add_driver+0xfb/0x2b0
>     [    4.616302]  driver_register+0x72/0xd0
>     [    4.616307]  nhi_init+0x60/0xff0 [thunderbolt]
>     [    4.616327]  ? __pfx_init_module+0x10/0x10 [thunderbolt]
>     [    4.616344]  do_one_initcall+0x5c/0x300
>     [    4.616352]  do_init_module+0x99/0x2f0
>     [    4.616358]  init_module_from_file+0xd6/0x130
>     [    4.616367]  idempotent_init_module+0x114/0x310
>     [    4.616377]  __x64_sys_finit_module+0x71/0xe0
>     [    4.616385]  do_syscall_64+0xe8/0x530
>     [    4.616392]  ? do_iter_readv_writev+0x1f5/0x250
>     [    4.616401]  ? vfs_iter_read+0xe0/0x140
>     [    4.616407]  ? ovl_file_accessed+0x2a/0xa0 [overlay]
>     [    4.616424]  ? backing_file_read_iter+0x16f/0x230
>     [    4.616433]  ? ovl_read_iter+0x92/0xa0 [overlay]
>     [    4.616445]  ? __pfx_ovl_file_accessed+0x10/0x10 [overlay]
>     [    4.616457]  ? vfs_read+0x25d/0x370
>     [    4.616464]  ? switch_fpu_return+0x50/0xd0
>     [    4.616470]  ? arch_exit_to_user_mode_prepare.isra.0+0x84/0xa0
>     [    4.616480]  ? do_syscall_64+0x124/0x530
>     [    4.616486]  ? seccomp_run_filters+0x14b/0x240
>     [    4.616495]  ? __seccomp_filter+0x50/0x360
>     [    4.616501]  ? do_syscall_64+0x9d/0x530
>     [    4.616507]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>     [    4.616515] RIP: 0033:0x77634b30030d
>     [    4.616522] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 5a 0f 00 f7 d8 64 89 01 48
>     [    4.616544] RSP: 002b:00007ffc6dc679d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>     [    4.616554] RAX: ffffffffffffffda RBX: 00006240351b2a60 RCX: 000077634b30030d
>     [    4.616570] RDX: 0000000000000000 RSI: 000077634a9325e1 RDI: 000000000000001c
>     [    4.616579] RBP: 00007ffc6dc67a70 R08: 0000000000000000 R09: 0000000000000000
>     [    4.616590] R10: 0000000000000000 R11: 0000000000000246 R12: 000077634a9325e1
>     [    4.616599] R13: 0000000000020000 R14: 00006240351b1830 R15: 0000000000000000
>     [    4.616610]  </TASK>
>     [    4.616614] Modules linked in: xhci_pci(+) intel_uncore(-) xhci_hcd pcspkr thunderbolt(+) floppy ehci_pci i2c_piix4 ehci_hcd ata_generic pata_acpi i2c_smbus serio_raw xen_scsiback target_core_mod xen_netback xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn i2c_dev fuse loop zram lz4hc_compress lz4_compress overlay xen_blkfront
>     [    4.616662] CR2: fffffffffffffff8
>     [    4.616668] ---[ end trace 0000000000000000 ]---
> 
> It's in a VM (on Xen) with USB controllers (PCI devices with 0c03* class)
> connected. From the VM point of view, those are:
> 
>     [    0.282416] pci 0000:00:06.0: [8086:7ec0] type 00 class 0x0c0330 conventional PCI endpoint
>     [    0.282416] pci 0000:00:06.0: BAR 0 [mem 0xf2050000-0xf205ffff 64bit]
>     [    0.282416] pci 0000:00:07.0: [8086:7ec2] type 00 class 0x0c0340 conventional PCI endpoint
>     [    0.282416] pci 0000:00:07.0: BAR 0 [mem 0xf2000000-0xf203ffff 64bit]
>     [    0.282416] pci 0000:00:07.0: BAR 2 [mem 0xf2074000-0xf2074fff 64bit]
>     [    0.282416] pci 0000:00:07.0: supports D1 D2
>     [    0.282416] pci 0000:00:08.0: [8086:7e7d] type 00 class 0x0c0330 conventional PCI endpoint
>     [    0.282416] pci 0000:00:08.0: BAR 0 [mem 0xf2060000-0xf206ffff 64bit]
> 
> Besides those PCI devices, the VM doesn't see the host's ACPI tables,
> which may be relevant to the failure (I'm not really expecting
> Thunderbolt to work in this setup). But still, it shouldn't panic... 

Agree. I think the problem is that the icm_probe() fails and then we
release the domain structure and the complete the ->domain_released but it
is not yet initialized (as also reported by Woody, CC'd).

Can you try this?

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index ffcb5a961ce8..a4816db5cacd 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1241,6 +1241,8 @@ int nhi_probe(struct tb_nhi *nhi)
 			return dev_err_probe(dev, res, "NHI specific init failed\n");
 	}
 
+	init_completion(&nhi->domain_released);
+
 	tb = nhi_select_cm(nhi);
 	if (!tb)
 		return dev_err_probe(dev, -ENODEV,
@@ -1248,8 +1250,6 @@ int nhi_probe(struct tb_nhi *nhi)
 
 	dev_dbg(dev, "NHI initialized, starting thunderbolt\n");
 
-	init_completion(&nhi->domain_released);
-
 	res = tb_domain_add(tb, host_reset);
 	if (res) {
 		/*
