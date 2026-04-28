Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8843B2FFC
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 11:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375075; cv=none; b=HyM1Hxkgk5XnF7nLD8wSps26lO7ESX7xuLeFKTJiKbgyIEiuRFhSS3cxf2VQsLCh/4EN+wB51PP5W1iVDQq9vU3zo0kus91nFSicfyaWq8xO+7acE5lF+VobHNpDFEsMTZspmm8Gq0o3+6CsbM0riPwBPS4xYcLtpZ+oCPjOefw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375075; c=relaxed/simple;
	bh=LvuYRn5Fx0xp0wQtnIbEg63XTpK4I8u8c2Aakt3SzFc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZqoiQhnA41IWTe8EIsP95B9N9CEPTwSkylIVfwGtToIwLUyl8jKq4Ak6i8jeshBm5+dITDBLzLMRPFixj7u4Mbw4DDCUCBmFzafPMxYCCIspiZ4Qd9DJ/zOerO7CJDcvqiBlf1Ql8R83yTqFPhgE9GP1oBEdNH92a6+tfdVBD8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufuqi324; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufuqi324"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C70CC2BCB5
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 11:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777375075;
	bh=LvuYRn5Fx0xp0wQtnIbEg63XTpK4I8u8c2Aakt3SzFc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ufuqi324vCcexRgxDlAZS9pfNXm0m6UsfIogK9MRsJlIQnVcPSP436HHHy0FnvNVY
	 whVGhOZe4o2HsbGMbiTAfscPjulbzIvN5oPSnFDCel0m4Ybj+o6nYYIVnOmFWNhvXx
	 GOYgbfGfRBXGjO4BnYbHAlqFnSFTm2BncI6lKRiEyHjsMUplXVp1LN6/oKI15FGe9b
	 rKaF7fH/mbwIB2rmk2vDGJYPeJSnNOAG/7VtGqzDuxsx77JzgEABspnS3iPrMs9Cw+
	 yNEXp/UiDI9zbjw89HdKPzHicfzG7i4kOHscWDGTuo4fDo1jlq8QkCLDu2e0mqZoZ/
	 joTbnAfiRo2CQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1D454C433E1; Tue, 28 Apr 2026 11:17:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221422] xhci_hcd host controller dies on Intel NUC8i5BEH with
 USB audio interfaces (POD HD500X, Mbox 2)
Date: Tue, 28 Apr 2026 11:17:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221422-208809-pzVcuECJe0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221422-208809@https.bugzilla.kernel.org/>
References: <bug-221422-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221422

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #1 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Does preventing xHC runtime suspend help:

echo on > /sys/bus/pci/devices/0000:c2:00.4/power/control=20

Could you also collect xhci trace and dmesg with dynamic debugs enabled when
triggering this issue

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
< Reproduce issue >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
