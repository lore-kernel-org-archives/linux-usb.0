Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D563264CE
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 20:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123451; cv=none; b=H3bbq2roiX+gFmpi1o+iq2QWBdJ45I5O91tOZNJ/Oo5WdWpj60SCVXb6ivCATLmLQd2BBlTJKyLnz36BavSCqI0fOMprtpyzv66K4LVHR9DEezJa92TvgZslwpeEkL9AOsTGIfOamKokW7CDfpHcq3zYY+L7gFf9QdUiUhGUSi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123451; c=relaxed/simple;
	bh=wS2983G+yvoJWWCozjJrdguiLafx8iKTyIM6HHeE6q0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AcEfF0N10CcIY0eDA7Ydj4PEUWQvC9/BUhHgourlGY140CV9QZrZ3LuAfVna5EJFEGy3wuXpoYCvd+eKpjt1g98F1fszTen7TBfnjIn63wwcCvZuJvuHXfCKYfXN9uAesh3O+6M+e+nHwYW74QEk9s3JDNbsmK/iQhE3Cybx8Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVM48d4n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVM48d4n"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1C2BC2BCF4
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 20:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788123450;
	bh=wS2983G+yvoJWWCozjJrdguiLafx8iKTyIM6HHeE6q0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cVM48d4nGe5uqnAMa+G08JcF/i3q1cpy0mdpqyuH1X2WzVmBBuY6CJ1gBlz/zcvO/
	 +ZC6+Vk/PEZFbl8vvu8RgLVAZWGmf3V6DcXSS8/HzqY/8HJ72kNjY17arTjzS1CrPQ
	 WY/ZqENVNr6bp0961jG0jsBiSj4nsWaCCjx84ErHxRyjtuD74d1kr3pZmL6vNO7DND
	 KbFd4BJUbGUYgxwzbl5p/BRRF1M8tYTlRirySAkzwXiTLlSSPeiiwBuj89x8KVHqCu
	 V0Vu40Y2V0sD144SzorohTai3y1/+KHwyjhjWofnAN+c/FhSWB+87Lx5SLXUwleS8K
	 0LvcLZyxEOmCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CD326C53BC9; Sun, 30 Aug 2026 20:57:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Sun, 30 Aug 2026 20:57:29 +0000
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
Message-ID: <bug-221103-208809-LSiH9eBcub@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #32 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
For the record, this issue has also been reported on linux-usb, here's the
latest case, with links to earlier reports and some patches in later messag=
es:
https://lore.kernel.org/linux-usb/07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leem=
huis.info/

Your finding is curious. Does it mean it would still work if you add msleep=
(10)
immediately before the failing line and not earlier?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
