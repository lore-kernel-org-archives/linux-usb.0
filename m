Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7D02DC79A
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763300; cv=none; b=jTYXzj44vkSvYN58Hp2qlKIIJ5KwRJ4uoetR0alKjypivPv9szKU8iIVzaFsYcx5jr+Rca5BURcMfDj6u7ASf8REfjaSvLinHxjsbCnPS5p0KQVtQ+RNH+Vbi4VU+ckAG8lKoLeKao6Dc1MKQ4utX02/N0z0zJInhhiy/a3/LGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763300; c=relaxed/simple;
	bh=oolaUwaqBwiqfdR77/uUt1r6gssD2zxFiQgnjkUpYmo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jnMbB1RZ6Cryzu8oMngjV3zBOeWcAdd6ApR5cnK2RGjVyjeoLcm+0rhcmeZOrbm5hmhnM25I27uI+RbqNOt90wdyMhsrjzRJ6jPW24kyLKynzzWNY6YlXQE2Q6cIqo86IlTVufSmbHQtqCXZq48lSS4nD4qufuzI+kpb7WS0ujI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9mN+Dd2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9mN+Dd2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6BD2C2BCF4
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 13:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785763297;
	bh=oolaUwaqBwiqfdR77/uUt1r6gssD2zxFiQgnjkUpYmo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l9mN+Dd2tkjFC5tVtlvDRDh5BE3R0rPl8Fo2PTbNVW/BxYgAXezmRZJ8LCI1xZk5Z
	 pKsB0uvDzMTHEmKOdcsOvYuANKMsL/nRMNZjfPRTNbVg5Yv2FvTLZNtCoCWebY4z8Y
	 u6eU3NVzZEP5c2DyCaYRP6asy8z1FnonGhR/Tn6gqfqOMdaQPm+70E2Q8iEutT2/KN
	 kk0BlGPHHkiNjVsTklYhdhv5/uT7d3QbdXSHKtg/KhGWSTUpXabBbUVQg5bFjNwUud
	 yN1Es1dJ9lumTNM1s1Gf4HRkH0w1LPRcLo8cuV7PPdxEYxZXOTbBSQnhJN9A8KjXV1
	 5Ps0zVBJtDiNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AD073C41612; Mon,  3 Aug 2026 13:21:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Mon, 03 Aug 2026 13:21:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mayhemandcoffee@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221774-208809-lSEQQDK8kD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221774-208809@https.bugzilla.kernel.org/>
References: <bug-221774-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221774

--- Comment #14 from mayhemandcoffee@gmail.com ---
I've tested the palm rejection.

It is a lot better as the cursor no longer jumps around when I am typing, n=
or
is it clicking on stuff. However, I noticed that occasionally, a keystroke
would not register while typing.=20

So I would say the palm rejection behavior is significantly improved, but I
don't think the behavior is completely correct yet.

Because of that, I'm not comfortable saying the issue is fully fixed or add=
ing
a Tested-by tag just yet. I'm happy to continue testing if you have another
revision or if there are specific things you'd like me to check.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
