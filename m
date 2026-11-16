Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841274;
	b=WIExtFdIUIaioJ1v4bFaE+gZcD3gH8i0TkNW2vfQrQBliVeGaEf1GFeZa3ea+hhXyewX
	 seol/CQ6SA0dVTezeCOD8RXr+bKQ4MO2uo4ccKqz2L0SjSD++ZoZNg4CGd2CgXKfkcgON
	 6VONUg665DWg704eU5vYQVgr0E4/QVtsRo2L96/JZpaj+ZEZNosMZIEoAPNFXb+ONS5wM
	 Dvg4nQ+3v/CEOHbri7mwoScIrjtR14M1KAwZ2xDFy79tj93OizNZmHy/juUSwTRMSLXgG
	 z6Zj55h2bHF5xFrhOjJGMY5O1equyykfK9dfZ6m7IyJwyelBiovMNHLe2vU7/d36IUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JM1zD3i7LF4wBwdktOmYzhj34P8A1bSegjMOIVKdeWY=;
	b=AQPudoye4J+YzAMaPT8He1mDp4nhzV5oIRz0vYkKop9KcNArFw4avYZSMy311eR/529P
	 2OfbDbwc7FYxKNJW4sFnnxAjABGa8T46YSEA4xYCbaJpbRgvoduk5WD9olJJODFpZVem1
	 w98gZNdmX779EwaRDW3i5BvUKPiSYKfSxVGjngrNXav+Zno/KXWRQZ21NyvoYIptZ3J2H
	 biiFoBppd9Uofiozg+Ku9TmtYGA9AI4QGScCQpYX9oZhOwVcoLjPfbb2+pSYKgQ0pTsRO
	 yngg6xsTw6yvobrZVIhx+AWFQUX+kw1ezOlcw/9NvJNSz3mPMF3RLiZfG9iICoOXtpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0tBilb/g";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED213606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED213606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0tBilb/g
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso20517315e9.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 07:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841272; x=1795446072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JM1zD3i7LF4wBwdktOmYzhj34P8A1bSegjMOIVKdeWY=;
        b=0tBilb/grq0KTWcpgfvZHJEhJHJDZoVB1ZNl6nBMtRzNU9Grh7NXlCcydHsYpJnJgk
         NZ+yisV+ynLlIpvV3XwCmgWkRzI2tqeBaEiNchMgspDWjNESnlqJXrCMLvEMu+LtrM6G
         kMKqO/HJKMBK6e04G2pz8bnRCS/eMrGM4KcGY7u91W9t8GJD5v42D41fYX6Wejj+IGbQ
         nlL7cvjx5ZyJ2Hn2U3MMfOu6/QAFUC6A2iidq7Ha+eskKX5qkDmA9nV5JtipCK7x1otC
         2uD6PLCuXcC3F7Ip/OI4jWmdIYIgMl5AMWLVWHJXbidriX6Y5sR4LUzpaNJZjpU1u6Yl
         h2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841272; x=1795446072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JM1zD3i7LF4wBwdktOmYzhj34P8A1bSegjMOIVKdeWY=;
        b=XU4WIFIasO3kxkQBK4fF8PAyFVKKV6H8mSsPd8zcMPPdrAQpMGbQVY/BFv38+2FzAK
         eWEAqlhPDHSmD8eGd33h0rsC8SGSEKjb/4n5p3yd66Rs8jpcqa30swOkWF3RYWNprTWc
         QN0Pcsgpp9DBH+SYCVPk2NjmquCNGcZlDPvwzjQq5XFyNd4qoz4riRfWDlbf100GZgMv
         F+PnaR/UA981NdC7Yfv6KWe6GkylUjC30NYw+7a5I2hfYEzmSocfbzSkR40LgThzhuxS
         W6jQUrmebR+Kwt/DbHlXsde6Q08/ncN3DTeIRzN847/QLGafOVQ6s1CqlNWaJBCqB6gM
         Kr+w==
X-Forwarded-Encrypted: i=1; AL+hErEHRXCtFTXpZ7TzAUkx5x+Jytr9KqBDJc4tDH1dcXP2sYSmowlQPufQyvooR/cxMaKr4yyCehjvyLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ay1b2DJdRNwg9n1QaiWYN+6cSGgyAebRiK2Ej+Rzkm2mQX9fh
	C+EfIfL122NoA9JJm9pHRbBzsFCVuk9SwlRUqLM/pP2UmCNdiavayxIw
X-Gm-Gg: AYBFou0r5QSr5TC2litWCLdfDh1KFDfkZ+lN6L5WZbpy45YKqVjAkStnJS2gQE2ozen
	xdaW/MugKhs8EkSejkbotqr2vLw+36AGzZYnsYShk5K2m4blA4Mm6M4D96w3I1Ltf4UQLazJLew
	8m2icO31/3QiRg81aUXRO3MizMCvmtf0DeJqy/z/tjWdc90mymMAr39F2YO0Yv3U3VxmzUvT4We
	6EVKVWhsSb2J51sl7w+5TAIo39zHrTfrjcLQnH6wZKTYQdjY0Y8htZiZemWCJtUmaCe73Saq5hE
	74uBIzMbOIgqQim57lU4U2LSbkkITRWQuChnbwEsdz1jNTCdSqRVUjwq/qB0tFBaPc47Oxr0o1a
	s3kPAs+Mp2TMPYQgBE35RlMGBMBph4JlE/5Hx6AbUpFP1UQyxpVha+9+3A4rfVlPDwVF9im8G5g
	/OunWML8Bcd/k1Li8tATaosQxgYijhh8gyh1swuHp6tuInosoXKpeTnVjCcFnPGULphPaI3cSRV
	NRE8yRrzPBbkVYAulIiy5bH5PkqTRRoOe5TlzDaGl7YIP+gpk8sDLXy6+GxduEcW2cr5L6G+8Ss
	ng3ICzJcwPfThLpbPr9mAnN1lbX2r4vnDbo=
X-Received: by 2002:a05:600c:6989:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb68233edamr150358065e9.20.1794841270609;
        Mon, 16 Nov 2026 07:01:10 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm22912555f8f.23.2026.11.16.07.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:01:10 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neill Kapron <nkapron@google.com>,
	Krystian Kaniewski <krystianmkaniewski@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v3] usb: gadget: u_serial: implement flush_buffer
Date: Mon, 16 Nov 2026 16:01:09 +0100
Message-ID: <20261116150109.1474880-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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
    This applies on top of Krystian Kaniewski's "usb: gadget: u_serial: pin
    ports while TTYs are installed" in usb-linus, which keeps the port until
    the tty is released. A flush from a hangup needs that.
    
    Tested on a Colibri VF50: with output pending and no reader on the
    host, close() after tcflush(TCOFLUSH) returns at once instead of after
    15 s.
    
    v3:
    - Patch 1/2 of v2 dropped, Krystian's patch replaces it.
    
    v2: https://lore.kernel.org/linux-usb/20261019085855.3259716-1-mehmet.fide@gmail.com/
    - Sent after a patch that keeps the port until the tty is released:
      a flush from a hangup could use a freed port (Sashiko on v1).

 drivers/usb/gadget/function/u_serial.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 0a304f508bc3..ff912c29d6be 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -891,6 +891,19 @@ static void gs_flush_chars(struct tty_struct *tty)
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
@@ -985,6 +998,7 @@ static const struct tty_operations gs_tty_ops = {
 	.write =		gs_write,
 	.put_char =		gs_put_char,
 	.flush_chars =		gs_flush_chars,
+	.flush_buffer =		gs_flush_buffer,
 	.write_room =		gs_write_room,
 	.chars_in_buffer =	gs_chars_in_buffer,
 	.unthrottle =		gs_unthrottle,

base-commit: 3149e8b3237f58d4dd440fc64c45c93404c4b064
-- 
2.56.0

