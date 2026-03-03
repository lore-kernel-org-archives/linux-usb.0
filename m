Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7621D47DD6F
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549693; cv=none; b=sjvS+o96u0T2eqwUZabddelaCHrpZCZiv9lB/lLvaeUdaydF3xKUaIqwnJ95I0wwHRk18WX8Xb6+h/VJ0TVGMLh8+agybM1d/n6UJhXFXnm+PlUOGBfjuS919XnGv60+wKW3rk14MUul1pV+GZIObvoNnhJK2OTcHDI3E0GfR2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549693; c=relaxed/simple;
	bh=HcuzwedtrFw2h/i6L3ldXtZDPRfHTQ+nN0Sr+QHGETo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f/GOOOg28IJMtWaLM9vTQ2hnFzrD5weRKIMUBJ2YBM4E+PVepsT/9TcsoSY0ckrTcTOU/mGBaIojI0h7AByyHQEFqVDjZ1zupw8viQnyaUileg8qvl7LUCi3fAkQSjzeX7F5VFz7xMpkU+XLPmFx9PZiETP3qAZvVsdfK/9BVvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVE6qkCn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVE6qkCn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEECAC2BCAF
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772549693;
	bh=HcuzwedtrFw2h/i6L3ldXtZDPRfHTQ+nN0Sr+QHGETo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sVE6qkCnL/BQ5xjvSFCV+MES7Sba6R1+bcS4+itiQwAkJYsT0SMYhmCPThasdlHta
	 eQWz9pz+QWaUKqSqNDpcRlgDPJL0fLkrLXoSsCqIcwERTpDFeqnJFdgZJ+DPMKWCPV
	 IDAKs4VRZ9TShUeiOjuSuwGAIEl3qWqRUcjezbP/byOV7bJ3ise/618UU+f7B5TXR8
	 JDLENf6AqDchBeo0iD2SLWQ6beXg/dK2BvNExU4UNlATEQvwFNdPDzSMi5Jg4Iw7mp
	 Pd+LC/DwuiP92LQXZKtExvi0Hk5mefGKEVerVdAvbRzF/OIplUqjvha5+lcrSOweQU
	 7aNCW4LjRdS0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E52F2C53BC7; Tue,  3 Mar 2026 14:54:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 03 Mar 2026 14:54:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.c.hubbard@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-221073-208809-HSP8qhCIVi@https.bugzilla.kernel.org/>
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

David Hubbard (david.c.hubbard@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |david.c.hubbard@gmail.com

--- Comment #20 from David Hubbard (david.c.hubbard@gmail.com) ---
Created attachment 309523
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309523&action=3Dedit
comment16-cap01.tgz

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
