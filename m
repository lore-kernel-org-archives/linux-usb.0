Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE038B7D6
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307325; cv=none; b=VKw2lvE4mBOzRpn8eF+Z9w+oZxt5xy/WycBvIEwGtf/8kosSfVCsggZbsZljQxEtlSCO7SgKNXL/YPoF77q30a9qFtUcnVTcALgDNo0DGKMVC/qVmgq5grjO9BPNIKTqKEuVkBODb14T/xOS8lqQpEzB+9UVMsvUu9u18XwPb4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307325; c=relaxed/simple;
	bh=dKSW7R5iup9iUKdY8DazzLVEMlUKy5uPeuaECQ/yoWk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wvc48SaeaNEiQPZGi7i5zZieBC5uQsiw3dCLOmVdLlUPstV55COcdMo/v3pp13fjbg9PrfNbKzbtv3mN3SjcQ5g+N9T4b05i18PI92lj461/pJL3m58Vx/HydMM0PLrGeRKhmflRz0fSG8xSxJWJOjUpWm+2RkOKVr8c1bCDjOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abrI262Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abrI262Y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F39EC2BCF4
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782307325;
	bh=dKSW7R5iup9iUKdY8DazzLVEMlUKy5uPeuaECQ/yoWk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=abrI262YFkU9vOT/bSjYhQimUXjqgIDqPytldoluFM2J5t8ua32izRvGSDVpzSpE4
	 ndgnvW206hSYav9uKynVr/JuhUPI9OI7WYKEXLAoZkZ8cRJKMxAtnSO9KM/wOWkMiO
	 KnZNcWlaVpwXABCrILn5dH7aXnEGbkerSJmaqnQS5HlLNoOEn1dRyj/2EKI/1povXv
	 H4WTDHc6ZDoP8sH5o3dq1tCH16Vy+h7NYUa+6ZXOA0UOq8s/FrY1Ow3PRLaYsApfa1
	 ykis07xcIFSsbJtN8Du0dekiXy9kNYuQfnxDnrgkYVYqNyo11oux3qcQW6OhqMCxp7
	 4Y6Q0Fph8/6IQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 05A5CC41612; Wed, 24 Jun 2026 13:22:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220936] ASMedia ASM4242 USB 3.2 xHCI Controller gives command
 timeout
Date: Wed, 24 Jun 2026 13:22:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stuart.a.hayhurst@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220936-208809-BQDBQEXm8s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220936-208809@https.bugzilla.kernel.org/>
References: <bug-220936-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220936

--- Comment #6 from Stuart Hayhurst (stuart.a.hayhurst@gmail.com) ---
Updating the firmware just released by my motherboard vendor has fixed the
Logitech device issues, it seems like it's just the power management issue =
now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
