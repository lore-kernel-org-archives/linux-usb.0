Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792432149;
	b=ZCd1yGwslC2OpD2RD8D9Epa9VdlHavs11uFexUr02EeI2MMijKnIouHfXHdCDVeNTF+f
	 ufzI4N6z7Ot2PL06z7TftepRbSAOLKTzGiLfMZnSLio0pi7NW7zC2MRhFGOHjh9SfyGQu
	 MUcQgLOPJYIoybsXv6MIhyrwAMkEVDRW43T2dV1LL/jR+Zp9BlztiKePFte6UL96KJwZN
	 rxFj9bDipJFYocEnjg6+nH4DFp1XVZffWZNGxqs6GCFJ1ofpf59Ms6UHTe1mbPkUvrvxo
	 zVMeUhF8wChzQKYzGVrUHF6QdKL2S0F58RFG5NHRCj8xZys+R75Wqdaknkhaz/etGew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432149;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=LQjFmI9QQLellZ0VlCapwZPQEhH0M5Hu+987Zcsj2FY=;
	b=StxmVlRni0YMum/fkQutRGxk/qfgOKfHrgW93RFz7bCZV3WY/t3B7wue+QggxYEYbSLG
	 6uQIRN5+f8yv+G+HB0ZpR1vqrnU7EYk93k7TwQ0VHgIvcfPbtJBpWO1tfcU5lxI3/PExF
	 t51p4hbd+9IAVDZt51gyKglF9rITVNNJ7xPJCm/3XVyDZlWtpnBZJbNPESpzh4FfjpNW7
	 Db+i3Shb3wkIa5PVm8hLCkfeF9gjxSp3b1GfEbUhgK3AxE5GYWfnIgVmV7hnsOD4K3R/R
	 oUuVlzzIUayFL+YGIlo1hNuHF0ZgOTJjY3KX1bpy/F1kx7BVoK2PGfmHx7w1XBtR69A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qv7GCCCL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190B9606A319
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qv7GCCCL
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E269825771
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 17:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792432149; cv=none; b=KxTy3L6b0dvj5t8XAAlT18qMn/Wft/+kD+hfw2IBHIfSlsX++ZYkk5XZ7eA0hOYFnwARz4HwuzVEFpRA9RO3j2uGt1VKzjSeH+XkJs/WFc4t36lHeiQ+4fcU9jFmRwNUoeCFHcq2/x0TjTrT4fpAYfItR9o6e8aSkQ9NDk6lSVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792432149; c=relaxed/simple;
	bh=LQjFmI9QQLellZ0VlCapwZPQEhH0M5Hu+987Zcsj2FY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QAoLA0x/kRo2WkOgijtCj3Olq3/G7a2XWT3VR17+lcWV8LYO98jwaUA3TGTkjWJwe2hLCPh80OnKg6aZE5odX6ZSwXaM7gD8cITIrjrVSHViw0wRuLDBwiP2RxOMgFTmXxJrYU8KH0SqrLae7G4bgnyR2UiLDYTT5aOinclpVyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qv7GCCCL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33A5DC2BCFD
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 17:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792432148;
	bh=LQjFmI9QQLellZ0VlCapwZPQEhH0M5Hu+987Zcsj2FY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qv7GCCCLyOnF1Zb01XS9xKcmm7pcXFrFkSi9elbIAWRfhVALdrC5MqOhMsZ1J2J+v
	 i/AS4C5NunGPfQnkKYZsIh4oKy+SoH3dNS6Kl9sLHnJlc1qpGw+9KBIK5974O0bswl
	 VcwQh9NhuMkGOkWKYRsz1/t53feX6Ok0kICRbgkWyufpFhSdz65rlQr9GABZRiajoq
	 PDOs9Cye9+5/63oJcHZz34r2SQpGZfA1gQKOaqZ3ySkBTxidG589d2WUlCG3r2u7Yj
	 jvuxDKLuqVkgmO69BQONMBHSEX0ztqwEOYlEjQ3joRpdKKedIan/PsBZ0VfpDe/Qcx
	 KyT8WOnYmjvlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0A012C41612; Mon, 19 Oct 2026 17:49:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222047] [REGRESSION] USB xhci_hcd boot timeout on ASUS ROG
 Crosshair X870E Hero since Linux 7.0)
Date: Mon, 19 Oct 2026 17:49:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222047-208809-W7DkVa9tR5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222047-208809@https.bugzilla.kernel.org/>
References: <bug-222047-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222047

--- Comment #10 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Michele Bezzi from comment #9)
> Yes I tried unplugging the devices (usd ports) and restart:
Not sure what you mean by this. Which devices did you unplug and from what?

The point of downgrading the kernel is to test if the problem goes away or =
not.
If old kernel still works, the bug is a kernel regression. If the old kernel
doesn't work anymore, the problem was caused by a HW change, FW upgrade,
userspace, etc.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
