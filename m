Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE664ADDBA
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711418; cv=none; b=sGwVKjGBZK9PW4cy5Go/WJt/LhXEOjY3vvPlIQiEM6zhttc/EuRNSXxK557wAg1Ei/pK9VLo7trYrpNzIiY/d/SW2OXRInpcublP2occImkRDlvhjrVAxaGzl47iuAky2tFO3PT7+KXhELa0G4S2FnIL4waI0cCRFCi/Lk0GNKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711418; c=relaxed/simple;
	bh=AWNQXnpd4Q9+RNBbCLBQLrQX8g/xFzIb9HESPwrsD7c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ahwZT52KImebdFmcBE2ffcwlAmbHDjvWkAc1BsWlqWo9cUyxTcPn/hW5db6GzrA9Zjh7mN+x33EjQNn4fCZ0exPPxjHmxhwkMvsRHdsgZV9uKwtjvqq0bxUnzPKNtpgRy3NkM2BIGuJ9ygu83ANObhUqUFSxXhXnCaeGbVODpow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0r2IZwS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0r2IZwS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5255EC2BCC6
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 15:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781711418;
	bh=AWNQXnpd4Q9+RNBbCLBQLrQX8g/xFzIb9HESPwrsD7c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=u0r2IZwSPuafHTYMp9s2HjmFRpyjL2QlhJqBOgkSi6oGhxXs0akegn+7Ubqpn09IK
	 HQ5Fyy/X8I7yo4OQrpmRzpMN8JSPx/vV9AqOC+HujYGZ+RfWgE5rDEzvDTmXPEK2RI
	 fq+cqeduY1xDYbBjQwyoLEjQQFq4jI8e8A1ut6GHDLl4vxjI/5wveK6vOCnnblEMaA
	 Tvc2l/ZPVUYoKUM0yh/jbsJKOdDv3JtsUpXdD64QywGjOvMY1RcJ+BXeJcvGo5+Oua
	 bdc+3O/tSb+YAneE8XJQ8lpsp9+vu1TRGAn7N1zvB1wNAnkZmXuhb0CjpaV7XcbrA8
	 GvIbMvzOPo9jA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4C8DEC53BC5; Wed, 17 Jun 2026 15:50:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Wed, 17 Jun 2026 15:50:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-xipzUxxNKq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #45 from Alan Stern (stern@rowland.harvard.edu) ---
I'd like to invite people on the linux-pci mailing list to pay attention=20
to this bug report:

        https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

Comments #14, #37, and #38 seem particularly relevant.

In short, the problem seems to be that after resuming from s2idle, a PCI=20
xHCI host controller sometimes does not get MSI-X interrupts any more.=20=20
Setting a quirk flag that causes the driver to use PCI INTx interrupts=20
instead works around the problem, but it's still a bug.

I have one of the affected systems but haven't tried to do any real=20
testing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
