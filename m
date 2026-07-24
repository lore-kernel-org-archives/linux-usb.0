Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC919377AA1
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926764; cv=none; b=Ry9nfGdS9X9jLUcui5+tbZJjXgTA1OAkB5h8UwPpnoucyGD5xRKrB14ujvIlAsS7QNyKYamOyAvxR3Sjl+B7rN49vWkflAnQyuz3ZsDMA9FCt4ZoNVVAmq/cotppFMsNcwzjghLGNuFwHo7OwrTcI483H1IRQoNpRhf/vXbBV/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926764; c=relaxed/simple;
	bh=gYDdiR19jzDM06uIzhhdPpgRLHmc3WwkikSgMoRVLZI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K80QR9bm8r73YzeVJX7IntEw8/AsUBgnEc1IBp1yD1rAfOLDeXCWb52mpdVFCGUBKZ5D6CReOxop2ogskYduH46N7fmzqOrNmN5PrFn0fPzaUTSwFu6D8JkC//229e2gKMaEp9z/S3mbngFxJJrNx6WypXd97R3iqEl/Auvxg9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6/jJdcS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6/jJdcS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D4D2C19425
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784926763;
	bh=gYDdiR19jzDM06uIzhhdPpgRLHmc3WwkikSgMoRVLZI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Y6/jJdcSRa349wihhtyOlDIUYPYC3KD/ccj/Z/O22wgbIsvPMsToZN1Oypo6lxT6w
	 gPrdHo9suv1z5yXuywrPA40dVQU/G2fn5qmWbtHo6blJoscKVa2HOVNVFgFNb4lovO
	 dBkH6DO0k+M9FCTpGMdKQZIzZe3Ll3IFgNpgTtfSX0RX4EWcnuUeAlZ0obDy6FxOBB
	 CqZGoC8rPTjKOfRb1TQwHgPzCtlMExuoX7/sph+ojw5FV9/EggVUZffA/80Mn31iKG
	 DDkTTtjCgZvikPd2yhQ2GPDh183rRPO5LeIdBQ35QzCTTLcHJcsg1sgJHajCupPrIY
	 p2edobpNOwUmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6A263C433E1; Fri, 24 Jul 2026 20:59:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3ODVdIEFNRCBTdHJpeCBIYWxvIChBU1VTIEdaMzAy?=
 =?UTF-8?B?RUEpOiBUQjQgZG9jaydzIFVTQiAyLjAgdXBzdHJlYW0gbmV2ZXIgZW51bWVy?=
 =?UTF-8?B?YXRlcyBvbiB4SENJIGNvbXBhbmlvbiBwb3J0IOKAlCAiQ2Fubm90IGVuYWJs?=
 =?UTF-8?B?ZSIgeDQsIHBvd2VyIGN5Y2xlLCBnaXZlcyB1cDsgVVNCNCBsaW5rIGFuZCBV?=
 =?UTF-8?B?U0IzIHR1bm5lbCB3b3Jr?=
Date: Fri, 24 Jul 2026 20:59:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lkorcm@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221785-208809-bnItAy62ZL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221785-208809@https.bugzilla.kernel.org/>
References: <bug-221785-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221785

--- Comment #7 from lkorcm@gmail.com ---
Created attachment 310506
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310506&action=3Dedit
/sys/bus/thunderbolt/devices listing

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
