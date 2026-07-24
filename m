Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F33C3BE0
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926649; cv=none; b=L83BlAseXsMNMzpe8bl5jwBQg6hBiuNbhu4x8KsV2n/WhkTTaDUfRdWf1NKdyU90k0Iad7LNactr6ON7Zd7M4weYarZPPSwxnVi3VSmzNFJX6xXsY/hPG7AaT7WSsQr7VUPXLkBi8Fh0AqdQMBxAvU93gJJZ0SXxl3giMyXs8AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926649; c=relaxed/simple;
	bh=WruXfKBo/ndxT+yx49Kb/IF73Ab5J9BB1+j2nmYZdNs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qnXOlKlkmNZcdwAGc6ABRbFFJpXoS8psV+80E0dnoAbJdMrdFrTrmuaX7oKzXLhcRvm5MWwblnXiOGEx5x7XRuokKsMJIGS8OwRqmyOlvQq1+vuunwR7Sjc1ddY18k9E47ZsOQcSY7lcAH0ZlAmEuqrjZ5pH0siR3CifcgRHCm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjmUXSgC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjmUXSgC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C965C19425
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784926649;
	bh=WruXfKBo/ndxT+yx49Kb/IF73Ab5J9BB1+j2nmYZdNs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DjmUXSgCHgjsUGBK+4UyS4PfIDkl19Y94TAC0pvp1heGa1IvxjrNevwjMabcQZSSK
	 yXIjoKyFmUfi7RIoY46/Q+pfsVBjxkHztByApZRyDRyhJgo8qzj7u/4PpA1+E5fr6H
	 3Ifz47dPBwzYO/iFLoYZMH8D+EmT5+mLJLg2Xnerd6jNfFZ1v9fR3OBYx12FnSkg3+
	 Zv4I1fDTLS7YZ2UjxIfJnG2HUtAHUqeBsNhr2aor+6szx1PyFic4MxW/14m4X470eb
	 E6cDxsMCXFs4nA3zBCVL130tvC5hZIf74gZ15eZsxt2+9C7RdOHsiOHbs1yflvNHGM
	 bmnH1PYVCygwg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EE544C4160E; Fri, 24 Jul 2026 20:57:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3ODVdIEFNRCBTdHJpeCBIYWxvIChBU1VTIEdaMzAy?=
 =?UTF-8?B?RUEpOiBUQjQgZG9jaydzIFVTQiAyLjAgdXBzdHJlYW0gbmV2ZXIgZW51bWVy?=
 =?UTF-8?B?YXRlcyBvbiB4SENJIGNvbXBhbmlvbiBwb3J0IOKAlCAiQ2Fubm90IGVuYWJs?=
 =?UTF-8?B?ZSIgeDQsIHBvd2VyIGN5Y2xlLCBnaXZlcyB1cDsgVVNCNCBsaW5rIGFuZCBV?=
 =?UTF-8?B?U0IzIHR1bm5lbCB3b3Jr?=
Date: Fri, 24 Jul 2026 20:57:28 +0000
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
Message-ID: <bug-221785-208809-2nZ2xaFwem@https.bugzilla.kernel.org/>
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

--- Comment #4 from lkorcm@gmail.com ---
Created attachment 310503
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310503&action=3Dedit
lsusb -t =E2=80=94 USB4-entered state, companion bus empty

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
