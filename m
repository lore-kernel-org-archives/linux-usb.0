Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ACD4399CB
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 21:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784756391; cv=none; b=J3j+MPrnlBED9diovjAIWnEY5tIrOufr024WSaqMyECRO+2i8dsm9UQFBinNvKlQX/kMqXw4OuU8hTZ/yf4Ug/XLofkeb5VgtozA9sPY11f5qYHJp9Sflwpx3vqyzOcSlPihzdTYUFHJAXRJcEYOxO2HJPfYHJXv9trQoZJ9U4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784756391; c=relaxed/simple;
	bh=0KXB3PB1KNIHP9R7ckgW3cLQBmzfSKYL9qB0WmB4xVk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=heCkwFQTXObFuFdZPCloBz40T0zS+CnWd9ZHCtmg4djyfYrOdPpTNDkfZ4IURJtY+6MpIsvScXkq2ineifkwN73zslCrt6CP8J7JWrFVKblbifd09scCtaGuLCI5sLcmiIcUsQeOtXyaYsKXE65DLu7eNlx6NmIClcUbMzLgCZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlEfDeAd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlEfDeAd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A128C2BCC7
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 21:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784756391;
	bh=0KXB3PB1KNIHP9R7ckgW3cLQBmzfSKYL9qB0WmB4xVk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UlEfDeAdBSseq4+YVEVH0LfZAZgtShUV0juxZdcSywXBY6yP+wlVZb3H07CxMs1XV
	 xpS1neKfLyQAAu8M/2A3DOjDxh9Ajdfy0tUiqBhMavUvlrSHj+/MhzO1MUoBvU9zII
	 URaxvlaYtyJ1yKqp/sbYbkUmxQO1ea+tuhbK3ENni+XD9aOyXICg4fEf/XAxWmfujR
	 whE/osqKzy8rjpK+Lfc25O73qwOAdx/5DesxAorE+eZ9R+SNq6vDYLDDa+vwaPfak+
	 rby+usULDcpuPi8rCBs8Hva2yZek4J/3vn1bqvoGShRLNizz2mTPCup55ZF9Rgcw7n
	 q6T3m2mwTZxlw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 219DBC4160E; Wed, 22 Jul 2026 21:39:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3NzhdIFtSRUdSRVNTSU9OIDYuMTLihpI2LjE4XSBB?=
 =?UTF-8?B?U1VTIE4tS0VZIGtleWJvYXJkICgwYjA1OjE5YjYpIFVTQiByZXNldHMgfjEv?=
 =?UTF-8?B?c2VjIHVuZGVyIGRHUFUgcmVuZGVyaW5nIGxvYWQgb24gUmFwaGFlbCB4SENJ?=
Date: Wed, 22 Jul 2026 21:39:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221778-208809-uwzbmkwQd4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221778-208809@https.bugzilla.kernel.org/>
References: <bug-221778-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221778

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #2 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
6.12 to 6.18 is a fairly large spread, and it isn't even clear if the bug i=
s a
regression or perhaps some CachyOS vs Arch difference. And the GPU uses an =
out
of tree driver, hmm.

IDK about CachyOS, but Arch package archive has 'linux' (non -lts) packages=
 for
all major versions from 6.12 to 6.18. Could you start with testing these to
find which release broke things? And try to use the same NVIDIA driver each
time, or (preferably) see if the problem occurs with Nouveau.

I would wager that resets are deliberate (HID driver seems to do that in
response to USB errors), but that still doesn't explain why USB errors occur
due to GPU activity and why some kernels work but others don't.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
