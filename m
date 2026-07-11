Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A68C305679
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 21:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803697; cv=none; b=SPXwOCLBqi+Jbf5q2Q3BaEko2xuKLZSF0EwtxoHwYfh+mBxgbp06CT9VX3aw2NsDKWITUk9TxcnK1zXg78HgdoJU3g3uoULOt8PXXl1pebTjTQ9xvh0LeK2yAFj61U73M3bz+plFguN6E9yGiTfSZ0Ok4nTy2qLbS9AuqAPC9sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803697; c=relaxed/simple;
	bh=vpNJE/OZ+qPlx/LE+xI25Lqq/oQp2MRIwN3YPiMFL4Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RNl5aeoGDfByM9kqTnJnTcCHTx8lSLwI5sr1rz6NJ6wgSn3tooU+Jhdl3lTzxKdP6PEk+rDRCoSmvJyqpYhQjPf+agp5H05JR6jf+dKaAiJrs+udAOAwP7jqKo2V9eJpkWBLwbJYjeoI++FECzyJoxI/GsEM8V/VE+soXfO8FMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqrOuzXo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqrOuzXo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E73A6C2BCC7
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 21:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783803696;
	bh=vpNJE/OZ+qPlx/LE+xI25Lqq/oQp2MRIwN3YPiMFL4Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DqrOuzXoAhE4JVnbJG/55RjkoXT2yiY8diXkwcbVRZ0sh2Opaq+uOj/WoIHwmYmZb
	 AGBLHG8l/nAqPUeNMt+tVzq6jf9b+cf8fgsltgtnUhUHXqh9A36vFtern/ri/eCxIR
	 5QhHMQnmtTOH0OlDKuGPb6e/hrfcbMUNn49ZzFwF2SWCk4JC9YfktjKBnAnaj003sW
	 XiXynz3GyobohJKXpqY9TQt1hu3tMM2oAq9UFxGR4aUlcjpn98H+hoI9lZacD+Xu+M
	 kRi7Ui5NnxCuUrSU+eXJvO/T8nGdmsjR90TFTw1ffEtf+1RcL6XHMPOJb7X8qGyUaP
	 aU7Yn59gy2pkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C0EABC3279F; Sat, 11 Jul 2026 21:01:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221721] prom21-xhci does not allow to use USB keyboard in
 plymouth
Date: Sat, 11 Jul 2026 21:01:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: hurryman2212@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221721-208809-7gaBuohjiS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221721-208809@https.bugzilla.kernel.org/>
References: <bug-221721-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221721

Jihong Min (hurryman2212@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hurryman2212@gmail.com

--- Comment #7 from Jihong Min (hurryman2212@gmail.com) ---
(In reply to Tomasz from comment #6)
> Hi, with "xhci-pci-prom21" module added to initrd, plymouth now works.
> Should I close this ticket?

Hi,

Which initrd building tool are you using? I may end up doing PR to that as
well.


Sincerely,
Jihong Min

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
