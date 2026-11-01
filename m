Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793549618;
	b=nRKLG7ThF+vbf352kDmThASVnjK/ZpBTbNrgnN8pUDi0EHC53aQplypIHXqIxRn3sKzD
	 4oZuyTYT2BtoLuXcuv90Pq96inC2o3RbKhX2GKdkWrIJZPcQqGNBtTWS2IwwZdFDgefgd
	 zR0YDTsm2+LKklG9pX5S8ZgUMbwBJSwwwu6BawFO744J0/91aWj0AtEMsXcqmNCoEnT4m
	 Dr9HvPyhJoG/bXtzJ3In0co1S6hQjsG5JdKsOOsZvce1cVHH+AG+F5y9stEt/DZ1miUcd
	 ZZRUJaCRZ3+Dri251AtRzzbhOhhAm+svktWT7EJkahKLk0L9D02GaFx/cmCNWgDRRUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549618;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=C4UXXMON6ARmJ+YK+sWDvEqo4QTQeID708H7bXYIW6s=;
	b=D9xWiWqQM5t03CxuCV1D2EOAT869qD9wSNmSYtwT8L7xn3hRlrAdzVttL6Lf2oH0A4m7
	 CEBAdj/zsTaWeXYMl5tykw3GeiJ6DzdXNHntpfdM+2QMbE5fGPApUbYqXgMIAQeYZrHe4
	 zFpvePwTCjuPxldxhZbUGDCOyTrSJkg42OHKgyIDC9sLzHJ0+i/lVojRAwYNBYtxASAjE
	 mboxRsYSgmgAKdCDs20HnLRAUxtIhutGWXV0FdIsAX7/XHNTCgaFQj4puPIoO1F7n82DU
	 nuaKNUSiDkK21gq6+Kq1W+IIqZRNyPVMuJHMs+vwY/gcd1y27TjQMrRm2z9cJ9gV+Hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ddnxzB4i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33688606A324
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Sun,  1 Nov 2026 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ddnxzB4i
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013ED6513C0
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 16:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793549618; cv=none; b=hUuWA0cU2OmOAqI9fVh+JIK9yjEDE/BFDkQ/QN2HVx0H29EVlFDiuqhbJ/oVxOERJHxdranBOpVRdtfLg44gs5kWtfshoZPFdJx27b5NBLKIYhLDclmgdQ8qVNfidj/fcCbaRNRuIdq3cLL7Ww81nzKpqC39zH5neUnqpMeMpdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793549618; c=relaxed/simple;
	bh=C4UXXMON6ARmJ+YK+sWDvEqo4QTQeID708H7bXYIW6s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQzfL1zWc21PhxRPXHkobRvcEr+lhOEzgPlQYNAqvhB9casrdt9kCb4Rlnz5YU7sFE6iaF3Jz4nfo393TF/dqSxn4mjk8ShcnefJjrXDMRrB9BzNBe9G/3LUXZ/6FvtFIqRYaLVv+SFPD/KbD/pGDpPRzT4nagWLtdAbtwWfoYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddnxzB4i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50B55C2BCFF
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793549617;
	bh=C4UXXMON6ARmJ+YK+sWDvEqo4QTQeID708H7bXYIW6s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ddnxzB4i61HEAHqKd7kLe4S7Toks9Bo8ZM2ZZT2Z27oSeFuF2imP6BH9QjNmYohwt
	 8XtmzSWgsBc+GaAAN3LDuRpz11EgKejL8TO0JUzXPrNOJuj7Iin3LswqxUg71FEDCd
	 2/JGM39jHrHGY4b8bTtM5usxaYO9b3F2WIimJWPSWEa4+czNIpIUnw88rLUO/bmkPx
	 vRJCQxcthIEz1PNo6KS14PPfbS5HiGuPJr+oBfC9GaVncIZ41Jdu73CofwgOzF/QCB
	 uR++FRKDhq+aXz3XRXAGRD7iiDyqM+9F1mevDdO8fUfqajtuk9KB7wp8BUM/3/HTIE
	 bU33Ztpudeyag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2D363C53BC7; Sun,  1 Nov 2026 16:13:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222222] Kingston USB flash drive repeatedly disconnected
Date: Sun, 01 Nov 2026 16:13:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222222-208809-Lqh85iryhv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222222-208809@https.bugzilla.kernel.org/>
References: <bug-222222-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222222

--- Comment #2 from Alan Stern (stern@rowland.harvard.edu) ---
If you submit your patch on the linux-usb mailing list, following the
procedures outlined in Documentation/process/submitting-patches.rst, we'll =
be
happy to consider it for inclusion in the kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
