Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511177;
	b=Lc2c1Eu0Og/suW8+rsF1YWEtfSunFFpdKl4Dx61viLq9NjtiFfiFyNHJYd7x+zeG84jT
	 mNUzO9IzmULD86s8TU9Rq7Yi+0gqhISAWbscPwA9fzUYkXIB91zrrOULl9BcECkR8mD9R
	 j6OTVV4XKmB35yDZYsjC0k2v5V/83s2CjVdiZnMvnx0xE+/dUOrldqElOSX/RYAwBgxsG
	 61aUzJBWvEQLoUfbM6g4xtQShqoR2wU/AwavxFFqsX3/a5jDpihAkaPR5m0eCIIMLls9Q
	 TaERTAgMju4uTMvaGUWSh7+ZjG3GVLO/keb+4rWB4BXLMxV/rHIlGozzrOCuIOUGOqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c4KdIyx5wd3lW7yQNQkMYWV0DoFONhgCwEzOBtMGwk4=;
	b=NOVdxibplyAl12gPLtnM3viaGnnVqHwMrXP5VvHy/fHF03aG4ILUZo5h542w6shUvy5Q
	 zJWDUxB2fsugMVohwQ9sWmqm55UHF/FP/bh3pnZiBBqT0Vtd4kl2eUZyzs+YK0XE7tMfW
	 79e8n+5gNoDujHzax7+2E+/LrMybu6D27zNV4jOd3VT6pPyIW5QJ+hmwDQZNRP6MRb0VY
	 6DQfqMofN0zvVsagKgajK0SciyzG9V7a52lEqGLYPddirTJIBSunLLaBJqNSV7xXAD+kc
	 kH7qWi9mlU5YyL/9FKPVysZEdl89tko/QIh+vOHBa3uLvZRHaUWiTgM3TCvbaob3FGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pqshield.com;
	spf=pass smtp.mailfrom=pqshield.com;
	dkim=pass header.d=pqshield.com header.i=@pqshield.com header.a=rsa-sha256 header.s=google header.b=E38VOoas;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6504606A327
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 15:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6504606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pqshield.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqshield.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pqshield.com header.i=@pqshield.com header.a=rsa-sha256 header.s=google header.b=E38VOoas
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e10a70540so1513681f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqshield.com; s=google; t=1792511175; x=1793115975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4KdIyx5wd3lW7yQNQkMYWV0DoFONhgCwEzOBtMGwk4=;
        b=E38VOoasEpWAnLvnZ8WivNqYKBz0bimAwdacr+8ZuIcKJ7k3AW3YwjK9DUIuxdy8W8
         SZudXCakreIjQc7lFLgEm+Sz+i/ZJ9SA9Cu8TvgP4anK7YLb2sJwx7auHAHjegDvC2Ua
         aM/yI8rNmkNr89B+Lt++Id3WKJYSiI2IfxsA9UKEfPo5/uKWvfnen22hsctlYbk1Kjhs
         fGsiVBZXNN/vXWOyK46A7URtAoaXh/Ix7zmDKvgZ+TM2T4A/8+7qyi9DOv38vEvmJs56
         qa5IKadnUwLUQLK5FDkyHjxpGL27OsG2taw5UBBJo9MybCN5GP2B5NV/sHU0yymHo14K
         TQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511175; x=1793115975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c4KdIyx5wd3lW7yQNQkMYWV0DoFONhgCwEzOBtMGwk4=;
        b=vvlGnIEECmp9o82SkhVMuNcU+HaPKvdVSJv2f0qTULI//vt0HNti7al8chVjD9PJ7e
         5HqCR9eAnDOx52JVmYBHelT18DMG7xlPC2/dNevWujDp7QFLZugVqgcPzzAULWCAi951
         6tVE1WMx2Qru870hT+E/3dlU3EYia42tEnNAg+dP2qgbFwWIVkKOETz4zC7ayzsH5FKj
         zKmewTCe3kdZ7eze45a7cuXgMjuOlMW/lYYSJ9n62yY6QW1G+2IIG4oFwLD3jgKH9Ia6
         lOuTAzu4H0C6gAR/ALmO1sAPkjOr21CctnOYwjcl7xQpG3317UoKXoJQP31tF+/ZzdMJ
         U1Hg==
X-Forwarded-Encrypted: i=1; AKwUvByIA6VJKSytFxA7c/roce7DL5aEzq/FufX4IUU1gibIxrtJYeEeqEJOjZGUDNTN8cYtdlaxaT5HQsY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoVoU3n5XTkzxgj++3RV2jHPJ4GSzr+hrXDtDQsQS+rwZ6MVCq
	5bbdE5R+FL6h5ndpsQXjMF7pon/5KLivE4P+ia7FgqpZeGdklBjVi6Blik8W6LOWGSU=
X-Gm-Gg: AYBFou1Ubi44NHlndHUkDQuMER50Mkb/Nq6NTsNIbRxrHBThdLb0jdK6eZK/dQrfV9s
	8u2yvKZv6LwrNU3QMOgypARufW6R7szfGa2tjYrBh2Ao7Yn1dd2ptkr9PgmFtks8LLeEEcqtc8K
	ev3e8unTrbYkgUhTisQkhXsoSt7l+GybnhwwCoB3tgKmOuEHQf1g8ddXWIYtv/uMCMXgxp5NOXx
	X3ITDJS1nCYuOrbztrMiFCUkqJ+Ku17OPs7XjatYHnpVNH2vtXhh5zzn8F4OsXv0tgznxSBM3Yt
	Q2Fm6aeC32/QNhS8ZFRfYqNvg/+2EXhildmNyagTE+x0wZNTTGv+dA/BjivKSFKHVcaJB6wSR29
	M7LBjHdaWA46Qe2xQXK4NixRgFsGjADzYezher/2SAC3iZHvlyCJZAhO9Enzm707tHItW4hRtke
	a/L4llHJ0VGcVvsgN8aU/Mw5w87ZhSjkLViWW4wl2aIaELCscD07A/RsEl07oxrlktGKP7oKHxT
	9E+TAzdRQegiSdArgJ6tl1XbvF9og==
X-Received: by 2002:a05:6000:605:b0:488:89c7:31aa with SMTP id ffacd0b85a97d-48e07fa5687mr25408992f8f.39.1792511175008;
        Tue, 20 Oct 2026 08:46:15 -0700 (PDT)
Received: from lucas-pascal-pqshield.home ([2a01:cb14:182f:5c00:2ff6:a03b:2ad7:1e40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82e23asm7291445f8f.50.2026.10.20.08.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:46:14 -0700 (PDT)
From: Lucas Pascal <lucas.pascal@pqshield.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usbip: vhci_hcd: store seqnums as u32 to fix lost unlinks after 2^31
Date: Tue, 20 Oct 2026 17:45:57 +0200
Message-ID: <20261020154557.597177-1-lucas.pascal@pqshield.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3237a1ae-c38c-4544-97c9-0dfaf0a0bc94@linuxfoundation.org>
References: <20261019151537.112304-1-lucas.pascal@pqshield.com> <3237a1ae-c38c-4544-97c9-0dfaf0a0bc94@linuxfoundation.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Shuah,

Sorry for the duplicates: my earlier replies went to you only, or were
sent with HTML bits by Gmail and rejected by the list. This is a
(hopefully right) plain-text resend to everyone.

On Mon, 19 Oct 2026 at 21:06, Shuah Khan <skhan@linuxfoundation.org> wrote:
> Can you reproduce this with usbip_host and client exchanging messages?

The QEMU test I mentioned may cover that already. It goes as follows:
- dummy_hcd is activated and g_zero is "plugged into" it.
- Host side: usbipd + "usbip bind" hand the device to usbip_host.
- Client side: "usbip attach -r 127.0.0.1" imports it through
  vhci_hcd.
- Transport: the real usbip_host <-> vhci_hcd protocol over TCP
  (loopback), no simulated peer. Same setup as the production machine
  where I hit the bug.
- Traffic test itself: I reused the usbtest test case 11 (unlink reads)
  with 3000 iterations:
  /opt/testusb -D /dev/bus/usb/<M>/<N> -t 11 -s 512 -c 3000
- As I modified vhci_hcd->seqnum at INT_MAX - 2000, the test crosses
  2^31 within seconds.

From there I can think of other tests:
- using another test case which does not focus on unlinks (case 1, 2?),
- host and client on different machines.

Would either be helpful?

> have you noticed "seqnum max" messages in dmesg while you were running
> tests?

Not in the QEMU before/after test itself. seqnum starts at
INT_MAX - 2000, above 0xffff, so given the driver code it won't trigger
the message:

  if (priv->seqnum == 0xffff)
      dev_info(&urb->dev->dev, "seqnum max\n");

However I did see it on the production runner server, ~20m after it
booted. The counter then kept going until it crossed 2^31 a month later:

2026-09-15T16:01:36+01:00 fwtest35 kernel: Linux version 7.0.0-31-generic (buildd@lcy02-amd64-060) (x86_64-linux-gnu-gcc-13 (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #31~24.04.1-Ubuntu SMP PREEMPT_DYNAMIC Mon Aug 10 09:38:02 UTC 2 (Ubuntu 7.0.0-31.31~24.04.1-generic 7.0.14)
[...]
2026-09-15T16:24:45+01:00 fwtest35 kernel: vhci_hcd: unlink->seqnum 37862
2026-09-15T16:24:45+01:00 fwtest35 kernel: vhci_hcd: urb->status -104
2026-09-15T16:24:45+01:00 fwtest35 kernel: vhci_hcd: unlink->seqnum 37865
2026-09-15T16:24:45+01:00 fwtest35 kernel: vhci_hcd: urb->status -104
2026-09-15T16:24:45+01:00 fwtest35 kernel: vhci_hcd: unlink->seqnum 37867
2026-09-15T16:24:45+01:00 fwtest35 kernel: vhci_hcd: urb->status -104
2026-09-15T16:24:48+01:00 fwtest35 kernel: usb 5-5: seqnum max
2026-09-15T16:24:49+01:00 fwtest35 kernel: vhci_hcd: unlink->seqnum 75555
2026-09-15T16:24:49+01:00 fwtest35 kernel: vhci_hcd: urb->status -104
2026-09-15T16:24:49+01:00 fwtest35 kernel: vhci_hcd: unlink->seqnum 75556
2026-09-15T16:24:49+01:00 fwtest35 kernel: vhci_hcd: urb->status -104
2026-09-15T16:24:49+01:00 fwtest35 kernel: vhci_hcd: unlink->seqnum 75557
[...]
2026-10-15T17:31:35+01:00 fwtest35 kernel: vhci_hcd: unlink->seqnum 2147467545
2026-10-15T17:31:35+01:00 fwtest35 kernel: vhci_hcd: urb->status -104
2026-10-15T17:31:35+01:00 fwtest35 kernel: vhci_hcd: unlink->seqnum 2147467547
2026-10-15T17:31:35+01:00 fwtest35 kernel: vhci_hcd: urb->status -104
2026-10-15T17:31:35+01:00 fwtest35 kernel: vhci_hcd: unlink->seqnum 2147467551
2026-10-15T17:31:35+01:00 fwtest35 kernel: vhci_hcd: urb->status -104
2026-10-15T17:31:39+01:00 fwtest35 kernel: vhci_hcd: unlink->seqnum 18446744071562096407
2026-10-15T17:31:39+01:00 fwtest35 kernel: vhci_hcd: cannot find the pending unlink 2147512087
2026-10-15T17:31:39+01:00 fwtest35 kernel: vhci_hcd: unlink->seqnum 18446744071562096629
2026-10-15T17:31:39+01:00 fwtest35 kernel: vhci_hcd: cannot find the pending unlink 2147512309

These last numbers show the bug:
- 2147467551 = 0x7fffc11f, < 0x80000000 - the bug doesn't trigger before
  2^31,
- 18446744071562096629 = 0xffffffff80006ff5 - the bug triggers,
  seqnum > 2^31 are sign-extended with 0xffffffff,
- 2147512309 = 0x80006ff5 - the expected seqnum.

Thank you,
Lucas
