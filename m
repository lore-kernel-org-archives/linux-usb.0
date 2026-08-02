Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD823AFCF1
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 11:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785670500; cv=none; b=sHLWgS8wOjbcxAUBvWM0MgUwS3u9JHuA8LpQMdmlt/3kvvedXBqqXcPs8QKYRmkA0rBVCfwJOcJlVWDNTP6NhwL7aIurbFNoVZzqkrpTbGEstfQbxltkKek5SX8fRYM9nt8U08d463qcjTH+Ok91eUvUkrsxBwOv3HcSDNz0rJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785670500; c=relaxed/simple;
	bh=3l69cxT7EEK7w6ZTr5XcvRGECXdZvJZg4vaHK+1J4CQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iPKyjCag2IMpvuJ2EbvfbNOTu+Urfo7ioSCf30dHxnC5zzeaSBsDVnKQOV4zB+VTSuJb/CaDod+EiB6+V/4Kj0OVkncw6tpOs+0d7dowj2GB8U/g1eboVKnsjJ5KgvaVkF19/Pu8vlBCo5+Le8F5enNMV/K55hIjn5HC9s4Gupw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q56RVo86; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q56RVo86"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D67FC19425
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 11:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785670499;
	bh=3l69cxT7EEK7w6ZTr5XcvRGECXdZvJZg4vaHK+1J4CQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q56RVo86GRnRiHr1l2dy/OIMB+cMInvt8zltk0Ok5kPhdiOm+rBGN5Q0QGCH4K1OD
	 lK20AneARQWbXu1oZuToJEcZUt/KtK5Io1GD9JARvdhTPRpnieATzsQi3C6HGVfJwZ
	 Wkq6wd0lC5vFnW7DkdcAeXFvWMqTXcXHfRzYvdXgaD68htHKVmMG/keNjTxMyy5fhx
	 daGgAwbfCkP3lxCI01q5ir29Jx6bvp9sf1N4H4wn7PSAEuyeTh74SwV3FWoZ3/z5xT
	 ILP6XVufc+a2BdObR2WIBnZw1Nc7J9dbPAeokmdGBi5E1LzlIsislUqh38wOmwt8ta
	 yqAdeF0qPPBxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EEAF1C433E1; Sun,  2 Aug 2026 11:34:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221822] tb-retry.patch (against drivers/thunderbolt/tb.c):
 makes USB4 link setup resilient to transient sideband failures on AMD hosts
 with slow-to-ready device routers.
Date: Sun, 02 Aug 2026 11:34:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: j.jamesjohnson@icloud.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221822-208809-A2wWXHXrNp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221822-208809@https.bugzilla.kernel.org/>
References: <bug-221822-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221822

--- Comment #1 from j. james johnson (j.jamesjohnson@icloud.com) ---
The 3-site retry patch (CL2=E2=86=92CL0s/CL1 fallback on *any* CL-enable er=
ror; 3=C3=97
retry with 100/200/300 ms backoff on
`tb_enable_clx`/`tb_enable_tmu`/`tb_tunnel_usb3`/`tb_tunnel_activate`) was
ported to the **shipping distro kernel `7.0.14-8-pve`** (pve-kernel build w=
ith
patch applied as `patches/kernel/0052-...`) and is now the daily driver on =
this
host. Results correct the original report:

- **Boot-attached hub self-recovers after ~2 failed cycles (~252 s) =E2=80=
=94 no
hotplug.** This invalidates the report's claim that boot-attached USB3 tunn=
el
creation is a hard failure point requiring a device reset.=20

- **CL-state and TMU failures eliminated** =E2=80=94 the CL2=E2=86=92CL0s/C=
L1 fallback absorbs
them.
- **The link lane-bonds at 40 Gb/s** on the successful cycle (`link width s=
et
to symmetric, dual lanes`) =E2=80=94 the original Summary's "never bonds" i=
s wrong;
bonding occurs whenever lane 1 trains in time, and the retries keep the ses=
sion
alive long enough for that to happen.
- **New errno data:** the winning cycle logged `PCIe Down path activation
failed: -13` (EACCES) twice before succeeding, alongside the `-107` (ENOTCO=
NN)
seen on failing cycles. Both are transient sideband/port-state races during
device-router enumeration; retry recovers both.
- **BIOS excluded:** flashed board BIOS 1.06 (which adds a retimer GPIO-det=
ect
change). Retimer sideband reads unchanged =E2=80=94 lane-0 NVM still all-ze=
ros, lane-1
retimer still never responds. Firmware is not the active variable; tracked
separately with the board vendor.
- 5 HDDs + PCIe/USB3 devices stable under sustained load (I/O at platter sp=
eed)

Open, load-tested asks to restate to upstream when the thread is next touch=
ed:
(a) retry-with-backoff on transient CL/TMU/USB3/PCIe-path-activation failur=
es;
(b) CL2=E2=86=92CL0s/CL1 fallback on any CL-enable error, not just `-EOPNOT=
SUPP`; (c)
re-attempt `tb_switch_set_link_width(DUAL)` when the second lane reaches
`TB_PORT_UP` late =E2=80=94 single-lane sessions still occur on cycles wher=
e lane 1
trains after the initial bonding attempt.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
