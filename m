Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17454253959
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748340540; cv=none; b=KkUSBFuT8x1ZINkkVn+OYJgM/NsSD+3WCcaWjCHm1wLoB0gPl6AfqMHCA+PFdHzY/GD8Ti8T5mCfJjfgHeTDRMVk5lxvzxoxY7F9e3LFfgfWIb83+cOsZ5qOcuno0PC8ikSp9E+C1yVF/xATIAEmk+YZbCME5hjJm09cT/kFm2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748340540; c=relaxed/simple;
	bh=N1sswxZmMY1biwvP9v+9jESQxvqJa8hX4wUj53VT34c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=um6d7NDEcDN7CLiKHEyMozDfvGzlWVS723IUtF312h2JyNJhrXgtTNivNOlo67LiAIqvo2D6bNLAjQi7TTT+2oiHgw2s8eOnMfgGkJd6YxL9xYFaM44Ar7BYx+BUzLU3k/lj2ieqaQ3eVuPVCSyEqSjQYqagN7g0ktpqumzEF/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nS1dVZQD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nS1dVZQD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78105C4CEEA
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748340539;
	bh=N1sswxZmMY1biwvP9v+9jESQxvqJa8hX4wUj53VT34c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nS1dVZQDLcHlixODpGpOD2PTnDszcIF0xhapIzGr+vv6+ELq+7bWXnxrI5xtOTwpN
	 qb0DktRPtez862wII+6zBIweIR93HUTw9kAVTeLsVjWhPfcVcaFLoaceI/4ooBqgRH
	 gSmBzNhp54SOifuM5wNYLKwHliq9NqcqpStW8RJ+kv5vbygZchDTZ+Ejl2NUzTYIGC
	 fkTdpTvzLIX6CmFwelKA9Mr6fNEj936IW0Eqci1BmpLhwt/PHkVBFneGSxlLkxDSXW
	 xI/5QjA16XQof5L5ZEl5WUEU1ig8JSIeUz7rIpiYDFfUHIMAjEmCKulAgQhCnwTShH
	 wCc2wmBWZMs7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6AB73C433E1; Tue, 27 May 2025 10:08:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220044] rndis_host: Zyxel 5G portable router seen as a WWAN
 device and not an Ethernet one in 6.13
Date: Tue, 27 May 2025 10:08:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bigon@bigon.be
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220044-208809-LUN2kypIqG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220044-208809@https.bugzilla.kernel.org/>
References: <bug-220044-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220044

Laurent Bigonville (bigon@bigon.be) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #2 from Laurent Bigonville (bigon@bigon.be) ---
OK, the problematic code has been reverted, this can be closed now

Tested with 6.15-RC7

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
