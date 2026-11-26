Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696183;
	b=MsNG42KnABKUMVX6KeKHavdhNKbGg6pzvKDuLCsjcJOxevcD89VWo1IvtAA7mOoATvCc
	 lRSr0gIHrb/ziEedouX/ZsS7FbxoUPd375aOuxRxAIqqjXAYYREMj4n0UcyFXB256sNos
	 uJ6nGwBgNXvwcV8SirkBtrlVLcsp/DSqx31+3a/HFj/0emzjLunt4g3Nog6GZJjDokuYj
	 ySelW+hbXHUlPZfTeb36/LX88V2EutlL7TEhglqG8U7KjWsvrKCnniW5ZDzA88VyGM1t7
	 pUq6jqA42dQ2LK1d9K2TPtR15rvH1zMsorX7v1/NtsN/1tmsf3CRidIZInwoPleP7BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696183;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=Wi2Cl5rp10lePVzryMXDl+moVJY6pZGwBVYcxjs7goI=;
	b=qFnGf3+QGNXmzAOOmNg8C2TG7Lpl2UTWQ0ZtgGrR+NLFuzzdyzqwFXnKyxIXInYqdVWt
	 UrLJKdHmi7NOjrM9xldl7wMPHQmuESqiINqo2+7HnnjF2Kii18Lr/7X+3qyZFAS+cIDt8
	 lHEa8JUQhiCogJ5qZCR/EFJEGZucuRC+nBgqbM3CoPiWsd0eij0gBoRgI75fvaFkggfKx
	 Pf+1cEFHVMna/Az/JEtFzTBCEjCrYICXYE6vsuNviZEBNCXiuKXXb5xDoZvZpsuFBFUmM
	 umEO8WMvo2kbZTdowUYoLVWiPC5ZdndojMAdeB4eS4nvoyXFB6en5GkpFjdSlOjqnNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RNceImUN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9823D606A33D
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 12:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RNceImUN
Received: by smtp.kernel.org (Postfix) with ESMTPS id D07541F000C6
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 12:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696182;
	bh=Wi2Cl5rp10lePVzryMXDl+moVJY6pZGwBVYcxjs7goI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=RNceImUNu9Zn+0iuFd2mdqO/isqjTFF6TvyAZ/xwACj5JHF8+TYBWIb4KQhs0Nhj5
	 nyd8LqNd2ZZf347ZMr4HJcv9phglHtPGnqM68jSBxgFYzrnfgXDEARHf7EAquVHn85
	 NWprBns/fhyXefJKZP/TGDgHJ+PhT77c20C1szmxPMvxIycB9PJd6nr7vXjhx9ti+H
	 /EAfbdj11JMTlf1TipJcjHhEIxLqo16pZJJ9PxrvH7byemV6Iz52d6XiYqDjfKSwxi
	 r7qn9u1XrL/OjNm0V+hNY1HVNdqY6+rUxTDBpWqVTADravjCsxP0qwTHHlyBWWPe9I
	 uc/7vmhL18gOg==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id CCC41240040F; Thu, 26 Nov 2026 12:29:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222328] xhci: ASMedia ASM2142/ASM3142 [1b21:2142] skips
 transfer event for bulk TRB before link TRB -> UVC stream (Elgato 4K X, 10
 Gbps) stalls with "not part of TD"
Date: Thu, 26 Nov 2026 12:29:42 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222328-208809-OVFLhZJfsu@https.bugzilla.kernel.org/>
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

--- Comment #3 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Doesn't seem to affect high-speed.

And it gets worse: if the Link TRB toggles cycle, then it doesn't toggle cy=
cle.
With uvcvideo URB count reduced to 2, sometimes the HC apparently still sees
stale TRB in the first segment while in wrong cycle state, so it executes t=
he
whole ring again, executes the missed last TD and works normally until anot=
her
occurrence of the bug. After a non-toggling link, it executes any pending T=
Ds
and waits.

Inserting one No-Op before the Link TRB seems to break this pattern, though=
 I
would prefer to understand what idiotic assumption the chip makes (or could=
 it
be a kernel bug?) that causes this behavior, before declaring that the prob=
lem
is solved for sure.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
