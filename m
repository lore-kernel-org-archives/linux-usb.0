Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793153195;
	b=1yxn5cmFo5OmNgpGygb2kltachurDuLR5gUpEGn5nNbXU9weNETLnNhvR/HbDQaSdw1v
	 Ks96W4bVDTiSU6TjWtBrVapOUAGrQ0rIqLZzD9Xz+r4GW330DiboxSM3Ihyq+7wHLe6Jg
	 VskuAfk4VRvQNkXZO1cy1Bb6IMZ0g6DRCZXZ0hQutHtEAdJ1osu57zEOm+m9Be3v02H6N
	 GwEzjqVBUeNrWcilou1BQpIyPehKtq4YIU0Nv+d3l1mnTULKa48vCNrF37uxsz4OtEgGh
	 RAdNuWjHqMmHj8DS4DsiZi5I3fyFPMI98veMZvjr/pBYUTzQjRDkSzVo01hoz1JNYeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=5Ud/YLDN/DqMkUXELEmv66/T4isgVnZ84WHVlucVFtE=;
	b=Q4AV+81xCPd934PSAxdXNR6yKd7rsU0T47gBBPvixixjseLoeJuBa6JMu9wiFrAY9KCV
	 edgceXfQVcBPJzvyBoXnV4XjDpdQ8qp3+vr3XW+znVkmZIMdF0Sw32fQgN+ZKy3tcydPJ
	 W/AFKpZr9tZ7O1X4SG+JU557yYk0vol/yL4wWIUkNjGqfhtIkQS/CLFtuWFaT4+H312Zj
	 geQUvJCqik8tYXVS65GHxS8TpX0SwEiYkO8pu3lJ8ZREw1zSkcfSiJrqRu+IYI6NhOVxR
	 2w0jXdEng9PPpNE2w3cpUWn8l6Kc/qKj0RKD4L1A3q7XAm3+jKRgE5rLdGGYPbBAaTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QyiHiolW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC30606A31D
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 02:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC30606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QyiHiolW
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso843123eec.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 19:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793153195; cv=none;
        d=google.com; s=arc-20260327;
        b=e9iTuivSNsNiBUktaugkb4LHTBM3tDLMG62Ky5r23mrFo8LsL1gVf3QzNNlwJtPU6g
         LjEl7Sj2KXFhnERnRLljDl7Np25zf87wwAMX2cuje1nGpHwqLIqPJQwV/gxcqVr+KxQW
         KWnvSfkQBYDIEhGyOMzglzrjFLiVuCuIG2I3BT0uO/StseZNRL98ohoSOw8A0+exDr48
         GaHm9apSWVyuYEMhzu6A3qO/qKnrJ0RGho8VAQGO9N1dxUJC96s1l+V2Pfu4FV6NrKTa
         RecABl3qHnkjyKNzSCo6nxwpolFbuzDFuLH+HSIOKMj0kZZBBKwvWWwmO/On1XQ8+Kar
         H18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5Ud/YLDN/DqMkUXELEmv66/T4isgVnZ84WHVlucVFtE=;
        fh=04wfdpQAcn5unfCQx9r5bFwIqG5JTzfw/4GAk3AGrrM=;
        b=Kh+9cVJgo/qPceOsTN4mJKR72/NfDUPRA9LlJgMOGswwdPpEywmRtDL369EA4BeN2Z
         lK2Tx29s0Z6IHjfwqYK8yT4X50O2wRHb7o0Or/mF8juTBMldePiFFg7hScWyFE9f53aj
         o5MsR5RzX38NMca6PJ+eFsO8yLMZ+RuelqiYTmL0t7SNR9uNaIyDG3YWODk0P4ISpLDl
         bx4xaWO1xIajeVzoxL5oCqY0YgcDhH4//YfDGcIw3ekxndbO+dSXp1siepQEVPROSQaG
         zTWsz6LNAK2LQ/x57JxMqMmDbFmrNNeSFWqLsuwQjx8IwpVZKssAqoRpK7g35TUjiNOn
         6ZTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153195; x=1793757995; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5Ud/YLDN/DqMkUXELEmv66/T4isgVnZ84WHVlucVFtE=;
        b=QyiHiolWni9ughzuQDjeal8g65n0zA/zU+DneT85xbDR0fI1D2715xsxr6LFwJGmSz
         3YkFJEU+U+RdWeVBlUUOHTWS+GFlypTprVzS3ea3/TSKsdEcUAvUeqiK6mWrXYm9Hl5H
         gGLQKQQZ4Zi9+tND53v9rulJDCFqwh/WztLRRaQOmGQvebL3EmlxqVHd8+t5sVi0OW+z
         Gq+yfC1eUIt4AR6xe9JEve4JjMnrtEvPWrIXs4h2da1JDHYJUEf8RohOt0IsnmUPSkm+
         OHRyBBttzNLZjvEUpBFzP6BWAqclB+Xtq+nXF9Um9cC4vem4gZWcSqrOD2GwgmsVMYPN
         GGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153195; x=1793757995;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ud/YLDN/DqMkUXELEmv66/T4isgVnZ84WHVlucVFtE=;
        b=2xlVoQ13gXjvCYZVdNpcR8fiGzguNFyBA0F+l2CkqhGtUUP2HqdSgDfvV8GtbBZdzy
         QCDpTbSLKfiLW2WDdpeYACudCw8yDc+Vg2MVpt1bHn9ZX2F7qebqeDPnRVe2B6eLo0Cf
         GrnRsebKl46104pERtH7R5PxyskZYYniu0Hopzru45woVVJHDhYZMKfFQJ0PBMQ/z2Hw
         qyqFQSyrYjn1e+Ervfi84dhPRwLyPUphnPKCk22u9u37c1sEIAgL628qoIJv9nQQBS/7
         pvgbcHTbA5aRevOu/NyiyqFH3AyfvnTs/wlOBvJ1KqMkMLllyexcdd8qD3nj6a703JLo
         enjA==
X-Forwarded-Encrypted: i=1; AKwUvByuAYYRYY0mKfb1dqDM4FCk9w+uInXjb8mXdYVCf3aham3mvvlG7L4cNuD9SAmyFcmLGxfu+VPiQUs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLANmJrmSCYAKvBYGtDDv3cQfXzkpIGhd2+vddsf0U2WfLM0sYl
	ggDJDQuLnwaYFGXlrHxAAoFZBWg2R0dBDdBU5xAENhVGP8xOkzk7ueDMCWypyZn3GeiBi4quu6B
	LcUkQUihcN595DS74ka8vqzgQBKD/f6aJMJy0
X-Gm-Gg: AYBFou0gCDiZ3ftC1rpmzB114UG0fElOnf1Fr1Kfku9auMKknYOACeP3bYsupDiHCQ6
	UQBKvEh+9TtCFAcQtItE2Q3A91QD1CBY68k3KjnlsbTEIQK0fhmGSiU0qU0SmJbtFL7/2FC6QQS
	tQOJaJjJCbAPsefs9S8ASaWkH6ljw8QUlnZgJm5B0yTdPgqO2OlSAHr3oeozRr3tKhXnf09i8/l
	B0NTZDTAVwZbWspU5WPKzzjPNZwOi/d4zp6hmuDyRvzfQ2s0C/XD2Nrg/4vPY/zuDqP+lw7W+3S
	1ZUBaD+N360pUWIylcbAc4omZvpZkRxA6PL0kSHeVujUDrUR9dHA/J+YHE3fCo+OTmFc03pO4IB
	22xKXKE5aG27KiSqzREIn8/xFH2qZ5n1emuIXjEkxco/tp05iKnFTP/mx2MrqQYMtmRpX1nc=
X-Received: by 2002:a05:7300:3aa5:b0:36a:2059:6c85 with SMTP id
 5a478bee46e88-36a20597091mr1447635eec.34.1793153194333; Tue, 27 Oct 2026
 19:06:34 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: SIMON BABY <simonkbaby@gmail.com>
Date: Tue, 27 Oct 2026 19:06:21 -0700
X-Gm-Features: AclHuK8IIvgBHRw_KHKoesDS5LVmN4ei8OrubgKsU8u4WZgHrGTEQwzj4kMSIHA
Message-ID: <CAEFUPH3_w2CNccQxr70qi8yv9zbcN9a9FvOt98m9vGvBL2H_pw@mail.gmail.com>
Subject: QUESTION] EHCI async QH/qTD lifetime on old 2.6.32.y, Octeon+ with ISP1564
To: andiry.xu@amd.com, Alan Stern <stern@rowland.harvard.edu>, 
	USB mailing list <linux-usb@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000002e1406065edd037a"

--0000000000002e1406065edd037a
Content-Type: text/plain; charset="UTF-8"

Hello,

 We are chasing a memory-corruption and stall problem on an embedded
system and would value your view on whether it matches anything known
in ehci-hcd. We understand 2.6.32 is very old, so we are asking about
known behavior, not asking you to debug our kernel.

System
Linux 2.6.32.46 (MontaVista CGE6), MIPS64 Cavium Octeon+ (CN5020), SMP
NXP/Philips ISP1564 (PCI 1131:1562, rev 11) EHCI at 0000:00:02.2, with
OHCI companions
Behind it: one 0424:2514 hub and four Sierra Wireless EM7565 modems
(1199:9091), each using out-of-tree GobiSerial (PPP over tty) and
GobiNet drivers
Kernel tainted P by one proprietary module unrelated to USB

Symptoms
All four modems stop at the same time: usb_control_msg failed (-145)
and Write URB timeout. Transfers are accepted but never complete.
EHCI registers look healthy while this happens: USBCMD=00010039
USBSTS=0000e008, RUN=1, HALT=0, ASE=1, ASS=1, and FRINDEX advancing.
Earlier crashes showed Unhandled kernel unaligned access in unrelated
code (sysfs endpoint reads), with corrupted pointers whose bytes
resemble PPP/HDLC data.
On a failed unit, echo 0000:00:02.2 > .../ehci_hcd/unbind oopsed in
device_del() via usb_remove_ep_devs(), with BadVA 7820f58567f09149.

Hypothesis, not proven. We suspect a DMA write to memory the driver no
longer owns, such as a stale qTD or QH overlay reference, or a write
past the programmed byte count. The diagram shows what we are trying
to tell apart:

What we have done
Ported 3d037774b42e ("Update qTD next pointer in QH overlay region
during unlink") to qh_refresh().
Added print-only checks in qtd_fill(), qh_completions(),
ehci_urb_done() and ehci_irq() for: qTD count greater than length,
remaining count greater than the programmed count, URB actual_length
greater than transfer_buffer_length, Data Buffer Error, and Host
System Error.
Not yet captured: a failure with those checks enabled.

Questions
Are there known cases, in the ISP1564 or other EHCI controllers, where
qTD or QH overlay handling lets the HC DMA outside the programmed
buffer or into freed qTDs? Is anything missing from the two commits
above?
Is there a way to detect a DMA write past the qTD byte count other
than an oversized buffer with a canary pattern?
For a stalled-but-running controller (RUN=1, HALT=0, FRINDEX
advancing), is ehci_halt() + ehci_reset() + usb_hc_died() a sound
recovery, or does it risk leaving freed qTDs reachable?
Are there EHCI fixes after 2.6.32.71 we should read besides the
async-unlink rework, which we know can't be cherry-picked?



Note: A diagram showing the possible crash is attached.

Thank you for your time

Regards
Simon

--0000000000002e1406065edd037a
Content-Type: text/plain; charset="US-ASCII"; name="corruption_diagram.txt"
Content-Disposition: attachment; filename="corruption_diagram.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mvrh2ebv0>
X-Attachment-Id: f_mvrh2ebv0

RVhQRUNURUQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVVNQRUNURUQNCi0tLS0tLS0t
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0tLS0tLS0tDQpxVEQ6IGFkZHI9WCwgY291
bnQ9NTEyICAgICAgICAgICAgICAgIHFURDogYWRkcj1YLCBjb3VudD01MTIgKGxvb2tzIGNvcnJl
Y3QpDQogICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KICAg
ICAgICB2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHYNCklTUDE1NjQgRE1B
IFdSSVRFICAgICAgICAgICAgICAgICAgICAgSVNQMTU2NCBETUEgV1JJVEUNCiAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQogICAgICAgIHYgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdg0KUkFNICBYICAgICArLS0tLS0tLS0tLS0tLS0t
LS0rICAgICAgICBSQU0gIFggICAgICstLS0tLS0tLS0tLS0tLS0tLSsNCiAgICAgICAgICAgfCA1
MTItYnl0ZSBSWCBidWYgfCAgICAgICAgICAgICAgICAgICB8IDUxMi1ieXRlIFJYIGJ1ZiB8DQog
ICAgIFgrNTEyICstLS0tLS0tLS0tLS0tLS0tLSsgPC0gc3RvcCAgICAgWCs1MTIgKy0tLS0tLS0t
LS0tLS0tLS0tKyA8LSBzaG91bGQgc3RvcA0KICAgICAgICAgICB8IG90aGVyIGtlcm5lbCAgICB8
ICAgICAgICAgICAgICAgICAgIHwgWFggWFggWFggWFggWFggIHwgPC0gb3ZlcndyaXR0ZW4/DQog
ICAgICAgICAgIHwgb2JqZWN0LCBpbnRhY3QgIHwgICAgICAgICAgICAgICAgICAgfCBvdGhlciBr
ZXJuZWwgICAgfA0KICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0rICAgICAgICAgICAgICAg
ICAgIHwgb2JqZWN0IENPUlJVUFRFRHwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0rDQoNCiAgIEFMVEVSTkFUSVZFOiAg
c3RhbGUgcVREIGZyZWVkIGFmdGVyIHVubGluaywgUUggb3ZlcmxheSBzdGlsbCBwb2ludHMgYXQg
aXQNCiAgIFFIIG92ZXJsYXkgLS0+IHFURDIgKGZyZWVkL3JldXNlZCkgLS0+IERNQSBsYW5kcyBp
biBtZW1vcnkgbm93IG93bmVkIGJ5IHNvbWVvbmUgZWxzZQ==
--0000000000002e1406065edd037a--
