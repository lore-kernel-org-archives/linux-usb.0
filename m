Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3DC1DE2AD
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 17:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773077092; cv=none; b=HagYq7EqmQSUGgsm16z+QOUOgUHXygn0xAz+EasQT7H72S/pLJ5Zwor8Y01VwpMhihH2fbiyUY5L3D6YkvKlnf/ce4I16wQSCjZAvclUPOPV+Pc/lCZUYIxXY2vD7LuvETY4VkYlgYRN07cdp4Fg563ycIS5RHFtnrqFKxtypq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773077092; c=relaxed/simple;
	bh=Rrv/FfcfI7NyUkx2v28ksa+w+doKLvQ/ecE8F8/apOU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u5X0Z+iyZEz3RR5b9zZ6DLB4tS6z8j7pknCJcJC+iHQl+8MQSEsS/w4i0TvRDtd6cmYSrINvb8zttcd8vrdbiceSbsN2z9Ce81HRXj+9zQGxIvFqJ/wc/ZzlcgPEyCm1vzaklG7gDGADv8S29kdQMfWzlFbnxR3DuMyiExaR/9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxDX7G3Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxDX7G3Y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FF58C19423
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 17:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773077091;
	bh=Rrv/FfcfI7NyUkx2v28ksa+w+doKLvQ/ecE8F8/apOU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lxDX7G3YCKdHdiEDGe/abUrv04/D1JFeL51MYAZ/zHibRQzpkA1Nb5qar1HmMAB6+
	 KK9Qxja3YWGU8b3MT/wG7Arkw6uo4dk4Qpi+iObY9NlSyq3OjaGUkHx6kcljWN1p54
	 hWApZcRqHf4JoeIVhzgFbUd/cdGxKEqdQhIm2//qSGBeSJVeo0giZ/3Ww/Fcd/a7X6
	 fZqix0Eko1DM8vbp4XJTc4cty2WYAW79nv+sVAhHvuzy03OjPMkXQMare2ic80VqDZ
	 ZuFUGeRpNHz27tPj9JURM65ceEKcgigL1yEQ7/Px+5ktVujDK6Z+sXLA1/fxVbGKfc
	 aqTzvQ5DXSJ+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 18931C3279F; Mon,  9 Mar 2026 17:24:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 17:24:39 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-qrQzRp2luK@https.bugzilla.kernel.org/>
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

--- Comment #26 from Roman Elshin (roxmail@list.ru) ---
(In reply to Liam Mitchell from comment #23)
> Here is V3 of the patch if you want to test:
> https://lore.kernel.org/linux-usb/20260309-usbhid-eproto-v3-1-
> 23bd841dfc91@gmail.com/T/#u

Thanks it seems to work!, but at hub removing:

[  859.967317] hid-generic 0003:046D:C53F.0008: can't resubmit intr,
0000:00:1d.7-5.4/input0, status -19
[  859.967329] hid-generic 0003:0603:00F5.0007: can't resubmit intr,
0000:00:1d.7-5.3/input1, status -19
[  859.967336] hid-generic 0003:046D:C53F.0009: can't resubmit intr,
0000:00:1d.7-5.4/input1, status -19=20

at dmesg.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
