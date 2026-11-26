Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696296;
	b=o7k1LQIfeagm6cdpUlelGl0zllUs280/yf1EM+LyFLEL7SNhy7Ky2i6eT67quT699jwu
	 lgzQ1vzu4m4se0LeBMOdDm3QuslPwuzGGaACr4E1Oo5cNhVybGa/axvLyIGktHnjuQLv6
	 3Z8Hbs+Zanc521cqyIX5SgWLanLaenz19eWUYqXVOGgHjCesMh3AeMB+lTbICAqQr0b/M
	 IT4t5tXGKMokBnot2E3l/chY8Ggeui+FSvFbRO1nFK5tBXBNfM2bAzRZ4xPGEwVjb3tmr
	 5pNMKxznaV+6As/u8/oWsOe4k9reczViTupv5b3Hx9AaJRjtawIpa3lWneOahb14chg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696296;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=uaKFVmllD618TNqy4f2OULFF66CWJNxa3OEEPsNWw4o=;
	b=OwzZOUM+k9EOhD99XaFKuj4loHGEZlEUzTDLVo46wW/QsU2A/T6IJCEkhkxlwut57IMd
	 TZyG8anWMGozY07aob2BPDk9UzolKU+utbqlGLzS+osTUN9fVwpnmZbmrvj4CV9DaYISA
	 5+R8KwDLtQ/ubNfRqsNtouvMWBgjL2NCmqMa1zVCxYdwQyK4AiRE23HVII6i91FIDxoPJ
	 T+kvP8Or7fitkDSjKzNyR4pxoZQVL99xgnlgksuUWLBJrVVI4XhiqQAJF22Vfn9EvBrXy
	 KSDBLvoXS5Q3tH/FmRCpsEYPN/n05nWzFsT7tsp4d/6hlMn0u9G9FE0ckA/K96YxJIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJErvGht;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42452606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJErvGht
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FB851F000D0
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 12:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696296;
	bh=uaKFVmllD618TNqy4f2OULFF66CWJNxa3OEEPsNWw4o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=NJErvGht+VlrMNUMsHY16kS7B/hxke26O3nWqdcuUVOym9o+SkVDfbHl3KEwqG4sW
	 j367/o9h0ekVl6ViWF8lXvNIs/jAQE2Fotb0C30sFZNwD/dzs7fdNN1JC5zTihPAbc
	 jOep4PmQXCdLoOEeHcPE9HqOjl7N9NJsttgcC2xcWeE0W+GEfPk6KnNBW/memZAJa3
	 WHXimbeUmsU7gx3LLzobA0ve1xDMaSP90sHVp8NHgxMxiv69w0Tpi686I8Q+XF8ONC
	 ryVfIAvCh6eazgD0HMFOQi02dlH7VWelcogGBbDWUEOK/tlTI9dle92POOBAoRB+Ka
	 dda+KZVDZnnJA==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 1C21C240040C; Thu, 26 Nov 2026 12:31:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222328] xhci: ASMedia ASM2142/ASM3142 [1b21:2142] skips
 transfer event for bulk TRB before link TRB -> UVC stream (Elgato 4K X, 10
 Gbps) stalls with "not part of TD"
Date: Thu, 26 Nov 2026 12:31:35 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222328-208809-Zt0BIUrgNH@https.bugzilla.kernel.org/>
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

--- Comment #4 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Created attachment 311585
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311585&action=3Dedit
Try to fix the ASM3142 bulk UVC bug

This seems to work for me. It ensures that no single-TRB TD can be enqueued
immediately before a link. It's not a complete solution, multi-TRB TDs are
affected too if they end right before the link. But it works for uvcvideo.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
