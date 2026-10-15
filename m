Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ECF31ED93
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 18:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089444; cv=none; b=NHkxal7zpLsYNLSbIcvN0BozHk1QsP6EwTv82Jxj+5wiJg8tDNGOLc2LvNryuMv5THWkowQ0MfHSlgNSCrKbFaGt2gyy8zzwLweL2DwDWeeS3jERDI8UFimwHDHEcQHeTIEEihnlOuJSSWJfd22xq9vi7ZHLFzijddDpsyKmcVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089444; c=relaxed/simple;
	bh=PEcFzA4nmKzk0M/xMve1a914MFOCYGkEnfvlCpOipNA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MSBkJmfilBssJauRDqiZLHmZxjuDT20N/nMvxsH9eNiAMx2hRT1dt4mT46Lmh//5mZ7cl/hcXyx4Tuxd+bjT7lopNmwLdzg7Vr/8J3wT29t+foXneLuXa/NW/9BTCIzwCFjW5+rmaf/1I6rYWQ+kaJkoNZNp99mt0Z+JCuN+9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=siC17B3c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="siC17B3c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0149C2BCF5
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 18:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792089443;
	bh=PEcFzA4nmKzk0M/xMve1a914MFOCYGkEnfvlCpOipNA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=siC17B3c/1Od0BU9a9Qtj3MXEtD+dYJO7z4HxIT9eHpzHGR3ph6pG13GScEQiQJQ7
	 W3hgZOVWFmSj42em9aAAzNqPyqkkHBw2kDIblTxMMnBEH1A92hJDbpXR/un0PexMf4
	 KFULmTt3HHHt8l1PGDoL8upAvfam8h/AT8K4v5VroV9xk08VziuHEFgznUb8AYyoPh
	 7SI0bb/Qte5GVGF2BqgQ7dPyoaIgESgtK21hjFITkNCO0Ja2/iRt/iH3WSjk6p7Am9
	 w8GkjqNtYL7MyCczeJfxF+G2iQPe678C0SCMl8YE+Hw6pfv4sSfjnSM1ptSlbv200u
	 l1a1G8HW8MykA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D1F6EC53BC5; Thu, 15 Oct 2026 18:37:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222047] [REGRESSION] USB xhci_hcd boot timeout on ASUS ROG
 Crosshair X870E Hero since Linux 7.0)
Date: Thu, 15 Oct 2026 18:37:23 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222047-208809-JbXPLT6LDy@https.bugzilla.kernel.org/>
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

--- Comment #5 from Michele Bezzi (fastmichelebezzi@gmail.com) ---
Created attachment 311131
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311131&action=3Dedit
kernel config

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
