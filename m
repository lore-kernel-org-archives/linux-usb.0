Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B253446C0
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 08:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669449; cv=none; b=ra+YKoy87DoduYZUPxvx7qRIhW5FB14JCptOFTLTa1g081/yqdCF9EzVSIvN5XV1CF1p6bMuSPWFFa0AMjOPok7CKJARw4zrAi+fwiQAnfIAWadARabxxui03BnyONyA5J0UcfVNg48CdSXhAgxBKYLVXpROobMPn3EqMEIxnAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669449; c=relaxed/simple;
	bh=VurJNzaYXelyd8wjX/n2Cc4ErgvUvunbOS0fR7D84AQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dnq2DvSrz1jtmP3GcRY3+juALtsfqNm0cTcffG/nfMGYIb4bBhhuOXcYT1XchtN3GYj3SBxyZlm8VwlhisPeI/1jDWZAFLGzGULMDNEDcM+qdKWR6Z21XYyTLXquFzcr6A2Sx87AtWGN9JI/ZN85IFCcoPa7TJULbH/8zcRi6qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJctP1hq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJctP1hq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 335D5C2BCF6
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 08:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790669449;
	bh=VurJNzaYXelyd8wjX/n2Cc4ErgvUvunbOS0fR7D84AQ=;
	h=From:To:Subject:Date:From;
	b=sJctP1hqcOM3ej+5n+iPh1XjQf4R0y7XIKtKJ7hOoXyuBNLdzfmAN7Q0ikqCxay7U
	 YVUjgiaLFbE7sBR4c5MGIlMybPTqt4qb0gq4zSGZ5uHCrSaRGDWEP5BUis6hYP4qQh
	 hRT3YpDE2tMuxwkAQEjayrZihzWJxBLVEkUo9ecUil44aO20tLim7z6Ts/E8cs/kiF
	 jh6wkpol2AH+adc7ugVVXkSfWJmhI4mVBtcOokLXY9yP+ozp8H5YUKTfka1Ra7gVEU
	 lP298pk9c6PkcqYSmxJupkpY0ZfIthfnLoMR+ixwmeMwspWvANVBdGH6F9jBW8+Y4d
	 uRmpeaME6kzsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 148C1C41614; Tue, 29 Sep 2026 08:10:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] New: [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Tue, 29 Sep 2026 08:10:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222071-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222071

            Bug ID: 222071
           Summary: [Bisected] [Regression] xhci_hcd: Resuming from
                    hibernation fails with "Not enough host resources"
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: h.judt@gmx.at
        Regression: No

Created attachment 310955
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310955&action=3Dedit
dmesg-7.2.6.bz2

Commit 2a70e5dc0301ad961b198f086a39e2479f6b8933 "usb: xhci: optimize resumi=
ng
from S4 (suspend-to-disk)" causes hibernate/resume cycles to fail.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D2a70e5dc0301ad961b198f086a39e2479f6b8933
Reverting it seems to make it good again.

dmesg excerpt:
usb 2-1.1.2: device descriptor read/64, error -32
xhci_hcd 0000:00:14.0: Not enough host resources, active endpoint contexts =
=3D 63
usb 2-1.1.2: Busted HC?  Not enough HCD resources for old configuration.
OOM killer enabled.
Restarting tasks: Starting
usb 2-1.1.2: USB disconnect, device number 5
Restarting tasks: Done
PM: hibernation: hibernation exit
usb 2-1.1.2: new full-speed USB device number 6 using xhci_hcd
usb 2-1.1.2: device descriptor read/64, error -32
xhci_hcd 0000:00:14.0: Not enough host resources, active endpoint contexts =
=3D 63
usb 2-1.1.2: can't set config #1, error -12

I will of course attach the full logs (one from today with kernel 7.2.6 and=
 an
older one with kernel 7.1.1).

Maybe something does not get cleaned up properly, because it starts happen
after a few cycles?

I will later also attach a dmesg with the commit reverted.

lsusb -tv after failure:
/:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dehci-pci/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/8p, 480M
        ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 001: Dev 007, 480M
        ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
/:  Bus 003.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dehci-pci/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/6p, 480M
        ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
        |__ Port 002: Dev 003, If 0, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
            ID 258a:002f=20=20
        |__ Port 002: Dev 003, If 1, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
            ID 258a:002f=20=20
        |__ Port 004: Dev 004, If 0, Class=3DMass Storage, Driver=3Dusb-sto=
rage,
480M
            ID 058f:6366 Alcor Micro Corp. Multi Flash Reader
/:  Bus 004.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 005.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 006.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub


Interestingly, the Realtek Semiconductor Corp. RTS5411 Hub still gets
recognized, but no devices.
/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 001: Dev 009, 480M
        ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
