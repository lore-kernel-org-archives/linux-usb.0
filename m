Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC23A386C0D
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780825893; cv=none; b=KQPJtJym9sESui4wZt37nrRCxv1esVUYA6oPZCsNAY/fPg5Vh/Hhshhil8V0MFB9YS66vCKHJFBoJCTSbVLpm/DaZD0/QzsW2VQxjaB7CY58gIDmnEuxEQHmjXdBF0+W6g9T3ROFvuZ2Y5X3qPHfsNhwMFfZXW9lVRWu/euZSjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780825893; c=relaxed/simple;
	bh=i1oCpfdFswALacqKWEmloOwuDuQecUWVE49heEfU014=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dMiC6bE0JUv/JiAA9cyZT+G9PEyJ7JjpUmxEaU0GPoNM4G9MXl/fnsldY2IVyDRx69Env88OZJwhTxVVMGM1agHpcuBE1s60lN8Kush7A9BpFptSngwhb9OXh5GB8H83oRDwswYjPoTX9metHXRmnxEs/nmdRUUvgSmGTfWxOyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Znyv3Hmq; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Znyv3Hmq"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8423f869421so2540440b3a.3
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 02:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780825891; x=1781430691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZHHpy1q3ydpA2HSp+30PNQez/ja9FOTHakLXuwR4NM=;
        b=Znyv3HmqTjKyuCY+O3O6ouCk6TOtSkW8eiuXLoptskWS1NMZtNNC+m1kulYWGKz3pP
         DxzYGvqoCQ9jvFdNYpxK8+sGqWECqKGYgTcuT8a8ykh9Ssc3Cy6ZU9AMdIGD9rIO7+ZP
         WRCsOh366t3p6UDxhKVuTQnAknTAhVhmz9hV+CwqdjEoO2DWrCtrRuHpu2JnZLd9zYIH
         vVx1+TN7mASvd3zo43KVlQlGpActMTrbNYusgSXryePav56/eym0F80+CpqFAkWNJwzI
         tH3NP4qRFq39Kk31GXNxFZ3yYn35R886ybRURqRIruaEYbjdfv3lbxzEap6ialpbxYQs
         saAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780825891; x=1781430691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZHHpy1q3ydpA2HSp+30PNQez/ja9FOTHakLXuwR4NM=;
        b=aaRrS3AE5/is4ysFTCV42k+9QWbgVivnT3GSrvrQDkJ0/i9A3mmkZoVJfMme/WXqAS
         TTAvfsOybDB+jzNjjFMThzFhnwsoHqHL73UyiRb+vxi3A36X3ERSGW0FS18v042aY9ZI
         Ks3plFj3HuRe4kyNbVYacWvl+77ONce7tbSkOedglO773NVU/j3qZdCcE/WDvZgBFf49
         EU9GvFekCTgQmlDEuBzBoZuTw2rv51GMBfjNy8UTiwIz7b6T9qikS6jfXRMQecZLSYXZ
         26yU2Wl1yyMFZ/NqlD3corrXglkWGVIdn+ov7YIgwYAZGwa9cUbBXIHGD8DQEU03lpbp
         8AWg==
X-Gm-Message-State: AOJu0YyWxH7FL4NGBkxCys5D7evv9NLLUHKSmR+LbddMzEnSem1Zd1ww
	yIY+FWr2JYpdr6w8IjUBAKvu7hxcNIxUjREt3EK7gZPNm2qdfJq1k2DYEt10mQHK
X-Gm-Gg: Acq92OHq3PgUnqDGokb+UE9ip3rWyQmA0XcXdGL2GXqNJR4jIZhH1JRPO7194O2xkXH
	ri72xoqFNZOLJJk5iaC6OlrhDMDwbHNF1/1lW3LiUqqgD+Gwt1ka6lg7J3oQdoeBaes99P9POeu
	+kFJYkqWw1yRUfdNlXCSipuwkNIfZLHuG3WnnxtDMudEZEMrqO+7dYkwQ7dfR2LcJ1DgVymoBbo
	Ayf4OTy5LSMb7G/DDdX5/cxN25IImSp3AJzHdJlcDzh6rniMHW9/yhtTmaHYH8hvCxRLfbHo+77
	+YZcZHEJD4QL1KRLEnZ3RPsDoeH4C4v4zpSk2TjMP94gBj82h4khntPmkZcRb0VD6vGVU8OejvM
	5wPbga8RGFem2YYQg3rFFtYWLUg3DBwKJkTsNMkP79VVTeD30q4pdvXZvGJOzHICwEBHDdgBfv2
	ljrf2FdEYJRJhZe/zmD+9EAlYW47kK/t9IuVkWf1dvmFP1XHXWrfhN3Lg+Y7ds5/fH4N0mdJe9U
	Oqts2pe86pmHvYFLLFqvrQUkl8=
X-Received: by 2002:a05:6a00:9286:b0:842:4023:42c9 with SMTP id d2e1a72fcca58-842b0fc08c5mr11266234b3a.41.1780825891034;
        Sun, 07 Jun 2026 02:51:31 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282916b10sm14629670b3a.58.2026.06.07.02.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 02:51:30 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] USB: serial: kl5kusb105: fix bulk-out buffer overflow
Date: Sun,  7 Jun 2026 18:51:14 +0900
Message-ID: <20260607095114.9375-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
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

