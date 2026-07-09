Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04933ACA7E
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 22:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635646; cv=none; b=rpkQgY766r9vKZXuC2I6QwwaxvKi4afY25ykc/o7cjnsGbAFnQ/VnUl7V38c0b4IyVHIUKWDkjtoDCLI/YcMwN/+RIpp7Sf2BVpHslJvWN5TAxuowQNaK/cqFEKy4bflBxPrQDkmFKiXrXB0tHzU0FlVAQ6LoyoY/tFAdjUvHB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635646; c=relaxed/simple;
	bh=oTT1bZk/Zye6FwUBpNfkQlRxOvzfRnVl54Me4d/8YKw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oM8ptvgmyfmC0/2HSXI0FEP1ge4vj/di15BxoyDdmVV8bGJ1GPbrCGpGlZVyAQt2K14SbP0CwA+YrYw9DjGjoI/bZQLsjrY//VSOqk6ckmhLm5PsCeeuBrxStn38Tw0g3CY3hrtsL4L3pkBQQCJ2JTpY8t/EMXFSvWF4josX0Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQniKvfl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQniKvfl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 867ACC2BCB7
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 22:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783635645;
	bh=oTT1bZk/Zye6FwUBpNfkQlRxOvzfRnVl54Me4d/8YKw=;
	h=From:To:Subject:Date:From;
	b=EQniKvfl9dQJCUfGQeWXRncJWWtpiRuRVBm/bD6S+wP3tnWmhhpgg7IfMcU8HtmKa
	 gdEnydRAqMNYJQ71PGUjzpeteiiuzg4L5dwTFM59BXvfqv2PmloUTqNu9BR5zbw3Os
	 BFlEdlupCqVEvixxF6smxDN4B0PvFXY944FoWXWj627CqekZ8HKwVPHXXg/4HbteIy
	 7d/WAMq4YZsD2MPJQVTGhPvDehbI5PNHgEIW9W83RWcwCNEQPStgB2xYKJiZE4aKbq
	 a6H8YNF7IrYSJosOnXXOTuDkOL1y+xOSHN+OrCBW25IMfmd8owgQxnU03wD6QMKS0g
	 m764EG9IIG9IA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 62E4CC3279F; Thu,  9 Jul 2026 22:20:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3NDBdIE5ldzogdWNzaV9hY3BpIFBQTSBpbml0IGZh?=
 =?UTF-8?B?aWxlZCAoLUVUSU1FRE9VVCkgb24gVGhpbmtQYWQgRTE0IEdlbiA3IChBTUQp?=
 =?UTF-8?B?IOKAlCBibG9ja3MgVVNCLUMgZG9jayBlbnVtZXJhdGlvbg==?=
Date: Thu, 09 Jul 2026 22:20:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: shofiqtest@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221740

            Bug ID: 221740
           Summary: ucsi_acpi PPM init failed (-ETIMEDOUT) on ThinkPad E14
                    Gen 7 (AMD) =E2=80=94 blocks USB-C dock enumeration
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: shofiqtest@gmail.com
        Regression: No

Description, include:

journalctl line: ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed
usb_power_delivery_revision: 0.0 (confirms PD negotiation never completes)
DMI: LENOVO 21T0CTO1WW, BIOS R2ZET34W (1.23), model ThinkPad E14 Gen 7
Kernels tested and both affected: 6.19.10-300.fc44 and 7.1.3-200.fc44
Note it works correctly on Windows with the same hardware/dock/cable
Attach the relevant dmesg enumeration failure log (the "device descriptor
read/64, error -71" sequence)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
