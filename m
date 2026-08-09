Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250252BEFFD
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786319222; cv=none; b=D2yiqrhyKdnz+w8YNEpJFDVBfaB3Nwu8kBNfUH6BRbaM+tcO+4Au5NZY04KgguJRiXF4K1A66Pz6+0pqC2zzHitsenG+hZl3c8U87y9xDu83zNPZhUqZSs1m8QVr0z1qjCTmNKWl8XydstWPYhqa7HydTSaHsdTL+j+EYQ7ZA3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786319222; c=relaxed/simple;
	bh=aamgx0vLp3uXSG6gTSey5e2dXMXKb7lJzaTgWM5Jxq8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eJZp5oosTnUA0tUJ8+fpqgz89D/NIKZv1E0pyT9WBfQlJWCMqnHGeJvz3DxF+0gmr77i4Wsc5q9AksCvye9+fzvkPE+497znvw/yXZDqy4xT4Q3DaVEyexEIIIH6k8W0UuHVJ0DNHXbB/UCQ3DYfBZOp+IajDGt50DeQCMkK9wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QO1ASXrQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QO1ASXrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90FA1C2BCB9
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786319221;
	bh=aamgx0vLp3uXSG6gTSey5e2dXMXKb7lJzaTgWM5Jxq8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QO1ASXrQMBCWJiGKiyI1ZvrZ4G8DM4I6t7V6DRBrGfwpDHiIM9QZnjio+52u/tKcD
	 xfGdfs0IZzvtimO7YXPAJv3AsosOxM2HN++7PXWIRirt8r2kAlOD9sGKamZjKOuJ8/
	 xT+hDoYTLNU1LuKUIvrOcNV30HLL33quZ/cmTdqmWrM+bA53KLj2GNx9V/B5VCgXkz
	 HuRWdAykOW1PbCTk1pmFcc/QwjP9VrnJtQ4kHe/Fitwr2kIMhlTEL75GBtou2rGeq5
	 CcDSOqI+CIjJPLi4VkGQQf3tG41ajbT0Kxnx5ky38tuPUeKmXHxEYGbYabSpwnA4HB
	 4VthXUgH9UigQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6C255C433E1; Sun,  9 Aug 2026 23:47:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221861] ucsi_acpi fails to probe on HP EliteBook X G1a
 (PNP0CA0/USBC000:00), USB-PD stuck at 100W SPR, cannot reach 140W EPR
Date: Sun, 09 Aug 2026 23:47:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jayden.blain@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221861-208809-C856w4i10j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221861-208809@https.bugzilla.kernel.org/>
References: <bug-221861-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221861

--- Comment #6 from jayden.blain@gmail.com ---
Reproduces on stock Arch kernel 7.1.6-arch1-1 (not just CachyOS's patched
linux-cachyos build) =E2=80=94 same symptom: ucsi_acpi loaded, device prese=
nt, driver
never binds, zero dmesg output on both boot and manual bind attempt:
=E2=9D=AF uname -r
  lsmod | grep ucsi
  readlink /sys/bus/platform/devices/USBC000:00/driver
  sudo dmesg | grep -i ucsi
7.1.6-arch1-1
ucsi_acpi              12288  0
typec_ucsi             81920  1 ucsi_acpi
roles                  16384  1 typec_ucsi
typec                 135168  1 typec_ucsi
Place your right index finger on the fingerprint reader
Failed to match fingerprint
Place your right index finger on the fingerprint reader
[    0.008172] ACPI: SSDT 0x00000000491E0000 001A39 (v02 HP     UcsiAcpi
00000001 INTL 20200717)
[    0.008174] ACPI: SSDT 0x00000000491DF000 0000FB (v02 HP     UcsiCntr
00000001 INTL 20200717)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
