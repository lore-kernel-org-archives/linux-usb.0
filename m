Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053893;
	b=JLEx1RSQ0sCC3gvmqESRp+0154ED0t57L6WXTAlXq2spuJDSUuXb9Rkxa/47sK4/U+hX
	 leCGzB5i3mfDf/HHyJG8B+XIcf+a10kUhzBUc5A7gZBnbkaT89jBT0MixuRvW76PzFrLc
	 YT/m5n6VoGkOPTvQ1nkKjpyfnMQ6RBakjYi1fFKB9GayMfogcPCzfidk2tMTHsRRmovQZ
	 gWq7gyT1TTduepfTAdEPc8sd/IbtNMPJkFR3cU1vRo3kYvdQp+LDtGNCM8YpExprn3l3f
	 F2gkL7DIMDzcS2Uozer29C0TQkr58qV+q8s0yLgMHDUG5YPCcBN+JO/xRPg7JLdql0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053893;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=8I63dy0EoudZBSmSdCMobKtQ+lOSGhvQLDiEcWU+Z0U=;
	b=lxIsxy9WVux6BLp89aZqwgH039oPcPoy50nY7+NC9728GPg4BC2eApRkV2/8I/zJxMun
	 2yaY7SEkdow1zfl+EmyqmEio/5pLrcYuwnKMClCiquMATjO5NdcGgWWu1HlP3gF8r475F
	 8Rre7D3OHVt1Wco3IRUUFPXxmom3cU8ny5SB82q31rHVf+CEm/1cHj+iaoOIpllxQSlva
	 zjniu3dTVZSQQHB46lAZFIY9D5DyZEiVQN1/UJYSgcth9umE2CYuZkm3NHxNaqqXqMv+S
	 DPU+tSHjNvWgi9EAH3phdhkYFB3dBYZimvfxgvrGNTRDfFkkHf84IvjV9dztS/AynGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmZUsvKJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E4A606A31C
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 02:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmZUsvKJ
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CDD31F000C4
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 02:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795053893;
	bh=8I63dy0EoudZBSmSdCMobKtQ+lOSGhvQLDiEcWU+Z0U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=UmZUsvKJstazJ7Cw1VO5zRHI9YcHI7bFPQKbqGgLYVSSRMRQ/WXYtVNiqlc8XxxNq
	 D6DDGziY8L+SLRWSHNrFGUVNtZ17RenhNU4aVwPVkrsg2wWYOorSVJvab7824Ib4xg
	 nTBciKawC+QQBWdNPhPP/FIkkZXTsPxKfmCZ4HojN7xw5nDb+v5dPatyllkqifDwNo
	 FKKG7+62PoX0kbipcP9Tbbd44ABNhLCju63DcQzWpe/5xFXoifyzckwIzPoe5Mf74X
	 kYUuUa6zW2NNYhCm2sjjpaZwW0qNujuUd3vB5R1YpKx5wPAWLBSX7qcMifpMLEfeTm
	 w5jlskcQKwgxQ==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 5F5D7240040C; Thu, 19 Nov 2026 02:04:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220193] PATCH 6.1 082/167 which adds support for Owon HDS200
 breaks functionality of Owon VDS1022
Date: Thu, 19 Nov 2026 02:04:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: daway320@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220193-208809-Zf1q1xbCtg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220193-208809@https.bugzilla.kernel.org/>
References: <bug-220193-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220193

--- Comment #10 from Wei Huang (daway320@163.com) ---
Hi leStoppe,

Closing the loop here: the USB serial maintainer has weighed in on
the mailing list thread.

Johan's take: there are now users of the in-kernel owon driver (the
HDS200 serial use case the original patch was written for), and
libusb itself has a mechanism to unbind a kernel driver when a
userspace application wants the device. So the preference is to keep
the broad match as is, and VDS1022 users should unbind the driver
from userspace rather than have the kernel match narrowed.

The v2 patch has accordingly been withdrawn - nothing will change in
the kernel for this device.

What this means for you in practice: your current workaround (module
blacklist) is the way the maintainer expects this to be handled.
The options:

1. Module blacklist (what you already do):

       blacklist usb-serial-simple

   Note this also disables the simple driver's other devices
   (NovAtel GPS etc.) - fine if you have none of those.

2. udev unbind rule (finer-grained; untested on my side, please
   treat as a starting point):

       ACTION=3D=3D"add", SUBSYSTEM=3D=3D"usb", DEVTYPE=3D=3D"usb_interface=
",
DRIVERS=3D=3D"owon", ATTRS{idVendor}=3D=3D"5345", ATTRS{idProduct}=3D=3D"12=
34",
RUN{program}=3D"/bin/sh -c 'echo %k > /sys/bus/usb/drivers/owon/unbind'"

Since the OWON software you use does not call the libusb detach
interface, the unbind needs to happen at the system level as above
(or upstream in that tool).

Sorry it did not land as a kernel fix in the end, but thanks again
for the thorough report - your descriptor dump settled the technical
questions, and the maintainer's decision was explicitly informed by
the real-world usage data from this bug.

Reference thread:
https://lore.kernel.org/linux-usb/20260810091322.2201740-1-huangwei@kylinos=
.cn/

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
