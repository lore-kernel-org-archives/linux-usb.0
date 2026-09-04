Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B82427FB0
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 07:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505411; cv=none; b=jcMVrJRULb7uBqZzkH9mJqMii7JMrlflNl92nunXtl8Sh1LERpMlssNpjei3thutqEUyT30y9USOpBAH3sfq/GQtrxGNY/ydPEYxue58nFMhWhXMQVeF1w6wXUjzMC3wxHb4EGtmUC1/Uv+wTahSX9xpze0ywGpsh6ZZaGVDTj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505411; c=relaxed/simple;
	bh=YEGNqmNx8spYHfM8kZPlNbtfpr9HBCoe1PEuhCgoGR8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oeX6w16BXVkvI0kvH1PXCG5SCCLS+dKsks5jpTejjg17R3GX0PKM09HVMI20NPHBBabEyYNVsWnMKCNmd4au7Ib0TmEvy3yvaJwWGfV4Sat38yPT1mh9aPgbLfm95plfhpzxC2qMrk19Y5I32KQLhFsBWGlb3NUZcx9a8y973II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2SA3cxm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2SA3cxm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA594C2BCF4
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 07:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788505410;
	bh=YEGNqmNx8spYHfM8kZPlNbtfpr9HBCoe1PEuhCgoGR8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=j2SA3cxmO1jpkHQ8JvliTLozTLdh1bnyjzAvmwqkbG2+JO+kClnUkh0L311Gm3L+l
	 zF0HhTE43nDf6/0RgHMwVWH28KkvFHMj0jgPDbx/lmKxndLPs8TS6iA8zMrzXo/FCK
	 LphNvgNJCRPI388ajDCmQmGCfAjcJgB0mprmNbOZ9Bf8mbU0abakTfXZrpZNNxuICq
	 8vcTLbqOSsnaszK+UrsJ/uD+GEugsmDNAvbxGS0m2RsqzqxqhdGF7YftugVwTzrSey
	 bLTkLhVQt4oSP+oE5FLGdDh0GZeJ42HqzIxPcCJvTwYTovScsG8aUiQDZpoOg3vCOJ
	 W6r5LDuccpdeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8931CC433E1; Fri,  4 Sep 2026 07:03:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221963] uvcvideo: Realtek Integrated_Webcam_HD (0bda:5696) RGB
 sensor never delivers frame data after STREAMON
Date: Fri, 04 Sep 2026 07:03:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cj897048@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221963-208809-GoY30qYJQi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221963-208809@https.bugzilla.kernel.org/>
References: <bug-221963-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221963

--- Comment #1 from Chandra Joshi (cj897048@gmail.com) ---
On a laptop with a Realtek "Integrated_Webcam_HD" combo RGB+IR webcam module
(USB ID 0bda:5696), the RGB capture node (/dev/video0) accepts VIDIOC_STREA=
MON
successfully and negotiates valid formats (YUYV and MJPG, multiple
resolutions), but never delivers a single video frame. The call hangs
indefinitely until killed. No error, warning, or informational message is
logged to the kernel ring buffer during the hang =E2=80=94 dmesg is complet=
ely silent.

The companion IR node (/dev/video2, 340x374, monochrome) on the same physic=
al
USB device streams frames successfully and immediately.

Hardware / environment
Webcam: Realtek Integrated_Webcam_HD, USB ID 0bda:5696
USB topology: dedicated port, not sharing a hub with other devices (lsusb -t
shows Port 005, all 4 interfaces belong solely to this device)
Device exposes 4 nodes: /dev/video0, /dev/video1, /dev/video2, /dev/video3
(video0 and video2 are the only ones with usable capture formats)
Distro: Ubuntu 24.04 (Noble)
Kernel tested: 7.0.0-30-generic and 7.0.0-31-generic (HWE) =E2=80=94 identi=
cal behavior
on both
No dual-boot Windows available to confirm hardware-level functionality (a
stale/unused Windows Boot Manager EFI entry exists but no working Windows
installation is present)
Steps to reproduce
v4l2-ctl -d /dev/video0 --stream-mmap --stream-count=3D5 --verbose

Result:

VIDIOC_QUERYCAP: ok
VIDIOC_REQBUFS returned 0 (Success)
VIDIOC_QUERYBUF returned 0 (Success)   x4
VIDIOC_G_FMT returned 0 (Success)
VIDIOC_QBUF returned 0 (Success)       x4
VIDIOC_STREAMON returned 0 (Success)
<hangs forever, no further output, no DQBUF ever completes>

Equivalent hang reproduced independently with:

ffmpeg -f v4l2 -i /dev/video0 -frames:v 1 out.jpg
ffmpeg -f v4l2 -input_format mjpeg -video_size 640x480 -i /dev/video0 -fram=
es:v
1 out.jpg
ffplay -f v4l2 -video_size 1280x720 -i /dev/video0
cheese (GStreamer backend)

All fail identically: format negotiates, STREAMON-equivalent succeeds, zero
packets/frames ever arrive.

Formats/controls confirmed valid (ruling out a format problem)
v4l2-ctl -d /dev/video0 --list-formats-ext
        [0]: 'MJPG' - 640x480, 1280x720, 960x540, 848x480, 640x360 @ 30fps
        [1]: 'YUYV' - 640x480, 640x360, 424x240, 320x240, 320x180, 160x120 @
30fps

v4l2-ctl -d /dev/video0 --list-ctrls
        brightness=3D0 (default 0), contrast=3D8, saturation=3D64 (default),
        gain=3D1 (min), auto_exposure=3DAperture Priority (default),
        exposure_time_absolute=3D156 (default 156, inactive/auto)
        -> all values are sane defaults, not stuck at an extreme
Things ruled out during troubleshooting
Pixel format mismatch =E2=80=94 tested both YUYV and MJPG explicitly, both =
hang
identically.
Exposure/brightness stuck low =E2=80=94 control values are default/sane, no=
t at min.
USB autosuspend =E2=80=94 disabled via echo on >
/sys/bus/usb/devices/1-5/power/control; no change.
uvcvideo bandwidth quirk =E2=80=94 reloaded driver with modprobe uvcvideo q=
uirks=3D128
(UVC_QUIRK_FIX_BANDWIDTH); no change.
USB hub/bandwidth sharing with sibling devices =E2=80=94 lsusb -t shows the=
 webcam
alone on its own port; nothing else shares it.
Stale/cached kernel state =E2=80=94 full USB-level unbind/bind cycle perfor=
med: echo
1-5 > /sys/bus/usb/drivers/usb/unbind then .../bind; device re-enumerates
cleanly (all 4 /dev/video* nodes return, uvcvideo re-attaches) but /dev/vid=
eo0
still hangs identically afterward.
Outdated kernel =E2=80=94 upgraded from 7.0.0-30-generic to 7.0.0-31-generi=
c (latest
available HWE kernel at time of testing); identical hang before and after,
including a full reboot.
Driver crash / GStreamer-specific bug =E2=80=94 reproduced the same zero-fr=
ame hang
with ffmpeg and raw v4l2-ctl --stream-mmap directly, bypassing GStreamer/ch=
eese
entirely, so this is not an application-layer bug.
Physical privacy shutter =E2=80=94 laptop has no hardware camera shutter or=
 Fn-key
camera toggle.
UVC_QUIRK_STREAM_NO_FID (quirks=3D16) =E2=80=94 no change; see usbmon findi=
ng below for
why.
dmesg during the hang

Completely silent =E2=80=94 no uvcvideo messages, no USB errors (no "usb_se=
t_interface
failed", no "isochronous frame lost", no timeout/reset events), nothing at =
all
correlated with the hang window.

usbmon capture =E2=80=94 key finding

A 10-second usbmon capture (bus 1, isochronous endpoint 1 of the webcam,
/sys/kernel/debug/usb/usbmon/1u) was taken while running v4l2-ctl -d
/dev/video0 --stream-mmap --stream-count=3D3 --verbose.

Findings:

Isochronous transfers on Ii:1:004:1 complete successfully (status 0),
confirming USB-level data transfer genuinely occurs =E2=80=94 this is not a
transport/bandwidth failure.
However, every single isochronous packet returned across the entire 10-seco=
nd
capture has payload length exactly 12 bytes =E2=80=94 i.e. only the bare UV=
C payload
header, with zero pixel data ever included:
C Zi:1:004:1 0:1:5224:0 32 0:0:12 0:2814:12 0:5628:12 ... =3D 0c8c0000 0000=
eab5
86008a02 00000000...

(0c =3D header length 12; 8c =3D bmHeaderInfo, decodes to EOH=3D1, SCR=3D1,=
 PTS=3D1,
FID=3D0, EOF=3D0 =E2=80=94 both FID and EOF remain constant/unset for the e=
ntire capture,
consistent with zero frame boundaries ever being signaled)

This pattern is identical and unchanging for the full duration of the captu=
re =E2=80=94
the sensor never once includes actual image payload bytes, only the 12-byte
header, packet after packet.
Interpretation

Given this, the issue is not a uvcvideo driver bug in interpreting frame
boundaries or payload =E2=80=94 the RGB sensor's ISP/pixel pipeline itself =
appears to
never produce or transmit actual image data, despite the control plane (for=
mat
negotiation, STREAMON, isochronous transport) functioning perfectly. This
strongly suggests either a hardware fault in the RGB sensor, or a missing
vendor-specific initialization/power-on sequence that the Windows driver se=
nds
but that uvcvideo's device quirk table does not replicate for this device I=
D.

Request
Has anyone reported this specific behavior for 0bda:5696?
Is there a known vendor-specific control sequence / quirk that could be add=
ed
for this device ID?
Any additional trace-level diagnostics (e.g. usbmon, UVC control transfers =
via
usbmon/wireshark-usb) that would help pin down whether the sensor is being =
sent
a wake/power command at all?

Happy to gather additional usbmon captures or test patches =E2=80=94 I have=
 full shell
access to the affected hardware.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
