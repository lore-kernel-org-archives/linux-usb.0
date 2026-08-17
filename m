Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6E03BADAA
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786958450; cv=none; b=iuSVCf/B64L9PlKP1wxTyZWzhx0vFqxyUys/XbH5HMmpitVt8mcNyevbNoVbQytRWEHhJdv+OtYXl2EzFtG2M9a39eqz58zGdceAMHICVhgGXTEh3UEUDGm+FBoUieqSkIq1WKienPBAGdpVF4PDzLmxHwccdKA8//YuM42piGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786958450; c=relaxed/simple;
	bh=i0Rpx05Yc13ffI+daQyqgvyYBnzXDXedTwZKvdO3Sik=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EyYT6kIv0030NuMpcEcnZ3miNmwnE+u0RcAqv8sIUp3JFfvVGEpgdBaegkVuFwq8NoUuXCp8mRrVHieljFRGKrosU7XzVxhyFXFw7olcMTepBspdINwgtqX6STWrwecqYJ10YNj6RLMQQVLb0mVwmcuMCf0cxKnnMkrBmmtsHbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ww9zCMfN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ww9zCMfN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC6E7C2BCF4
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786958450;
	bh=i0Rpx05Yc13ffI+daQyqgvyYBnzXDXedTwZKvdO3Sik=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ww9zCMfNCX9BRpGPFZH4bc5TKjdGi5l+tGJm0qnHvOBx4DXBLFJ+imRYT4gnHWmt1
	 O9s11IbyBiGtwSxuix9M9EI9bSNSNfESgV6HfiEQgcjh00Db6oqZ7bn0o1MGZcig8F
	 WVmojZ0ecIY9PkSK9yq3OZrqCpgsMp+uHytb+hikw9AysZG4cDxbG4X2sxTeJGoa56
	 P4VIT0Hkp+zb6La7wMzRGU5wSCO1L0BZULsCUJQb25X9mSOc22Cj4zCI9pjcEOdW9T
	 NYTMp4XknNhzUrPLZSqkyLP3iyEx/os2z4IaOHpsFbT7aPSzGK+mUhq0Y1yqN3zknj
	 eB7ixZ75femuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DB86DC41612; Mon, 17 Aug 2026 09:20:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221142] ucsi_acpi actively breaks USB-C PD charging on Lenovo
 Legion Pro 7 (Arrow Lake)
Date: Mon, 17 Aug 2026 09:20:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: huangwei@kylinos.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221142-208809-gmeHTJa3um@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221142-208809@https.bugzilla.kernel.org/>
References: <bug-221142-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221142

Wei Huang (huangwei@kylinos.cn) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |huangwei@kylinos.cn

--- Comment #1 from Wei Huang (huangwei@kylinos.cn) ---
Hi Alstergee,

Thanks for the detailed report, and for verifying that blacklisting
ucsi_acpi restores normal PD negotiation on this machine.

The cleanest way forward is a DMI quirk for this model in
drivers/usb/typec/ucsi/ucsi_acpi.c - there is already a quirk mechanism
there, used for a similar EC firmware problem on LG gram laptops. To
write the quirk, I need the exact DMI identification strings of the
machine, which are not part of the report.

Could you please attach the output of:

    sudo dmidecode -t system

Alternatively, the contents of these files:

    /sys/class/dmi/id/sys_vendor
    /sys/class/dmi/id/product_name
    /sys/class/dmi/id/product_version
    /sys/class/dmi/id/product_family
    /sys/class/dmi/id/product_sku
    /sys/class/dmi/id/board_name
    /sys/class/dmi/id/board_version

With that information I can prepare a patch and submit it upstream.

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
