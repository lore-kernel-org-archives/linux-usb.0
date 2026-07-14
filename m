Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5529C3DD523
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 06:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011580; cv=none; b=JSvgzU1zl5vo6idlo3h+GcURYe5+6MBAheYNBYJ4CAGCF1kYwxsTqGPnK8i5URRHNY4Z/Tt7OrVCve2XJWjJCBQIMlg0WLltKrJHQoVFz5KDN0zmDP2t3VeyzaH9F5bYOK56T2JUOI4aXMvpielYhhQqiLKbi/mQbK+YIFCfOD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011580; c=relaxed/simple;
	bh=EkIygYk8dIniCtSqZzsCFKBts13kbAq1xkr5enUmX28=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vCrx32QQy4gi9GnuAVXtX++PC6vtqHM9mgP7oPP0eCsvsMdQbSJ0F0PGeRR1HVNnMZghmtOStKXfM5D1u9WcOoFnjFjNBwJ6Fg0Q/p4scG73ahfU2H4/9rDZqSOyeaSD3YA1yoILBgGIHrRh1KQ1K5H7wtgkCPoSE3hTr9xy9BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTLkmfQA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTLkmfQA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E19B6C2BCFB
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 06:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784011579;
	bh=EkIygYk8dIniCtSqZzsCFKBts13kbAq1xkr5enUmX28=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jTLkmfQAyTpEOY38iX3Ctmw5k1m8TmbmtosAi3cu0fkL1JkEvMR0hOr5KMM3ZSRRk
	 Q2wZINlGbWj68qNEHpbdW3n8qZSI4W1RqQnUjW4xpeTR0kSFg1FnOY+zXyFx09dE1V
	 IDmt25HHKlvMmLDiDt8EXWY5tcBWtmByp9j0ijr6z4goi+86drWLfhIGrWEy/hR+Mh
	 sjQQaWYQ1z4Uk/RiLVb8aZWOjQ8iCmQ1717ssmgFT41LdwQVVnnnbWvqHkrYjaqNsl
	 GYPQq7fg6qSRQttFnwm4AMvPJAYnf8IIDCk0KGZDHKDjHH8hdFQ22jiGlgNLe9b0eY
	 IRa6UKg+rLh/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D31EAC433E1; Tue, 14 Jul 2026 06:46:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 14 Jul 2026 06:46:19 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221073-208809-ip7pLe1TTy@https.bugzilla.kernel.org/>
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

Francis DB (francisdb@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |francisdb@gmail.com

--- Comment #66 from Francis DB (francisdb@gmail.com) ---
Framework Desktop (AMD Ryzen AI Max 300, BIOS 03.05), rear USB-A xHCI
0000:c2:00.4 (1022:1587). Baseline on this machine: ~32% of s2idle cycles k=
ill
the controller ("rtcwake -m mem -s 300" loop; 8 deaths in 25 cycles, on sto=
ck
7.1.3 and on 7.1.3 + the earlier delay patch, every run dead within 1-6
cycles).

With 7.1.3 + the v3 device link patch (attachment 310446) the link engages:

  amdgpu 0000:c2:00.0: USB controller 0000:c2:00.4 D0 power state depends on
0000:c2:00.0

and the same reproducer ran 28 consecutive clean cycles with zero controller
deaths. The v3 patch fixes the controller death on this hardware.

Re the full-system hang in comment 63: I have seen the same thing here, with
two data points that should help classify it.=20
(1) It is not specific to rapid cycling: my cycles are 300 s suspends, and =
the
machine still hard-locked once during an overnight v3 run (no ping, no kern=
el
output, nothing in pstore, forced power-off).=20
(2) It is not from the v3 patch: I hit the identical hard lock once on the
completely stock kernel too.
So it looks like a separate, pre-existing, rarer bug (~2 in ~35 cycles here=
),
not a regression from the device link.

I am testing the v4 patch (attachment 310447) now and will report back with
results.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
