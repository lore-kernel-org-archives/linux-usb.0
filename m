Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2740C330D43
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 18:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772474921; cv=none; b=q5xikSaXsxm1Neb8W1/4gGp+v7/5JtyJoIx08snbZx7dWI2hKTEGkFSvePs5iUCpXHhc38t9gY1ZHkEvWeNW/3pJL7ISf999F+wUucw/6WaVzzBDa6ROEhJ+HCgqAVvLdTCrJ1qFBssAJBq7w1k3iLl1z2BpkJQXVd+mryaVs/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772474921; c=relaxed/simple;
	bh=YTUgimEo6vrbzzocS5x4yrPXbv9IlhKtmyOEnRXAaFw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jCcXjlS3IWqwoi3NrzeDw06mxHFq9tVIOBbUPHA//8NdpFlu5IJj61sVigdZwmpeALMhUnYdeYPODNHXJy90mTp8DKf81JhPgGTUxk00pbQ7v2dNF76/jlb7JYQwb4247Lj/aYzXnO5rkWgL4S2PXrvh+h3t90QO/Id1X6WQhHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THtb3Yhl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THtb3Yhl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B75FEC19423
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 18:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772474920;
	bh=YTUgimEo6vrbzzocS5x4yrPXbv9IlhKtmyOEnRXAaFw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=THtb3Yhl5hmJCCNnYkv4scpRCVlr0QvrVSCvSjf//DG+/ZGaUXsBCa79BX1dN0DSO
	 4BbnQZPnuLNYCPvWSpRnjZHnc9P0dgm9TNLgxy71PNcPgiRzjUiyxAOy/4HcCbkzhM
	 kmNwf7R1h0IVhYIdrgd+lQgNmGYiC4tOZkjKxJ1RW4u9mqndF7ENX6TbukOCXx4Qdz
	 cSsmdmiC8wAzZjkDhDFysdmLAFiutVVv8FhBE8m4bcZ3KqpjREwSbGuiswNynN3Ia0
	 ENi91jZiO390E2q9oFPaZgaSyATLhPpYYAYLuMDs0j1PrLbSuFROkqz5WiUVGi64oL
	 DURkfQSpjFVqg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AC277C53BBF; Mon,  2 Mar 2026 18:08:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 02 Mar 2026 18:08:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-xCjXo27Uds@https.bugzilla.kernel.org/>
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

--- Comment #17 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
That code won't even run, because the HC resumes normally. And it appears to
function normally too, we just aren't getting interrupts so things time out=
 and
the driver gives up trying.

Considering that we have two similar bugs affecting different generations of
same hardware and (in this case) xHCI reset doesn't help but rebinding the =
PCI
driver does, I think a power management bug in HW or PCI/x86 subsystems is =
more
likely.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
