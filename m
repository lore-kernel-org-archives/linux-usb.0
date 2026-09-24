Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B904078C6
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 22:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790287777; cv=none; b=r+sYNxUbW1wjCyTpp5nymHtv8UKAGUMv+z1biJ1ubkUun5W0OTTJwgmwaPEcLoi0c4UKMo1d6dA9bQcWTOi+3OrIOrrUm8Y/cj6HNbStH6ugK6yUds9tJsKrIhOl6DZXyk3dmbTxyx3GqaWbKFbyKEsPgUQdPPcwLS3l2I+l6Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790287777; c=relaxed/simple;
	bh=XjadGYV747gkr1OSdwb59iZZY+3v+2OElVZC4NDpouc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WP/j7slTpjUj0BUnMDQg06YVT/F0YDkG7b5sU5f5IjCxXh0OaGqGON+1ZU+D9J0lVd0C7RWjOM3Dubpn6aR+8pKAO45/FGElkP7/l6MZyp6hQuRbQ5E8ccJFdTmIn7ZAxyla+GcMk4gVeHS471XwN6FtC5UYrux6jj734w380H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSpjbFC2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSpjbFC2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1341EC2BCFD
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 22:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790287777;
	bh=XjadGYV747gkr1OSdwb59iZZY+3v+2OElVZC4NDpouc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nSpjbFC2CTAUIcXp21dQX2SdZSQuhSe3BzaZ0DRAr4abX3+VFrdyXCySkcdk9QXBb
	 VOQ7ADICmItmpy2GLLx1zqWqB1WxVBEE1d2GMRvpnbq64t8nJ47fv8t3wagRBCizaB
	 W4ujLpMosUIvuYr4wrc/l1ZfU7Y7FMEMdAJ3+v8HFER39hGwxvQom1lG6/1Ljy0QM7
	 5+KtDEKuRXUzBLJ8kUBblwIGSuU3ERvjfoGOWH9+I+zJItuZtejKCmzkHfdi1uhQkK
	 s2PXuciquXQv1oYyxfB4FlgN79Jcxvas2BqfY3R0vYm2PbErxTdB8KeK266tUxmglm
	 9P9xGvv9my3Pw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 00567C433E1; Thu, 24 Sep 2026 22:09:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221977] ucsi_acpi PPM_RESET timeout on ASUS Zenbook
 UX425UA/UM425UA (AMD Renoir) - not fixed by poll_cci or timeout increase,
 tested extensively
Date: Thu, 24 Sep 2026 22:09:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221977-208809-2pjWJ3Y4pg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221977-208809@https.bugzilla.kernel.org/>
References: <bug-221977-208809@https.bugzilla.kernel.org/>
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

--- Comment #1 from sax69sax420@gmail.com ---
  Root cause found and a fix verified on the ASUS ZenBook UX425UA_UM425UA (=
BIOS
UX425UA.301, Ryzen 7 5700U). Kernel used for the tests: Ubuntu 6.8.0-124
(Ubuntu's UCSI code is a backported variant of 6.8); the same fix also work=
ed
with=20
  the upstream v6.8 ucsi and ucsi_acpi modules.

  Summary: the firmware clears the EC's CCI register when it is read, so
ucsi_acpi's init does not fail at the PPM reset (that works) but at
SET_NOTIFICATION_ENABLE. The existing ucsi_zenbook_ops quirk, used for the
ZenBook
  UX325UA_UM325UA, fixes it; only this model's DMI name is missing from
ucsi_acpi_quirks[].

  Details:

  - ACPI: the UCSI device is USBC000 (SSDT with OEM table id "AmdTable"), t=
he
PPM lives in the ASUS EC. The _DSM function 2 (read) copies the EC's
VER/CCI/MESSAGE_IN into the memory mailbox and then writes zero into the EC=
's
CCI byte 0
  and byte 3. The EC event handler _Q79 does the same (copy, clear CCI0 and
CCI3, then Notify (UBTC, 0x80)). Decompiled tables attached.
  - The generic ucsi_acpi_read() runs _DSM function 2 on every CCI read,
including from ucsi_acpi_notify(). So when the Notify arrives, _Q79 has alr=
eady
put "command complete" in the mailbox and cleared the EC copy, and the noti=
fy
  handler's own _DSM read overwrites the mailbox CCI with zeros.
  - Instrumented log (seconds since boot): PPM_RESET written at 1329.189; C=
CI
reads 0x00000000 at .194 and 0x08000000 (RESET_COMPLETE) at .218, so the re=
set
works; SET_NOTIFICATION_ENABLE (0x80010005) written at .240; Notify 0x80
  arrives at .261; the handler reads CCI 0x00000000; nothing completes the
wait, ucsi_acpi_sync_write() times out after its 5 * HZ and the init fails =
with
"error -ETIMEDOUT: PPM init failed". Raising UCSI_TIMEOUT_MS or slowing the
poll=20
  loop changes nothing, because neither is the wait that expires (I tried 3=
0 s
and a 200 ms poll interval).
  - Checked and ruled out: the mailbox address from _CRS equals the
OperationRegion address used by _DSM (0xcc4ddca6), the EC handler is instal=
led
long before the probe, no OS-version gating in the UCSI methods.

  Patch (against v6.8 ucsi_acpi.c, applies cleanly; newer trees have rework=
ed
this file, I can retest on request):

  --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
  +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
  @@ -192,6 +192,13 @@
        },
        {
                .matches =3D {
  +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
  +                     DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX425UA_UM425U=
A"),
  +             },
  +             .driver_data =3D (void *)&ucsi_zenbook_ops,
  +     },
  +     {
  +             .matches =3D {
                        DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
                },
                .driver_data =3D (void *)&ucsi_dell_ops,

  Test result with this entry added (Ubuntu 6.8.0-124 ucsi_acpi.c, loaded l=
ive
and then permanently, surviving reboots, module loaded about 1 s into boot):
init completes, /sys/class/typec/port0 and port1 appear (port0 with the cha=
rger=20
  as partner, USB PD 3.0), the ucsi-source-psy supplies register, no oops, =
no
other regressions. The connector status Request Data Object shows the real
contract: object position 4, 3250 mA, i.e. the 20 V 3.25 A PDO of the 65 W
charger.

  One more observation, probably an EC firmware limit: GET_PDOS for the par=
tner
source capabilities returns only one PDO (fixed 5 V 3 A, 4 bytes) although =
the
charger offers 5/9/15/20 V, so the power_supply attributes and=20
  usb_power_delivery sysfs show 5 V while the actual contract is 20 V.

  Could the entry be added upstream? I can send it as a proper patch to
linux-usb if that is preferred, and I can test other kernels or trees.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
