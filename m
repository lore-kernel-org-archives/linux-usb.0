Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260753B9920
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926686; cv=none; b=kjwzpjCTKQOt1NW4y2mGFRm0VrcEhW20DFbep06jF71m2rkFAAWMBlpoPFCLZBzOuSxLFerhFBG8hWFOm6qMuJ7u5UdauVu1xziKfomlNpqUbHF9BmVAObnn32a5N2CAH4m1m7kU5eH6gdBAfuYtGVQuRUHz8t1+kPrZiSKZ7FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926686; c=relaxed/simple;
	bh=tx66xDwk7sWqmIakG2AUrZV1C7Gyw3qdP8cOD3URGa4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tLpeK5uU2f+V3e2PaFglZlw5SzMHVa/l5FpX+UFZv74u28ZKWg8JmoDWmBFPQXyVdIxgTzTUjLedKH4H82l2MqfCdL8nn042jLhnOFA9me/OwZOLAsF+Sq7dAlzRokIMuyhyTGBAfHfE7pHgXifi92PIRIJe8gNfPUEyqu6vl0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1hLIt4L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1hLIt4L"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABD97C19425
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784926685;
	bh=tx66xDwk7sWqmIakG2AUrZV1C7Gyw3qdP8cOD3URGa4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q1hLIt4LMhTk+1jMCec47kr+XhIUL8giiZstrlCT2Qsc/3bRgfqZgOJlQDcIMg7ta
	 KrwaPIrzbmWSsrucGwEuHaIc0ekBm3jarvZ6ty60c3W9Ib280+9vcD+TEBizSJd3nq
	 G911xmCzvke103XBAADEcZszbGlWlfwdd/fApJ9V+a0TdyHuj6Vt21nNyoSlWV0+lc
	 AkWh+G3ibYrFRenH2BBscHSN4O/4rVlBUA2IFCdkNinyPV0LwoD0XbKtOQPA1G68lb
	 ZGh7AJKdSLaPBLwtgcVgiGLdSFxYjmh+srFEwi2pxn/DrnOSj1ee/uc2Uai1vkF5P5
	 3luOWZ7UVZpBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 99494C4160E; Fri, 24 Jul 2026 20:58:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3ODVdIEFNRCBTdHJpeCBIYWxvIChBU1VTIEdaMzAy?=
 =?UTF-8?B?RUEpOiBUQjQgZG9jaydzIFVTQiAyLjAgdXBzdHJlYW0gbmV2ZXIgZW51bWVy?=
 =?UTF-8?B?YXRlcyBvbiB4SENJIGNvbXBhbmlvbiBwb3J0IOKAlCAiQ2Fubm90IGVuYWJs?=
 =?UTF-8?B?ZSIgeDQsIHBvd2VyIGN5Y2xlLCBnaXZlcyB1cDsgVVNCNCBsaW5rIGFuZCBV?=
 =?UTF-8?B?U0IzIHR1bm5lbCB3b3Jr?=
Date: Fri, 24 Jul 2026 20:58:05 +0000
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
Message-ID: <bug-221785-208809-OY52Jqa3g7@https.bugzilla.kernel.org/>
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

--- Comment #5 from lkorcm@gmail.com ---
Created attachment 310504
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310504&action=3Dedit
lsusb -v

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
