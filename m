Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347434;
	b=h7+XmCWxe9gvlWpibLauz4oV4bczCIzis+vcrBIXnf5DRZCaOnssja29PS6gqMEZRlmI
	 Rf7k+YqrLLgbJm2VKeu+OjJIDQt+3d033OuNMRfQgVwsEdI7HhNPh0pwSyr3OAX/nzZAr
	 Zo5S4dYlIKYcOyw/qJyuWUCx/2Em4JOwFvzxI2v5z2OCIjImuaMady3kBNIyRGvcXW0xj
	 WW3sVLvYZW/nXlt0ZU1YvcBlYHpAB7BYJ2WNSCWZz6YyRll5GwTPqpf9fPG8cq2eW0h+i
	 S0ncF9GmA1qxnjwmt7NFcogaSJw0GplIrJfQ2/2K27KRrDrSXcggEWTPr16ml/FIUYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347434;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=qqrYXtCkM49UDRUQRJtaw8ZAidwIPCXVdXrTCZ9onAU=;
	b=1ZcDj+ImAFfNgwprVpYH33u/Um1e6/ognrNB61JVWMpoZapiefCRpSejSl6QW/Wn0ybR
	 JAr7yyawGWgBtp8n7YyFwKS19iQ4FhH5LK0l7zsf3v41wjkcNVGkCBLsEif/i3yiwPQA6
	 7j4Y+NBwwIuJ9cXr8/54IAbKsxdZMIBUyTHfGkq2JA8pEshXufxZEIZQjVAUFkFoVjZ/o
	 lFyIc4fqc5yTmI2PFt6NXyBc9TWKPily/s8343PpjjyJNAKLSsiMkQYil6YX68tpPPwGt
	 emq9cP6GnskXntHxRgG5C/ViwLFgF1bz6CJi/BkyMorU4VIp0XD+CKVR5y6lv/i4nIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O52mKBqD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B69606A333
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O52mKBqD
Received: by smtp.kernel.org (Postfix) with ESMTPS id 566671F000C6
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 11:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795347434;
	bh=qqrYXtCkM49UDRUQRJtaw8ZAidwIPCXVdXrTCZ9onAU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=O52mKBqDvsbiEvpK4g9JbVskxt9Ew1bQZ801V77ukcSxBMhgmVTofM7OuZ3jPb7ue
	 FekbjfD4fMwq0R9WU7LQHICvEGd9tnjrcGteckh4pkmx3Q21RlrMALL84EaC6hYVSn
	 WPsCR2r19ijIW6eSW5r7gVt0R67HueTpCVkB1i/Pn3H7kQcbT/PUhZq+a92n2ekTBD
	 mfPFCobTwOhQvSo+h0ulyiHxTx/sidJUdoRFWg2hky8qvsN3IZ9S4a9DCxHUWk1U/n
	 kqIXhx/srdwiKQnZhGsT/pcFDpdeqo96bJWA2YHgjbMXTwIIVil8VHUgNbSjcxs+bE
	 C31SX0tYSUfgg==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 52D95240040F; Sun, 22 Nov 2026 11:37:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE2OTldIFBDSWUgbGluayBkcm9wcyBkdXJpbmcgR1BV?=
 =?UTF-8?B?IEJBUjIgaW5pdCDigJQgTWluaXNmb3J1bSBERUcyIGVHUFUgZG9jayBvdmVy?=
 =?UTF-8?B?IFRodW5kZXJib2x0IDQ=?=
Date: Sun, 22 Nov 2026 11:37:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: inwestygator@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221699-208809-G3FTOHFiDr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221699-208809@https.bugzilla.kernel.org/>
References: <bug-221699-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221699

inwestygator@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |inwestygator@gmail.com

--- Comment #4 from inwestygator@gmail.com ---
Another Intel Panther Lake data point, with a working workaround.

Hardware:
- Laptop: Framework Laptop 13 Pro (Intel Core Ultra Series 3, Panther Lake,=
 Arc
B390 iGPU on xe), BIOS 03.04
- eGPU: Razer Core X V2, Intel JHL9480 / Barlow Ridge (8086:5786), USB4 40 =
Gb/s
(2 x 20)
- GPU: NVIDIA RTX 3090 (10de:2204), PCIe 4.0 x4
- PCIe path: 00:07.0 (USB4 root port) -> 02:00.0 (switch upstream) -> 03:00=
.0
(switch downstream) -> 04:00.0 (GPU)
- Kernel 7.2.15 (Arch, Omarchy). NVIDIA open 615.78.08 and proprietary
580.178.04.

Symptom:
The GPU falls off the bus (Xid 79) at state changes: during the driver's st=
art,
at the first
Vulkan use after idle, and when a workload stops. Steady load runs fine. Af=
ter
a failure only a
power cycle of the enclosure recovers it. With the open driver it failed in=
 19
of 20 boots.

What I found:
- With the proprietary driver and NVreg_EnableGpuFirmware=3D0 (GSP firmware=
 off)
the card is
  stable, but it stays in P0 at about 105 W, so its link speed never change=
s.
- With GSP on, the same proprietary driver fails again (2 of 2 boots).
- Locking the link speed before the driver loads fixes it with GSP on, at f=
ull
16 GT/s
  (the workaround from bug 221319 comment 58):

    setpci -s 03:00.0 CAP_EXP+30.w=3D0024:002f   # LnkCtl2: target 16 GT/s =
+ HW
Autonomous Speed Disable
    setpci -s 04:00.0 CAP_EXP+30.w=3D0024:002f   # same on the GPU
    setpci -s 03:00.0 CAP_EXP+10.w=3D0020:0020   # retrain, then load the d=
river

  Results: 8 vulkaninfo runs with 20 s idle between them, no Xid (unlocked:
failed within one to
  three runs). 13 runs of a compute workload started and stopped (a model
loaded on the
  GPU, a request, the process exiting), most with 30 s idle after: no Xid. =
The
link stayed at 16 GT/s and the card idles normally in P8 at
  about 7 W.

  Then the same with the open driver 615.78.08 (unlocked it failed in 19 of=
 20
boots, often
  already while loading): the driver loaded cleanly, 8 vulkaninfo runs with=
 20
s idle and 4
  workloads started and stopped with 30 s idle, no Xid, link at 16 GT/s, id=
le
in P8.

So on this Intel host too, the failure follows the GPU changing its link sp=
eed,
which fits the
analysis in bug 221319. ASPM was already disabled on the link.

Related reports:
https://forums.developer.nvidia.com/t/gsp-firmware-triggering-xid-79-on-usb=
4-thunderbolt-egpu/389811
(with nvidia-bug-report.log.gz, GSP on, right after a failure) and
https://github.com/NVIDIA/open-gpu-kernel-modules/issues/979

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
