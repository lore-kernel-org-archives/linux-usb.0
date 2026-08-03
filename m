Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1202A40B0FE
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 13:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763750; cv=none; b=j3YS/GNuLFKReOJxAmUlbOP+iFBbui8keetbTHbpNfatsA3EkEQ9zmKlj3vMg8eGXlm3RR49urQLdA2Xb/zQeX8lnjFEDJLH8zXoWiLUyuaiO/1k4wsvfNIr9UDTZb6I1mV32uLvH2iETbc+VgA6myY5vWUXo5zs/om6hYHQsK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763750; c=relaxed/simple;
	bh=ym+P4yr83cLonxfGG0o6VAKDjCE/0V7gT1aHFCXGT+o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kSIr4qMYAuLztiHc1Igb3yEh1bMzldlw2eL7CXeGVqfPJVaxs7mS7dKLFbLg2AUZ1yeHy54b58evVYOxM8nTAAZRe+plJU/pR7DxtJcdMHSGaKbXkufLrvG1KYYbGF0sQW7Y8HNh+Wz23OFmMiblojmRMTjvToS4f3bX152vLwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daRhdBxK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daRhdBxK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27780C2BCB9
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785763749;
	bh=ym+P4yr83cLonxfGG0o6VAKDjCE/0V7gT1aHFCXGT+o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=daRhdBxKg1WsE8GRr4owlrRyvVofoBr0m8yU5qKp7uoKBRdlF0Qmn+q20+fLbZHmS
	 2r1cm8GMeIGEi++x7DeziHpFw3IfWiya5M8FD/NjAttbKX+++d2idqIjyzo4YQxNxS
	 G7KOG5WoFYyxU9uI6zSr5h66T3PR3BamPEPMqwXhDMs8BW+Cmh82wl9RYBY20lsJYs
	 JW2RMd5ogdRuHHH2KW3AEO7CeqSepFd05g0RKwu0e6r98GNeRuyQDPiQafkdOIkA+u
	 TjeVj3q7sfTskTGFR92jkuTDGgk+3LbVAqQlzVDk/DVJgy2HWpryUdYeS4bIzESTGx
	 acRFuuPLBj3Qw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 18AB1C4160E; Mon,  3 Aug 2026 13:29:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Mon, 03 Aug 2026 13:29:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mayhemandcoffee@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221774-208809-fDDJl1LiAu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221774-208809@https.bugzilla.kernel.org/>
References: <bug-221774-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221774

--- Comment #15 from mayhemandcoffee@gmail.com ---
(In reply to mayhemandcoffee from comment #14)
> I've tested the palm rejection.
>=20
> It is a lot better as the cursor no longer jumps around when I am typing,
> nor is it clicking on stuff. However, I noticed that occasionally, a
> keystroke would not register while typing.=20
>=20
> So I would say the palm rejection behavior is significantly improved, but=
 I
> don't think the behavior is completely correct yet.
>=20
> Because of that, I'm not comfortable saying the issue is fully fixed or
> adding a Tested-by tag just yet. I'm happy to continue testing if you have
> another revision or if there are specific things you'd like me to check.

I should also mention that I have a recent version of libinput and the quirk
from commit 772c1f5ebb4a4122d55fc392a690056d8c55809d is already present in
/usr/share/libinput/50-system-asus.quirks.

[thienan@thienan-pc libinput]$ sed -n '45,55p'
/usr/share/libinput/50-system-asus.quirks
AttrKeyboardIntegration=3Dinternal

# enable "disable touchpad while typing" to work with z13 keyboard
[Asus ROG FLow Z13 2025 keyboard]
MatchUdevType=3Dkeyboard
MatchBus=3Dusb
MatchVendor=3D0x0B05
MatchProduct=3D0x1A30
AttrKeyboardIntegration=3Dinternal

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
