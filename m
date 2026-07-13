Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5C43624AB
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783925066; cv=none; b=SOArvyWjm2cswqrTrun3mHERkf87ScEugr1qh1xZnvGYHhKBIymQmVZZu3MikmnIHplLqwzBnjkKsSRWmyiYBKp2uc6LtlQBZCY5fscVE63LWylnBLRRoED9Ke9xV0vPf960brgpFT11B2MwjuZeb2vLWERc7Yat6KB9HLQb0no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783925066; c=relaxed/simple;
	bh=hHv8fePnIK42yk0NZz2NN7M4tZHAIGfD8wXQDcJeN4k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tktTjRXuzSmuk6AoM6L6p7FkV2CtNmQxUUP2yZAYNtvnFTzl053E0UmpFsvPdVI+2XXqTFY+AWJNwxJ9bdBInXX2/RECR21QYC4SVre/SRG/hloILuR5MM7lcHz7Olty5ZerkV4kDEVCnQKiOVgpGzKBb3/reR1xYbnybH3rviM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsMbccep; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsMbccep"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D677C2BCB8
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 06:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783925066;
	bh=hHv8fePnIK42yk0NZz2NN7M4tZHAIGfD8wXQDcJeN4k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tsMbccepxBF9jEkqeCTeSYWjk0jiHeyKwMX/P/d1rFM6rtWPObwfhb56oMh1MXHxy
	 j1g6I/Cm8ab/J200wsnuWrawtehMGrPu6a/FhJAaTi2Ic3ETLKSSRUT/dMc87+Xs0n
	 rKiRaEGs/N4d8p2SsNlxUVCoHYciGHoJ+wavZYnc8sY0uizNOuI3WqRro42SS7NSOO
	 fZC8rJIyMrgnKCoskXnvyyY89ko1BzDF9eiU+Q25Bdfp69rd4h91WE8kIlugDKmt2i
	 2NpLwIlethCqPK4mG4+lomKLzDP8mu0UTXkeuJSxyNFAtATAzke60u/IYzuHWUsNJf
	 v8dytTYCr75mQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1DDC2C4160E; Mon, 13 Jul 2026 06:44:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221721] prom21-xhci does not allow to use USB keyboard in
 plymouth
Date: Mon, 13 Jul 2026 06:44:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: hurryman2212@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221721-208809-On8WcF8pGN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221721-208809@https.bugzilla.kernel.org/>
References: <bug-221721-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221721

--- Comment #9 from Jihong Min (hurryman2212@gmail.com) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #8)
> > I may end up doing PR to that as well.
>=20
> Well, fixing this is nice, but do you plan to fix this on the kernel leve=
l,
> too? This is maybe a borderline thing wrt to the "no regressions" rule, b=
ut
> still would be nice to prevent problems for users that do update their
> kernels without updating their initramfs tool.

Currently, there is no plan to address this in the kernel.

During the patch review series, it was concluded to implement this in the
Renesas way, which does not "pollute" the generic "xhci-pci.c", and requires
the very same approach (initramfs building tools must address this issue to
explicitly include `xhci-pci-prom21` same as `xhci-pci-renesas` (for dracut=
),
or "correctly" detects the module tree for system-available devices in so
called "dep" or "hostonly" mode (it seems dracut fails in this point but ot=
hers
look better in the handling routine).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
