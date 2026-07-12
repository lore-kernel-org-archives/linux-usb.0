Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FFBE56A
	for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783872177; cv=none; b=QEWifaMxKjctQt+AqJVC5fc7reykb3aKsWQE4LvWWgi0ccbWmNdM3En7Iu0ta+IWQhTaILCvph41Wx2m2R7SuWpriDGwPlqtBzRxSrPsAZcmv1rs88hBChbnVuz4jh3mKqB2bSQHkIDF2i5/4BjfQpnzZgLPyu2PhcF0KTv0DZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783872177; c=relaxed/simple;
	bh=YBfbZlfQWPBbTUn9LaLDtUvVrc3O4G/EG+rT/9WyQpI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MZzhDScHbZ1oDr8+3OYfVw5Om/q9DPnmfaPG9JZEIkPhQojZokZ3o5Dh6qCrYYyiI/IhJYBLLC3GgH+ET4qPsqpMYU5r36ILabbm67tJz3086WPVWo9a3sAadIesZlFeL5exJQLQfEBjzPRGverrVf8bpKfwWadLdZJ/VjxM4RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/ysXJFS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/ysXJFS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D7ADC2BCF4
	for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783872177;
	bh=YBfbZlfQWPBbTUn9LaLDtUvVrc3O4G/EG+rT/9WyQpI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e/ysXJFSEFaF/WKOiYlkQyAZDFhSwjrtHrYW09040YKaPxCiUU6+lLQb6lGwnpE2G
	 eNmyPABDvn0cc7XP6xwcUMCsXhwhWevI/iHpsRpiO8dhBYG+yYh+3Roc/YJuzW2g7o
	 9NnQM4kS0S1u2WqyGKHK4/QBqqEAlojqn1ydaWXyM4IsbWRyZQ/sAobP5Awkzu+dAJ
	 t+h1TO7V18URXzR0DjsJlXhZSD44iBTG4kv48Vc/SrW31kS7COVJp99ZdNlYFZSHo1
	 cGqdqywuuPmtEZyyy3WCWTnCAx1n4JODj8csT+YxE14Dk8l+ZxFBwQoqKL2uCcCncw
	 sgyFe1HEfWGkg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 37FFEC53BC7; Sun, 12 Jul 2026 16:02:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Sun, 12 Jul 2026 16:02:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.c.hubbard@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-3ZcBkNpymG@https.bugzilla.kernel.org/>
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

--- Comment #51 from David Hubbard (david.c.hubbard@gmail.com) ---
(In reply to Alexander F from comment #50)
> Unfortunately it still failed. First on the 2nd cycle, then on the 8th.

I also got a failure now, after more cycles of testing the patched kernel:

[ 1213.160470] ACPI: EC: interrupt blocked
[300397.315230] ACPI: EC: interrupt unblocked
[300398.002554] [drm] PCIE GART of 512M enabled (table at 0x000000800090000=
0).
[300398.002615] amdgpu 0000:c2:00.0: amdgpu: SMU is resuming...
[300398.008114] nvme nvme0: 32/0/0 default/read/poll queues
[300398.026094] amdgpu 0000:c2:00.0: amdgpu: SMU is resumed successfully!
[300398.053810] xhci_hcd 0000:c2:00.4: Port resume timed out, port 1-1:
0x400e03
[300398.104761] EDID block 1 (tag 0x80) checksum is invalid, remainder is 1=
91
[300398.107810] amdgpu 0000:c2:00.0: [drm] detect_link_and_local_sink:
manufacturer_id =3D 6904, product_id =3D 26A4, serial_number =3D 21BB1,
manufacture_week =3D 26, manufacture_year =3D 19, display_name =3D ASUS VW2=
66H,
speaker_flag =3D 0, audio_mode_count =3D 0
[300398.148104] [HW_LINK_TRAINING]:enable_link entered
[300398.148105] [HW_LINK_TRAINING]:link disabled
[300398.148106] [HW_LINK_TRAINING]:enable_link_hdmi entered
[300398.182298] amdgpu 0000:c2:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng=
 0
on hub 0
[300398.182305] amdgpu 0000:c2:00.0: amdgpu: ring comp_1.0.0 uses VM inv en=
g 1
on hub 0
[300398.182306] amdgpu 0000:c2:00.0: amdgpu: ring comp_1.1.0 uses VM inv en=
g 4
on hub 0
[300398.182307] amdgpu 0000:c2:00.0: amdgpu: ring comp_1.2.0 uses VM inv en=
g 6
on hub 0
[300398.182308] amdgpu 0000:c2:00.0: amdgpu: ring comp_1.3.0 uses VM inv en=
g 7
on hub 0
[300398.182309] amdgpu 0000:c2:00.0: amdgpu: ring comp_1.0.1 uses VM inv en=
g 8
on hub 0
[300398.182309] amdgpu 0000:c2:00.0: amdgpu: ring comp_1.1.1 uses VM inv en=
g 9
on hub 0
[300398.182310] amdgpu 0000:c2:00.0: amdgpu: ring comp_1.2.1 uses VM inv en=
g 10
on hub 0
[300398.182311] amdgpu 0000:c2:00.0: amdgpu: ring comp_1.3.1 uses VM inv en=
g 11
on hub 0
[300398.182312] amdgpu 0000:c2:00.0: amdgpu: ring sdma0 uses VM inv eng 12 =
on
hub 0
[300398.182312] amdgpu 0000:c2:00.0: amdgpu: ring vcn_unified_0 uses VM inv=
 eng
0 on hub 8
[300398.182313] amdgpu 0000:c2:00.0: amdgpu: ring vcn_unified_1 uses VM inv=
 eng
1 on hub 8
[300398.182314] amdgpu 0000:c2:00.0: amdgpu: ring jpeg_dec_0 uses VM inv en=
g 4
on hub 8
[300398.182315] amdgpu 0000:c2:00.0: amdgpu: ring jpeg_dec_1 uses VM inv en=
g 6
on hub 8
[300398.182316] amdgpu 0000:c2:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv=
 eng
13 on hub 0
[300398.182316] amdgpu 0000:c2:00.0: amdgpu: ring vpe uses VM inv eng 7 on =
hub
8
[300408.195596] xhci_hcd 0000:c2:00.4: xHCI host not responding to stop
endpoint command
[300408.211433] xhci_hcd 0000:c2:00.4: xHCI host controller not responding,
assume dead
[300408.211448] xhci_hcd 0000:c2:00.4: HC died; cleaning up
[300408.211785] usb 2-1: PM: dpm_run_callback(): usb_dev_resume returns -22
[300408.211810] usb 2-1: PM: failed to resume async: error -22
[300408.216609] OOM killer enabled.
[300408.216612] Restarting tasks: Starting
[300408.216696] usb 2-1.2: USB disconnect, device number 3
[300408.216712] usb 2-1: USB disconnect, device number 2
[300408.216760] usb 1-1: USB disconnect, device number 2
[300408.216768] usb 1-1.2: USB disconnect, device number 3
[300408.216771] usb 1-1.2.3: USB disconnect, device number 4
[300408.217523] Restarting tasks: Done
[300408.217569] random: crng reseeded on system resumption
[300408.217614] PM: suspend exit

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
