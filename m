Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F382D7BF
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 02:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775442697; cv=none; b=piuQbvCeI1V4x4qZxxSo1C12uLVG3xnzpBIjSjKHrvOMS6x4rToGd1JosL0h6YMLgUdeBV7dMHQU2SUOBPPf1ASdA02Gdo4K5bHzF7MAwUqqSffrvGpgfeehc+SCFvzWdZIrmoU6yO4QBgEIWR1vLOAjHY+3qp4icCBtU7uH9Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775442697; c=relaxed/simple;
	bh=5r2xWozSuaCbVwaUO1hn6ZHMZVN+dx6nBhlpvCwpPps=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OPNLhOYT0hazRG029wvbNV9zjjbLAUvbOT0L8WMHkgyqV7c+Xc+wZB33psZUcp9MjUmZV5+CpDn+rP6oTWSzrzg4yb2HUVClAIAobeETlavknDlQT99UYSkKjLvy17Q0vL2SWM9xjldJegMIlxm6rmwWWm6pBOb1RK7744lFdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6HK1MFZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6HK1MFZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F0E1C2BCB1
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 02:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775442697;
	bh=5r2xWozSuaCbVwaUO1hn6ZHMZVN+dx6nBhlpvCwpPps=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U6HK1MFZgQ20JqmxOOWvsSINISLxikRTNaa7iu5fsWgm3hDD0mxZqJ2q7Xr903bGy
	 Tlo2tZkbFDV9uRFFw0A55+llu5aSJnX5WuLIIMFaXoa5lIrHSb2sCmBAzX8VJSgh4e
	 cEIhIZZdfWYZdpvkk8kdc2eBNn1B8cwD73sa6qbjrWihpe5VSaY/y6XCHA6JDZiAW6
	 PXEAVJtn10SAWLxNE7tis+uE06axuonDqrcpg6ip8YQjECOGnIxgmqH/FCu5ZsTU6t
	 nH1LsXLf1/Ll2nXW01VDDZWcX1LSiZ4KMiXE9XZ53tJPHr3FbTTbLJGQ/FIpJD+H5U
	 /HOgF36gQSsaA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 79DB3C53BC5; Mon,  6 Apr 2026 02:31:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221319] Certain operations via PCIe tunneling between an AMD
 USB4 host and a Thunderbolt-5 peripherals cause an instant reboot
Date: Mon, 06 Apr 2026 02:31:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_pci@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-221319-208809-WkSYfQUDyY@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |PCI
           Assignee|drivers_usb@kernel-bugs.ker |drivers_pci@kernel-bugs.osd
                   |nel.org                     |l.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
