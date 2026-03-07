Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEB04A02
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772910192; cv=none; b=izYUMfMMs1yGCXSHDL+F6qUo/At/VGzar3pj1vce3HfXeCwfwC4A9dA5IVWBKIssjBukGGYIrqeY/5G5/23f26EWNC3yAzmTlll1Sar15ltq4L21wBTrhuAEYUOKgCYX3Ib9S6b7ddYOqaJ6qCq/q5z12TYymYXFlrr28wtUXrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772910192; c=relaxed/simple;
	bh=WyEsN+RFv7+GpA9i/SEjBa4CM14aRc0bp+2rYIrsnRQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UMu9SM5zTGyhb3AHDgRso4H9QRoxbr84NMkdNNPfGDxsoJuAWNpYyypmu0RqsF84EmwLWo8CM2lhviZKciiP39rwJP+h4HFlryX1K0Mq5la1aYGNLqfewPWoOgDCzn6hMVWf5YjJ5exqyhXC5dIVwig5OIWK1l82SblRq35zZlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EozkaPNh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EozkaPNh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1CA8C19422
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 19:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772910191;
	bh=WyEsN+RFv7+GpA9i/SEjBa4CM14aRc0bp+2rYIrsnRQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EozkaPNhVywT2jz/YipbYdV2sS44y0HJlDEIjlDl7bogd6w3bbW51xFykcqpd4TMd
	 cEhfE9H3/PKkmf8Qj5zz/Vf+0B9gHs95Z7fZfSxE4nojavZY8QgNFxlBkCPDW6DO32
	 CaWU7knKtzdo9si2oG/30oPOBRNmTLvzySBRo3nxFzSDuno2CMq4h1D/UrEcALBseZ
	 LSrZXViGhWcbdwlMMdVP6QZI+/pOoykFqDc8zoLlo2lQIjoLa/FjyJNXwj2Nx+L/hb
	 nAVqhsW0hnS1SkBAUivvBhLqJs4Jax4KqYEXrsUhc6NKn7UgVUhhRwF0sGXBHPTym1
	 sO4Z27qXShFkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ACC33C433E1; Sat,  7 Mar 2026 19:03:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sat, 07 Mar 2026 19:03:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221184-208809-kEtYob5cKa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221184-208809@https.bugzilla.kernel.org/>
References: <bug-221184-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #6 from Roman Elshin (roxmail@list.ru) ---
Created attachment 309570
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309570&action=3Dedit
lsusb -tv while usbmon

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
