Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5647C477E32
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034297; cv=none; b=ISdkS0pQMle7UZf1OHuKiiD3+SLvysVpdD2Q+kEC1R+NDh9V/sMKlgHDLtexZkWee81jK9hQHwnxc/CgnT2QXott2luAIOuoDOlmk+atRaRPtJEMcA5uIXaWWzaNbT68/lkJuQy9uXf24R+Mopl+g5qDkHRFUPDlSxTRriZO4Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034297; c=relaxed/simple;
	bh=OvYwtRwcCrT2TPQLtA+N9AEzX9RCY/ReOs37ZEq+n74=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c2s/6zNMxOtTTyXG5oDKvpeQM1vKuOUPBPC+vfIDFfGE5lwf6V3Wmm0AaCcUqG+E51LnU+J1a6mEi0nwzKR09rD8cgie38jnzkv+iW3SdaaR+etUvVZbBhPEB20wnxk8CXnmll5lWjFDr3P7fKw6e7q8MWN0ezeYNHSYfz0ByT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+AxJ3Va; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+AxJ3Va"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4364C2BCB9
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 13:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784034296;
	bh=OvYwtRwcCrT2TPQLtA+N9AEzX9RCY/ReOs37ZEq+n74=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l+AxJ3VaWup0wjQIEcFzyedBkabpTqQNb7y8T7zv/SxbUWDSvaDB3gRb6BOhOBUSl
	 UvRjA5grlbgpPcB/zIWU0VrdDOXsZjkwo6Z7oGDwpdADHtx5A6JovIurd7NheBF8Xp
	 VoLkZX4JggjB/zw/sdGk+dJ3VgZ0R5vXll1IF14lk5y02u5zS1tMQZgZ1vtVF+yqEC
	 9AWrxYYD/fbiGlaRQbdP3dGAJcMwphELjL8rz3Fky0N4CjrY06FxIHAuY6tnGy9+c7
	 D1O/iD6ws29vpd1W9ySE1EvuVqu1SRgiM6Vm5C/jxEIftQ+Fys9rqF3ZB9DQgOQG1s
	 meotfOoqRcQog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CFF6DC433E1; Tue, 14 Jul 2026 13:04:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 14 Jul 2026 13:04:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: francisdb@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-6obSKNk8mV@https.bugzilla.kernel.org/>
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

--- Comment #67 from Francis DB (francisdb@gmail.com) ---
v4 (attachment 310447) results on the Framework Desktop (AMD Ryzen AI Max 3=
00,
BIOS 03.05, xHCI 0000:c2:00.4): 146 clean s2idle cycles, zero controller de=
aths
(6 cycles at 300 s suspends, 140 at 60 s; baseline without the patch was ~3=
2%
deaths per cycle, every run dead within 1-6 cycles). The link engages via t=
he
SMU path: "amdgpu 0000:c2:00.0: [drm] USB controller 0000:c2:00.4 D0 power
state depends on 0000:c2:00.0". The v4 patch fixes the controller death on =
this
hardware.

On the full-system hang: after arming hung-task/soft/hardlockup panic (dump=
 to
efi-pstore), I got 140 consecutive hang-free cycles on v4 with the rear por=
ts
empty. Given I previously saw hangs within 1-13 cycles (twice on kernels
without the fix, once on v4 with USB devices attached to the affected
controller), it may be a rarer expression of the same resume race rather th=
an
an independent bug. If it ever fires again the panic trace will be preserved
and I will attach it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
