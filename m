Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E73735C1BD
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 20:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974539; cv=none; b=XVuwfouTihqK13dbUFqMdZ7A0MW5u4HFKhqHw6bADWOobRpIcVt7oeNxciGZFb6qdJkpk9xOSdyrMkMIMn/Zh9x6lSMAh3KrEkEF7TJJ5VZzgul1tLYzkMFrrdtIag4bfDme+PsvEe6B8JSARaC9Mi9LEu4TkDBsFdhuqc6OiyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974539; c=relaxed/simple;
	bh=FdgLPgBjsUjBTjvMxXGS7PBPmxbEFE/TVVLZbyppG24=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sGlMWkjQUlS2cl+cHhdsrYkrJ70Vb9B0FsDHCDMgwEDZ8cCUXxHrJL4Jy5Na5QoULZQvI7O5TXZJjTMMFmL4nOKJxHVX5fD33MSEOmuvi5fvpbuQQUEBP3fWOxFkauDMDhnojdQ8vFsuRsEKddqU+RzjqEYkO7AyQW1RdjVSiuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKzLpaZj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKzLpaZj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A171AC2BCB8
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 20:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974538;
	bh=FdgLPgBjsUjBTjvMxXGS7PBPmxbEFE/TVVLZbyppG24=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fKzLpaZjZlcrwNQdFT5N9uE7S89aMhtliMqDxwLzo/YfRk6GtaX1HCOWPYx0K1qI3
	 NlNCyEnCH/uMKRLjE1TXywk5qifz0502v8vV32toi5SWS1o1JFS8BBmccWThcW+YOQ
	 T4Oy03KDJovZ/vqk7NY0MwxAvDIjboU7SHxD2b4S/r4mHX6xzVIYhg1s603xJpVkGs
	 b+rvKiihBdwq97uJUA4twIlbB/dwqxafn5YvO4mw7/8dYyuBkDgDLNWy+7kteK+yY9
	 pSX+zfUNMqGWq0eNmFbF6Eb7jfu27ywiNDan3XA5C/k8H+1k31tQjbN61uVYOhOCSW
	 Vq8GKqzPESceA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8DDF1C53BBF; Mon, 13 Jul 2026 20:28:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 20:28:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-3qdweGGDEV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #60 from Alexander F (superveridical@gmail.com) ---
I tested against 7.1.3, and wasn't able to boot into graphical environment.
Booting into backup kernel and looking into previous boot's klog revealed t=
hat
there is "NULL pointer dereference". If it's caused by the older version, I=
 can
theoretically probably get 7.2-rc3 /working/compiling, but that would take =
some
time.

kernel: amdgpu: Virtual CRAT table created for CPU
kernel: amdgpu: Topology: Add CPU node
kernel: amdgpu 0000:c4:00.0: enabling device (0006 -> 0007)
kernel: amdgpu 0000:c4:00.0: initializing kernel modesetting (IP DISCOVERY
0x1002:0x1586 0x1043:0x1FB3 0xC1).
kernel: amdgpu 0000:c4:00.0: register mmio base: 0xA0300000
kernel: amdgpu 0000:c4:00.0: register mmio size: 1048576
kernel: amdgpu 0000:c4:00.0: detected ip block number 0 <common_v1_0_0>
(soc21_common)
kernel: amdgpu 0000:c4:00.0: detected ip block number 1 <gmc_v11_0_0>
(gmc_v11_0)
kernel: amdgpu 0000:c4:00.0: detected ip block number 2 <ih_v6_0_0> (ih_v6_=
1)
kernel: amdgpu 0000:c4:00.0: detected ip block number 3 <psp_v13_0_0> (psp)
kernel: amdgpu 0000:c4:00.0: detected ip block number 4 <smu_v14_0_0> (smu)
kernel: amdgpu 0000:c4:00.0: detected ip block number 5 <dce_v1_0_0> (dm)
kernel: amdgpu 0000:c4:00.0: detected ip block number 6 <gfx_v11_0_0>
(gfx_v11_0)
kernel: amdgpu 0000:c4:00.0: detected ip block number 7 <sdma_v6_0_0>
(sdma_v6_0)
kernel: amdgpu 0000:c4:00.0: detected ip block number 8 <vcn_v4_0_5>
(vcn_v4_0_5)
kernel: amdgpu 0000:c4:00.0: detected ip block number 9 <jpeg_v4_0_5>
(jpeg_v4_0_5)
kernel: amdgpu 0000:c4:00.0: detected ip block number 10 <mes_v11_0_0>
(mes_v11_0)
kernel: amdgpu 0000:c4:00.0: detected ip block number 11 <vpe_v6_1_0>
(vpe_v6_1)
kernel: amdgpu 0000:c4:00.0: detected ip block number 12 <isp_v4_1_1> (isp_=
ip)
kernel: BUG: kernel NULL pointer dereference, address: 0000000000000118
kernel: #PF: supervisor read access in kernel mode
kernel: #PF: error_code(0x0000) - not-present page
kernel: PGD 0 P4D 0=20
kernel: Oops: Oops: 0000 [#1] SMP NOPTI
kernel: CPU: 21 UID: 0 PID: 865 Comm: (udev-worker) Not tainted 7.1.3-dist =
#3
PREEMPT(lazy)=20
kernel: Hardware name: ASUSTeK COMPUTER INC. ROG Flow Z13
GZ302EA_GZ302EA/GZ302EA, BIOS GZ302EA.311 08/01/2025
kernel: RIP: 0010:soc21_common_early_init+0x18/0x250 [amdgpu]
kernel: Code: 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1=
e fa
0f 1f 44 00 00 53 48 8b 5f 10 48 8b 83 d8 76 01 00 48 89 df <48> 8b 80 18 0=
1 00
00 2e 2e 2e ff d0 48 89 df 48 c7 83 a0 09 00 00
kernel: RSP: 0018:ffffd12c0350f940 EFLAGS: 00010282
kernel: RAX: 0000000000000000 RBX: ffff8ef5aa800000 RCX: 0000000000000000
kernel: RDX: 0000000000000000 RSI: 0000000000000120 RDI: ffff8ef5aa800000
kernel: RBP: 0000000000000000 R08: 0000000000000000 R09: ffffd12c0350f6a0
kernel: R10: ffffffffc2bef3f0 R11: 3fffffffffffdfff R12: 0000000000000000
kernel: R13: ffff8ef581678001 R14: 0000000000000008 R15: 000fffffffe00000
kernel: FS:  00007fa0a244a040(0000) GS:ffff8efc40572000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 0000000000000118 CR3: 0000000108460000 CR4: 0000000000f50ef0
kernel: PKRU: 55555554
kernel: Call Trace:
kernel:  <TASK>
kernel:  amdgpu_device_ip_early_init.constprop.0+0x45b/0x6c0 [amdgpu]
kernel:  amdgpu_device_init.cold+0xce/0x74b [amdgpu]
kernel:  ? do_pci_enable_device+0x119/0x190
kernel:  amdgpu_driver_load_kms+0x19/0x80 [amdgpu]
kernel:  amdgpu_pci_probe+0x1e7/0x580 [amdgpu]
kernel:  ? __pm_runtime_resume+0x5f/0x90
kernel:  local_pci_probe+0x3e/0x90
kernel:  pci_call_probe+0x59/0x190
kernel:  ? pci_match_device+0x15f/0x180
kernel:  ? pci_assign_irq+0x2d/0x160
kernel:  pci_device_probe+0x95/0x170
kernel:  call_driver_probe+0x26/0x100
kernel:  ? driver_sysfs_add+0x59/0xd0
kernel:  really_probe+0xcc/0x2c0
kernel:  __driver_probe_device+0x84/0x170
kernel:  driver_probe_device+0x1f/0xa0
kernel:  ? __pfx___driver_attach+0x10/0x10
kernel:  __driver_attach+0xcb/0x210
kernel:  bus_for_each_dev+0x85/0xd0
kernel:  bus_add_driver+0x13c/0x220
kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
kernel:  driver_register+0x75/0xe0
kernel:  ? amdgpu_init+0x24/0xff0 [amdgpu]
kernel:  do_one_initcall+0x5d/0x320
kernel:  ? load_module+0x86b/0x990
kernel:  do_init_module+0x84/0x270
kernel:  init_module_from_file+0xd8/0x140
kernel:  idempotent_init_module+0x114/0x310
kernel:  __x64_sys_finit_module+0x71/0xe0
kernel:  do_syscall_64+0xe2/0x590
kernel:  ? __seccomp_filter+0x52/0x380
kernel:  ? do_syscall_64+0x99/0x590
kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
kernel: RIP: 0033:0x7fa0a1f3b8dd
kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 4=
8 89
f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 f=
f ff
73 01 c3 48 8b 0d eb a4 0b 00 f7 d8 64 89 01 48
kernel: RSP: 002b:00007ffc99fbcfe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000=
139
kernel: RAX: ffffffffffffffda RBX: 0000557db52b8480 RCX: 00007fa0a1f3b8dd
kernel: RDX: 0000000000000000 RSI: 00007fa0a173b3af RDI: 00000000000000a8
kernel: RBP: 0000000000000000 R08: 0000000000000000 R09: 00007ffc99fbd120
kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 00007fa0a173b3af
kernel: R13: 0000000000020000 R14: 0000557db550d050 R15: 0000000000000000
kernel:  </TASK>
kernel: Modules linked in: fat amdgpu(+) snd_acp70 snd_acp_i2s snd_acp_pdm
snd_acp_pcm snd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh
snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_xtensa_dsp
snd_sof_pci snd_sof snd_sof_utils snd_pci_ps mt7925e snd_hda_codec_alc269(+)
snd_soc_acpi_amd_match snd_hda_scodec_component btusb
snd_soc_acpi_amd_sdca_quirks mt7925_common snd_hda_codec_realtek_lib
snd_soc_sdca btrtl mt792x_lib snd_hda_codec_generic drm_buddy
snd_hda_codec_atihdmi amdxcp mt76_connac_lib snd_hda_codec_hdmi btintel
i2c_algo_bit snd_soc_core btbcm drm_client_lib mt76 snd_hda_intel uvcvideo
snd_compress snd_hda_scodec_cs35l41_spi drm_ttm_helper amd_atl regmap_spi
snd_hda_codec ttm btmtk mac80211 snd_acp_pci drm_exec bluetooth
videobuf2_vmalloc snd_amd_acpi_mach intel_rapl_msr snd_hwdep
snd_acp_legacy_common videobuf2_memops drm_panel_backlight_quirks uvc
drm_suballoc_helper snd_hda_core intel_rapl_common videobuf2_v4l2 libarc4
snd_hda_scodec_cs35l41_i2c videobuf2_common
kernel:  snd_intel_dspcfg drm_display_helper snd_pci_acp6x amdxdna
snd_hda_scodec_cs35l41 kvm_amd cfg80211 snd_soc_cs_amp_lib snd_pci_acp5x cec
hid_sensor_accel_3d snd_pcm drm_shmem_helper kvm snd_rn_pci_acp3x ov13b10
snd_acp_config cs_dsp irqbypass snd_soc_cs35l41_lib gpu_sched v4l2_fwnode
snd_timer hid_sensor_trigger i2c_piix4 v4l2_async amd_pmf snd_soc_acpi
drm_kms_helper kfifo_buf rapl snd snd_pci_acp3x videodev k10temp soundcore
industrialio amdtee asus_nb_wmi i2c_smbus hid_sensor_iio_common joydev
asus_armoury mc tee amd_pmc wmi_bmof firmware_attributes_class
serial_multi_instantiate pcspkr loop fuse nfnetlink hid_asus asus_wmi
sparse_keymap rfkill ucsi_acpi sdhci_pci typec_ucsi sdhci_uhs2 sdhci
hid_multitouch hid_sensor_hub typec nvme uas cqhci usb_storage gpio_keys
nvme_core nvme_keyring i2c_hid_acpi amd_sfh video nvme_auth i2c_hid mmc_core
thunderbolt soc_button_array sp5100_tco wmi serio_raw
kernel: CR2: 0000000000000118
kernel: ---[ end trace 0000000000000000 ]---
kernel: RIP: 0010:soc21_common_early_init+0x18/0x250 [amdgpu]
kernel: Code: 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1=
e fa
0f 1f 44 00 00 53 48 8b 5f 10 48 8b 83 d8 76 01 00 48 89 df <48> 8b 80 18 0=
1 00
00 2e 2e 2e ff d0 48 89 df 48 c7 83 a0 09 00 00
kernel: RSP: 0018:ffffd12c0350f940 EFLAGS: 00010282
kernel: RAX: 0000000000000000 RBX: ffff8ef5aa800000 RCX: 0000000000000000
kernel: RDX: 0000000000000000 RSI: 0000000000000120 RDI: ffff8ef5aa800000
kernel: RBP: 0000000000000000 R08: 0000000000000000 R09: ffffd12c0350f6a0
kernel: R10: ffffffffc2bef3f0 R11: 3fffffffffffdfff R12: 0000000000000000
kernel: R13: ffff8ef581678001 R14: 0000000000000008 R15: 000fffffffe00000
kernel: FS:  00007fa0a244a040(0000) GS:ffff8efc40572000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 0000000000000118 CR3: 0000000108460000 CR4: 0000000000f50ef0
kernel: PKRU: 55555554

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
