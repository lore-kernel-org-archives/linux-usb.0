Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5D24DCF6
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 05:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785390728; cv=none; b=bisHKGr6qpGWGbEZvi03xmhfbywlDdts66qH82turYUbsHRrJEnGTuN/9Pg3Ln8f/KkWwYE6RSvh4xZ1+k3moMgHgBmlZLjKvU81GrAtHRry7G0PxbaEfLep/a08X3M+TAGk/3tNMksBsSRYzNdLN93P12PlObw87Perb3QNdGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785390728; c=relaxed/simple;
	bh=0pB3z8UTxB9RVluGbMuITJm28Epi8NhauVDdNME/TZM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fXqGrvogzzRFPgimuYOsUkMQcBHulS1FAeXvqIrl+HLAdDYxkAu4cgHY0S5aa3d+HzW4IeFHBml2DOyxjvhl8q3UO83bukSL/DUhD1PZQci0fCx2d1+TTsp+OX/qmFetQRxF4ZKPRJVjR2kqVxYp9XQhp0BCnJ39Q0J9JWVdW8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdgThONc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdgThONc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79CE1C2BCB3
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 05:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785390728;
	bh=0pB3z8UTxB9RVluGbMuITJm28Epi8NhauVDdNME/TZM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LdgThONc8UBiXjBVKiyhhAQPErKQ4zS3VN98be06XIF1sMIVpU9BQ+2kevjEq69pq
	 e6BFZuAIeBItWgrmTE+5l3y717pvQzqjxxQVoKWb0Htt/Yop0Y4b2thNZwuoSSn1Dl
	 4keKHW49FbDhGH0q3pTF6uxCY5E2Y9J1ZGO46FPHIECsCGBzTzzkf3l+k1IPEnpIL3
	 YYK5IduROUrdjMZZEaQEeneCT03ESYV2k+6Q6LqpkiCLdaOn80VqCgXtr8HxgFZsLZ
	 sgj/f4ho/RISayKjZCTvpqE8X6LAh5GyS+OC3UdoapnDCXglrKIUTAvWbeVdAHMuPB
	 n6VGcbjvbGE5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5443BC4160E; Thu, 30 Jul 2026 05:52:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE4MDZdIFJpZ2h0LXNpZGUgVVNCLUEgcG9ydCBmYWls?=
 =?UTF-8?B?cyBTdXBlclNwZWVkIGxpbmsgdHJhaW5pbmcgb24gTGVub3ZvIFRoaW5rUGFk?=
 =?UTF-8?B?IFgxMyBHZW4gNSAoTWV0ZW9yIExha2UsIHhoY2lfaGNkIDgwODY6N2U3ZCkg?=
 =?UTF-8?B?4oCUIHdvcmtzIG9uIEZlZG9yYSA2LjE5LjMwMCwgZmFpbHMgb24gNi4xOC4z?=
 =?UTF-8?B?OSBhbmQgNy4xLjQ=?=
Date: Thu, 30 Jul 2026 05:52:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221806-208809-GnMd7HGDCO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221806-208809@https.bugzilla.kernel.org/>
References: <bug-221806-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221806

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
6.18.39 is younger then 6.19.y, so it might be a regression that was introd=
uced
in a recent backport. You might want to try if older 6.18.y released work =
=E2=80=93 and
if they did, check if 7.2-rc5 is affected as well and bisect within the 6.1=
8.y
series: https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
