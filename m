Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7745837C0E0
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769916; cv=none; b=JrhVSfzGQ7chwlc3H/i2pibl4SNM/s1u7DwIub61k+Uw8XRWmruUEAb1mkHQL/YwZzpsvAujzsZ/JzkYcw9Ab/rE/BUyiUx4YZBZjp5xUwBZWZK3JRJLMquhNrUEvFXAHMI5+BLYo6yzsucFzRxvwFMB3Zr1tVAcTIJZ0iYpqY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769916; c=relaxed/simple;
	bh=I+ilDtclnidfy6Tj4YDEkBOaP9GK+LCEdVvaSh6TSLM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FDGkTmb7JNiAzrN+IzDIRQINtOeZYXPGLTef9RfuMfF2/pOtuXlSj4LcIKC4yUzpBPC7RZ7j5ob6QqkkbHLEfQkif60ZYKFhO7WGT0hoGoIm8sQHBC9Tipap2yJ1Y8mqFph7l07ABgSq7a6rx4He1yZzXapgXVmUMhU3wggSAZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXcxVDL8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXcxVDL8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 377A7C19424
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 17:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773769916;
	bh=I+ilDtclnidfy6Tj4YDEkBOaP9GK+LCEdVvaSh6TSLM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aXcxVDL85pCEmFGKgzymuSWxQL5b1uUtw3lcL/3Ms087TYE7zNXwI3L0Bx4S3y/g4
	 xmA+Vs7GEGD5mf775TYGskNU11KiF1+feWpbofwDRP6oyBYxYIRFnY7LuUzCW7WZ6z
	 2dkkeYU6FDBBvFKZdw0CPItUqTP9iWMk3EVVbjICL883ry7fI17OX4mkyUNE2LDgp/
	 SxpXtIGD6M8SFatiIKA94/vkSj/+Uu8w+DDEVKtG9acduoyfMiV4TuxwYcjjbMn/Xu
	 qlvrwPEKph9JQVPsq/HNGnarZ8qcGRVA+dmd0GE6KXzx/BrEnHOdLMWzb3XdrU1WHW
	 4oigSQH5kJOUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 320AFC53BC7; Tue, 17 Mar 2026 17:51:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 17 Mar 2026 17:51:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-P8MwolXrth@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #50 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Thanks, Alan. Guenter, can you submit a formal patch perhaps? It seems you =
have
a good justification for it as stated in the comment #47.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
