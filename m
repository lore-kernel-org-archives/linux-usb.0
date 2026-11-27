Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776057;
	b=sG87WK6WD/KF+LovDo0cDt9I/94wGgK6RFWxkIQ5Bvs17C4KxrHRjbLc1ETpJQ7JaAtz
	 0uFUvA7Jyfle5mSj0y2q9daR5HZv8y3Shhz2zXr1fBtjHR5ktMz2tUIeVYepAeO0QdLpa
	 Sibga2L/hfnvEb0j5GAwjIEm89euNBuS3UcSmeE48GT7QUge/nRxx86nHRaYhUbrwCimm
	 m5h/QNiDaMc/Hn+L/F3JMtfXJdZv8VLbv4EaFedfvkwQQnQ1KAZrFQE6LEFzdSPuClBHR
	 Xd8rCLKklxQz9v6G/i0Tsf4DJ8HdtpETPC0Lnp6QDmEBggKLuMyWxXyytNXN/xnkNgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wRkg1D7v1brwh6BLcrTMSeTk04sUpCGspFqgyNeqWI8=;
	b=wdU/m19nELTQx6mHJ420Ld7/87T8o+or/k/Pie4OYk1zVyYPQmmWcGdZeTd0flK4IPfQ
	 v7mkjX0ocxL9PixEdVoQw8Tz75lKalDxHv5rC2hRu2RL4FUu2Dl2087V/khn3+was9+e1
	 ly4UeBFYeTS1wWVBGVhccFsNzAhlBePAuj6O75/ebLw/m5nIuBpbJVRQSLRP6nQh0Xup3
	 4ogWUDdz8qtxhe4qeBOTFSYvxsQsOTqURJr2RVNDgSRVQSZmBXHPaq9i2ksAanInGB5ZS
	 vRH1BAOB4end2AHcmKuCj5PkKAzrD22oPT/KSRoDv+OXudp4QJhP7zCLQLDdOkQAIgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=oDg3528d;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42B5606A321
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 10:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D42B5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=oDg3528d
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so64325685e9.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 02:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795776055; x=1796380855; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wRkg1D7v1brwh6BLcrTMSeTk04sUpCGspFqgyNeqWI8=;
        b=oDg3528dyAW8e9kVjWy29tU6J/vo4YknP6bAWy1omIXFeopNkGNZ3jgIHz0atznFFu
         z3VETAqk2ybQzDCygmuHXUJDsz60KFbKZ6RDCHm9cThLBESXvxcFYILshyMNvkghk8US
         WE+J27T/4kyuAFUsC3U3/ztokkMSEoRb7Ba6wJxCgFcWSsirfXlU1cdKF6lY3HEA7TjY
         Gg8VBe3YgfbNIWgX35fQ6oyf1mNX5xvO5CKODDvK79YT85zKfV75jRmThMk8Fx6FrABY
         JWLDAVCF/SEywIQHEsiSxhDZyRl6Fd7dwo9rB8AoMtee8UeK8NdZj7+l9Nxh13+vnmTG
         oy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776055; x=1796380855;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wRkg1D7v1brwh6BLcrTMSeTk04sUpCGspFqgyNeqWI8=;
        b=BTLicAGA/tnOSJbV9J4/D4YmB1cFHo5+zMsRA54HG5j41hUAlpeDMhSrbhlj4ldO5k
         9qZCZlM7jRQzkpB3ypm3eSoi6D01Ok4lnvDUwgkjYSU4NBXTl0z3F+TQvb53BSCiq3GQ
         rSZjIj/J1QDcZdp3uqwgGg/geqSUUSZItQa+/5zgG7bwcV4NUgW+xAuTmfIH9xRC8Ybf
         SX2quz7ZKDmaqBti3HQB8K5CVMKuKMaUSf8d/VqUrl3FIvAhuBBbx1jOqadcJhFEG7Y3
         6JZ5P5HFSe2vHmBTaF0o0LdsWLR2jJqkvCspj5j212xB2N9FWiZ4usbVFfpIhWLiFSDq
         /jTA==
X-Forwarded-Encrypted: i=1; AL+hErEtmDtUz0FEL89WcQ7y9BTspCNxbQojKOt7ZDzbeSQJAcGmKD2ruum8+z4X9hQQ8qIvCxv8EpT7D28=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LD/V4yYi/FUIZEZAiSOOZ8ihQ2DGHbbxGYMfZ9o9UqtzHAHiJ
	e925ZLs2beHj3dRC3Y7XVZe39e7BZbRUK3zinH+1TCDImOmSv4gLtlsc1VKZUwTxLC0=
X-Gm-Gg: AZFdTZf3EWTtjU+c4ZLiyU0TogvVve1QsrxHQsR8572sP4i/wBonMRsGTr63QLAQm9a
	MBg4kbcVLIpN7MkPMbgLoeIW5CJzrVttjf8xcnCJMT77cvIYMGE1U4rLMaZfOTYoCsgDij2f9GI
	XxvZitcft7STe9tR31Co1ZntZ84Vno0ixUX92GdkkKyIRQZXVsI5XBUEZspt4pAQ9o3XFs0NRu1
	go1mFSYGntRSMdBw2tB9ULwtn8A/sI6nGaVx+8cLDEddK4MgCSn9HKUwdNeAo1+JbFguf+JZXAs
	SSSYiYeLvAtGmRyM2tDUtJhzQdxHg0eUxRrabpGUmt3SfnJP/i6+rfOvi1UP6xcjEjUCDkZYyu+
	jNwRPlnoRT1MQzsfTXGWwD80Tw9cL1RKR76WGT2aDUbP5DSeJ8R7SJJpO7Q0DQbRJAcG38JAzpF
	YRwnbvmbubLq5h64Cr9uxKu1OBS09GtMY5hlyzNlhmZw2AbLhbJ6f8qnV7P1/A1CXpTSve4HXj9
	X83xpC5CPSmTJqDiDGrhkNdxahs9Ek17V2yVtna9QQqzpnNpuUxv8XNTPQfeV2fph/djOS2JXac
	w6kKkDt9Ht1qTOg/KND6mqWPsXn2Z+uoSr6caVr18hoDFe/VheDN4YUN63Jn8tdU2E3YxbPA0bh
	hYSpi0LsX
X-Received: by 2002:a05:600c:530e:b0:4ba:eb:eb9b with SMTP id 5b1f17b1804b1-4bb8880aba2mr474922345e9.8.1795776055138;
        Fri, 27 Nov 2026 02:40:55 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm45597649f8f.32.2026.11.27.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:54 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/6] usb: typec: fusb302: Make full PD 3.0 work on the
 2.0-only FUSB302
Date: Fri, 27 Nov 2026 14:40:45 +0400
Message-Id: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WPy26DMBBFfwV5XVd+AHZY5T+qLDzjcXCVALEBt
 Yry7zVBfey6Gl1p7uPcWaYUKbOuurNEa8xxHIpQLxXD3g1n4tEXzZRQrZRC8bBk0OWeac7jkpD
 QTVxI1NYjgtKCFeuUKMSPZ+zbadd5gXfCecvaPvqY5zF9PntXuf39U7FKLrlqoYFArgYFx3CJ0
 0TpdaCZnR57S6LbUhjmvfoXoRDt6Zr3W7qUHB1ciON4vfK6DYqMoRql7cqav/DfTtn+7IrpxhM
 5zymlMXHrNLqGwoEAu1VtbnB5j45zV2nvLZqDcAaMUMaB901rSbceGrIqBEfOoDEF4vEFRhagz
 JABAAA=
X-Change-ID: 20261102-fusb302-getsourcecap-01c38dccb230
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao@google.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5860; i=alchark@flipper.net;
 h=from:subject:message-id; bh=h+EGZKpp9eX6rEcjqbpyOrZBNDQRM7p40IXhJq9S+Co=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRzxpnZRDF+FFvcsye3+dqvFWKu5n4OixcGHnNZGvoyJ
 sHYy3x7x0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPd+ZThf0L64q3Tt568vq9BZ+W2DxOK7pjUffsmnzbz6bEL/kud/8gxMrxdvjz
 vF+vn+v4FN58Er/g23axd2HLH6V2b6kN2ra48MYcLAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The FUSB302 implements PD 2.0, whose Message Type field is four bits wide,
so it decodes the PD 3.0 Get_Source_Cap_Extended (0x11) as a GoodCRC (0x1)
and never acknowledges it. v1 dropped the message, which keeps TCPM in
step with the partner, but leaves partners such as an Apple Studio Display
soft resetting over and over. This version acknowledges it from the driver
instead, resulting in a proper PD 3.0 contract with no resets even with
strict partners.

Patches 1-3 keep the RX FIFO in step, which the rest relies on. Patch 1
resyncs the RX FIFO by CRC after a flush cuts a packet short, patch 2
drains the FIFO on each interrupt, reading only while CC is idle, and
patch 3 reads the FIFO out rather than flush it as PD RX goes on. They
fix behaviour as old as the driver, which also causes resets on attach
with no Get_Source_Cap_Extended involved, so they carry Fixes: and
Cc: stable. Each builds on the one before, so they go to stable together
and in this order.

Patch 4 handles interrupts in the IRQ thread rather than a work item, as
suggested in review of the switch to a threaded handler [4]. This has a
nice side effect of slightly reducing the latency, as it cuts out a
context switch and makes the actual IRQ handling code run at realtime
priority rather than in a normal kworker thread (which sometimes queued
behind other tasks in my testing, causing missed protocol timings).

Patches 5 and 6 are new functionality for PD 3.0 partners. Patch 5 sends
the GoodCRC from the driver, 2.2-2.8ms after the interrupt over a 400kHz
I2C bus. That is too late for strict partners (such as an iPhone 17 Pro
as the source), but still often produces a PD 3.0 contract, because the
partners retry unacknowledged messages three times, and the software ack
sent for the first one lands in the window of one of the retries. Patch 6
is a pile of black magic to make it work reliably in protocol specified
timings, as long as the I2C bus runs at 400kHz or more. It reads the
status and the head of the RX FIFO in one transfer and keeps the GoodCRC
pre-staged in the TX FIFO, all but the TXON. The GoodCRC then goes out
0.4-0.9ms after the interrupt, and gives 100% success rate in PD 3.0
negotiation with the iPhone in my testing, with no resets at all.

Patch 2 was sent on its own before [1] and is folded in here, as the
rest builds on it. The issue Sashiko raised there, an unacknowledged
Get_Source_Cap_Extended reaching TCPM only ahead of the Soft_Reset that
follows it, goes away with patch 5, which reads and answers the message
as it arrives.

The series applies on top of [2] and [3] (also recorded in b4 metadata).

The verbose code comments are there to keep Sashiko from suggesting,
over and over, things that are not true of this chip or the broader setup.
Happy to trim them down if required. Note that I ran the local Sashiko
over Claude Sonnet 5.5 CLI, so it probably raised slightly different
issues than the upstream Sashiko would have (it runs over Gemini 4).

Tested on the FUSB302B ports of two Flipper One boards (RK3576), one
sending Get_Source_Cap_Extended, Ping floods and other messages to the
other at either power role, with RX FIFO flushes forced mid-packet, PD
RX turned on late, and suspend to RAM with interrupts arriving through
it, and against an iPhone 17 Pro, which is the strictest PD 3.0 partner
I have seen so far.

[1] https://lore.kernel.org/r/20261102-fusb302-drain-rxfifo-v1-1-bd9b232ab345@flipper.net
[2] https://lore.kernel.org/r/20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net
[3] https://lore.kernel.org/r/20261123-fusb302-irq-read-error-v2-1-5539a09127d8@flipper.net
[4] https://lore.kernel.org/r/20260312120418.99U0NPWL@linutronix.de

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Acknowledge Get_Source_Cap_Extended from the driver instead of
  dropping it, so the partner sees it delivered (dropped Heikki's Ack,
  as the patch is new), and in time for the partner to accept it (new
  patches 4 and 6)
- Fold in "Drain the RX FIFO on each PD interrupt" [1], now reading only
  while CC is idle (dropped Sebastian's Reviewed-by, as the code changed)
- New patches 1 and 3 to keep the RX FIFO in step, which the rest
  relies on
- Added Fixes: and Cc: stable to patches 1-3
- Rebased onto next-20261124, on top of [2] and [3]
- Link to v1: https://patch.msgid.link/20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net

---
Alexey Charkov (6):
      usb: typec: fusb302: Find the next message when the RX FIFO is out of step
      usb: typec: fusb302: Drain the RX FIFO on each PD interrupt
      usb: typec: fusb302: Read out the RX FIFO rather than flush it as PD RX goes on
      usb: typec: fusb302: Handle interrupts in the IRQ thread
      usb: typec: fusb302: Acknowledge Get_Source_Cap_Extended from the driver
      usb: typec: fusb302: Acknowledge Get_Source_Cap_Extended in time

 drivers/usb/typec/tcpm/Kconfig   |    1 +
 drivers/usb/typec/tcpm/fusb302.c | 1036 +++++++++++++++++++++++++++++++++++---
 2 files changed, 955 insertions(+), 82 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261102-fusb302-getsourcecap-01c38dccb230
prerequisite-change-id: 20261103-husb311-cable-comm-46f2e77e4c18:v1
prerequisite-patch-id: 2ea442b68dfeee84c38efb27749d2f40487d2fff
prerequisite-patch-id: 00acfb9e5b26f7f594c64b6ec87fbc5badcb59ca
prerequisite-patch-id: 398e6c15de4f0c6fe4751176bc4ffe0fd1a4e58f
prerequisite-patch-id: 134a18c9c2e06dc019aba39387bff53c94dc415b
prerequisite-patch-id: b2e7a13203fd30a8c71b71a4856e7cee7a1bef19
prerequisite-change-id: 20261116-fusb302-irq-read-error-8a3ca5ef9ebc:v2
prerequisite-patch-id: b484440b7ee2dc68c6e5561a71804b5de607f178

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

