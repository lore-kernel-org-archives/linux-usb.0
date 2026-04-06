Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3B41DDC1B
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 00:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775436104; cv=none; b=cDVy5YaiPBF3pAJxNRrHbc4j+Cd64c8MWFQC4xQpaVhZ/e+e1Eup4sKSPz/814ql9UpxjbXbohRa/l4mB1O7rDIqXnNv85iwlDU+teh8otS7M2wGrEr8+eoioMPyqAy+gy+gObUVDq5koLNBZiF1qLbJFUhPH5Xf1l1EJFqZe4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775436104; c=relaxed/simple;
	bh=ed36gpOmYMIGF6lSgC7sbU4iWnjGxBaVoj6aPfZMROE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lUmej5+AkmF1UReBAPwH0b0fsSKjTOnLr7W6xe5ZegK6SUMNRWkfhTaEmzpqOQmt+q6yHFp174nqZib95ioTrZZzOgpf5/Ex+zIrYuvfi7MApW3kMI4Qk9LjsJoW3jdlwU2a0ADrVPqckn8U6L8YDSCn9UKrCPiaY3QyHLYzHvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdUEhh4g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdUEhh4g"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCC24C116C6
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 00:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775436102;
	bh=ed36gpOmYMIGF6lSgC7sbU4iWnjGxBaVoj6aPfZMROE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fdUEhh4gk2PwI6MRc+dfDe8C0bmOyo+hy4EIzMpeGFF3WMwb/EfkdZvf9nqKJx/Pc
	 xFQGsSdDn08pz97jhbEcwC9htPTP5rZ1bHCKPLuMJ7cEINlRUcOc1bT25fQhVzt1mT
	 G/QaR/xlOHS4NVM6Kt3l46Lhq91yNNbdOkyW+wDPi9n/JBDKxLf2NTwt3UnOxwwRew
	 6HKfgLFLPbEmtPJcdMIN805fdJP/Yphu25J9ZxSF0GBuyUdkHA5i1vbwBjGhW0z/qe
	 JxciYKuLmtPsAsr1GYCURrtvQ36tx/3M4ih4O6tt1ZzVHCYzmaWUOQsLvpWdcu3Au4
	 tCrwQX6S+Lh5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C46FAC433E1; Mon,  6 Apr 2026 00:41:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221319] Certain operations via PCIe tunneling between an AMD
 USB4 host and a Thunderbolt-5 peripherals cause an instant reboot
Date: Mon, 06 Apr 2026 00:41:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: foss@morgwai.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221319-208809-TbTuGQq0bo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221319-208809@https.bugzilla.kernel.org/>
References: <bug-221319-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221319

--- Comment #4 from Morgwai Kotarbinski (foss@morgwai.pl) ---
Created attachment 309829
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309829&action=3Dedit
systemd journal from a deg2-induced reboot and the boot after

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
