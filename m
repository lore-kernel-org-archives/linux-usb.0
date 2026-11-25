Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624148;
	b=GSf7MvOGXVrBgJNwgRrK82kMKAfIVjrQF3bn2LLCIELEuxdrhqmbW15BrnKv+M01CSr7
	 o5nfWS6evj1+6JJJ2VeM4+67rxgs0WcVhCv8y5Ts1WjaXQ2sMHaIwYyO0iBQirNhE9FqG
	 jtYGFY1HZ4ouEJc8hUqYsc1bDqfbeOaCuzX9REDrLU1gXDJpji7pLt7yY8Wv9sylhUqlM
	 RfW6uKCdkcYiCM6lonKFCeWq/p0/ExlTkAWk9DZvz9LuydWAlihvFahDX08RN3P/2jecP
	 aX3D6qru7Lo/RIBePF+hyd1uMUKMRwbxqViwM8oC8yIQCX8VPU51iKpAouAi1XjSHYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624148;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=oypYsktZKYCm8kuv1J1SFGTA24nxzYXhAUx0jKdk9WM=;
	b=YLiARy563dCcCxn3hwFYOkUtBUlRI6hvKgWzcOOkWDdh5Y4mYxr3tNoDHwxLDhsatWLn
	 HXw3uLTwPWbEzLUd2Ai6CJCfRWFMuaih/Tvrl+PZB0jZyqlwD5FeuweFo39HI6t2OG2Ta
	 p5GWCzawAuEwZS598flffbkAURd69/ujlCh1wor+5pJRYRZIUVh0m5p/xfEcZc96xyGJI
	 s4euNudzNIdcKaN669AYrWkYs1btQkq6kyThV44IcRuJDXC6gQ/jdX0rSv2/WP4kTqOD+
	 RZkE4LUun7f1yY8AUsckdgeTTTd5TIL6nVjocOIb8MWtCfLjJzJV6aOXKbIJfcRRl1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U216dXEo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661BE606A326
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 16:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U216dXEo
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BAB51F000D3
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 16:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795624148;
	bh=oypYsktZKYCm8kuv1J1SFGTA24nxzYXhAUx0jKdk9WM=;
	h=From:To:Subject:Date;
	b=U216dXEo96V2AHIGU2gbggkxX/uqN01QWGF2xk6Q4HacR3Qpsydvn5H6PXRm6HKfe
	 +wEjmKKf9BZPmDe/OAC1q9zQfDdVc1HeXXP/znhhkO3kLRdkzwSK2aWzmwPmLAw1Xy
	 pzD5uKTINllqf828y/8MP6PIYTOF69kyq3fiIqUXMatvQ6NSL6zUGy8wVIakr7yd6T
	 Whcc2ixtOhmGyBzrc9B2daRQMuVcTX+RCu5XmWJpXYpaD2YmySfrY3KDfaqmLwlPgP
	 9lcboNGbNQOmHoH2UkimG19ZkuX64ScZIw621SOj3z4rOJhzFPNSbNHJzr5+eqTpq0
	 svERiWlNs5Geg==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 18FAB240040C; Wed, 25 Nov 2026 16:29:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222328] New: Hardware - Host controller: ASMedia
 ASM2142/ASM3142 USB 3.1 Host Controller [1b21:2142] on a PCIe add-in card  
 (GLOTRENDS U3142X1), link 8 GT/s x1, Kernel driver: xhci_hcd   xhci quirks
 reported at probe: 0x0000000000800010 (SPURIOUS_SUCCESS | NO_64BIT_
Date: Wed, 25 Nov 2026 16:29:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: drastic-vivid-7557@shy.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-222328-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222328

            Bug ID: 222328
           Summary: Hardware - Host controller: ASMedia ASM2142/ASM3142
                    USB 3.1 Host Controller [1b21:2142] on a PCIe add-in
                    card   (GLOTRENDS U3142X1), link 8 GT/s x1, Kernel
                    driver: xhci_hcd   xhci quirks reported at probe:
                    0x0000000000800010 (SPURIOUS_SUCCESS | NO_64BIT_
           Product: Drivers
           Version: 2.5
    Kernel Version: 7.3.4
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: drastic-vivid-7557@shy.email
        Regression: No

Created attachment 311583
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311583&action=3Dedit
dmesg, lspci, lsusb, v4l2 formats and xhci tracepoints

Hardware
- Host controller: ASMedia ASM2142/ASM3142 USB 3.1 Host Controller [1b21:21=
42]
on a PCIe add-in card
  (GLOTRENDS U3142X1), link 8 GT/s x1, Kernel driver: xhci_hcd
  xhci quirks reported at probe: 0x0000000000800010 (SPURIOUS_SUCCESS |
NO_64BIT_SUPPORT)
- Device: Elgato 4K X capture card [0fd9:009b] (SuperSpeed Plus PID;
USB_QUIRK_NO_BOS applies),
  UVC 1.00, video on a bulk endpoint (EP 2 IN, wMaxPacketSize 1024, bMaxBur=
st
7)
- Board: Gigabyte A520M S2H, Ryzen 5 5600X
- Kernel: 7.3.4-ogc10.1.fc45.x86_64 (Bazzite / Fedora 45)
  Reproduced with and without iommu=3Dpt.

Symptom
- The device enumerates at SuperSpeed Plus and every UVC mode is offered (e=
.g.
NV12 3840x2160@60).
- Capture of any mode, including NV12 1920x1080@60 and MJPEG 3840x2160@60,
delivers about 1 frame
  every few seconds. ffmpeg shows "frame=3D 1 ... elapsed=3D0:00:06".
- dmesg repeatedly shows:
    xhci_hcd 0000:04:00.0: Event dma 0x000000000b036000 for ep 4 status 1 n=
ot
part of TD at 000000000b02cfe0 - 000000000b02cfe0
    xhci_hcd 0000:04:00.0: Event dma 0x000000000b036010 for ep 4 status 1 n=
ot
part of TD at 000000000b02cfe0 - 000000000b02cfe0
    xhci_hcd 0000:04:00.0: Event dma 0x000000000b036020 for ep 4 status 1 n=
ot
part of TD at 000000000b02cfe0 - 000000000b02cfe0
    xhci_hcd 0000:04:00.0: Event dma 0x000000000b036030 for ep 4 status 1 n=
ot
part of TD at 000000000b02cfe0 - 000000000b02cfe0
- Same device, same card, same cable on Windows 11: full 10 Gbps capture wo=
rks.
- The same device on the board's AMD xHCI ports (other controllers) captures
normally.

Analysis (xhci-hcd tracepoints, uvcvideo bulk URBs of 16384 bytes, 1 TRB per
TD)
The stream runs at full speed until the endpoint ring's enqueue reaches the
last TRB slot before the
Link TRB. The controller completes the TRBs before it, posts NO transfer ev=
ent
for the TRB at
segment offset 0xfe0, and then posts events for the TRBs on the next segmen=
t.
The driver's current TD
stays at ...fe0, so every later event is "not part of TD" and the stream
stalls.

  xhci_queue_trb:     BULK: @0x...b02cfc0 ... length 16384 ... flags
b:i:I:c:s:I:e:c
  xhci_queue_trb:     BULK: @0x...b02cfd0 ... length 16384
  xhci_queue_trb:     BULK: @0x...b02cfe0 ... length 16384          <-- last
TRB before link TRB at ...ff0
  xhci_queue_trb:     BULK: @0x...b036000 ... length 16384          <-- next
segment
  xhci_queue_trb:     BULK: @0x...b036010 ... length 16384
  xhci_handle_event:  TRB 000000000b02cfc0 status 'Success' ... ep 5 'Trans=
fer
Event'
  xhci_handle_event:  TRB 000000000b02cfd0 status 'Success' ...
                      (no event for 000000000b02cfe0)
  xhci_handle_event:  TRB 000000000b036000 status 'Success' ...   -> "not p=
art
of TD"
  xhci_handle_event:  TRB 000000000b036010 status 'Success' ...   -> "not p=
art
of TD"
  xhci_handle_event:  TRB 000000000b036020 status 'Success' ...
  xhci_handle_event:  TRB 000000000b036030 status 'Success' ...

It looks as if the ASM2142/3142 does not post a completion event for a TD t=
hat
ends on the TRB
directly before an unchained Link TRB, at least at SuperSpeed Plus with this
bulk device. Windows'
xHCI driver is not affected, possibly because of different ring and link TRB
chaining behaviour.

Attachments
- xhci-trace-all.txt.gz: xhci-hcd tracepoints during a 4 s capture attempt
- dmesg.txt, lspci-asm3142.txt (lspci -vvv), lspci-tree.txt, lsusb-tree.txt,
v4l2-formats.txt,
  ffmpeg-1080p60.txt, uname.txt

Steps to reproduce
  ffmpeg -f v4l2 -input_format nv12 -video_size 1920x1080 -framerate 60 \
         -i /dev/v4l/by-id/usb-Elgato_Elgato_4K_X_*-video-index0 -t 4 -f nu=
ll -

Workarounds tried, none helped:
- iommu=3Dpt: no change.
- xhci_hcd.quirks=3D0x1 (XHCI_LINK_TRB_QUIRK, probe quirks 0x00000000008000=
11):
no change. The event for the
  TRB right before the link TRB is still missing:
    Event dma 0x00000000fec67000 for ep 4 status 1 not part of TD at
00000000fec66fe0 - 00000000fec66fe0

Happy to test patches. I can build and boot a test kernel if needed.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
