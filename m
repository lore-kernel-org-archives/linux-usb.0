Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641373;
	b=5dj+vIJP+YL0N0sTE1yak5xvvQAoL74eYH4B/gtDgRfPCI7Q6zO0c7gsCJRnNkYybWO9
	 mObGtBXpWNM7B8uT78BETp6VyUqmaoQrdb1RR999ldFPQcVJZh7GabJ5rtvsI+10wK2Gs
	 86i9SUemlnjEOmS+tXJVPq1gCsh0T+AyKj8WDEXAKKwVD++83uBA+IuMIsiA3VwKT9p4T
	 aUoK7sGlrXAYn/s2mXG8dfOqlx2+sE7w4jZ4ZiZLKIYoNfl3xgKiW3CtShwtVyU3Ywwgq
	 YMYSjGAgqTBkUQT3lkqZNKdQO9aGuffG0XsJHT2UHingHpZzk5BdhcyFhotS/5UElrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641373;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=Jd2CH+K6JmlMngKsarUL/SWrh36DCSbKJhqVwJcom+M=;
	b=UghyRYG0S+Z7IQ0gt5qmHrWlAVW1bQ8znMRy6TCZbGZ0G/IoGGQYjE5+dDBfdIhGPaBn
	 JtTGZ4sBCuTECNQGlAUnk1dynxY0OzpCL1wUTSFvsXUSC0TitRJMGXS+MzMWVYSyGjt4O
	 Vq9KEYnxeavsKDyQli7jJrXvXjBYuODJxVtBuOw0Gy3fno+XIdIU0Dmy+9GWFZWTJt3uv
	 KDr6wfo9w9Hoz38b3HGsffuyW6PWa6usyBUPQ7pUo8aryyxx6rQfQWWBp7NFdpsH63ucP
	 zjYnyOiEuu9EGXzug5ErUnluK2z9wO7sycJ2Hm/gwi9OmDE/WG1PDD1FLnYeQAfv/Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FY9Vmt7q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140DF606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 21:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FY9Vmt7q
Received: by smtp.kernel.org (Postfix) with ESMTPS id C58611F000C6
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 21:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795641372;
	bh=Jd2CH+K6JmlMngKsarUL/SWrh36DCSbKJhqVwJcom+M=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FY9Vmt7qCzQ5kWF6MDnoTbezdB4PKwYVxnVgcJAMPkIUtEzTTetW8dcQZSAsozYaL
	 VgWf8AiVKV+VTcYXmuKbRuxbsW0REC7GScGrVnYu/579gUYDoKoBroJUWae3ytcpwJ
	 zHQxzA7CwVuZorjMgL+aYsdZXBouER6v1b+eypw2RiCiyUEGHd7GppVDaYv7jvBRWT
	 e+WZkuz3MRxOTrKEFc3JiQ9afdwVZIJ640DK7V1sJ+S7j4efv+nVxOhENFCkox5vzP
	 2cENxwcT6pkuXl4Pwfzk36+kZPoez31k+tifX/LcXZlGWAPtdg9RDhMinhQwmvAxpQ
	 Z4vj0TPi0aT7A==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id C289C240040C; Wed, 25 Nov 2026 21:16:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222328] xhci: ASMedia ASM2142/ASM3142 [1b21:2142] skips
 transfer event for bulk TRB before link TRB -> UVC stream (Elgato 4K X, 10
 Gbps) stalls with "not part of TD"
Date: Wed, 25 Nov 2026 21:16:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222328-208809-2tCQqFvu9B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222328-208809@https.bugzilla.kernel.org/>
References: <bug-222328-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222328

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Fascinating, the same happens on my ASM3142 with a 5gbps UVC capture device,
but I haven't seen it with other USB3 bulk IN devices. Typically for ASMedi=
a,
the bug is random (several TDs at 0x...fe0 succeed before the first missing
event is logged). Or maybe it happens if the unreported transfer was short?

Patching uvcvideo to only submit one URB at a time (#define UVC_URBS 1) see=
ms
to fix it, but 2 URBs trigger it about as quickly as 5. Seems to happen fas=
ter
if the device is behind a hub.

Windows works differently, it uses Event Data TRBs so if the transfers do
actually occur but IOC/ISP handling is broken, Windows won't notice. And th=
ere
is never such a thing as a transfer TRB immediately before an unchained lin=
k.

But implementing EDs properly seems like a bit of work; I think I will try =
some
hacks like padding the ring with NOPs before the link...

I haven't seen this on ASM1142 and Promontory yet.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
