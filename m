Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241463D9DBC
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791312442; cv=none; b=AfKTlbLSSeF2tiF7N9mxRNZZqVXcMAZaHPjA8722OtbUOrZ8Dw7pWZBtCAykkJHB5ffliiBA8rXeovRuDrwA2uK4hgkuI2KMuft6/w/+i99W770FFk3bYK6D9rouvPzPi4v9fem7mXBJ6BKBHwVbegrbp1yvkFLWVtp0Hfc72ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791312442; c=relaxed/simple;
	bh=xkQ/7n/N0PYPQvZEZbjnNqvj7kaklAb2LiKSwwOxCBI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uzg5Q0+80Nn++4XpR+1QO7b9sNy18cokxO6h1Rb6Ru4lNkDqvpiAgMM7bkoNlN1nLnt34T+lZNqjevGli8nPuDTL2u6zzBKR9q4vTWzJjOGNJrNicl467KzO/eTWsVPXCkxQ2THEleLtN6o2HyXs6TobIRfGESJJBkPMLx8ikJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7p6CPfw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7p6CPfw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C14FC2BCF4
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 18:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791312441;
	bh=xkQ/7n/N0PYPQvZEZbjnNqvj7kaklAb2LiKSwwOxCBI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f7p6CPfwFFkrsYZM52VQUl+4gdwJzNdm/tUP/c3lW8vafQb7ZQEWr2qYbKVVm/zaM
	 srS7yt1Ffx1caMRw6jaAlvrw5sbbzcXNaCEoyuLfSToLW5KRDKeXPNI5u9klad41zz
	 ozR/EFlZZ4ks6VNXkKVPMyHZdL24NWBmZO/bjRZK5HljIA5Bd3lBcXh/ltUrosQnX5
	 31WO3RZDiHlIkwtLgzV4Rlx4w+oCF0SkXgzR5GD08FdiJSCFhpNP8dVb1PwFa0vpM8
	 ICp2ToR+qjQNA9wKE/GOPaGEqCP3+who/rLwEP229LyH7uD7THhcyXgv8Dnb4OxN2E
	 dsBtotl1XRwOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7A87DC3279F; Tue,  6 Oct 2026 18:47:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjIwOTFdIFJlZ3Jlc3Npb24gNy4xLjEw4oaSNy4yLng6?=
 =?UTF-8?B?IHBvd2Vyb2ZmIGhhbmdzIGFmdGVyIExlbm92byBVU0I0IGRvY2sgKDQwQkYp?=
 =?UTF-8?B?IGNvbm5lY3RlZCBkdXJpbmcgc2Vzc2lvbjsgc3RhdGUgcGVyc2lzdHMgYWZ0?=
 =?UTF-8?B?ZXIgdW5wbHVn?=
Date: Tue, 06 Oct 2026 18:47:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: abadragan@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222091-208809-SmWiVLDhWa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222091-208809@https.bugzilla.kernel.org/>
References: <bug-222091-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222091

--- Comment #2 from AlexTLDR (abadragan@gmail.com) ---
(In reply to Artem S. Tashkinov from comment #1)
> Could you please bisect?
>=20
> Any LLM can guide you through it.

Follow-up: I found that the regression is resolved by the kernel
parameter thunderbolt.host_reset=3D0. With it, the machine powers off
cleanly even after the dock has been connected during the session.

Looking at what changed in drivers/thunderbolt between the last good
(7.1.x) and first bad (7.2.x) kernels, the suspect is commit
5f40cba7d4 "thunderbolt: Assert downstream port reset on shutdown",
merged for v7.2-rc1. That commit forces the host_reset path in the
PCI ->shutdown callback and asserts PORT_CS_19.DPR on each connected
downstream port before tearing down the router tree. This matches all
observations on this machine:

- the hang only occurs once the dock (router 17ef:118d) has been
  connected in the session, i.e. once a connected downstream port
  exists to assert the reset on
- the fault is latched (later unplugging does not help)
- host_reset=3D0 skips exactly this new shutdown-time reset sequence
  and the poweroff hang disappears
- "modprobe -r thunderbolt" deadlocks in the same teardown path

So the regression appears to be in the new downstream-port-reset
(SBTX-low) sequence: on this hardware (Insyde BIOS 1.07.03dTPCS,
Intel Core Ultra 200V, NHI 8086:a833) the assertion against the
Lenovo 40BF dock router never completes and the machine hangs at
firmware handoff.

Since that commit fixed a real issue elsewhere (60 s polling of a
dead link / warm reset on some platforms), a plain revert is probably
not the answer - perhaps the DPR assertion needs a timeout or a
quirk. Happy to test a patch or a scratch build with the revert to
confirm the identification.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
