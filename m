Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D896342532
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 01:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788746220; cv=none; b=ufH+taF1nnKbk+Ae9JvMLwthQJWs+MZaAS47NSq+dQSev8dwMhiE7oBzTsE9QseheJ5IQim8zECTRIT4O3P15CiAv8FU73pgSXF/nNyOBfyDUHrhYD3Y8LOmtBH8K9hPh3UrTrC2DbVoLx7fXUatdXG5+AMRma5j3B3eVsc/fCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788746220; c=relaxed/simple;
	bh=5+3e9FG7TtJsUEd88KzV7pSYbihPy/+VTTS8SszyOTY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QL6fm99M9wpsNTy2gWVMC9L5T0Tu3c+boftuDYSEkaJhIvSlu+Z2YWB+3x+vXPXPs1VODvE0UgaW8KmHs7TyTqUAPrZ5a65LYj2HbJQOHlNLgWGe4AkVPy2qdQeFRBKBOb1hLjDJVlGVia7gN3IjtiPSlywE4oGLdr+8+0E3hqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=casWo3su; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="casWo3su"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3663FC2BCB8
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 01:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788746219;
	bh=5+3e9FG7TtJsUEd88KzV7pSYbihPy/+VTTS8SszyOTY=;
	h=From:To:Subject:Date:From;
	b=casWo3suGYRZ5xkDx+iw1yeIhQLeiFu/N1xdOemKN/rVIYcA1X50UvlkcdQjUmQYW
	 b4nLOa7QfnKxFj61hGSRxQF7CipwXc6IXrfJDwFyCEKJbLs706ihDh+JS+QubqxmwU
	 PY9Djt72Y5tK+6VAhjvG/vicWKdlqyboIcugH4tSaICwCBFYgbWbumLIJIVPp5jEMP
	 aErqWgDyrXv3lTZxOXeMpVABiADjo+QQmFBI7p8+Vnou9XJPvxIg6xUnvaJX15aU/l
	 hQbBUGHNtnHyfhWV9pzjft1qi8zgnwJSgl3BihU23xZQoDQBis4Lb11SV5X5DY/+/p
	 wJ5UJ96fNtF6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 07259C41612; Mon,  7 Sep 2026 01:56:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221977] New: ucsi_acpi PPM_RESET timeout on ASUS Zenbook
 UX425UA/UM425UA (AMD Renoir) - not fixed by poll_cci or timeout increase,
 tested extensively
Date: Mon, 07 Sep 2026 01:56:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sax69sax420@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221977-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221977

            Bug ID: 221977
           Summary: ucsi_acpi PPM_RESET timeout on ASUS Zenbook
                    UX425UA/UM425UA (AMD Renoir) - not fixed by poll_cci
                    or timeout increase, tested extensively
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: sax69sax420@gmail.com
        Regression: No

SYSTEM
  ------
  ASUS Zenbook 14 UX425UA/UM425UA, AMD Ryzen 7 5700U (Renoir), BIOS
  UX425UA.301 (2021, latest available). Ubuntu 24.04, kernel
  6.8.0-124-generic. Dual-boot with Windows 10 (works correctly there,
  see below).

  ERROR
  -----
  Every boot, and every subsequent module reload:

    ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed

  /sys/class/typec/ never populates. USB-C charging itself works fine
  (confirmed via direct wattage logging) - this only affects PD
  telemetry, alt-mode, and role-switching.

  WHAT I'VE ALREADY TESTED (all negative)
  ----------------------------------------
  1. Timeout increase: built a signed DKMS module with UCSI_TIMEOUT_MS
     patched 5000 -> 30000 (6x default, 3x the merged 10000 fix).
     Confirmed via source inspection that -ETIMEDOUT is only ever set
     after the real elapsed-time check in ucsi_reset_ppm() fires, so
     this is a genuine 30-second wait, not an early bail-out. Still
     times out identically.

  2. Polling frequency, isolated as its own variable: same 30s budget,
     but msleep(20) -> msleep(200) in the ucsi_reset_ppm() loop (~150
     EC/_DSM hits instead of ~1500), to test whether rapid _DSM/EC-mutex
     polling itself was the blocker rather than total patience. Still
     times out identically.

  3. Current mainline behavior: diffed 6.8's ucsi.c/ucsi_acpi.c against
     current master. The poll_cci() rewrite (976e7e9bdc77) and timeout
     increase (bf4f9ae1cb08) are both present there. For the ACPI
     backend specifically, ucsi_acpi_poll_cci() still forces a _DSM
     read on every call during PPM_RESET - functionally identical to
     what I already tested in #1. So current mainline would not behave
     differently here.

  4. The old ASUS Zenbook quirk (ucsi_zenbook_ops, for the near-identical
     "UX325UA_UM325UA" model): checked in source - during PPM_RESET
     specifically, the quirked and generic read paths are identical
     (both force _DSM every read), so this was never going to apply
     regardless of the DMI mismatch. (Also since removed upstream,
     folded into the poll_cci rewrite.)

  5. Boot path: tested booting via two different methods into the OS,
     in case boot-manager timing mattered. No difference.

  6. Device presence: tested with the charger completely unplugged from
  WINDOWS COMPARISON
  -------------------
  Booting the same machine into Windows 10, Device Manager shows the
  identical \_SB.UBTC ACPI object (confirmed via DEVPKEY_Device_
  BiosDeviceName) healthy, ProblemCode 0, using Microsoft's generic
  in-box UcmUcsiAcpiClient.sys (not an OEM driver). I compared its
  public reference sample source (microsoft/Windows-driver-samples,
  UcmUcsiAcpiSample) against ucsi_acpi.c's low-level read/write code -
  both call _DSM before every register access, in the same order. No
  structural difference found at that layer. The actual retry/
  completion logic that must differ lives in the closed-source
  UcmUcsiCx.sys class extension, which I have no visibility into.

  RELATED
  -------
  This looks like the same class of failure as Bug 219590, where the
  reporting maintainer's own affected laptop was also not fixed by
  either of the two 2025 patches ("in my case it unfortunately didn't
  help" - comment #9). Reporting this as what looks like a second,
  independently-confirmed case of the same "not fixed by known fixes"
  outcome, with a slightly wider set of variables tested (specifically
  the polling-frequency isolation in #2, which I haven't seen tested
  elsewhere).

  Happy to run further diagnostics if anyone has a specific next test
  in mind - I've documented the exact ACPI tables and mechanism (_DSM
  UUID 6f8398c2-7ca4-11e4-ad36-631042b5008f, \_SB.UBTC device, 48-byte
  SystemMemory OperationRegion mailbox) and can reproduce any test
  reliably given the DKMS/MOK pipeline is already set up on this
  machine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
