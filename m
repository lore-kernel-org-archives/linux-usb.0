Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BC24A68A3
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400952; cv=none; b=M9HFdcKWN78m9vqzv6D5awsC46NJLlD5pyQkh7CFLS9+3O0iSRWtC4nVybJyajqHoFrWqG5iD7eXqsC5JGQ11gxIEIqnscOO+xd9+Wis9rSkobcYiEE6n1K4ofVLkQqs+aN22BN5wx7IOfipG5xVheGkjSmrcZUpJbYubkwgZrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400952; c=relaxed/simple;
	bh=g3YIZCSmW9GAuNcYS3+rBFyCUZV76NZ97hW9R/Yj5tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scYbUj8kpusQepur7XBY9+kXGhSU+5Q/oSOMH6SfHbzJJlBcZhFCZ4itx5iqmbsbs1ri7123vGth6Kxtfc2L9aiRXn5HEiVTWie7NhvfgdCehsmvIuhxunNRv2DBz55M8/CpI911fibSSt9EWxk9i5I/00QIaSOktmnf9sZAyv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQeHZTSd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQeHZTSd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so5900215e9.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400948; x=1793005748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7CZlbVVy/xg1aRcpbMRq9i2C75IjWcUsxCiERRLUmU=;
        b=SQeHZTSdblheFcUkSg3VbHpbC1/P928UYEiI4678yEkpnTYvFTswKxHW9iqPr8ErDP
         rFws1KmD+oYm4QlEIDntlmqZKB31rEMQVtkxbf1FXxBAEoLONiv+MVNOn1On1ifQym1Y
         Q2oOOAmTA7P24bt7G6SwPcUV1J43hGq2BnkkN3jiMtOlHZaq1AU0HP8pKi889LB370Iu
         2tWoKRyGecNGEYYsJDA11TO8qrqEw/ttTn0tbgCIFMj3cSko+U6/92oqaSYCyjbYiEtJ
         HbDtD8ZX5dZ8EfXXslAAhlQqkHhNj6dafL3H/90CwJvLj02n7VAnzmyc3c0WRDx6wbYI
         7Ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400948; x=1793005748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X7CZlbVVy/xg1aRcpbMRq9i2C75IjWcUsxCiERRLUmU=;
        b=iYhXq4GlOxgiHXkMUVNR96Uz3mm1Eofb9WR0aDbF4N6iWHxwRkumBr41DdgZaXvZgi
         cxBMB88OVgTEaaHf+Jb54hcsl8ugfZI0ercVd/GYka39UuaGIJ/wSAaE9dAqzCx25Ggf
         mAVH+87fXQg8d4vNdym/X+RZ7biA9Iu/vaF0yYWMiPdwy6j/y/wx+a1DoB66dYLt8KuC
         vyg/pf47E8grS+ICUcM2jwvhomhwe2KZY8BA2B3GS0dBGnqUw5ITTCMijaF45g/p25Bd
         zSvFQo4qUqBaqQqfrxvwlfwe8mEXFk/1QXKTsFCdBeuTZlMJ6laFS1t3Pru6T0/d11qR
         Id8g==
X-Forwarded-Encrypted: i=1; AKwUvBxPIOE7cnJ6EL+0OVf6RBBA7q02gM2QSJOMTI9S6BjwZ7goBPl9ZIdC2t3c5Y3gvkHGVH8d4qNXI/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/YNIPdM7b9er2Jd9hGuSr/OEPK2DmINKXPOSWo9S9as6+4Kwu
	E4qgBupZ7A/AYZMBu3wfXg5Qd+ASnHKVPaRU/kzjyQC0BdCEpTx3YR6o
X-Gm-Gg: AYBFou13OfzGQIb49sz4tsmMOmAsiVhud6rfeFKWslRbnkdVLEg+kpuaEC9gHdaO/sn
	PFhPaZhstGapClgPE2+TMN4MYWVq1KeEtEA8iz2r43HFkjPtLHgxNsSquxrCyX6Lg5jv/JuQs2s
	isEIAOeYM5p6bqLVDW/jXlJOEg4oDAR+1sQeDRf11hxXwWQYBaviDrNAvlaqV6Kj8ihqEekX8l0
	I8+cmPDGh5rd3ali2CeJ7VHqojIklQBmy8fJ74VUEv6tOshiIodveWCQqYYyy8b/v0LTtb5UrLd
	Y1xiEU+KaXNtoxcmkqb65hmKUWVDIVVfF9qhv82baIiyYi4aKKAT9TjpLoW2aqxel5sokAxkg0K
	LSr+87hMtIQFu499ljLhzm0UWGx3mfAW4B3N5Db27iTnp3XtWRqPx8Yf005ARj08Zv0jDtmmsdr
	l3L6TsP69go3NL7eeolliWmSfpP4w8HOMNQ9Yqj9l1BLO/RVN4NW0hV3JPU4N4RfIYq+XqipKos
	+M76Rh3phdo2JE=
X-Received: by 2002:a05:600c:46d4:b0:4a1:d2b5:38e0 with SMTP id 5b1f17b1804b1-4a1d760d9d6mr149685135e9.25.1792400948349;
        Mon, 19 Oct 2026 02:09:08 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm174734465e9.5.2026.10.19.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:09:07 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neill Kapron <nkapron@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Wayne Chang <waynec@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Felipe Balbi <balbi@ti.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 2/2] usb: gadget: u_serial: implement flush_buffer
Date: Mon, 19 Oct 2026 11:09:04 +0200
Message-ID: <20261019090904.3264978-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019085855.3259716-1-mehmet.fide@gmail.com>
References: <20261019085855.3259716-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

gs_close() waits up to GS_CLOSE_TIMEOUT (15 s) for the write buffer
to drain while the gadget is connected. When the host does not read
the port, for example because no application on the host has it open,
the last close blocks for the full timeout. tcflush(TCOFLUSH) cannot
avoid that: u_serial has no flush_buffer operation, so the request is
a no-op.

Implement flush_buffer: discard the buffered output under the port
lock and wake up the close and write waiters. As on other tty drivers,
a hangup and an interrupt character (ISIG without NOFLSH) now discard
the pending output as well.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Changes in v2:
    - none, now after the patch that keeps the port alive for the hangup

 drivers/usb/gadget/function/u_serial.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 19eea724280b..187a2598181a 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -822,6 +822,19 @@ static void gs_flush_chars(struct tty_struct *tty)
 	spin_unlock_irqrestore(&port->port_lock, flags);
 }
 
+static void gs_flush_buffer(struct tty_struct *tty)
+{
+	struct gs_port	*port = tty->driver_data;
+	unsigned long	flags;
+
+	spin_lock_irqsave(&port->port_lock, flags);
+	kfifo_reset(&port->port_write_buf);
+	spin_unlock_irqrestore(&port->port_lock, flags);
+
+	wake_up_interruptible(&port->drain_wait);
+	tty_wakeup(tty);
+}
+
 static unsigned int gs_write_room(struct tty_struct *tty)
 {
 	struct gs_port	*port = tty->driver_data;
@@ -946,6 +959,7 @@ static const struct tty_operations gs_tty_ops = {
 	.write =		gs_write,
 	.put_char =		gs_put_char,
 	.flush_chars =		gs_flush_chars,
+	.flush_buffer =		gs_flush_buffer,
 	.write_room =		gs_write_room,
 	.chars_in_buffer =	gs_chars_in_buffer,
 	.unthrottle =		gs_unthrottle,
-- 
2.55.0

