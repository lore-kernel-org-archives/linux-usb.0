Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325C03630B5
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 21:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783979525; cv=none; b=ReEmr3mZ03L/MPBPEVVXTBHx/p+MStJj6+Rc+0DmgecET3y7DxftAIm/lXO6DL3aCqrB6EFwakWhY0n0Szv7vuC2YRXfC0vv1zkXWrDOkhEVodWubY1rRBV07CubfTN0T5APMsGUWcaL9Qv37qgZ90iw+djJ83UzvtVflIu+gCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783979525; c=relaxed/simple;
	bh=Bgaw0F6s8/pBxWBx3I/ac4bpORdDpxDw+P8AakTN+J8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BG532xpeWTtle788UcNbp/22A5VN9SiMqCfS+5zJdWA6d6+r62q2D363BxdgM4Jgyyl8GPxPdRPhpijI24dNDLij5okI4cw5n2ZStF5lmEIPLygsH95X6luOKo9HMAtBoierswm+Jy2iTDg7V8fxFP98cb2oB2+9htebAPoR9mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSOZURRm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSOZURRm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93556C2BCB8
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 21:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783979524;
	bh=Bgaw0F6s8/pBxWBx3I/ac4bpORdDpxDw+P8AakTN+J8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZSOZURRm1M7JSqqZmQQJGSGVEC4nsgvsQBF/wSZKjasCEYie8y+2NTay5rw6KygbG
	 6RZOS7rwhRmrHlYdC6+llzgPqI++oAvcQRYz56t9HKcL+VWcsOP8sQJsd1SUlR6loh
	 kAmuvcU8ZlvSRn856FW8q8HygZpuK6255DRYwPHBbXpHdmvO3I+DwQpV0arxD1nUXp
	 hMmXYbYyCGr1evctcETeXTnup+8R9Z2ChCfbmZ0wPe6MUoiqw15yOQTVB0Qir4Ix7w
	 yph66J4r8gDsjX3cglrnFb0oq0qWOf+/+0c1zyHwHD0YTV68iSZ9KfJxZ63/hd8ljO
	 gXDFO+IZ8y/bQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7CB36C53BC7; Mon, 13 Jul 2026 21:52:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 21:52:04 +0000
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
Message-ID: <bug-221073-208809-0QDv2ABwtR@https.bugzilla.kernel.org/>
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

--- Comment #63 from Alexander F (superveridical@gmail.com) ---
Wait though before submitting it anywhere. I managed to hang (black screen,
backlit keyboard indicating it's no longer cycling, unresponsive -- first t=
ime
something like this happened) my system during particularly rapid cycle
testing. Nothing in the klog. Could be unrelated. I'll do more tests tomorr=
ow.

And we of course need others testing it, not just my particularly suspicious
Z13

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
