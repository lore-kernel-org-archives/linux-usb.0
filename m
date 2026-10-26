Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792995205;
	b=4reP4SAGSYEiFAcJk7TNFwzq0tjTkHtbMnmWzFSk1AylmnAbHGpNt6kDEk/yyPQHd8cj
	 cXFbQ3e76ZCdcn4MfhSEzxl5U6kx6jVPMqTNKeHS4QaM4niSJbhXyzZ+zcatN2mdyKc1t
	 orzvBVGA2/VKtXLJ/F0YyyoxfIbnedrf5f0qllsR1zvuJ3W5IjZFkVDXycGwY+yMUASvR
	 Dkz9xfDD8sND9jnI9D2odHLFdyV0NVtVpshw7KJRGB6dViagPCLehncWA/J4UaMWvUXaI
	 hhguGLV9S40z49jVfVttbXbuYDmcUnnO87gCbcTfeaHCTkL50LnyxR+OpssKlrCfS0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995205;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=6uX0Sac4gFaivSlxEGGCtIYhDJPx7LjnSvYVXPA8ZAo=;
	b=mUnEO+e8BYnTzRHFXTN95lR1QwZxv5H/ALDSwy/J5GOAyPjwC4IJyHWy/orJ0xymOMNt
	 an1rlAV9LxIok0nPJdTd6i8lgFSSxjXL308s86dtHI4S4Ce1kL/b6njWFNMwcxgtdfPWF
	 rP90xjzvwDvO6XquP8AKMfoT9keNChOX1f97RPHtm9LAZDhscLb0fXovpBEqa0qLZpzsy
	 c236y+ArRpiYqxI7IyxP9T0B2ed2XXQi4Ed0oFvQ6QvOvB00VJqakXuZKGqFcmdbh+13D
	 ozdcRPam8UBRpf30Uf26tq1X0ouNpxf3rsO1Cz/ZbNsaoQqDJwyPcAR6Rpyqy0FKwhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R1FNiB7t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC486606A31A
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Mon, 26 Oct 2026 06:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R1FNiB7t
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C926513C0
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 06:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792995204; cv=none; b=khgKCTjxUCS9pFK6iBa0fL4aHghWYCtbcJt7YHWGCo8BVB4HL7h8427wrWjor0m9SbcPuAIxGiEZxggOud2hO+PrPEewVzrA90NB8JKf8zh3rrmFOf6d4xxIf9Fdo/nLOPuRVCRc6Ub5ymCd1T/ILk0uG9WGj9VoA/mF5kvE858=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792995204; c=relaxed/simple;
	bh=h6fdB6/iI9niCBXYPK/VqyIeDLUfgEhl4IsyXuomxHc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HQQRI/0A5Flbj6+JV3PfxJ8TNk56KV9jcxXro0jKv9VHnsvHSP87b+zY2Lzco73eAPDVfryZF4R1IWwylkBb6YPk8VOqLygkvsrtjn+im/RNkJD0z8v0JY6YLnyJYIcDFanb0hc10I0kQ0zhgd6uexy/MiMAKpaa66V27RHGPMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1FNiB7t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EF75C2BCC7
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 06:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792995204;
	bh=h6fdB6/iI9niCBXYPK/VqyIeDLUfgEhl4IsyXuomxHc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R1FNiB7tG9/eMFSBCZ+znyxcaKnO/XYZUvs+kURvbndTPJttYOUcwOX2sIqFuWoAw
	 6ItQW6LowM2In/yIgea+RnWIQDLL2DtAKY2CcLBIH/0zSaLPqzVU3w7jMhguOQzT0W
	 sji0SKZt2XWzLuPPRenQHNasvz+Bh+c9JFrp3U8XRuk8bDv/Lebn+Lm1gfs6FJlHot
	 s/8dHSAR13fYMgH9JvPU1QPmeA45ayMbmYXWgz3A2YMm6o3sXGF7zxKQzpWB4zON2W
	 xwc4ph8JfdxyefotLdqh8OrVbpWIY98O3llRQNHJ792koZuJm7vOunMu8ve5dyTfoZ
	 RLCV7VrJcD92Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 110C7C41613; Mon, 26 Oct 2026 06:13:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220936] ASMedia ASM4242 USB 3.2 xHCI Controller gives command
 timeout
Date: Mon, 26 Oct 2026 06:13:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jiayi_dec@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220936-208809-ezYKbhR32B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220936-208809@https.bugzilla.kernel.org/>
References: <bug-220936-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220936

Jiayi Li (jiayi_dec@163.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jiayi_dec@163.com

--- Comment #11 from Jiayi Li (jiayi_dec@163.com) ---
Hi,

> ```
> [  160.064098] xhci_hcd 0000:77:00.0: WARN: xHC CMD_RUN timeout
> [  160.064117] xhci_hcd 0000:77:00.0: PM: suspend_common(): xhci_pci_susp=
end
> [xhci_pci] returns -110
> [  160.064124] xhci_hcd 0000:77:00.0: can't suspend (hcd_pci_runtime_susp=
end
> [usbcore] returned -110)
> ```
>=20

I encountered the same error on the same controller model, and enabling
XHCI_SUSPEND_DELAY resolved it for me. You could try xhci_hcd.quirks=3D0x40=
000000
as well.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
