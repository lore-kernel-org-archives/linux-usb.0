Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795619273;
	b=jXLOqglmtlq7iuGBjgQ6qVImEMiHbjBVSd6Cgi3loqiJu4VZLAG1dpwPb9hw+GW0WJ0Q
	 MiHIHdHg4KS/JbgjwoR7nST2xM62DTB3/ljA9l3vxq3exB/TTk0SoDtC6a+GnCUnZTbo9
	 KRImLewZLUDzz1ypvAGM6S5rd/R5ZlO9y5unoDqHYvnYz7Y03qnl6j3iIIkH+J79JQJhU
	 o7FmHDEYxwoffwsGmnAtkWGxGbY9LZ+3YLi4jjm41cjuBzSwi6Ws7Sn0ddeweqXfgwIbv
	 BgVNM9Vp8hv0fBMXx2BtEYFAaEPg3MEVC3Bkxj7A7TCO0guw10GWl16dPtbVBWOuG9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619273;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=+BXM+qxfZg+vzbMVPzIkBfgeJqU0Ixp13bYvZ0r4Nlo=;
	b=uTqo+4FONcOo3yEiVrMv5KYXWjZ6IKrh20VQoZdSartxu+CKcoTWi9UIBnhMRICRDQAv
	 hT3XL9YspDilKMRJvSDEKX1YiCsN0lfwRUQV0JcYU6LMshXMv1PQn2ObbUHMz9V1l/RQe
	 Rkxdq2k8uIy5kc4aoD84PUk2/cuKRT1LqfDk/ksa+0++tVnUx/RcsYC2YCLN6IFlh2H1S
	 +aMWe6Q/oR7fJoua7NJeZvtzKeMhwIodFJU60n2/wrDo/j6gngY7UoKtyoaMdvUJA80kX
	 ouvng/LCmTAapbdOz5TGkt2h4VUvhNo/NzgEZNxI0c2oRk5saVTnFjpb6M1qJZ/6/yQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngILTgMs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B13A606A326;
	Wed, 25 Nov 2026 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngILTgMs
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795619273;
	b=Xv/4o7ptSfsdIbVDqn0pDoS3lu7gmBM9CjsPynDKOjvmcUM4ett2FDwDr7qguh8a7YDU
	 8FBxQp1xEppDTa958Le1gQvad5y4GhXdpXwsvj7KTEhGZvDPm5Pr0y8Zv9akgXy2ea0GO
	 H3vUGU988WBfWONpYup2gDt6Yab+WOTCjwf6YU6tvaFxIUVh/FIP3nN2P3WIPEkiEylID
	 U1350T8DiNQIqf8W5Ti4iUvGw67KWJ7Zuz/oXILFmsKSdor4I0Ih1u3D89O22nguQpTgU
	 0b5lYeUjFPMDWqa6n1oa3mH3rol6sg+nRE0uPBoTnviDgg4Nr6+GDERRdTDB8w11nNw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795619273;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=+BXM+qxfZg+vzbMVPzIkBfgeJqU0Ixp13bYvZ0r4Nlo=;
	b=XGiMKpej2XnIILWgrRn+0yz2V9KtR3bhxghTDd7IKhjKDBEgKofXhcejO4L8YOoXbd5/
	 dtmOYxozjfhulFNPoVbLOXaXvq0PC9b7PUZhQmGzga1SPK/E86B+rI0H4awCK/ymiVrUY
	 tnx0TcRWKuQZ8WuZmndeMARWWkkjaXXEEMSjRZKwufIoiYhdlFk5ItAjMR3S5cdLk6dSr
	 DSO2GZ0JL/glqAJSdcYEJvObedEOqBwgpIqh1aPNWwi0HQi4tOno+/Ghd8svQhAisPpV4
	 9ql5F+n+61vOMF5++d8hssr42SRBYbIjRraorHAlDTRQ+VFI+fda3gPk/zENmuWcXyg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 473541F0089F;
	Wed, 25 Nov 2026 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619273;
	bh=+BXM+qxfZg+vzbMVPzIkBfgeJqU0Ixp13bYvZ0r4Nlo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ngILTgMsY+Ixfc2j8Zm58eNuOvbSTzyOXhIxQHPUCLaRxB4Gj0A83c4yZ0k/DfAfP
	 4RqBlJ0uBJr2sHxATIWR/mu7SViBABx8lYcTVZNxFiDySS7sjFiTf7M8FVnBKkDA6P
	 GXnmS6Cpo/QjrOSdUxTN9VLp6+S7HJ9Yqc6qezyV4GhEmrazDLZX9rzqLwwkraW44b
	 dYHCH6hZzx2gOw29M6oddqRKcXLDQJnWUk0ep6u1DFnS46rSnSAAojePrU0C/t74ze
	 8yJHHaXUe49K5eaEKkUtK6M+f74sIV8N+iRXTihXQpB6dQBuZOcWGpHWqC5KSYhNIo
	 NCDfMV/nT8mQg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 983824CF23;
	Wed, 25 Nov 2026 15:07:41 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] usb: gadget: u_serial: Fix the console request's
 lifetime
Date: Wed, 25 Nov 2026 12:05:25 -0300
Message-Id: <20261125-u-serial-console-dequeue-v3-0-b47f6e401dc1@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NwQ6CMBAFf8X07Jp2gVI8+R/GA5QFaoBqC0RD+
 HcpJsaT8TjJezMz8+QMeXbczczRZLyx/QrRfsd0k/c1gSlXZshR8gwVjBAeeQva9t62BCXdRxo
 JqizNeK5IpVqy9X5zVJnHpj5f3uzH4kp6CL6waIwfrHtu7UmE3R+ZSYCAIo5LqRKVyAhPdZeb9
 qBtx0Jmwo9ICMQfIgQOCnkVJYnClOS3aFmWF86HsmwbAQAA
X-Change-ID: 20260928-u-serial-console-dequeue-f9790a8e87c6
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neill Kapron <nkapron@google.com>
Cc: Krystian Kaniewski <krystianmkaniewski@gmail.com>, 
 Brian Ellis <brianellis@gotenna.com>, Ai Chao <aichao@kylinos.cn>, 
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, 
 Prashanth K <prashanth.k@oss.qualcomm.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795619260; l=4027;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=GSRQ9eXme+cUkxkcRyLB0I8yf+HJuUbsohTGM10rVCU=;
 b=6+t63q/kV4xuCjxfGf5Zm7E31IA3emAkmfmV6ivoBExKLPgePXP5G8UajgvORSHQua+a0SS09
 ovYZyFzqxsKCoXdkTukpiw9Z8ilGsbxtgdyBB3o88O4L7gZw863y2yQ
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com

The console does not follow the gadget API's rule that a queued
request belongs to the controller until its completion runs: it reads
req->length while the request is queued, frees the request right after
an asynchronous usb_ep_dequeue(), and can free it while
__gs_console_push() is still queueing it. Patch 2 frees the request
only once it is back. This also removes the idle dequeue from
gserial_disconnect() that produced "request ... was not queued" at each
suspend, which v1 was about. Patch 2 relies on patch 1: the configfs
console attribute sets and clears port->console outside port_lock,
which connect and disconnect use to find the console.

---
Changes in v3:
- Patch 2: queue the request under a new lock, cons->tx_lock, which the
  disconnect also takes, so that a disconnect waits for a queue in
  progress. In v2, a set_alt could disable and re-enable the endpoint
  while gs_console_work() was queueing, and the orphaned request was
  then queued on the new connection, out of reach of gs_console_exit(),
  as Sashiko found [2]. A failed queue no longer finds the request
  orphaned, so only the completion frees an orphaned request.
  gserial_disconnect() disconnects the console after dropping
  port_lock, since the controller may complete a tty write from inside
  usb_ep_queue(), and gs_write_complete() takes port_lock.
- Patch 1: unchanged.
- Link to v2: https://patch.msgid.link/20261122-u-serial-console-dequeue-v2-0-820f355827e6@gmail.com

Changes in v2:
- Rework, per Sashiko's review of v1 [1]: instead of skipping the
  dequeue of an idle request, free the request only once it is back.
  v1 kept the use-after-free, and could still dequeue a request after a
  failed queue.
- New patch 1, for a race the rework depends on.
- Link to v1: https://patch.msgid.link/20260928-u-serial-console-dequeue-v1-1-b44d68585632@gmail.com

Tested on a Motorola Moto X4 (XT1900-6, SDM630, dwc3) with linux-next's
u_serial.c plus this series, built in the sdm660-mainline 7.2.3 tree;
linux-next itself was only build-tested. With KASAN and the console on
ttyGS0, the control being the same file without the series:
- A host bus reset during console output: a slab-use-after-free in
  dwc3_gadget_giveback() at each of 20 resets without the series, none
  in 100 with it.
- The console turned off through configfs with its request queued and
  the host not reading: the request is cancelled and freed by its
  completion, with no KASAN report, over 5 rounds. Without the series,
  KASAN caught dwc3 giving it back after it was freed, in each round.
- The configfs write racing a host reset, with a delay added inside
  gs_console_init() and gs_console_exit(): one connect per console,
  and no request left on a released console. Without patch 1, a second
  connect or a request on the released console in 10 of 10 rounds.
- A host reset while gs_console_work() is queueing, with a delay
  added before usb_ep_queue(): with v2, the orphaned request was queued
  on the new connection in 5 of 5 rounds. With this series, in the 5
  rounds where the reset landed in the delay, the disconnect waited,
  the queue failed and the disconnect freed the idle request.
Without KASAN, with console=null so that ttyGS0 is not a console: no
"was not queued" over three suspends.

[1] https://sashiko.dev/#/patchset/20260928-u-serial-console-dequeue-v1-1-b44d68585632@gmail.com
[2] https://sashiko.dev/#/patchset/20261122-u-serial-console-dequeue-v2-0-820f355827e6@gmail.com

---
Fabricio Akio (2):
      usb: gadget: u_serial: Publish the console only under port_lock
      usb: gadget: u_serial: Free the console request only once it is back

 drivers/usb/gadget/function/u_serial.c | 200 +++++++++++++++++++++++++--------
 1 file changed, 156 insertions(+), 44 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20260928-u-serial-console-dequeue-f9790a8e87c6

Best regards,
--  
Fabricio Akio <fabricioakio@gmail.com>


