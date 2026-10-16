Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE791D432D
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 05:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792130290; cv=none; b=KpwF6lQTR/girwk87yRaPKq3HDoL0GCl+/KO5abobzyitWpDPIHQzAoPzBYJVT9le9zlf9i0HeMK6pprpLR+k78P0gX8p0i7gZum+T9CF/SbgZFo5qlcUWdWhiq2B1Sx0zj/O4sFXVYODUcQ/54EqdxOoxtgh6cdBqkVKopIVkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792130290; c=relaxed/simple;
	bh=mJ0+jgWknR5we2n78RmwDa4v1wuJ2mX07t2yIIAgXWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hD5PQvtDbo684ORw9xUiE7FijRZl8xkKzPfYZmhYlaaPVuEVirUwxOvjQttXqUh1zh/QQ9nRK+X1jdysMurOSI7vDwaup8mF6nrU6Iz3lQejdeExQsoCsI+VXdfeM0pyCG9U2912snOwYxTY2/CvSlku9Ba8JZLwOGfB95IAfv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIir13zi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIir13zi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792130287; x=1823666287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mJ0+jgWknR5we2n78RmwDa4v1wuJ2mX07t2yIIAgXWk=;
  b=AIir13zi0bbQPIxNg1YdI5zbssz8Viwm6nUWI2PZHEMLtQF9MukXRtz7
   m78vu6d5+91E+Sy7MFxHAgotLIwRHOjH7CEU/xuHA//k8zhtmPySz9qID
   Ml/Nyim3l3RaQfRNxufT9RceoT+Gxx3z3c/SnOZx4Fj586Rfo7Y6mXMpI
   Ns/SHyQwww401GThHMTV7kfsvgbn27pnmZwh03sWCnTPpSG0jntDlqd2A
   /GfoKXYdsgPvbuANnseUSlAwgG2YC26EBOqx8EyWl95hXgrWBn4jQKQIm
   aLvZGbU2YdJ1QQRbLKPEPRJpCE8DSjF/WEl73Cgu8WClrQXvbat4pgTce
   g==;
X-CSE-ConnectionGUID: D9Kqb1yjQ8yFGe503rhntg==
X-CSE-MsgGUID: yJvT9jAlR36F2jBPIt9jdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="1013323"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1013323"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 22:58:06 -0700
X-CSE-ConnectionGUID: vjCcVtK+Q+2vXfJmbkGxYg==
X-CSE-MsgGUID: dr8irFBCS+2TFuURjk6ZUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1943344"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2026 22:58:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B43DF99; Fri, 16 Oct 2026 07:58:02 +0200 (CEST)
Date: Fri, 16 Oct 2026 07:58:02 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: =?utf-8?B?UGF3ZcWC?= Frelek <pawel.frelek@gmail.com>
Cc: westeri@kernel.org, linux-usb@vger.kernel.org, andreas.noever@gmail.com,
	YehezkelShB@gmail.com, Sanath S <Sanath.S@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [BUG] thunderbolt: NULL pointer dereference in tb_dp_dprx_work
 after device disconnect (7.2.6)
Message-ID: <20261016055802.GV176164@black.igk.intel.com>
References: <CABL4uFnCWgWdPL5s85O49sDyNADf4Lk684nx60g9wox_qOOOww@mail.gmail.com>
 <CABL4uF=f6Y06KmZ+ux2ZrboiLxivFZMyB_dqc4rTiEtiLd3GLw@mail.gmail.com>
 <20260925052929.GW106095@black.igk.intel.com>
 <CABL4uFn1nTrdxomWgAWs_gtsM5r1owt+4KOk1F39rXTLF3UZkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABL4uFn1nTrdxomWgAWs_gtsM5r1owt+4KOk1F39rXTLF3UZkg@mail.gmail.com>

Hi,

On Tue, Oct 13, 2026 at 05:31:30PM +0200, Paweł Frelek wrote:
> Hi Mika,
> 
> Following up on my earlier report about the panic in tb_dp_dprx_work.
> I now hit a different, reproducible problem: power-off hangs in
> nhi_pci_remove. It happened three times in the last few days (Oct 10,
> 11, 12).
> 
> Hardware: Lenovo ThinkPad X13 Gen 3 AMD (21CNS15T00, BIOS R22ET81W
> 1.51), ThinkPad Thunderbolt 4 Dock (40B0), firmware up to date.
> Kernel: 7.2.9-arch1-1 (Arch), cmdline includes thunderbolt.dprx_timeout=60000.
> 
> During shutdown the dock disconnects on its own a few seconds before power-off:
> 
> [24634.327865] pcieport 0000:00:04.1: pciehp: Slot(0): Link Down
> [24634.327920] pcieport 0000:00:04.1: pciehp: Slot(0): Card not present
> [24634.331648] thunderbolt 0-2: device disconnected
> 
> Then systemd reaches “Powering off” and the kernel hangs. With
> kernel.hung_task_panic=1 I got this from pstore:
> 
> INFO: task shutdown:1 blocked for more than 122 seconds.
> Tainted: G W 7.2.9-arch1-1 #1
> task:shutdown state:D stack:0 pid:1 tgid:1 ppid:0
> Call Trace:
> __schedule+0x420/0x1770
> schedule+0x27/0xa0
> schedule_timeout+0xdc/0x120
> wait_for_completion+0x9a/0x180
> nhi_pci_remove+0x53/0x60 [thunderbolt]
> pci_device_shutdown+0x3e/0x80
> device_shutdown+0x169/0x1d0
> kernel_power_off+0x35/0x80
> __do_sys_reboot+0x1da/0x260
> do_syscall_64+0xaa/0x660
> entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Kernel panic - not syncing: hung_task: blocked tasks

Okay something is still holding the domain reference.

> The full pstore dmesg is attached. I can enable thunderbolt dynamic
> debug or test patches if that helps.

Yes please. Also drop the dprx_timeout= if you don't need it (you should
not). I'm adding AMD folks here too just in case.

> Thanks,
> Paweł Frelek
> 
> 
> -- 
> Paweł Frelek   (﻿ ͡° ͜ʖ ͡°)
> pawel.frelek@gmail.com

> Panic#1 Part10
> <6>[24632.437095] [drm] MST_DSC Send DSC disable to synaptics
> <6>[24632.735408] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.862292] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.891129] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.967513] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.973266] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.978300] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.984496] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.992772] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.998544] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24633.003518] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24633.009391] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24633.431687] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24633.655158] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24634.326452] usb 8-1: USB disconnect, device number 10
> <6>[24634.326471] usb 8-1.1: USB disconnect, device number 11
> <6>[24634.327865] pcieport 0000:00:04.1: pciehp: Slot(0): Link Down
> <6>[24634.327870] amdgpu 0000:73:00.0: [drm] DMUB HPD IRQ callback: link_index=7
> <6>[24634.327873] pcieport 0000:00:04.1: pciehp: Slot(0): Card not present
> <6>[24634.327938] [drm] DM_MST: stopping TM on aconnector: 000000004f5eeb2e [id: 439]
> <6>[24634.331648] thunderbolt 0-2: device disconnected
> Panic#1 Part9
> <6>[24634.340482] pci_bus 0000:05: busn_res: [bus 05] is released
> <6>[24634.340773] pci_bus 0000:06: busn_res: [bus 06-29] is released
> <6>[24634.341226] pci_bus 0000:2a: busn_res: [bus 2a-4d] is released
> <6>[24634.341613] usb 8-1.2: USB disconnect, device number 12
> <6>[24634.341618] pci_bus 0000:4e: busn_res: [bus 4e-71] is released
> <6>[24634.342325] pci_bus 0000:72: busn_res: [bus 72] is released
> <6>[24634.342674] pci_bus 0000:04: busn_res: [bus 04-72] is released
> <6>[24634.352012] usb 9-1: USB disconnect, device number 6
> <6>[24634.352021] usb 9-1.4: USB disconnect, device number 7
> <6>[24634.352026] usb 9-1.4.4: USB disconnect, device number 8
> <6>[24634.352031] r8152-cfgselector 9-1.4.4.3: USB disconnect, device number 9
> <6>[24634.372901] r8152 9-1.4.4.3:1.0 eth0: Stop submitting intr, status -108
> <6>[24634.374148] usb 8-1.4: USB disconnect, device number 13
> <6>[24634.374154] usb 8-1.4.3: USB disconnect, device number 15
> <6>[24634.533817] usb 8-1.4.4: USB disconnect, device number 14
> <6>[24634.533828] usb 8-1.4.4.1: USB disconnect, device number 16
> <4>[24634.539108] amdgpu 0000:73:00.0: [drm] REG_WAIT timeout 1us * 100 tries - dcn31_program_compbuf_size line:141
> <6>[24634.664153] usb 8-1.4.4.4: USB disconnect, device number 18
> <4>[24643.828278] kauditd_printk_skb: 6397 callbacks suppressed
> <5>[24643.828284] audit: type=1400 audit(1791838024.538:76266): apparmor="ALLOWED" operation="exec" class="file" info="profile transition not found" error=-13 profile="containerd-shim-runc-v2" name="/usr/bin/runc" pid=45595 comm="containerd-shim" requested_mask="x" denied_mask="x" fsuid=0 ouid=0 target="containerd-shim-runc-v2//null-/usr/bin/runc"
> Panic#1 Part8
> <5>[24643.828325] audit: type=1400 audit(1791838024.538:76267): apparmor="ALLOWED" operation="file_inherit" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/dev/null" pid=45595 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24643.828371] audit: type=1400 audit(1791838024.538:76268): apparmor="ALLOWED" operation="file_mmap" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/usr/bin/runc" pid=45595 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24643.828428] audit: type=1400 audit(1791838024.538:76269): apparmor="ALLOWED" operation="file_mmap" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/usr/lib/ld-linux-x86-64.so.2" pid=45595 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24643.828542] audit: type=1400 audit(1791838024.538:76270): apparmor="ALLOWED" operation="getattr" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/etc/ld.so.cache" pid=45595 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24643.828554] audit: type=1400 audit(1791838024.538:76271): apparmor="ALLOWED" operation="open" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/etc/ld.so.cache" pid=45595 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24643.828561] audit: type=1400 audit(1791838024.538:76272): apparmor="ALLOWED" operation="getattr" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/etc/ld.so.cache" pid=45595 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> Panic#1 Part7
> <5>[24643.828703] audit: type=1400 audit(1791838024.538:76273): apparmor="ALLOWED" operation="getattr" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/opt/containerd/lib/" pid=45595 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24643.828734] audit: type=1400 audit(1791838024.538:76274): apparmor="ALLOWED" operation="getattr" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/etc/ld.so.cache" pid=45595 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24643.828759] audit: type=1400 audit(1791838024.538:76275): apparmor="ALLOWED" operation="open" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/usr/lib/libseccomp.so.2.6.0" pid=45595 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <6>[24644.024287] wlan0: deauthenticating from 18:90:d8:a7:f6:ef by local choice (Reason: 3=DEAUTH_LEAVING)
> <46>[24644.583785] systemd-journald[402]: Received client request to relinquish /var/log/journal/176c744b434d4ae49d4c488510daa3bc access.
> <6>[24644.699027] zram0: detected capacity change from 15091712 to 0
> <30>[24644.827761] systemd-shutdown[1]: Syncing filesystems and block devices.
> <30>[24644.874636] systemd-shutdown[1]: Sending SIGTERM to remaining processes...
> <46>[24644.895180] systemd-journald[402]: Received SIGTERM from PID 1 (systemd-shutdow).
> <30>[24644.920650] systemd-shutdown[1]: Sending SIGKILL to remaining processes...
> <30>[24644.940295] systemd-shutdown[1]: Unmounting file systems.
> <30>[24644.943736] (sd-umount)[45667]: Unmounting '/run/credentials/systemd-journald.service'.
> Panic#1 Part6
> <30>[24644.945422] (sd-umount)[45668]: Unmounting '/run/credentials/@encrypted'.
> <30>[24644.947034] (sd-remount)[45669]: Remounting '/' read-only with options 'compress=zstd:1,ssd,space_cache=v2,subvolid=256,subvol=/@'.
> <30>[24645.016605] systemd-shutdown[1]: All filesystems unmounted.
> <30>[24645.016621] systemd-shutdown[1]: Deactivating swaps.
> <30>[24645.016705] systemd-shutdown[1]: All swaps deactivated.
> <30>[24645.016714] systemd-shutdown[1]: Detaching loop devices.
> <30>[24645.025936] systemd-shutdown[1]: All loop devices detached.
> <30>[24645.025947] systemd-shutdown[1]: Stopping MD devices.
> <30>[24645.026306] systemd-shutdown[1]: All MD devices stopped.
> <30>[24645.026315] systemd-shutdown[1]: Detaching DM devices.
> <30>[24645.027204] systemd-shutdown[1]: Not all DM devices detached, 1 left.
> <30>[24645.027431] systemd-shutdown[1]: Detaching DM devices.
> <30>[24645.028320] systemd-shutdown[1]: Not all DM devices detached, 1 left.
> <30>[24645.028331] systemd-shutdown[1]: Cannot finalize remaining DM devices, continuing.
> <30>[24645.784824] systemd-shutdown[1]: Successfully changed into root pivot.
> <30>[24645.784836] systemd-shutdown[1]: Entering exitrd...
> <30>[24645.795995] shutdown[1]: Syncing filesystems and block devices.
> <30>[24645.796924] shutdown[1]: Sending SIGTERM to remaining processes...
> <30>[24645.820163] shutdown[1]: Sending SIGKILL to remaining processes...
> <30>[24645.841953] shutdown[1]: Unmounting file systems.
> <30>[24645.845393] (sd-umoun[45680]: Unmounting '/run/credentials'.
> <30>[24645.847133] (sd-umoun[45681]: Unmounting '/oldroot/dev/hugepages'.
> <30>[24645.848759] (sd-umoun[45682]: Unmounting '/oldroot/sys/fs/fuse/connections'.
> Panic#1 Part5
> <30>[24645.850464] (sd-umoun[45683]: Unmounting '/oldroot/dev/mqueue'.
> <30>[24645.852095] (sd-umoun[45684]: Unmounting '/oldroot/sys/kernel/config'.
> <30>[24645.853678] (sd-umoun[45685]: Unmounting '/oldroot/sys/kernel/tracing'.
> <30>[24645.855275] (sd-umoun[45686]: Unmounting '/oldroot/sys/kernel/debug'.
> <30>[24645.856832] (sd-umoun[45687]: Unmounting '/oldroot/run'.
> <30>[24645.858456] (sd-umoun[45688]: Unmounting '/oldroot/proc'.
> <30>[24645.859969] (sd-umoun[45689]: Unmounting '/oldroot/sys/fs/bpf'.
> <30>[24645.861552] (sd-umoun[45690]: Unmounting '/oldroot/sys/firmware/efi/efivars'.
> <30>[24645.863144] (sd-umoun[45691]: Unmounting '/oldroot/sys/fs/pstore'.
> <30>[24645.864714] (sd-umoun[45692]: Unmounting '/oldroot/sys/fs/cgroup'.
> <30>[24645.866320] (sd-umoun[45693]: Unmounting '/oldroot/sys/kernel/security'.
> <30>[24645.867900] (sd-umoun[45694]: Unmounting '/oldroot/sys'.
> <30>[24645.869413] (sd-umoun[45695]: Unmounting '/oldroot/dev/pts'.
> <30>[24645.870990] (sd-umoun[45696]: Unmounting '/oldroot/dev/shm'.
> <30>[24645.872521] (sd-umoun[45697]: Unmounting '/oldroot/dev'.
> <30>[24645.874085] (sd-umoun[45698]: Unmounting '/oldroot'.
> <6>[24648.401132] BTRFS info (device dm-0): last unmount of filesystem c18f6e97-44f5-4800-bf73-79d39ac3d1e6
> <4>[24649.020666] kauditd_printk_skb: 3270 callbacks suppressed
> <5>[24649.020674] audit: type=1400 audit(1791838029.730:79546): apparmor="ALLOWED" operation="open" class="file" profile="systemd-shutdown//null-/shutdown" name="/proc/1/mountinfo" pid=1 comm="shutdown" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <30>[24649.021011] shutdown[1]: All filesystems unmounted.
> Panic#1 Part4
> <30>[24649.021383] shutdown[1]: Deactivating swaps.
> <5>[24649.021444] audit: type=1400 audit(1791838029.730:79547): apparmor="ALLOWED" operation="getattr" class="file" profile="systemd-shutdown//null-/shutdown" name="/proc/1/mountinfo" pid=1 comm="shutdown" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <30>[24649.021455] shutdown[1]: All swaps deactivated.
> <5>[24649.021456] audit: type=1400 audit(1791838029.731:79548): apparmor="ALLOWED" operation="open" class="file" profile="systemd-shutdown//null-/shutdown" name="/proc/swaps" pid=1 comm="shutdown" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <30>[24649.021463] shutdown[1]: Detaching loop devices.
> <5>[24649.021464] audit: type=1400 audit(1791838029.731:79549): apparmor="ALLOWED" operation="getattr" class="file" profile="systemd-shutdown//null-/shutdown" name="/proc/swaps" pid=1 comm="shutdown" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24649.021557] audit: type=1400 audit(1791838029.731:79550): apparmor="ALLOWED" operation="open" class="file" profile="systemd-shutdown//null-/shutdown" name="/sys/bus/" pid=1 comm="shutdown" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24649.021565] audit: type=1400 audit(1791838029.731:79551): apparmor="ALLOWED" operation="getattr" class="file" profile="systemd-shutdown//null-/shutdown" name="/sys/bus/" pid=1 comm="shutdown" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24649.021674] audit: type=1400 audit(1791838029.731:79552): apparmor="ALLOWED" operation="open" class="file" profile="systemd-shutdown//null-/shutdown" name="/sys/class/" pid=1 comm="shutdown" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> Panic#1 Part3
> <5>[24649.021687] audit: type=1400 audit(1791838029.731:79553): apparmor="ALLOWED" operation="getattr" class="file" profile="systemd-shutdown//null-/shutdown" name="/sys/class/" pid=1 comm="shutdown" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24649.021749] audit: type=1400 audit(1791838029.731:79554): apparmor="ALLOWED" operation="open" class="file" profile="systemd-shutdown//null-/shutdown" name="/sys/class/block/" pid=1 comm="shutdown" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24649.021755] audit: type=1400 audit(1791838029.731:79555): apparmor="ALLOWED" operation="getattr" class="file" profile="systemd-shutdown//null-/shutdown" name="/sys/class/block/" pid=1 comm="shutdown" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <30>[24649.021916] shutdown[1]: All loop devices detached.
> <30>[24649.021925] shutdown[1]: Stopping MD devices.
> <30>[24649.022247] shutdown[1]: All MD devices stopped.
> <30>[24649.022256] shutdown[1]: Detaching DM devices.
> <30>[24649.023437] shutdown[1]: Detaching DM /dev/dm-0 (253:0).
> <30>[24649.023926] shutdown[1]: Syncing /dev/dm-0.
> <30>[24649.086155] shutdown[1]: All DM devices detached.
> <30>[24649.086171] shutdown[1]: All filesystems, swaps, loop devices, MD devices and DM devices detached.
> <30>[24649.086810] shutdown[1]: Syncing filesystems and block devices.
> <30>[24649.088537] shutdown[1]: Powering off.
> <3>[24823.915399] INFO: task shutdown:1 blocked for more than 122 seconds.
> <3>[24823.916301]       Tainted: G        W           7.2.9-arch1-1 #1
> <3>[24823.916901] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> Panic#1 Part2
> <6>[24823.917469] task:shutdown        state:D stack:0     pid:1     tgid:1     ppid:0      task_flags:0x400100 flags:0x00080000
> <6>[24823.918060] Call Trace:
> <6>[24823.918739]  <TASK>
> <6>[24823.919306]  __schedule+0x420/0x1770
> <6>[24823.919858]  ? srso_alias_return_thunk+0x5/0xfbef5
> <6>[24823.920415]  ? ilookup+0x7f/0xe0
> <6>[24823.921008]  ? srso_alias_return_thunk+0x5/0xfbef5
> <6>[24823.921586]  schedule+0x27/0xa0
> <6>[24823.922149]  schedule_timeout+0xdc/0x120
> <6>[24823.922691]  wait_for_completion+0x9a/0x180
> <6>[24823.923265]  nhi_pci_remove+0x53/0x60 [thunderbolt 5a53207a8682f9e034326c92a693ee76741e3f49]
> <6>[24823.924013]  pci_device_shutdown+0x3e/0x80
> <6>[24823.924806]  ? __pfx_pci_device_shutdown+0x10/0x10
> <6>[24823.926121]  device_shutdown+0x169/0x1d0
> <6>[24823.927091]  ? srso_alias_return_thunk+0x5/0xfbef5
> <6>[24823.927681]  kernel_power_off+0x35/0x80
> <6>[24823.928258]  __do_sys_reboot+0x1da/0x260
> <6>[24823.928821]  do_syscall_64+0xaa/0x660
> <6>[24823.929376]  ? srso_alias_return_thunk+0x5/0xfbef5
> <6>[24823.929918]  ? vfs_writev+0x1bf/0x3e0
> <6>[24823.930481]  ? srso_alias_return_thunk+0x5/0xfbef5
> <6>[24823.931034]  ? do_writev+0x95/0x150
> <6>[24823.931572]  ? srso_alias_return_thunk+0x5/0xfbef5
> <6>[24823.932116]  ? do_syscall_64+0xaa/0x660
> <6>[24823.932647]  ? srso_alias_return_thunk+0x5/0xfbef5
> <6>[24823.933183]  ? do_syscall_64+0xaa/0x660
> <6>[24823.933712]  ? srso_alias_return_thunk+0x5/0xfbef5
> <6>[24823.934251]  ? do_syscall_64+0xaa/0x660
> <6>[24823.934778]  ? srso_alias_return_thunk+0x5/0xfbef5
> <6>[24823.935320]  ? do_syscall_64+0x5f/0x660
> <6>[24823.935846]  ? srso_alias_return_thunk+0x5/0xfbef5
> Panic#1 Part1
> <6>[24823.936385]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> <6>[24823.936917] RIP: 0033:0x7fd2a7f1dc37
> <6>[24823.937454] RSP: 002b:00007ffddf6f2eb8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a9
> <6>[24823.938006] RAX: ffffffffffffffda RBX: 00007ffddf6f2f70 RCX: 00007fd2a7f1dc37
> <6>[24823.938552] RDX: 000000004321fedc RSI: 0000000028121969 RDI: 00000000fee1dead
> <6>[24823.939114] RBP: 00007ffddf6f3050 R08: 0000000000000000 R09: 0000000000000000
> <6>[24823.939670] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> <6>[24823.940237] R13: 0000000000000000 R14: 0000000000000000 R15: 00007ffddf6f31b8
> <6>[24823.940829]  </TASK>
> <0>[24823.941495] Kernel panic - not syncing: hung_task: blocked tasks
> <4>[24823.941512] CPU: 6 UID: 0 PID: 95 Comm: khungtaskd Tainted: G        W           7.2.9-arch1-1 #1 PREEMPT(full)  227f612332c55d5b5b0a0c054e4cd1f76a9a914f
> <4>[24823.941537] Tainted: [W]=WARN
> <4>[24823.941546] Hardware name: LENOVO 21CNS15T00/21CNS15T00, BIOS R22ET81W (1.51 ) 04/10/2026
> <4>[24823.941559] Call Trace:
> <4>[24823.941568]  <TASK>
> <4>[24823.941577]  dump_stack_lvl+0x5d/0x80
> <4>[24823.941596]  vpanic+0x20a/0x410
> <4>[24823.941613]  panic+0x6b/0x70
> <4>[24823.941629]  watchdog.cold+0x1bb/0x2c5
> <4>[24823.941651]  ? __pfx_watchdog+0x10/0x10
> <4>[24823.941668]  kthread+0xe4/0x120
> <4>[24823.941682]  ? __pfx_kthread+0x10/0x10
> <4>[24823.941697]  ret_from_fork+0x2a7/0x330
> <4>[24823.941713]  ? __pfx_kthread+0x10/0x10
> <4>[24823.941726]  ret_from_fork_asm+0x1a/0x30
> <4>[24823.941748]  </TASK>
> <0>[24823.942400] Kernel Offset: 0x15400000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)

> Panic#1 Part22
> <6>[20529.282074] usb 3-3: reset full-speed USB device number 2 using xhci_hcd
> <5>[20533.371209] audit: type=1400 audit(1791833914.080:69796): apparmor="ALLOWED" operation="mknod" class="file" profile="bootctl" name="/sys/firmware/efi/efivars/LoaderEntryOneShot-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f" pid=40732 comm="bootctl" requested_mask="c" denied_mask="c" fsuid=0 ouid=0
> <5>[20533.371219] audit: type=1400 audit(1791833914.080:69797): apparmor="ALLOWED" operation="open" class="file" profile="bootctl" name="/sys/firmware/efi/efivars/LoaderEntryOneShot-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f" pid=40732 comm="bootctl" requested_mask="wc" denied_mask="wc" fsuid=0 ouid=0
> <5>[20533.437381] audit: type=1400 audit(1791833914.147:69798): apparmor="ALLOWED" operation="open" class="file" profile="lsb-release" name="/home/nidh0gg/" pid=40751 comm="find" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
> <5>[20657.525024] audit: type=1400 audit(1791834038.234:69799): apparmor="ALLOWED" operation="mkdir" class="file" profile="kioworker" name="/var/cache/samba/" pid=41101 comm="kioworker" requested_mask="c" denied_mask="c" fsuid=1000 ouid=1000
> <5>[20657.775909] audit: type=1400 audit(1791834038.485:69800): apparmor="ALLOWED" operation="mkdir" class="file" profile="kioworker" name="/var/cache/samba/" pid=41101 comm="kioworker" requested_mask="c" denied_mask="c" fsuid=1000 ouid=1000
> <5>[20667.566466] audit: type=1400 audit(1791834048.276:69801): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> Panic#1 Part21
> <5>[20721.797466] audit: type=1400 audit(1791834102.507:69802): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[20977.808173] audit: type=1400 audit(1791834358.517:69803): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[21028.650276] audit: type=1400 audit(1791834409.359:69804): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[21087.593680] audit: type=1400 audit(1791834468.303:69805): apparmor="ALLOWED" operation="open" class="file" profile="lsb-release" name="/home/nidh0gg/" pid=41378 comm="find" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
> <5>[21126.783753] audit: type=1400 audit(1791834507.493:69806): apparmor="ALLOWED" operation="open" class="file" profile="lsb-release" name="/home/nidh0gg/" pid=41460 comm="find" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
> <5>[21278.080263] audit: type=1400 audit(1791834658.790:69807): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[21335.585948] audit: type=1400 audit(1791834716.295:69808): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> Panic#1 Part20
> <5>[21588.315787] audit: type=1400 audit(1791834969.025:69809): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[21642.349179] audit: type=1400 audit(1791835023.058:69810): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[21656.520102] audit: type=1400 audit(1791835037.229:69811): apparmor="ALLOWED" operation="file_inherit" class="file" profile="checkupdates" name="/dev/rfkill" pid=41653 comm="checkupdates" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
> <5>[21656.524375] audit: type=1400 audit(1791835037.234:69812): apparmor="ALLOWED" operation="file_inherit" class="file" profile="pacman-conf" name="/dev/rfkill" pid=41655 comm="pacman-conf" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
> <5>[21656.547094] audit: type=1400 audit(1791835037.256:69813): apparmor="ALLOWED" operation="file_inherit" class="file" profile="checkupdates//fakeroot" name="/dev/rfkill" pid=41658 comm="fakeroot" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
> <5>[21656.564130] audit: type=1400 audit(1791835037.273:69814): apparmor="ALLOWED" operation="file_inherit" class="file" profile="pacman" name="/dev/rfkill" pid=41673 comm="pacman" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
> <5>[21888.576948] audit: type=1400 audit(1791835269.286:69815): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> Panic#1 Part19
> <5>[21949.052231] audit: type=1400 audit(1791835329.762:69816): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[22198.763898] audit: type=1400 audit(1791835579.473:69817): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[22255.958078] audit: type=1400 audit(1791835636.667:69818): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[22261.963850] audit: type=1400 audit(1791835642.673:69819): apparmor="ALLOWED" operation="unlink" class="file" profile="checkupdates" name="/tmp/checkup-db-1000/db.lck" pid=41843 comm="rm" requested_mask="d" denied_mask="d" fsuid=1000 ouid=1000
> <5>[22509.044662] audit: type=1400 audit(1791835889.754:69820): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[22555.427096] audit: type=1400 audit(1791835936.136:69821): apparmor="ALLOWED" operation="open" class="file" profile="lsb-release" name="/home/nidh0gg/" pid=41915 comm="find" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
> <5>[22562.760122] audit: type=1400 audit(1791835943.469:69822): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> Panic#1 Part18
> <5>[22809.331374] audit: type=1400 audit(1791836190.041:69823): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[23019.474266] audit: type=1400 audit(1791836400.184:69824): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[23059.500936] audit: type=1400 audit(1791836440.210:69825): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[23125.496731] audit: type=1400 audit(1791836506.206:69826): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[23251.129663] audit: type=1400 audit(1791836631.839:69827): apparmor="ALLOWED" operation="open" class="file" profile="lsb-release" name="/home/nidh0gg/" pid=42164 comm="find" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
> <5>[23257.018032] audit: type=1400 audit(1791836637.727:69828): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[23303.738382] audit: type=1400 audit(1791836684.448:69829): apparmor="ALLOWED" operation="open" class="file" profile="lsb-release" name="/home/nidh0gg/" pid=42248 comm="find" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
> Panic#1 Part17
> <5>[23318.250806] audit: type=1400 audit(1791836698.960:69830): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[23346.144340] audit: type=1400 audit(1791836726.854:69831): apparmor="ALLOWED" operation="open" class="file" profile="lsb-release" name="/home/nidh0gg/" pid=42316 comm="find" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
> <5>[23509.910984] audit: type=1400 audit(1791836890.620:69832): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[23569.928929] audit: type=1400 audit(1791836950.638:69833): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[23635.974406] audit: type=1400 audit(1791837016.684:69834): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[23756.323429] audit: type=1400 audit(1791837137.033:69835): apparmor="ALLOWED" operation="mknod" class="file" profile="mpv" name="/home/nidh0gg/.local/state/mpv/watch_later/AC97A01AEDBFBE92F83C9FF67C348D32" pid=5495 comm="mpv" requested_mask="c" denied_mask="c" fsuid=1000 ouid=1000
> Panic#1 Part16
> <5>[23756.330378] audit: type=1400 audit(1791837137.040:69836): apparmor="ALLOWED" operation="open" class="file" profile="mpv" name="/home/nidh0gg/.local/state/mpv/watch_later/AC97A01AEDBFBE92F83C9FF67C348D32" pid=5495 comm="mpv" requested_mask="wc" denied_mask="wc" fsuid=1000 ouid=1000
> <5>[23756.331158] audit: type=1400 audit(1791837137.041:69837): apparmor="ALLOWED" operation="mknod" class="file" profile="mpv" name="/home/nidh0gg/.local/state/mpv/watch_later/A626D6E7CF28CDFFFFAB450BA0007AAB" pid=5495 comm="mpv" requested_mask="c" denied_mask="c" fsuid=1000 ouid=1000
> <5>[23756.331224] audit: type=1400 audit(1791837137.041:69838): apparmor="ALLOWED" operation="open" class="file" profile="mpv" name="/home/nidh0gg/.local/state/mpv/watch_later/A626D6E7CF28CDFFFFAB450BA0007AAB" pid=5495 comm="mpv" requested_mask="wc" denied_mask="wc" fsuid=1000 ouid=1000
> <5>[23756.331291] audit: type=1400 audit(1791837137.041:69839): apparmor="ALLOWED" operation="open" class="file" profile="mpv" name="/home/nidh0gg/.local/state/mpv/watch_later/4A0AB97538013C30CF703C450CC823B3" pid=5495 comm="mpv" requested_mask="wc" denied_mask="wc" fsuid=1000 ouid=1000
> <5>[23756.331299] audit: type=1400 audit(1791837137.041:69840): apparmor="ALLOWED" operation="truncate" class="file" profile="mpv" name="/home/nidh0gg/.local/state/mpv/watch_later/4A0AB97538013C30CF703C450CC823B3" pid=5495 comm="mpv" requested_mask="w" denied_mask="w" fsuid=1000 ouid=1000
> Panic#1 Part15
> <5>[23756.331529] audit: type=1400 audit(1791837137.041:69841): apparmor="ALLOWED" operation="open" class="file" profile="mpv" name="/home/nidh0gg/.local/state/mpv/watch_later/0AB6BB4899AFEF25D595B64F673B7A2D" pid=5495 comm="mpv" requested_mask="wc" denied_mask="wc" fsuid=1000 ouid=1000
> <5>[23756.331537] audit: type=1400 audit(1791837137.041:69842): apparmor="ALLOWED" operation="truncate" class="file" profile="mpv" name="/home/nidh0gg/.local/state/mpv/watch_later/0AB6BB4899AFEF25D595B64F673B7A2D" pid=5495 comm="mpv" requested_mask="w" denied_mask="w" fsuid=1000 ouid=1000
> <5>[23756.331635] audit: type=1400 audit(1791837137.041:69843): apparmor="ALLOWED" operation="open" class="file" profile="mpv" name="/home/nidh0gg/.local/state/mpv/watch_later/214E41144E86164FF1F77E942E8F9220" pid=5495 comm="mpv" requested_mask="wc" denied_mask="wc" fsuid=1000 ouid=1000
> <5>[23756.331640] audit: type=1400 audit(1791837137.041:69844): apparmor="ALLOWED" operation="truncate" class="file" profile="mpv" name="/home/nidh0gg/.local/state/mpv/watch_later/214E41144E86164FF1F77E942E8F9220" pid=5495 comm="mpv" requested_mask="w" denied_mask="w" fsuid=1000 ouid=1000
> <4>[23772.477322] kauditd_printk_skb: 2 callbacks suppressed
> <5>[23772.477328] audit: type=1400 audit(1791837153.187:69847): apparmor="ALLOWED" operation="open" class="file" profile="systemd-logind" name="/sys/firmware/efi/efivars/LoaderEntryOneShot-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f" pid=1762 comm="systemd-logind" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> Panic#1 Part14
> <5>[23880.192628] audit: type=1400 audit(1791837260.902:69848): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[23941.434053] audit: type=1400 audit(1791837322.143:69849): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[23991.133553] audit: type=1400 audit(1791837371.843:69850): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[24027.992332] audit: type=1400 audit(1791837408.702:69851): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[24062.777736] audit: type=1400 audit(1791837443.487:69852): apparmor="ALLOWED" operation="unlink" class="file" profile="checkupdates" name="/tmp/checkup-db-1000/db.lck" pid=43599 comm="rm" requested_mask="d" denied_mask="d" fsuid=1000 ouid=1000
> <5>[24138.702943] audit: type=1400 audit(1791837519.412:69853): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> Panic#1 Part13
> <5>[24190.459031] audit: type=1400 audit(1791837571.168:69854): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[24460.694613] audit: type=1400 audit(1791837841.404:69855): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[24540.707147] audit: type=1400 audit(1791837921.417:69856): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[24610.728663] audit: type=1400 audit(1791837991.438:69857): apparmor="ALLOWED" operation="signal" class="signal" profile="waybar" pid=3184 comm="gly-global-exec" requested_mask="send" denied_mask="send" signal=kill peer="unconfined"
> <5>[24626.505435] audit: type=1400 audit(1791838007.215:69858): apparmor="ALLOWED" operation="open" class="file" profile="lsb-release" name="/home/nidh0gg/" pid=44913 comm="find" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
> <5>[24631.742881] audit: type=1400 audit(1791838012.452:69859): apparmor="ALLOWED" operation="open" class="file" profile="tlp" name="/sys/devices/pci0000:00/0000:00:14.3/PNP0C09:00/ACPI0003:00/power_supply/AC/type" pid=45130 comm="cat" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> Panic#1 Part12
> <5>[24631.745509] audit: type=1400 audit(1791838012.455:69860): apparmor="ALLOWED" operation="open" class="file" profile="tlp" name="/sys/devices/pci0000:00/0000:00:14.3/PNP0C09:00/ACPI0003:00/power_supply/AC/online" pid=45135 comm="cat" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24631.785235] audit: type=1400 audit(1791838012.495:69861): apparmor="ALLOWED" operation="exec" class="file" info="profile transition not found" error=-13 profile="containerd-shim-runc-v2" name="/usr/bin/runc" pid=45184 comm="containerd-shim" requested_mask="x" denied_mask="x" fsuid=0 ouid=0 target="containerd-shim-runc-v2//null-/usr/bin/runc"
> <5>[24631.785991] audit: type=1400 audit(1791838012.495:69862): apparmor="ALLOWED" operation="file_inherit" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/dev/null" pid=45184 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24631.786139] audit: type=1400 audit(1791838012.496:69863): apparmor="ALLOWED" operation="file_mmap" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/usr/bin/runc" pid=45184 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24631.788393] audit: type=1400 audit(1791838012.498:69864): apparmor="ALLOWED" operation="file_mmap" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/usr/lib/ld-linux-x86-64.so.2" pid=45184 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> Panic#1 Part11
> <5>[24631.788512] audit: type=1400 audit(1791838012.498:69865): apparmor="ALLOWED" operation="getattr" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/etc/ld.so.cache" pid=45184 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24631.788521] audit: type=1400 audit(1791838012.498:69866): apparmor="ALLOWED" operation="open" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/etc/ld.so.cache" pid=45184 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24631.788542] audit: type=1400 audit(1791838012.498:69867): apparmor="ALLOWED" operation="getattr" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/etc/ld.so.cache" pid=45184 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <5>[24631.790148] audit: type=1400 audit(1791838012.499:69868): apparmor="ALLOWED" operation="getattr" class="file" profile="containerd-shim-runc-v2//null-/usr/bin/runc" name="/opt/containerd/lib/" pid=45184 comm="runc" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> <6>[24632.206356] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.212502] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.217318] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.222212] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.311807] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7
> <6>[24632.422399] amdgpu 0000:73:00.0: [drm] DMUB HPD RX IRQ callback: link_index=7

