Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14F82EAD15
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 17:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480222; cv=none; b=SY6ot+9oCZbqCy49Ef3a+tjX4D3WXGlJov1cWbNvVgLxoh9mk7yDCpCBvVz5El6yjSVhfXaOt6WhL4mhvOp345oEZGmySivLDxpnE5DrCB/A3AmxlFjVFqZfnh4jM0CfnHy2Mt5GKn+TtSSfKofip4ArFQjFNCINtpb60gdqwok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480222; c=relaxed/simple;
	bh=kb6wc+ygJo3YtzX0Wh5hQTnxeo1TnX4cHZGrLXkP47k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OuR++425jbDKZULlMmRv5aULOPFYwt9KbL63G9hrhwxEIGhi0r+20czyolLYaKIlwETCrjYsHdiweC1DifS0oDo6tj0KREzZSq9iGsy+CMgs/zVrcn0DWGcPj4VGa2hgW+JCUdJFphnxwDjdJBKYIElhx+/hja3cQtQbYQorkHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NceGuUTk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NceGuUTk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BA70C2BCC7
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 17:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791480221;
	bh=kb6wc+ygJo3YtzX0Wh5hQTnxeo1TnX4cHZGrLXkP47k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NceGuUTkKLe0k5dIeSehwr5lC+GnsihGUMbcxYgJ5Fe2uoCPJVVphRHe3aTzBf0m2
	 AqBFCJX7jSMHhT6TLcDAMU8IInVao/wrq/aHFMFbGnuj++VPcqXnMNuF/2VQhCLhvc
	 CLwsQq6fV824aytIKaUWaL4DaSCum2coPHvmorJUlnh5b49S0phka7L/i83iunjdNC
	 7wZSj+2/erbA05L47ietOWwnOmGLW0Hb2WeYeoYYCSC+CF86o6MvwDuUxj/6svVN/u
	 x4G/aw9uJtfc4FJFjrqxjxrmum3qLtbZEp5ONRypYnb8uTfC65V/Mp/tv+TvFIk9Pf
	 6LoN06VN16hvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6485EC3279F; Thu,  8 Oct 2026 17:23:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjIwOTFdIFJlZ3Jlc3Npb24gNy4xLjEw4oaSNy4yLng6?=
 =?UTF-8?B?IHBvd2Vyb2ZmIGhhbmdzIGFmdGVyIExlbm92byBVU0I0IGRvY2sgKDQwQkYp?=
 =?UTF-8?B?IGNvbm5lY3RlZCBkdXJpbmcgc2Vzc2lvbjsgc3RhdGUgcGVyc2lzdHMgYWZ0?=
 =?UTF-8?B?ZXIgdW5wbHVn?=
Date: Thu, 08 Oct 2026 17:23:41 +0000
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
Message-ID: <bug-222091-208809-bnC62kKnxE@https.bugzilla.kernel.org/>
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

--- Comment #4 from AlexTLDR (abadragan@gmail.com) ---
(In reply to Artem S. Tashkinov from comment #3)
> Guesses aren't really accepted here.
>=20
> Fetch 7.2.9, revert the patch, confirm everything's working fine.

Follow up on the test. Fresh install, 7.2.9-200.fc44.

First boot, clean command line, no thunderbolt.host_reset. Dock connected
during the session, router 0-3 (17ef:118d) and the retimer enumerated
fine. Poweroff hung again, stuck on the firmware splash, needed a hard
power off. The journal from that boot ends at

systemd-shutdown[1]: Syncing filesystems and block devices.
systemd-shutdown[1]: Sending SIGTERM to remaining processes...
systemd-journald[789]: Journal stopped

so userspace finished cleanly (poweroff.target reached, filesystems
synced) and the hang happens after journald is gone. pstore caught
nothing (Fedora has CONFIG_PSTORE_CONSOLE off, and a hang is not a panic
anyway), so the last kernel messages are not recoverable from disk. I
kept the full kernel log of that session, can attach it if useful.

Then booted the same 7.2.9 kernel with thunderbolt.host_reset=3D0, dock
connected for the whole session, and poweroff works cleanly again.

Summary: stock 7.2.9 hangs on poweroff once the 40BF dock has been
connected, same 7.2.9 with thunderbolt.host_reset=3D0 powers off fine. So
the parameter still fully works around the issue on 7.2.9, same behavior
as 7.2.5 to 7.2.8.

If it helps I can set up netconsole to a second machine and capture the
console during the hanging poweroff, that should show exactly where the
shutdown path stops. Also happy to test any patch or scratch build.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
