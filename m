Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541BB35975
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788126669; cv=none; b=e9PzftR24jjP6XhNpw6dix5mS7RvSN3heFdmv0ts21+2VfE2fLeypCGsmoQ9qBLiX6tXD+bAz8bv5gj24inH+5v10txiYPosRxvCdbjQh1JlQZc/48KIRz7qgWJddIvgndj6HhRQRsdJCW94FsaMvBpuHW4/9oUF2jl8aZlTdXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788126669; c=relaxed/simple;
	bh=WiGbA7gD1KgrRpzTpRmlaZNCRu/Jrat5YaZxBqUuwvo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M68ovjvxWfIhIUx9ZbZi3j+32QdmBw372jpZPRl457CCLma1umRICfdWRGYm3YRA6aqbDN1hE6QNoJxU4T0denY/1P/A8ri4fBYZxkcGrj+hs7DPE61VKPpMguUfG+wZpwjKKGQ+n7SEHl00x0bh7s8C7hT7wnDbQ0fdbQs91Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvjgCUxl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvjgCUxl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D7A9C2BD00
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 21:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788126669;
	bh=WiGbA7gD1KgrRpzTpRmlaZNCRu/Jrat5YaZxBqUuwvo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LvjgCUxl+jt6ZsxCvCjUaG+56c0SnzTcFfEl1YkEcYhsE+WJPDvrJ2n7Hz1rpVTvB
	 5k4WT4FwGzuM9pQdPTKW9hyxjyxEtIS1hkXF+qqVaKg5RoZehRrDVHf5iSt+oAFA1Q
	 0Nr/0xO8Aa5gQnQYUxz8VfmftPaEjDhcr2yORHvkaOFwzCvRBPmUVldgIgO+lqr0UC
	 eG/5gS+n0dDLvhMgtRjzs13wiR6405qwrsvkZNzPWCkYXCmPkYXu6HnbuscVwBMqlD
	 2JfJ1KdXTlVe8VkzVDbECdJbexVyKyz7vi7RNZz5IKHihpkbAPI7mbF/BvqdESjbkC
	 Pauk3OYXJGWCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F184BC53BBF; Sun, 30 Aug 2026 21:51:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Sun, 30 Aug 2026 21:51:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: voltara@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-ihEU1YJ6yw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #33 from Andrew Skalski (voltara@gmail.com) ---
(In reply to Micha=C5=82 Pecio from comment #32)
> Your finding is curious. Does it mean it would still work if you add
> msleep(10) immediately before the failing line and not earlier?

Yes it works there as well, except you need to use mdelay instead of msleep=
.=20
For that reason, and because xhci_set_cmd_ring_deq is used elsewhere, I mov=
ed
the msleep just outside the atomic section in xhci_resume for the proof of
concept.

The reason I tried adding the delay was because I noticed enabling debug
logging made the problem go away.  This made me suspect the lockup was timi=
ng
related.

Thanks for the link to the other bug reports.  I'll have a read through the=
m.


On a separate topic, I did some further investigation into my crashes to ti=
e up
some loose ends about the trigger:

1) I'm pretty confident that it's just the two "1022:14c9" controllers that=
 are
causing my crashes.  I have been running an unpatched kernel with
'/sys/bus/pci/devices/<pci-id>/power/control =3D=3D on' just for those two,=
 and it
has been perfectly stable.

2) The crashes that resulted from plugging in USB devices were somewhat of a
red herring.  A daemon on my system (colord) was reacting to the plug event=
s by
scanning everything in /dev/bus/usb.  So in all cases the underlying trigger
was actually the same: resuming the "1022:14c9" controllers by accessing th=
eir
device nodes in /dev/bus/usb.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
