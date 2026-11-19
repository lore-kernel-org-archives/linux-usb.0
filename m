Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095295;
	b=iGcV8fahN09lGC9a5D6xeDowMiK2LeAttsB91Ug0+ZHh1bviQ651KKzvVUOuNesVZA0K
	 APDjhmOCows3H7rY648xOll9meKBRHZCWEjQgmwIL27eSixQ/ABFYmx2NvKQz0BlmJ9oZ
	 SWsHRYtPmJrsIocQq7q1W+/hZKTBQZn0J9hfOTiKOOa9/ZUDxGjd9LOOzf9lth3oEZMxV
	 SfRrlPmta97uctQxPUHjIvqhoPZvMB7XOTkFFQzmafD8zSMtbpuo6ktrpf2RCmae1IS0J
	 26QGm+7JbGqTS9NwdadElaVbb6eHngkq59SKCc+c+kgoIx5FLM5/jW1FpqYVcwIw0sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095295;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=Gk0EXmVvHtAgcgzI8MUsh/XQAsSVdKju1FI83b0i5aA=;
	b=fX7qwzZeIXLzBsLNfCAL9zdmOxQRMFXTcoEQEqRDTQyvZJSm7E2zG0uUNzQWIs5It1/f
	 ZCZVwVijYghrZfHkH/VafbArPuTAsXkE4Vnv6lA/Eubc8y+Ypf0TVQE3+LyMjYr/C8m3D
	 TBIe3bGxKWf1+VVo+YYl/d9SxfPSJBLKITxWmRV2aCxs3DNgDoZVmL9pC4NoYVDoxwWA+
	 q4HbQ8TAiw3K9zH3L/Qk+PKSMGcU8gpOenSxTEN1s5I7Ny+Fj/SNjTt9prDdIgYTIJG0r
	 SibypaHbqhOWALBV15uZmF0sc4oDTSIyRnvYf0y+2SzjalCKhQCAcxG0v2xPdG4IjqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdskE8Rb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65533606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdskE8Rb
Received: by smtp.kernel.org (Postfix) with ESMTPS id F31A11F000C4
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095295;
	bh=Gk0EXmVvHtAgcgzI8MUsh/XQAsSVdKju1FI83b0i5aA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=jdskE8RbwcQnyWfo/0TMur/eg4d6VHMcVFvfJsFt0HCv8xu2uQwVbUXMhObvdWGRS
	 SmEl8Ws/HyxCGet0ccgDljmQdT+nBSF82dKm8OQ3OTBZV1RMPyt+QXHQh1j+aeJZrB
	 7Xo9o+1TCtdSeLCKz4y8wipYuzAWCBTHVzH+GMiEFf7MMfpE6s1vFeL8XukvPx2UMM
	 WbT6JKEUGUnZF4d8+Z+ASGL4WLEo80/lQgCbjvEcVV5aB3QbkZRWXHCWzpCLzwDlXY
	 jyXM46NDMQyxt/NU0BtW0wiwfvMbutCHrBxZGS/rhxo5OstC5cejM9wcykdoS0yiss
	 MCPsC9R1rjfbg==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id EEEAB240040C; Thu, 19 Nov 2026 13:34:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222296] HID sub-device (wheel rim) hot-swap on Ardor Le Mans
 base does not re-probe the keyboard interface
Date: Thu, 19 Nov 2026 13:34:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daniel.matushkin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222296-208809-dsyhGqMTlH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222296-208809@https.bugzilla.kernel.org/>
References: <bug-222296-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222296

--- Comment #1 from Daniel (daniel.matushkin@gmail.com) ---
Created attachment 311522
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311522&action=3Dedit
lsusb -v -d 11ff:dd12 output

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
