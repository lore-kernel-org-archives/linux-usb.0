Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D3C455185
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089616; cv=none; b=nH1fYz6fo9Pu1857giE/pxsTo3yHuV5Iprul4Dba3uQSk19DtecO6JvdlLypM5DyeumAPzNF6PuViXw2rO3FlcHSIlW22DBcKMqLatHo7YKmQYdNIkzEC5/L5h8iPP6kH+i0gz62gg2WN/zlsf0qH4lhEDhwWRL0ODO5K9Ax1Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089616; c=relaxed/simple;
	bh=l+sFKb8CGNc6frjnRhvlhQL4z82y5cJQrVr12jfxsXE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qn+Lz6R+zM6FOaWod4C5lCS2nO/hiYKIM9NLeff2mj49WeiL0b3lVurIoDwpvyV6/sm055vmusejbdZo7tDR11c7Y8JU0RpcWYjfi0ft3MD6aXs38ukRh41aR7U9zPltUzSfYjWkd3uAU22QsUkW+pC1jzJHDQBnnaLjgLx+ymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3+S/C6Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3+S/C6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0329C2BCF5
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792089615;
	bh=l+sFKb8CGNc6frjnRhvlhQL4z82y5cJQrVr12jfxsXE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O3+S/C6ZjCCS0nP6mx1Fc6Py0lixAwaRDWJNI+lm0O+3vvEBPyQGJ/A1A/Gm5NGp6
	 T8VqAm7kwvqHJb7NOHlkrKIhcYko1kGpF0PFcqArDisFFO4ARPZPWrE8PtWf2wBhKn
	 EY1hFcC+ocAejXQ9XI1UpAO1jrZbvlCIkLBtb71myUHQxLCry+uwqab/FAtjRJ/+Uk
	 uf1P5luyUNQfthmbuUbgDoBsdR9L9ixs3Vh/TOvdHsu/ADO4XjY7iS2wHnQBUX1PzT
	 OJs13TTlWIMPAY0rmaqMpltMWkao16ZPlOTv1qUg+wIIL/h9svCr9wfvqJfjDu7hkh
	 jNfzb3S+YpK7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8287FC41612; Thu, 15 Oct 2026 18:40:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222047] [REGRESSION] USB xhci_hcd boot timeout on ASUS ROG
 Crosshair X870E Hero since Linux 7.0)
Date: Thu, 15 Oct 2026 18:40:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fastmichelebezzi@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222047-208809-7KleOyEyYv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222047-208809@https.bugzilla.kernel.org/>
References: <bug-222047-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222047

--- Comment #7 from Michele Bezzi (fastmichelebezzi@gmail.com) ---
i updated all info you asked i think in the attachments (also new dmesg) Im=
'm
on kernel Linux  7.2.9-arch1-1 #1 SMP PREEMPT_DYNAMIC Sat, 03 Oct 2026 11:4=
3:28
+0000 x86_64 GNU/Linux

the problems persist.
I searched and apparently and the problem sounds like a regression started =
from
kernel 7.

I thank you in advance

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
