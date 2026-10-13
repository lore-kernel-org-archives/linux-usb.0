Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98696521884
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 21:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926922; cv=none; b=eCmCl3Xfw3cukL2VJJN/DZnNcKebdBsKZzNEj5IoJcJViUkvBQ4zhiI5BFRuKZNWUBqAVTMLuXoAy4rO2ODxu7VE95ZBsu6aZP1eJP2Q/dbhgfrL/I5LkZM9Y/I7hYLZYqNpqqhBNbH9FQ0clDxnq3o2vU1rfsFmaiX38LPD5bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926922; c=relaxed/simple;
	bh=3BGLnxzI3DJqy6MZxMpHDrlrTzrKKbBs4DopJiAsJcc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GAk0Y/O/2qI3C9llnzqhfig6aJk5Xqi+3noUrS4odBP7EluV4s+3WZeGRf6eocRyVjUtnY1iacvq+zi69gFfUSWtOJARPnUQOs16Wahu0VaP0A63EmId9Wfhg+7zbks5mE+3LqCtBEzshtto+sPJm3bX8SqKSjkVjAnD+L3TwrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hwo34AC4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hwo34AC4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6665C2BCF7
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 21:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791926921;
	bh=3BGLnxzI3DJqy6MZxMpHDrlrTzrKKbBs4DopJiAsJcc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Hwo34AC4MPXSsLdqHOcoYsYHmj9C0WTKpSH3SN+PhsbQeetuCwakxFvs4u4oG1Yd4
	 UFeVaSSyVq9+6B6aXCNeYuyY6h5aMgns43EUgHZUobX1Axoa6busJvAZ3f4WbCL1rv
	 ++W4/8UImNdaUJuKwq2gSp4TuC1leQ4MRuiGdmHGVcRAq90yD2FWkv+OTv+1Y7Ugyk
	 sNhItUa3LqCBkYBmmXpLs2hdp9nOUh5/ht09O9kofQfrtgfStHaKsvGFqdZnyl7O/U
	 HrNo+C57EIod/tUkcfJ0VwpOt7JWXnhrFwaBARGzFWgr5ccYlAgwUsxe+S5N6H05ZP
	 ktzqbDiCEERYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C0082C53BC5; Tue, 13 Oct 2026 21:28:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220193] PATCH 6.1 082/167 which adds support for Owon HDS200
 breaks functionality of Owon VDS1022
Date: Tue, 13 Oct 2026 21:28:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: lestoppe@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220193-208809-oXQUO3PKcI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220193-208809@https.bugzilla.kernel.org/>
References: <bug-220193-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220193

--- Comment #6 from leStoppe (lestoppe@gmail.com) ---
Apologies for the delayed response! I'll lookup the mail thread and reply t=
here
as well.

1. I use this software : https://github.com/florentbr/Owon-VDS1022

   What you said is exactly what is happening. This software uses libusb to
access  the VDS1022. The breakage started when the kernel automatically sta=
rted
to load the usb-simple-serial driver. The application could access it only
after I blacklisted the driver.

3. The VDS1022 supports some SCPI commands. I can enable the socket for it =
via
the userspace application above. I'm not sure the command set is same as HD=
S200
or if it can be done through the serial interface instead of libusb

2. Pasting the output of lsusb -v -d 5345:1234 below :

------------------------------------------------------------------------
Bus 001 Device 003: ID 5345:1234 Owon PDS6062T Oscilloscope
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            2 Communications
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0=20
  bMaxPacketSize0        64
  idVendor           0x5345 Owon
  idProduct          0x1234 PDS6062T Oscilloscope
  bcdDevice           10.01
  iManufacturer           1 S
  iProduct                2 U
  iSerial                 3 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0029
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0xc0
      Self Powered
    MaxPower               50mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         5 Physical Interface Device
      bInterfaceSubClass      6 [unknown]
      bInterfaceProtocol     80=20
      iInterface              0=20
      ** UNRECOGNIZED:  09 21 00 01 00 01 22 00 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
cannot read device status, Resource temporarily unavailable (11)
-----------------------------------------------------------------------

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
