Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F33A7DE9
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 04:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769057618; cv=none; b=sgHxGaAkG2wcIGCnE27vw629OgzMcJTJ0vnZcKQ3ULnIPRNoM0psxNdmc5CUWVaOGfo23m7gDY83VQYw85wU0d7LR1NFMGxBtH5PkI80sitPm3tlVb6zv6kw+6qIRUMcXAfyXPtwjYrM8GyjMrELutHuSXm6v8QjjspiB8CLqwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769057618; c=relaxed/simple;
	bh=hLjvfZK86XHAkhdnc1/aE0h1bdHUcTpUWd4Yax5wqfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nSbha0whzwetIOMfLpOEQ1Fxp9YFJEfl0ijK6Z0ir1qD8Uaa3IhPpILP3uWnG+KANUXw2yxOh2jAHQ50jEOG9XaRSeVfPJSN7ahvAyHtrFR/hgrU8g775dFMa1aVDSrTjqWXBDQLXeIkm6TnZftYDwDGwBlxGt+CtgYkBxGlQXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6xFGVaS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6xFGVaS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22AD9C2BC87
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 04:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769057618;
	bh=hLjvfZK86XHAkhdnc1/aE0h1bdHUcTpUWd4Yax5wqfc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q6xFGVaSfH0V0/7CUNgWdNBTSt07dzO+vkCrtDgWdJrOB5LxDDZ0FSwRgYdC6i2gI
	 G5fk1SCCAmaibTBe5kJAEONfLIB3Glc4BGgt+19e/7f8EdpPTbOBGog4xy9CR/kT/S
	 Dq9zoCLcO3bRHLAzGIv9oBXad7u8sOr27M2i2PAxjIiuK/IwQgNdy70hT+9MjKGtEr
	 dERmSOsFGcwotkvIQoGePSedXxjCexUqmTS5pGZyfrCu0hxfQFw5RvWs6Ks685Aykn
	 rHYzhP/+TlUUcDekSUFTUDBKg86L/GhDYjjiPty5rgMk0jjCLSMr7lv+ngYcRh3bEI
	 tFHq9GCfV7A8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1B7E2C41616; Thu, 22 Jan 2026 04:53:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Thu, 22 Jan 2026 04:53:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Jeff.kirsher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215740-208809-gzRbfsB6X5@https.bugzilla.kernel.org/>
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

Jeff Kirsher (Jeff.kirsher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |Jeff.kirsher@gmail.com

--- Comment #45 from Jeff Kirsher (Jeff.kirsher@gmail.com) ---
I was able to reproduce the issue and I tested your patch on a 6.16.12 kern=
el,
as well as a 6.8.0 kernel.  You patch resolved the issue.  I was able to te=
st
this fix for over 4 months now (sorry for the delayed response).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
