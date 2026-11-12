Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476162;
	b=lDiXtia3nKF2jBE6xHmmkoaETKAcePYbNqSbDhTvNztPg+ytY1OjBFKvkJDszTh9fA+I
	 2sr1+0MEm3QIkSA+jtY6FT71TDYqQeRdbJqvVh9mOeoxpQjuwlsshUBH3/vSczYImn2Ej
	 IRRqf/3dxMoGZqg7dFN2JnF6o2vEWOQpqp+SfYAtf0yOOhMDgRTg4khyFd7MkMBlFfNDA
	 vUii27WsTA9NfMZBVtjr8xfr1PLMLCPMI5J/UX6CwiUOHrHUt7FblOTKJ7sn++8pnnLYM
	 yRxMpqS9WuZftbcPn57O+pymqAZYvP0DmX/8R4CjXeQHgTGy0oyNg3euQuTeSF/fevQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476162;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=gNqQiKnMhv8cOxk1dSQQnCiYR+PUCsO1KVcbw7/S90k=;
	b=M8lsAKX2jfWohbjT2rOT2auAyPObjiMmcsJiJxv0vMsmjr04FuaWJ5N5LJZ6TPyJhslB
	 zHjC287bCerGzau7viQpMfGXSWyCYfWTxzsunO0q9Pl/zDUEdgKK6Nr07n2B4r3VsoUWc
	 fzIPzL/nifqdqsXcyq/Ao2O9qjdoFwiXuuh/bBnWsXh0LnGqLbIe9V63FF3QdVSb/sXc0
	 WGkcvz+q4JYG0C+9X1UFIhlj2Vtc2H3b8/edSWfH5ivLKpNjkYcDKhHvPqWfx34Rk4GPQ
	 K/ShEvx5sayntPfLz41Ntw4C9BvDw/sZIFXZ3E979hxSj7Y769POMUZcxu+Dy5N81BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ul/sd55s";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21697606A333
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ul/sd55s
Received: by smtp.kernel.org (Postfix) with ESMTPS id A428A1F00A0E
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 09:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794476161;
	bh=gNqQiKnMhv8cOxk1dSQQnCiYR+PUCsO1KVcbw7/S90k=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ul/sd55sCbc3t1UEigEns+rvaLupDTq8x2TwB+DZW8UKaiTDdJsfjfg2RyAR/s1Oj
	 jT/wBrdjRD6G2ugIPLfVaQ1EonG8ufls7PR2djneVVkwFfSAxKKaZDBMj/n9a1zPYz
	 1MecWSrM4ALeYLUnTxm7hSvkMqljU15qQ2MYsiccALdroKL3YCisVdTS3/FoTmn9CP
	 046WXtWQVgM8h4yLaDYoGpac1rIrX01Bvr+8ZdBLhvk87LCgGyuZBSsRVWzG7WM5Yf
	 BoigWem6qwxBtyCKu667uGLaZ/vEhL7Xk/HjLKK4JZIge3xObSb7SbU9KgBtyjfk65
	 r5t6n82Pvj43w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 96D1CC41613; Thu, 12 Nov 2026 09:36:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222261] Regression: ALSA: ua101 breaks genuine Edirol UA-1000
 ("playback packet size 560 too small for 15 capture frames")
Date: Thu, 12 Nov 2026 09:36:01 +0000
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
Message-ID: <bug-222261-208809-v1XlBkkYIs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222261-208809@https.bugzilla.kernel.org/>
References: <bug-222261-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222261

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
You have assigned this bug to USB drivers, but sound drivers are a separate
subsystem, including USB ones. Nobody relevant will see this.

I think Sound(ALSA) is the proper "component" for this, or email
linux-sound@vger.kernel.org.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
