Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793773272;
	b=m1GHaEBN1n/AM3fGUHCRJuwX9aBJRXBjHkAHpo7q8jDpK433vTFmGPsUdsjdM3Pjeo6z
	 m8t2vQlvEHay2k9qgKxhlb6KJc2C4NFTpmcYItJdXETFQRJ8RBxWU9veRcw1s2RhpPMUj
	 /TR3ua/aINE8M82IlyuPd9e4D3p45I17TawO1PN4EExG4UCD4mA/iwfJUrCahsL3EYYx+
	 no2aaUBKRQ5tJ/dlkw4YpNjixEx0vWFXRBeFpeF/IuK2OEyzPig/kJUIX7ugKCQxoGWmM
	 jDIA25+lj2SgOjKEVH+7Z4zEBES0fz/tq0a2EAvWyA2Y8zIqnUAMy/oJM98+n8e1dHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773272;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=nYpIMlFlHBbREpON1MHK2ZN9DHtczyIaiyTWY/HRJ/U=;
	b=IpzgTau9qMbjSL50VfN/N2Ef9/eScbDXmZvcfApLHfnAYqGRX01hEXlgvuh/3/xZR2bV
	 JLD+Yu0RwkQ5vLyJjASxqqxAu5a/yMZT4cmiPj4Ia33oAZauuy6JqUIUeeyDBkbyf+yuz
	 3rODGDs/i03Ae0OUFbzFi41qjbTAn8SFI0+zg05RN0EcBiSdZJSiD6xtbr1q/evGx5J6S
	 lnn/qkCpWEVprwgA5jp9HL90s6l7dMnqXp7v8KIPJbrnG/g/gns5LEhOJpIXKUk79K9ix
	 FckYdwExqLxmRCwZZNVoUNTLqDH7bTjUgV8RhbxWD0FKwAtk0b6FxoRF2AxLydFZM9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XD1MaYr+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D15606A328
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Wed,  4 Nov 2026 06:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XD1MaYr+
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC23B6513C0
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 06:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793773271; cv=none; b=ZxonzampD22VFObumynFKwoPud4ZHamfAneRRIV/v8/dhqx512YfFZdTFLjHlMYCzmnZzNix5yaXyaFsW00mEbmfaZGwhbOYMWjSnO+mTFGRAZfpNZTjTm2OOVfN3E+HFFyQvptqP4rP38qfLJRBuh3XimLS2Ue3RoUHMxcEPok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793773271; c=relaxed/simple;
	bh=6Zx+tZhiCeY+rClYyJQUQ1AB54yY4JXjtuwjFTzTr6I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CYoRcWLQOFIfeWvj2uiRFX3RloBcFzo0uU+W1qVeS3c7jL8vx0IYg2KWS9ZAQrnglBV3oAswNU2Oukl0LttYm7FQwf7qv3MYlkLgmtwoqqpiW6GnghMTMldEKKR69pv+EYJrJh5odAjQwBd2GOR/SSrw94/8OKnPzAbnPjQQMmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XD1MaYr+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 441CDC2BCFD
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 06:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793773271;
	bh=6Zx+tZhiCeY+rClYyJQUQ1AB54yY4JXjtuwjFTzTr6I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XD1MaYr+qWP10QL12Wg7OD+0XcT6KoQpPW9QwZaSvKdMut3BWB0Xn2I3SoMXLx+MU
	 3aNPeCHdtiGe5D6NF49GXsGJHe6xchkDS4GJnpdPs3Ao2ugQsuakFbaYr0jr9iV2b3
	 Xrhp2shd7GywX8D+XXouUVNs5PcndPhvrCRvbrl2ZY2GgEhaj/nLAeKnIDID9jOr8s
	 qDq6cXsNn6KsD/VP4EHbq5ksi4JJZqFmeCXCp1WwpraX+g+wBNiiO4y2j0oI3WD2Fu
	 hkmGOZNxwTQD8qpSnC1eobEGD6DJGgPSU3D3z4Kkk7v9C5pKEncKlbECwiBeNH4O10
	 HsG9CLnd3KMDA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 19ACBC433E1; Wed,  4 Nov 2026 06:21:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222229] HID: usbhid: Razer DeathStalker Essential 2014
 (1532:011f) 51.2s EP0 initialization timeout (-110), dead LEDs, and hotplug
 failure
Date: Wed, 04 Nov 2026 06:21:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre.jap@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222229-208809-PS8oQECpSN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222229-208809@https.bugzilla.kernel.org/>
References: <bug-222229-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222229

--- Comment #1 from Pierre LEROY (pierre.jap@gmail.com) ---
    UPDATE / FINAL SOLUTION:

    After further usbmon trace analysis and prototyping, the exact root cau=
ses
and a verified 100% working fix for the 51.2s timeout, dead
    status LEDs, and hotplug failures have been identified:

    1. Root Causes:
       - Destabilization on GET_REPORT: The MCU EP0 parser wedges if
usbhid_init_reports() queries reports via EP0 (requires
       HID_QUIRK_NO_INIT_REPORTS | HID_QUIRK_NOGET).
       - Dirty EP0 state: After usbhid_parse() queries class
GET_DESCRIPTOR(HID_DT_REPORT) (0x81), EP0 hangs on immediate subsequent
requests.
       Issuing a standard 18-byte GET_DESCRIPTOR(USB_DT_DEVICE) (0x80) on E=
P0
before and after usbhid_parse() resets the MCU state machine
       cleanly.
       - Asynchronous led_work race: When Interface 0 (1.0) finishes
input_register_device(), input_leds_connect() schedules hdev->led_work
       asynchronously on system_wq. This sends HID_REQ_SET_REPORT over EP0 =
at
the exact same millisecond usb_set_configuration() begins probing
       Interface 1 (1.1) on EP0, resulting in 2 x 25.6s =3D 51.2s ETIMEDOUT.
       - Hardware LED routing: The hardware status LEDs (NumLock / CapsLock=
 /
ScrollLock) are actually accepted and routed through Interface 1
       (1.1, the NKRO keyboard interface), not Interface 0.

    2. Verified Results:
       With EP0 descriptor resets, flushing led_work prior to probing secon=
dary
interfaces, and routing LEDs to Interface 1.1:
       - USB HID enumeration drops from 51.2s to < 0.2s.
       - All 3 interfaces (1.0 Boot Keyboard, 1.1 NKRO Keyboard, 1.2
Mouse/Vendor) bind cleanly.
       - NumLock, CapsLock, and ScrollLock LEDs light and toggle immediatel=
y.
       - Hotplugging (unplug / replug) is 100% reliable.

    3. Working Reference Module & Code:
       Full DKMS module and verification code:
       https://github.com/Djkawada/razer-deathstalker-linux-fix

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
