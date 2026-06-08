Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C30439C63E
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 09:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909801; cv=none; b=Ek192/7K0P5IngXI5Ns3S3Yiq0TLn0Dcd/MjAewK9d/V3QSEPAwWXVvFmqwMbITZM3rn8vlLiSWml19BJiN1Hzg8IddxhsMLdN8sHWrIQz3lfQh5/r8h82GqETf9GVdKwbSeTpoKMqkJoywsbpzffoU9zY/B2WDm6MXb3i1cpuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909801; c=relaxed/simple;
	bh=XE93PARpsFUC8Fu5iBpHVIPInN7GAPqYBflYnDxSCcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4qaM0YFMIMHooWaKP1G4jbhdFYtQ+6nwjxFGHDD+g5grHUQKvjY2Q6Z1dp1VxySLKwH0gVF82+b2l7z7mHUvtaZ+rIzy6Ap610fByt6WcBbCduhBqgSWzHQJNnq0X0RAAWb0Eu56zay4IWHSyFQPdIHg05/bpaHMEIl8y3dlFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXU5LmdZ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXU5LmdZ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so2996525a91.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780909799; x=1781514599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssI6ZEk3gw66VAN5mRRaeGUv1dLfHJJ6NdyjMb06HLE=;
        b=hXU5LmdZYyiDEn+bjDyaKZmC2hK/FAc53r4Jb43vlhwESd34WxcGddTg32qDUYEwxj
         DX8PKxbfQlHwqZzWtm6H3ltvpmSA/UlkkqwT0xsDMt5V7gVAyP1gnSqMO4e1nx5iy6Q9
         ZARYUt05WzK1GhtUbAw8g/6FIrOA/c6vzy5XGPWoPfMPOapxDGcAAKtSDa59tfRPL9GV
         QAtm2WRc4fRtbDB60Ec7UqbGds3T/LsT0HUoMrqRJ4IHiAIgI9RZrewutX9SSV+HZTkB
         sZImkn+kfrye/Hb7lm6nQeGinZ8e/yyvUouCNjinZK+hLDQHplnoAchYEvun8dKprflF
         q/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909799; x=1781514599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ssI6ZEk3gw66VAN5mRRaeGUv1dLfHJJ6NdyjMb06HLE=;
        b=cLcVuqB6YrhN4DCXfVsvMl8hkazRiueb5/v5gcbSPISyWKWAEetfYA/NZstC4aroFL
         j2RfTcq7mEUOaTQZUDw/MpHE2+bjlMvGfi7SYVMS4y0+yfdr1bXuSdcB/5JDLhnLzU1w
         4jA+ZXfccsrUv+6jfn0KEooJEbsC3ZVZxs5GS5+/PPOMh9WL9IQykR3sOTlBIE2Y3K8Z
         2jBJwXqr102hnLDktTEKgf07sbhoeSFXTB5YCSL0KKoEKUMXd5cFxbKAnpkujeieK5ZN
         GfWBezYlf3ZGqAtfPgmuyl++2QwpMQgBj9qfB+4AzdCpOnIk17CBnv6K0vWwCix9SJWJ
         Zyxg==
X-Gm-Message-State: AOJu0YzrV5yArx1BH1unBs1fHZPU/NqQ72sBCtcrHjQfjm0mZHNbnuY5
	gud/kglMqQ4NG9ekgPrL1oY7nv0YuVC/0onmiKTqd3S97sjmQQ2kfBvH
X-Gm-Gg: Acq92OEuHo5pUo231PO69wnGEev5oot2kNvb3PrH8YFMJcL65t3mn6HRtchl8RoBGbF
	e3gxuVIriQna0ZgqaJ9BLmER5OMwAsQEwnV4g2COcCgCINUPzOQTuifWajy2mxh5/zDYuCjvgvw
	zqv/xw9vO22Up2mwqRLTVA+tqIWXbeEL1jsT7BXi2oNSHaGahRLn4pqdAPy02f5JG6VOVVMMfeg
	S2lpbBSGf1nKlabWh5yk03DX14/J8rLii7DgwCP0DkUxufAa9D/I1KmLVsUK74pj6H4MoaZaDni
	4gvWxEuGe5J/vrEvzvDtXOF7eEbjBEhMw2kym0cUKp9lqGxVP90X2JfLeCM7YV1ZnOybQ/4B/kt
	xXOSFfSHe2MjweDGo47QdmgUEsieKjSI4T3PBZpJpYWfJaherfHoZfML84Y3I4jMQ5wAEcuylQh
	gDRMB0Q/RzLvZVAuRhl3GYPngOc8lxwg/f5gZpYTmJCCMvkV885WR1D0PVkSKHRuxMCkpQBx9ov
	bA4+R1s3+0SQjbyFmIVSMPg2D0=
X-Received: by 2002:a17:90b:53c6:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-370f162420amr16555954a91.23.1780909798820;
        Mon, 08 Jun 2026 02:09:58 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a29cd6sm15147098a91.11.2026.06.08.02.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:09:58 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2] USB: serial: kl5kusb105: fix bulk-out buffer overflow
Date: Mon,  8 Jun 2026 18:09:26 +0900
Message-ID: <20260608090926.10506-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607095114.9375-1-sammiee5311@gmail.com>
References: <20260607095114.9375-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

klsi_105_prepare_write_buffer() is called by the generic write path
with the bulk-out buffer and its size (bulk_out_size, 64 bytes). It
stores a two-byte length header at the start of the buffer and copies
the payload from the write fifo starting at buf + KLSI_HDR_LEN, but
passes the full buffer size as the number of bytes to copy:

  count = kfifo_out_locked(&port->write_fifo, buf + KLSI_HDR_LEN,
                           size, &port->lock);

When the fifo holds at least size bytes, size bytes are copied starting
two bytes into the size-byte buffer, writing KLSI_HDR_LEN bytes past its
end. Copy at most size - KLSI_HDR_LEN bytes instead, leaving room for
the header as safe_serial already does.

Writing bulk_out_size or more bytes to the tty triggers a slab
out-of-bounds write, observed with KASAN by emulating the device with
dummy_hcd and raw-gadget:

  BUG: KASAN: slab-out-of-bounds in kfifo_copy_out+0x83/0xc0
  Write of size 64 at addr ffff888112c62202 by task python3
   kfifo_copy_out
   klsi_105_prepare_write_buffer [kl5kusb105]
   usb_serial_generic_write_start [usbserial]
  Allocated by task 139:
   usb_serial_probe [usbserial]
  The buggy address is located 2 bytes inside of allocated 64-byte region

The out-of-bounds write no longer occurs with this change applied.

Fixes: 60b3013cdaf3 ("USB: kl5usb105: reimplement using generic framework")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
v2:
- Add Assisted-by tag as requested by Johan.

 drivers/usb/serial/kl5kusb105.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/kl5kusb105.c b/drivers/usb/serial/kl5kusb105.c
index ed8531a64768..e72a0b45a707 100644
--- a/drivers/usb/serial/kl5kusb105.c
+++ b/drivers/usb/serial/kl5kusb105.c
@@ -330,8 +330,8 @@ static int klsi_105_prepare_write_buffer(struct usb_serial_port *port,
 	unsigned char *buf = dest;
 	int count;
 
-	count = kfifo_out_locked(&port->write_fifo, buf + KLSI_HDR_LEN, size,
-								&port->lock);
+	count = kfifo_out_locked(&port->write_fifo, buf + KLSI_HDR_LEN,
+				 size - KLSI_HDR_LEN, &port->lock);
 	put_unaligned_le16(count, buf);
 
 	return count + KLSI_HDR_LEN;
-- 
2.43.0

