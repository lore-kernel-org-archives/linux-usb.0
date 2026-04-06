Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1B8396D2A
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506270; cv=none; b=gT/a1oddDuRU7BZP5g7sDfhdQ7tNkEfAVA3Qy3LB/LB4kvd4fgBd5M3uWEK0g5OVTNMzQCcCl6M0eYcNK4hkoqLxqbqjpx2GzhMzeHcLjGsp9AQD+h7ER/oftcgp3XbgPQgZe83c4AX2uWl+BhGTbPporBCayTlEg6jpaDwhwbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506270; c=relaxed/simple;
	bh=EEFoYLO0VoNlVzgVII5/7+uGzBVNu0QjxpZ6WPgRio8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wzk2O5XFg87lhIdHy/HaCNzhpK+gzVnfffnNZHYKkWItQjjQV5cQCkVMRBqR+jtQHTN+Mnty8bccMI+CdrZ5aGxPB30vcej7CqLoBpAo6KRvSpG4njlXny255VxNH/KIjXhpfXSmRFBwoN8Bk+Qr4iB68MQhDIP0zjIgoxgTHgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChIs+giw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChIs+giw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88E48C19425
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 20:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775506269;
	bh=EEFoYLO0VoNlVzgVII5/7+uGzBVNu0QjxpZ6WPgRio8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ChIs+giwuTveM1zgb1QS6VI4QcRht0dHyL4nhimeUIkSqksiU4SQmCvetTQwRZ/MV
	 8O10uOumcxK75bvuEcLdeLr96BZOf2wzSjEd+9nS9ykyl3ERLdI5+ZfF0UJw/ll8Pp
	 PlT+CHO2fKVU9zrxmn/TZd5jJNqbDg/562BEcL2p9AD6X1tm6M2dQP/BHuUz705a0n
	 QBiEyFr0xcxdBu68bK0ZyMHqFE/OjpGqF3fmGNGNpGBkZkx+uUcnYCVwdoAEC+JDcn
	 UBSa4ro37rAFiCHeRCKjkusibhJwEA1vmsBZpbjOETOnJ/nMxiajcYEGPoPS64pq8w
	 ZPNQS2Mz1Qfrg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7C0E1C41613; Mon,  6 Apr 2026 20:11:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Mon, 06 Apr 2026 20:11:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: manauer.uel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221318-208809-9lB4DVNy1p@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #18 from manauer.uel@gmail.com ---
One addition to the mouse comparison table. I checked the Logitech Lightspe=
ed
Receiver, the wireless dongle that was observed earlier to make all other m=
ice
work when plugged in alongside them and the wired mouse re-plugged ...

    Logitech Lightspeed Receiver (046d:c539)  3  1ms/1ms/1ms  yes

It has 3 interfaces, all polling at 1ms, which is exactly the same profile =
as
the failing mice. Yet it works on its own and somehow makes wired mice work
alongside it. This unfortunately does not fit the pattern from the previous
comment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
