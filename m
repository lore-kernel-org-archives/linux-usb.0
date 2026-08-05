Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5853E4C6D
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921116; cv=none; b=qkn7n8dqq5kkqivwrQI4/S+71PksXiS+lSuISwaO9TqWNDL59cu7NqnZNFR1/0ZTdhUjeWABxk01yWjfY5EtnMjRyuL8AI2bC2Iq9tt9rvuDb9p7GaTByeiYF+fvAAaH5nGdDSra3TGMujoG5ljeR9SQ60vEbGhrZZND7l7XRBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921116; c=relaxed/simple;
	bh=3Qv0QvDlcpPD0KoTLgGRCXGC+JhRqrVJRmRnEsC+gMU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OyEo20zOmeD0MdshQFIqRlfDw2HCrix+rb9vwNMeAOTQIvG+yJS6ORjZ/IIqOrS+1ErhGHW/ZNsk3NFCBT8W8VFJ+PQtD0GiVHwQvCNEXiyVUcGatyB7WirqVTpdBiyMdNvp07oOLF/6J18PXPkkP10dJyLDeWTr0cJ3jlNhvQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhGC5Qq2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhGC5Qq2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30DD3C19425
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785921116;
	bh=3Qv0QvDlcpPD0KoTLgGRCXGC+JhRqrVJRmRnEsC+gMU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DhGC5Qq2OTFvrQ0SF5BjxB1NsvrrGwqmR9pduS+4rwto7s0Z9fqgxoWU5eSpLEpJI
	 iyoSZAeWaCt122SJWuCOdhligoyVOYIdUzITXyq0ExGS08hY5n1L9ltZ2CbN0Zbdzi
	 E8MKx+zMPyvCN7EBRQysd+jKJGUvy7bHEpnvlYypTig0f3Pv6SA3fsmgPgYOvsk9et
	 ELymellr++D7XoejWExlo7/Lwp23KKMho0Ku4JPLaG/+wlko6lQKzfMnAz3hRTbYlV
	 lMYcyBiKCmuRQNYw9hxbHaeX9w03PiA24l+c+n5GarJSXAiIXrCb8fWfAA1XVC3Gmj
	 R+bxUguQK+FCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 17EA9C4160E; Wed,  5 Aug 2026 09:11:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3NDBdIHVjc2lfYWNwaSBQUE0gaW5pdCBmYWlsZWQg?=
 =?UTF-8?B?KC1FVElNRURPVVQpIG9uIFRoaW5rUGFkIEUxNCBHZW4gNyAoQU1EKSDigJQg?=
 =?UTF-8?B?YmxvY2tzIFVTQi1DIGRvY2sgZW51bWVyYXRpb24=?=
Date: Wed, 05 Aug 2026 09:11:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: huangwei@kylinos.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221740-208809-PZniIpyKVG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221740-208809@https.bugzilla.kernel.org/>
References: <bug-221740-208809@https.bugzilla.kernel.org/>
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

--- Comment #2 from Wei Huang (huangwei@kylinos.cn) ---
Hi Shofiq,

Thanks for the detailed report, and for noting that it works on Windows =E2=
=80=94
that's a useful data point ruling out the dock/cable/hardware.

I've been looking into this and I believe the UCSI driver's command
completion timeout is too short on machines where the EC is slow during
boot. I've prepared a patch, submitted it upstream [1], and would appreciate
your help testing it.

  [1]
https://lore.kernel.org/linux-usb/20260805085725.389761-1-huangwei@kylinos.=
cn/

=3D=3D What I've found =3D=3D

The UCSI driver has two paths to talk to the platform firmware (PPM):

  1. ucsi_reset_ppm()             =E2=80=94 polls, 10-second timeout
  2. ucsi_sync_control_common()   =E2=80=94 waits for an ACPI notification,
                                    currently hardcoded to 5 seconds

A previous fix [2] raised path (1) from 5s to 10s, but path (2) was left at
5 seconds. Since your log shows "PPM init failed" WITHOUT "failed to reset
PPM!", the reset itself likely succeeded =E2=80=94 the timeout is hitting a=
 command
sent right after it (e.g. SET_NOTIFICATION_ENABLE, GET_CAPABILITY). That's
exactly path (2).

Once UCSI init aborts, USB-C PD negotiation never completes
(usb_power_delivery_revision: 0.0), which blocks dock enumeration since the
dock depends on a PD contract. This matches the symptoms you described.

The patch replaces the hardcoded 5-second timeout in path (2) with
msecs_to_jiffies(UCSI_TIMEOUT_MS), so both paths use the same 10-second
value.

  [2] commit bf4f9ae1cb08c ("usb: typec: ucsi: increase timeout for PPM
      reset operations")

=3D=3D Before testing =E2=80=94 a quick check =3D=3D

To confirm the diagnosis, could you run and paste the output of:

    sudo dmesg | grep -i ucsi

I'd like to verify that there is NO "failed to reset PPM!" line, and that
"PPM init failed" is the only ucsi error. (If "failed to reset PPM!" IS
present, the fix is different and I'll adjust.)

=3D=3D How to test =3D=3D

The raw patch is available at the lore link [1] above. The simplest way on
Fedora is to apply it against a matching kernel source tree and rebuild just
the typec_ucsi module:

    # prerequisites
    sudo dnf install kernel-devel-$(uname -r) kernel-headers gcc make

    # get source matching your kernel
    sudo dnf download --source kernel
    rpm2cpio kernel-*.src.rpm | cpio -idmv
    tar xf linux-*.tar.xz && cd linux-*/
    patch -p1 < /path/to/the-patch-from-lore

    # build only the affected module
    cp /lib/modules/$(uname -r)/build/.config .config
    make olddefconfig
    make M=3Ddrivers/usb/typec/ucsi modules

    # install and reload
    sudo cp drivers/usb/typec/ucsi/typec_ucsi.ko \
         /lib/modules/$(uname -r)/extra/
    sudo depmod -a
    sudo modprobe -r typec_ucsi && sudo modprobe typec_ucsi
    # or simply reboot

=3D=3D What to report back =3D=3D

  1. The dmesg | grep -i ucsi output after applying the patch.
  2. Whether the USB-C dock enumerates (dmesg should show the USB devices).
  3. These values after connecting the dock:

        cat /sys/class/typec/port0/power_role
        cat /sys/class/typec/port0/usb_power_delivery_revision

If 10 seconds is still not enough, please also run:

    sudo acpidbg -b "examine USBC000:00"

so I can investigate whether the ACPI/EC notification path itself is broken
(in which case no timeout increase will help, and we'd need a different fix=
).

(I've also attached the patch directly to this bug for convenience.)

Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
