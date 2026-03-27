Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E3C35B136
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 07:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596771; cv=none; b=U8Az8zpRbLCxVQJIOHu3T90TaZ7f54Ko2iK5zgwen6izo8fCwosG98meq0Tg6gTzzHBii7cu+opEb6bo5OW2x3dqo4U/KaVfKnEa3amO0QAuRAxi1OLbqYP0YmohvEWq1t9yBReHSG/IAyJUR5a54bjDpNA1upXr4RLIzRCd7ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596771; c=relaxed/simple;
	bh=+ShoLdz9/OM/tcUtRedCYiIfB51UqNgB7LeiDV/CXyA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d4Jz50cPl6BsaD+aNCN8Pt+li3wRKukEwuF+bgN9gHttYzWNCtOrM4Ma/f3QE6LhLh9+talcS1i59SZBsKjThi+L/uqfL7afcbbRenPbh3g1aX+Gvj9clFUYyABzxlVEPTGqbIjtNcxt0Ljz5Pl6L9YeuqCl5UgchhVrm0th0UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRg3PWIp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRg3PWIp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D43F1C19423
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 07:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774596770;
	bh=+ShoLdz9/OM/tcUtRedCYiIfB51UqNgB7LeiDV/CXyA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NRg3PWIp6LJX+h69lCy2ln11+S8UQQ+0yG41ciLEJCiLd1Slf64mpngISFxswsds4
	 sjYWzKs49KKIoptKOFX5oXVu4puqHRF+5o27eRn3QQZxsIl4Ga6YHqYuLi3J1Z6mcO
	 0V4M4+4PL7Jpa5EIgXOTKu9vtnhv40ddvJVMGQt5ex+ozmyN2ySS/zthR7D+G3GNvw
	 Eldll8vyziNjBWL3su/y1VzeL4ZEx9VpcGJeEL23at0BXyOTgYlfR9yNMEvuQUL/ay
	 FYkDRVtoP7xsCiwUWWi5srm+6R++nfp/FM79OsWbNqT/ybqAb5LD3MmvDvxmog5i+N
	 CjL7ZLeTpImUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9322C41612; Fri, 27 Mar 2026 07:32:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 27 Mar 2026 07:32:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215740-208809-P54FG1m59t@https.bugzilla.kernel.org/>
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

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #53 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Guenter Roeck from comment #52)
> comment #51: Sounds good. I'd suggest to go ahead.

Agree. I close this for now since we have a compromise solution publicly
available.
https://lore.kernel.org/all/20260327055846.248829-1-mikhail.v.gavrilov@gmai=
l.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
