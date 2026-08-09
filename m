Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3CA222565
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786318481; cv=none; b=mOrxu62OOSUen52j8NFZ1uDC4+50ufR/atneqlf/8m92sqjNg5rjTojbA57MGbfua+3DXG5aliHO+ZdkaC699PEmsjCXZyFqSnDKx9JoQxmOgApZY2rS7nZStu5Tl5YExeAyrTTICIfYUsW1hIbd65TEZV0jg3kZhYImMQ25EL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786318481; c=relaxed/simple;
	bh=xTiP9lDNo6xBtFi0NPvuu0mSdrfrPg+1uC8KAT5mW6Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iGB9dKGJmqujiuC38mF+9lAYsW4aOiKyyM1Id7750hgKahkm3dzigDy1kBWxlFoK4i5alyYD4Nedqvul5PYJhMnmmlCgsE7hWCVsDNhx6Ke4F/+Kx/ZFJBHz0qkXc9Kpbxof+f9NKD07iDpyt8ucqEEiQj5XVepKGy4dediv3Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=seI37Whf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="seI37Whf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 250CEC2BCF5
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786318481;
	bh=xTiP9lDNo6xBtFi0NPvuu0mSdrfrPg+1uC8KAT5mW6Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=seI37WhfbDtqVGkG9InRGmgbCvqcbq6IkrxrvarzSZOvfVBZbIk49Ah6eT6eIDFHx
	 FG9N/yfsECdb7fcTZG64UhXZQGgJg/mL8v6wN7UNsprP7Qzai3JAkwG18O/iQlBhL9
	 bmwFPnHmKgKN8SzArvkzIQNKGVgCrxcOTaIIZY+dnnZj0UnHowfR1/Atzu9s0e4waI
	 toQbqiiC0e91NHytubrbjiT64/R8WmNoK7JHK6S6i9SDHmbHaX+8ZgFHZtrLy1zjI9
	 A067NNfPcORMLNz2+5N42JkhX5JVPPRIioUWG2i4EVEHeQ7Hy2q3GIwNU4C3tYQm+c
	 0x8h00qy9S6zA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 15538C4160E; Sun,  9 Aug 2026 23:34:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221861] ucsi_acpi fails to probe on HP EliteBook X G1a
 (PNP0CA0/USBC000:00), USB-PD stuck at 100W SPR, cannot reach 140W EPR
Date: Sun, 09 Aug 2026 23:34:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jayden.blain@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221861-208809-wD35waewvy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221861-208809@https.bugzilla.kernel.org/>
References: <bug-221861-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221861

--- Comment #3 from jayden.blain@gmail.com ---
Created attachment 310610
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310610&action=3Dedit
lsusb log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
