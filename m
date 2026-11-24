Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.240.9.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558027;
	b=oGcAbsvB9gG+dEtngvhUm96IGmtR0JD5Rs/uvrGBxBoCn2YRAEUU/ZFdrrRyFM/dfnZy
	 p6fI8AwX0d6ejWb51Ad0uQzsux/SuPRwiiCBcxQx3Znps+rLZbpe0Bh0LTZLt+DouVkto
	 itnF0UUUJkqchEFWAhOsmI7DJv3nYo2sAYy2lO0FzB9PXiFuRLJPGjfoDONt1cKLd+ZiE
	 iRC4EdIJJegy/qgzlrOEs4m/5hqOhA/7QZ6ZYBxUPSZX+7zPrBO9xbz3QR5LgFvx9LxFa
	 cu9o5ho2+6K+QtuMjL2D1eXCUQKe7iPx1tHP7cxTQvbdVNmuivC3fZjhOIPIBxee8sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558027;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:List-Unsubscribe:
	 List-Unsubscribe-Post:References:From:To:Cc:Reply-To:Subject:
	 Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:
	 Feedback-ID:X-SES-Outgoing;
	bh=RZ5eG4oApUlaap8ZcD6OHHiwIXso7soQIFLTpEiVLa8=;
	b=20ThI2+DCEkkXI9HHA0j5QGZWpxWAw8lgQmL422uVnXZ9elKX2nTFLvWQ0B/TZcra8LW
	 XDXVA7eVGSziVzK6RIU0kN9EoRL0qaqa1MmneCWFZvmyWxJXegNmjvm+BtJE/CA98fluF
	 aO86LB2zvKvX8c8/RqFez9PLGFtwDAdOzdETQjkXPv8xZ0+UvtoIAQsgYJ3qCYhHp0FTI
	 LmB8nVUov+0MYgSvURj0ndfl/CUj+F1mgXP44dfQG+STX++xvfVmfQQvTAOsGni5HaffS
	 NCDA6PmrNroC2Zzr4ry8zS/tSoIcQiflrCu+WT22WcKltUXJrwxEu4lYD2iSIrNUgmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.grokbot.com;
	spf=pass smtp.mailfrom=mail.mail.grokbot.com;
	dkim=pass header.d=mail.grokbot.com header.i=@mail.grokbot.com header.a=rsa-sha256 header.s=chya7do5z2af6fu5nhnfk24jer43js4a header.b=XHsH2mW4;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=nLYPHYIQ;
	arc=none smtp.remote-ip=54.240.9.31
Received: from a9-31.smtp-out.amazonses.com (a9-31.smtp-out.amazonses.com [54.240.9.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1F2606A323
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 22:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC1F2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.grokbot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.mail.grokbot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mail.grokbot.com header.i=@mail.grokbot.com header.a=rsa-sha256 header.s=chya7do5z2af6fu5nhnfk24jer43js4a header.b=XHsH2mW4;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=nLYPHYIQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=chya7do5z2af6fu5nhnfk24jer43js4a; d=mail.grokbot.com;
	t=1795558026;
	h=List-Unsubscribe:List-Unsubscribe-Post:References:From:To:Cc:Reply-To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=kTDsr17n0x/DBCq52NLQy/7Ibf/viGEo80bIoSWbY88=;
	b=XHsH2mW4e0rEUcmDKeo7EKyBB7v2Dxw3ZpY94YJV4/lFi4Ll95zfHFlBOpMCuBBH
	3CzjL56EeiA6C/yq8yxbmOInc1bLTyo13moYAZOF4TqQExFgyBhjRF8KTcC/0iZokDS
	r+FrkvjPIKZP9kvkWCFSCNQCUzpkGxSG8rLSRLbqQxgJBmm3A6gEGSMsUgU4JDNVEJX
	HBEC941Pm39Tt0gweGaNnQMHKQe636ullmdVEtMSooBpuQ0ddrpX8dNkj0MTXGipPro
	DKfTM8Y3Le2UGQxGgZ+pvWWL0RoEXaIlQIzxlyPOS8wEJn51EAWTNXt+tGCjq1fS7Xc
	60ALcWlNUw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1795558026;
	h=List-Unsubscribe:List-Unsubscribe-Post:References:From:To:Cc:Reply-To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=kTDsr17n0x/DBCq52NLQy/7Ibf/viGEo80bIoSWbY88=;
	b=nLYPHYIQc6LuLidIRQlHyt6Fop4A+WuJ69+AWSdmnoZGs8bdxCJSaNoR+Ml1WfoD
	8nmWgKDYxSKsBvKiuItdoYxhHd4amxXwfRx3palJmcLGLHioNUNXBskbVR4/VmXEiz8
	f+0XWqLCAgqXKGfxVaaXVoF/CdU9lDszGnHwK4fM=
List-Unsubscribe-Post: List-Unsubscribe=One-Click
References: <2e4a3414-502c-41ca-9e60-00877dafc403@mail.grokbot.com>
From: myitforce@mail.grokbot.com
To: westeri@kernel.org
Cc: andreas.noever@gmail.com, YehezkelShB@gmail.com, 
	linux-usb@vger.kernel.org
Reply-To: myitforce@mail.grokbot.com
Subject: [BUG] thunderbolt: DP tunnel to USB4/TB5 hub torn down immediately
 (adapter unplug) on Alpine Ridge host
Message-ID: <010001a20f992a5a-205d672f-7d03-4fd4-8c55-3cafc829d20d-000000@email.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 22:07:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.fEnU3ccvllxLtJBUaYT91MTmOYNbRqP5oL88A2UkuQF6ossBVbh5STHzasceFsir04XyyuG42nT7n6uR29FF1cITEcL1ChwuwmmnByiLq7b19cZXcWlSBKaGH1eTvuCkTV39F9cQxjTxRwjaqAkRRXNrp73fLaTAWNswKCAdEs0=:1.us-east-1.6duzA/nfEyqJmYS7DZLtjVrpjz2pDnbKq2D1dAyqdPM=:AmazonSES
X-SES-Outgoing: 2026.11.24-54.240.9.31

Hi,

The software connection manager on an Alpine Ridge (Thunderbolt 3) =
Apple host successfully builds a DisplayPort tunnel to an Intel Barlow =
Ridge USB4/TB5 hub, then immediately tears it down after a hot-unplug event=
 on the hub's DP OUT adapter. i915 never sees a connected DP connector. USB=
, PCIe tunneling and the Thunderbolt link stay up.

This was reproduced on Ubuntu 7.0.0-44-generic with thunderbolt dynamic =
debug enabled. I am happy to collect further traces or test patches.

Hardware
--------
Host:        Apple MacBookPro13,2 (2016 13-inch MacBook =
Pro, Touch Bar)
CPU/GPU:     Intel Skylake-U, iGPU 8086:1927 (Iris Graphics=
 550), i915
Host TB:     two Intel JHL6540 Alpine Ridge C 4C controllers
             NHI 8086:15d2 at 0000:05:00.0 and 0000:7b:00.0
             USB xHCI 8086:15d4 also present (e.g. 0000:7c:00.0)
             host routers generation 3
BIOS:        529.120.1.0.0 =
(03/14/2024)
Dock:        OWC Thunderbolt 5 Hub (vendor 0x5a device 0xde81)
Dock router: USB4 switch 8087:5786 (Intel Barlow Ridge / JHL9480),
             NVM 64.81, PlugEventsDelay 10ms
Link:        TBT (TBT3 =
support: yes), 20.0 Gb/s x 2 lanes (40 Gb/s),
             boltctl =
generation USB4, authorized, policy auto
Display:     USB-C-to-HDMI / =
USB-C-to-DP cable on a hub Thunderbolt 5
             downstream port. =
After the failed tunnel, lsusb shows
             0639:7213 Chrontel CH7213=
 "USB-C To DP Cable" as a USB
             Billboard device, and/or Genesys=
 05e3:0f01 Billboard.

Kernel / CM
-----------
Linux 7.0.0-44-generic =
#44-Ubuntu SMP PREEMPT_DYNAMIC Fri Nov 6 02:38:04 UTC 2026 x86_64
CONFIG_USB4=3Dm (thunderbolt.ko). Software connection manager =
(domain0/security =3D user).
Default parameters after tests were reverted: =
start_icm=3DN, bw_alloc_mode=3DY, clx=3DY, dprx_timeout=3D12000, =
host_reset=3DY. No thunderbolt parameters on the current kernel command =
line.

i915 connectors: eDP-1 connected; DP-1, DP-2, HDMI-A-1 and HDMI-A-2 =
stay disconnected throughout.

Symptoms
--------
1. Plug the OWC TB5 hub =
into a host Type-C/TB3 port and connect a display to a hub TB5 downstream =
port with a USB-C-to-HDMI or USB-C-to-DP cable.
2. The hub enumerates, is =
authorized, USB devices work, a PCIe tunnel is established.
3. The software CM pairs host DP IN 0:9 (0:10 also exists) with a hub DP =
OUT (3:19, later 3:11). It reports DP IN maximum
   5400 Mb/s x4 =3D 17280 =
Mb/s (HBR2), DP OUT maximum
   8100 Mb/s x4 =3D 25920 Mb/s (HBR3), and =
36000/36000 Mb/s available, then activates Video + AUX TX + AUX RX.
4. Within the same second it acks a hot-unplug on that DP OUT and tears the=
 tunnel down ("DP OUT resource unavailable: adapter unplug").
5. This repeats about four times per plug (twice to 3:19, twice to 3:11) =
and then stops.
6. i915 DP-1/DP-2 never go connected. The cable falls back =
to USB Billboard (Chrontel CH7213 0639:7213 and/or Genesys 05e3:0f01).

The unplug is not a 12s DPRX timeout. A hot-unplug event on the hub DP OUT =
is acked *during* path activation (before Video/AUX complete), a hot-plug =
is acked while hops are programmed, and another hot-unplug arrives =
immediately after "AUX RX path activation complete". That last event is =
what calls tb_dp_resource_unavailable(..., "adapter unplug") in =
tb_handle_hotplug().

"DP OUT in use" / "no suitable DP OUT adapter =
available" in the same window is the CM looking for a second pair for the =
other host DP IN while the first tunnel is still marked enabled; that looks=
 like a consequence, not the cause.

What works
----------
- The same USB-C-to-HDMI cable plugged directly into the MacBook (Type-C DP=
 Alt Mode, no Thunderbolt DP tunnel) drives the monitor under Linux.
- The same hub, cables and monitors work on an Apple M5 MacBook Air (native=
 USB4 host) under macOS.
- USB and tunneled PCIe through the hub on this =
Linux host work.

What was tried
--------------
- Cold boot with the hub =
and monitor already connected: no display.
- Both sides of the laptop (the =
two Alpine Ridge controllers): no display.
- thunderbolt.start_icm=3D1 =
(GRUB one-shot, boot 13:41:37-13:46:54 PST / America/Los_Angeles). The =
firmware connection manager failed to enumerate the hub. Reverted; current =
start_icm=3DN.

    Kernel command line: ... thunderbolt.start_icm=3D1 ...
    thunderbolt 0000:05:00.0: failed to find route string for switch at 3.1
    thunderbolt 0000:05:00.0: no switch exists at 3.1, ignoring

- thunderbolt.bw_alloc_mode=3D0 at runtime (rmmod / modprobe; log =
tb-bwalloc0.log). The failure is identical. "bandwidth allocation mode =
supported/enabled" is not logged in either the default or the =
bw_alloc_mode=3D0 captures, which matches tb_dp_pre_activate() returning =
early when the DP IN switch is not USB4. Excerpt from the bw_alloc_mode=3D0=
 replug, 13:57:38 PST, tunnel 0:9 <-> 3:11 (hop-programming lines omitted).=
 The same sequence also ran twice on 3:19 at 13:57:32 PST in that log:

    thunderbolt 0000:05:00.0: acking hot plug event on 3:11
    thunderbolt 0000:05:00.0: 3:11: DP OUT resource available after hotplug
    thunderbolt 0000:05:00.0: 0:9: sink 0 allocated
    thunderbolt 0000:05:00.0: 0:9: attached to bandwidth group 1
    thunderbolt 0000:05:00.0: available bandwidth for new DP tunnel =
36000/36000 Mb/s
    thunderbolt 0000:05:00.0: 0:9 <-> 3:11 (DP): =
activating
    thunderbolt 0000:05:00.0: acking hot unplug event on 3:11
    thunderbolt 0000:05:00.0: 0:9 <-> 3:11 (DP): DP IN maximum supported =
bandwidth 5400 Mb/s x4 =3D 17280 Mb/s
    thunderbolt 0000:05:00.0: 0:9 <->=
 3:11 (DP): DP OUT maximum supported bandwidth 8100 Mb/s x4 =3D 25920 Mb/s
    thunderbolt 0000:05:00.0: activating Video path from 0:9 to 3:11
    thunderbolt 0000:05:00.0: acking hot plug event on 3:11
    thunderbolt 0000:05:00.0: Video path activation complete
    thunderbolt 0000:05:00.0: activating AUX TX path from 0:9 to 3:11
    thunderbolt 0000:05:00.0: AUX TX path activation complete
    thunderbolt 0000:05:00.0: activating AUX RX path from 3:11 to 0:9
    thunderbolt 0000:05:00.0: AUX RX path activation complete
    thunderbolt 0000:05:00.0: acking hot unplug event on 3:11
    thunderbolt 0000:05:00.0: 3:11: DP OUT in use
    thunderbolt =
0000:05:00.0: 0:10: no suitable DP OUT adapter available, not tunneling
    thunderbolt 0000:05:00.0: 3:11: DP OUT resource unavailable: adapter =
unplug
    thunderbolt 0000:05:00.0: 0:9 <-> 3:11 (DP): deactivating

- Authorization is not the issue (boltctl: authorized, policy auto). =
Parameters were returned to defaults after the tests (bw_alloc_mode=3DY, =
start_icm=3DN).

Notes
-----
- "0:9: attached to bandwidth group 1" is =
logged even with bw_alloc_mode=3D0. That message comes from the software CM=
 attaching a DP IN to an internal bandwidth group for every DP tunnel. It =
is not the same as USB4 DP bandwidth-allocation mode.

- The "device links to tunneled native ports are missing!" warning is =
printed for both host NHIs at probe. tb_apple_add_links() only covers =
Light/Cactus/Falcon Ridge, and Apple ACPI does not provide the USB4 _DSD =
mappings. I believe this is unrelated: PCIe/USB through the hub work, and =
the DP failure happens at plug, not at resume.

- tb_dp_cm_handshake() is =
skipped unless both ends are USB4 or Titan Ridge, and tb_dp_pre_activate() =
returns early unless the DP IN switch is USB4. Here the DP IN is Alpine =
Ridge (generation 3) and the DP OUT is on a Barlow Ridge USB4 hub. I do not=
 know whether that skipped handshake (or something else on the gen3 IN / =
USB4 OUT path) is why the hub pulses HPD during activation; I wanted to =
mention it in case it is relevant.

- domain0/iommu_dma_protection reads 0.=
 DMAR tables are present.

Key log excerpt, default parameters (times are
America/Los_Angeles / PST)
----------------------------------------------
Hub enumeration (link already TBT, not USB4 PHY):

  [Tue Nov 24 13:48:53 =
2026] thunderbolt 0000:05:00.0: acking hot plug event on 0:3
  [Tue Nov 24 13:48:53 2026] thunderbolt 0000:05:00.0: 0:3: is connected, =
link is up (state: 2)
  [Tue Nov 24 13:48:53 2026] thunderbolt 0000:05:00.=
0:  USB4 Switch: 8087:5786 (Revision: 132, TB Version: 64)
  [Tue Nov 24 13:48:53 2026] thunderbolt 0000:05:00.0:    Upstream Port =
Number: 1 Depth: 0 Route String: 0x0 Enabled: 0, PlugEventsDelay: 10ms
  [Tue Nov 24 13:48:53 2026] thunderbolt 0000:05:00.0: initializing Switch =
at 0x3 (depth: 1, up port: 1)
  [Tue Nov 24 13:48:53 2026] thunderbolt =
0000:05:00.0: 3: link: TBT
  [Tue Nov 24 13:48:53 2026] thunderbolt =
0000:05:00.0: 3: TBT3 support: yes, xHCI: yes

First DP tunnel (0:9 <-> =
3:19) with default bw_alloc_mode=3DY.
Hop-programming lines omitted:

  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.0: acking hot plug =
event on 3:19
  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.0: 3:19: =
DP OUT resource available after hotplug
  [Tue Nov 24 13:48:54 2026] =
thunderbolt 0000:05:00.0: 0:9: DP IN available
  [Tue Nov 24 13:48:54 2026]=
 thunderbolt 0000:05:00.0: 3:19: DP OUT available
  [Tue Nov 24 13:48:54 =
2026] thunderbolt 0000:05:00.0: 0:9: sink 0 allocated
  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.0: 0: allocated DP =
resource for port 9
  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.0: =
0:9: attached to bandwidth group 1
  [Tue Nov 24 13:48:54 2026] thunderbolt=
 0000:05:00.0: available bandwidth for new DP tunnel 36000/36000 Mb/s
  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.0: 0:9 <-> 3:19 (DP): =
activating
  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.0: acking =
hot unplug event on 3:19
  [Tue Nov 24 13:48:54 2026] thunderbolt =
0000:05:00.0: 0:9 <-> 3:19 (DP): DP IN maximum supported bandwidth 5400 =
Mb/s x4 =3D 17280 Mb/s
  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.=
0: 0:9 <-> 3:19 (DP): DP OUT maximum supported bandwidth 8100 Mb/s x4 =3D =
25920 Mb/s
  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.0: =
activating Video path from 0:9 to 3:19
  [Tue Nov 24 13:48:54 2026] =
thunderbolt 0000:05:00.0: acking hot plug event on 3:19
  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.0: Video path =
activation complete
  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.0: =
activating AUX TX path from 0:9 to 3:19
  [Tue Nov 24 13:48:54 2026] =
thunderbolt 0000:05:00.0: AUX TX path activation complete
  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.0: activating AUX RX =
path from 3:19 to 0:9
  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.=
0: AUX RX path activation complete
  [Tue Nov 24 13:48:54 2026] thunderbolt=
 0000:05:00.0: acking hot unplug event on 3:19
  [Tue Nov 24 13:48:54 2026]=
 thunderbolt 0000:05:00.0: 3:19: DP OUT in use
  [Tue Nov 24 13:48:54 2026]=
 thunderbolt 0000:05:00.0: 0:10: no suitable DP OUT adapter available, not =
tunneling
  [Tue Nov 24 13:48:54 2026] thunderbolt 0000:05:00.0: 3:19: DP =
OUT resource unavailable: adapter unplug
  [Tue Nov 24 13:48:54 2026] =
thunderbolt 0000:05:00.0: 0:9 <-> 3:19 (DP): deactivating

The same activate / mid-activation HPD bounce / deactivate sequence then =
repeats on 3:19 and twice more on 3:11.

Request
-------
Guidance would be appreciated. I can provide additional traces (tb_event =
control packets, drm.debug on a repro, etc.) and I am willing to test debug=
 patches.

Full logs (available if useful; host-unique identifiers in the =
logs have been replaced with placeholders):

  dmesg-full.txt
      default-parameter plug at 13:48:53 PST, with thunderbolt
      dyndbg (first capture after reboot)
  dmesg-tb.txt / =
dmesg-excerpt-dp-unplug.txt
      filtered / trimmed excerpt of that plug
  tb-bwalloc0.log
      runtime bw_alloc_mode=3D0 test (module reload at =
13:55:22 PST,
      hub replug, DP teardown at 13:57:32 and 13:57:38 PST)
  dmesg-excerpt-bwalloc0-135738.txt
      trimmed excerpt of that test
  tb-icm-boot.log
      kernel log from the thunderbolt.start_icm=3D1 boot
      (13:41:37-13:46:54 PST). /tmp/tb-icm-boot.log was no longer
      on the laptop; this is journalctl -b -1 -k from that boot.
  sysinfo.txt, sysinfo2.txt, sysinfo-20261124-1402.txt
      uname, module parameters, boltctl, lsusb, drm, sysfs
  debugfs-ports.txt, debugfs-ports-20261124-1402.txt
      debugfs thunderbolt tree / port regs (partial)

Thanks,
Jeremy Menefee
