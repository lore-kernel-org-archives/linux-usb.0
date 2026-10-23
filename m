Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792789886;
	b=Gtdr4pKgOsrcTuvAGWUgTIapmY2E7hIgiUSCF/dkXZZxOpKxVgaGulw4073bXrjWlDMo
	 D5QRlsZHS3KkpPKOsuCvNfRmoDpDjZCWtNdODMwFgqReT3XanJGKlTEWSEFo/UGyb4+dl
	 ZCQruZsnC1SHQSEIdLggWlbfreuWmpcLzUs3kvlpudTb2mNFvr5+EnW01wEHbn5XOuXs9
	 jUOIPIOYvog0RT96cJOvF6FGK8w4ch+yEppfmvq9qVLRiXmXd6CqqMTR1Hj9fQ754zif0
	 kcPEX+AN4mVhZ/6YD2qAbr2BpcFUKlOqkxXZVpreLapP25jZ32MtPDuKP9BFPjSKFSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792789886;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=xhzNXHhGdg0Nqfy1cFDISPJi8GvvFE8LUsqWDG+MLNk=;
	b=lroWbFchjwn4zHjQWpe1SF/0xvEHD1HWAaxgRm4+VTKNsWW7VKHsEKsiuW4xSDA9pXib
	 /uioSI1bMj94T7T/s8Oyv9tRSpcsrUEBgFoTEQ3lwlg6dVR4Z5WBQ42YfHLSa7Oeyf8CT
	 PPSr4JVXAXv4d9jRMmd2DP8gwPH79gssPwvtN1KfoXtFlcfO02O6zje1jaOn9nkIpT70O
	 4Wu7gLj7d+hJtVl+S1YCnUOmjm9ttDGsvoek/DosEvtptxjG9vLXhjd3/qORzrnATrKKa
	 V76K9fttpfYlYoKqWmKpJUneK+DKoa4xyy4Vc39K6/IikKZE7ah/4NvpIzOv282986g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Edpl8CcB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D2C606A31B
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Fri, 23 Oct 2026 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Edpl8CcB
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CE56513C0
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 21:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792789885; cv=none; b=E+Mgul1JxRrilWCba3gU9EyCSolhoQmlaCXdr3RI83TTgfiNE0bqf+7QuhgNu5HyG2aYGasI0xDWMV6d0ySVswmRLRgcpTqF/HNhKwjywXLRMu5STaCarYXuxxJ7805Xy4eY2bo+mArG45KXLcqT99JUABUm30Gb0K/lI+9ySXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792789885; c=relaxed/simple;
	bh=tUd+vyC044P9qhroP6uKBDcCcAPP7zOiSOh7fyQxpRw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Cj95IkROKqGo1M/PO9acwK+euE5P79uO+zjHc34a22r6j4/T5EdwVRLeu4tLGWsduHDbzstGJrVyLNl4rtZu9Tl+/eWye1EnAqgW1mQnggcKryVmfpISRcduvLB2Mptyq4lPBwp8CfqYG9kgVhleH2pdXoIHlOQNGDyvGxBcLhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Edpl8CcB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 414A5C2BCC7
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792789885;
	bh=tUd+vyC044P9qhroP6uKBDcCcAPP7zOiSOh7fyQxpRw=;
	h=From:To:Subject:Date:From;
	b=Edpl8CcBjOWAYlKmCnNnIZy/tOoDf0qfJMLJLuiyDYBlHATrXzZMAbUA9wZb1nX6B
	 omuFBZ3iNOCzPETNqgAFnVCYxCyMYx/YSzz9OB2rtREd0Rf5PO/S3XQeocBV0jY8lz
	 8ZYD/c56AOGjiLZTFJbH7gQprDF6F8LEDxS2zdqQ/zBt85ZpHfx3Klx47MKE9Q+4zO
	 gOLDbflMdnA1ecUQv0q/fWJl6aLN+gqnMxcpiZpgcGhAD1NrGYM0eoEvgsncv7O80D
	 iT/vyZ26Nsuux81lMJSfgx4D+whQbSJ9Wrg5iUHbybFushicRO3EplbQEYSw1Dlt6y
	 y1629VDCeVJrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 19B14C41612; Fri, 23 Oct 2026 21:11:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222188] New: ASUS ROG Flow Z13 GZ302EAC (Strix Halo): no
 DisplayPort Alt Mode on USB4 Type-C ports, partner altmodes never registered
 by UCSI
Date: Fri, 23 Oct 2026 21:11:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimitri.creus@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222188-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222188

            Bug ID: 222188
           Summary: ASUS ROG Flow Z13 GZ302EAC (Strix Halo): no
                    DisplayPort Alt Mode on USB4 Type-C ports, partner
                    altmodes never registered by UCSI
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: dimitri.creus@gmail.com
        Regression: No

Created attachment 311261
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311261&action=3Dedit
rapport-usbc.txt

Hardware: ASUS ROG Flow Z13 GZ302EAC (AMD Ryzen AI Max+ 395, Radeon 8060S
"Strix Halo"), BIOS GZ302EAC.304.
Both Type-C ports are USB4 with DisplayPort and Power Delivery according to
ASUS specifications.

Problem:
A passive USB-C -> HDMI cable (DP Alt Mode) connected to a TV gives no pict=
ure.
All card1-DP-* DRM
connectors stay "disconnected". The native HDMI port of the same laptop wor=
ks
with the same TV.
The same cable and TV work with another DP Alt Mode source (Meta Quest 3), =
so
cable and display are fine.

Observations (Fedora 44, kernel 7.2.11-200.fc44):
- typec, typec_ucsi, ucsi_acpi are loaded; typec_displayport was not
auto-loaded.
- The cable is enumerated as a port partner (portN-partner appears on plug =
and
disappears on unplug),
  supports_usb_power_delivery=3Dyes, power_role source, data_role host.
- No partner altmode is ever registered: /sys/bus/typec/devices/ stays empt=
y.
- Loading typec_displayport manually and re-plugging changes nothing.
- Same result on both Type-C ports, both plug orientations, cold boot with =
the
cable connected,
  and after an ASUS EC reset.
- Nothing typec/ucsi related is logged by the kernel on plug or unplug.

Also reproduced with an Ubuntu 26.10 live USB (kernel 7.3): same behaviour,=
 no
picture.

Expected: DisplayPort Alt Mode entered, a DP connector becomes "connected".

Attached: rapport-usbc.txt (typec sysfs attributes, port and partner altmod=
es,
partner identity,
DRM connector status, lspci, kernel log filtered on
ucsi/typec/thunderbolt/usb4).

I can test patches or provide more debug output (ucsi tracing, debugfs) if
needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
