Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233504;
	b=fXkLXpbjenxzd3qrBmvzuIPegsrcouLsruTQ2rNVkguTGRTKiL/8fqET+5PvFMRYayhB
	 XJ+VW7vQ0hLnF1Hfzso8nXhUoLpnhrGs/cH8wTJH5i0aC+sSL2VvZTDo3PnUXLm4vqj/E
	 2dqqGXr2M92FPV7a/IHO59Lmjsw5Gz1CFaEL6blgetbXOXFkXdxdJS6xhFdJrs/P7n1oT
	 ALvfgvS0BWEhah9zWIWL0oGPnanmkOuTMLh74ceWgedX4t69HubEXngst9vJHaF0LqLuY
	 311ApQUfmkLMWUqq3O/U5fJgZKNkGgVlitMTmqrhGGO+Dl5WPhpqMkGIemXVt2BylBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OZAb6lnBWKXnQecNrOS09cug5s14VwaaeGt2z/u1g1w=;
	b=dVNfd3fQ0B4hnPZZ7auM8yA2T602Y44GcaIlitj9HUPhppQZ4x0PM57w1Dgajd72jili
	 i3vjG9AEN1ekLIzMi6ErHkWZorQlRRk9trJk4voWWP2kDqsNEmqdixArDLJNVM29jN/3/
	 dIELjciX8z39WdqOMAcuX5DefTaOLfR+di7ZqYGcVYcjAdA+G4TQOJD7GsNbvdFpINS7p
	 1Eoq7kH4OH/c01xyBX6W+yzUCLLuculSG1OLt2++VraAjAtgXmLWnpROXlcnP03714ob5
	 56uJTJfmdpsGs0p9d2iT+jfs5IPH74NUU1KdmaKl1n4KoRJk2wPgdyWSG0MtcnXz1IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpY5AHzR;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F608606A330
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 14:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F608606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpY5AHzR
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1570966eec.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 06:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794233503; x=1794838303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZAb6lnBWKXnQecNrOS09cug5s14VwaaeGt2z/u1g1w=;
        b=RpY5AHzRxwJ+7kg2LOASUK53qzNOCbDaOc+YyJElnpVvPXtu2C4IIuwgjeWaOEjV8e
         mDOKck7Q0x8Dw7Hmfqw7XARxIKeGyU/dnG6DgEfZ5tlVZ0HymvJxCGUdoZxnz/Gi/nQc
         LlQRNHIljkjNCwQIVVvtpLoFY6zPA7tIYKUPGMFnOIw95DsYmi0Bxubd3kKIom97MX7D
         i8iqS+ass2MijyM3i0nDZz1snvV2V/5UjSTUfVC96yLb1LsokkS6ckoVL9jG9m17dH4/
         dmLJeMjBT8T0TO63NYF5Bpg4kyC0fehPpTZWolz3u2fQsyD4cjo9n+TAJveXQegS7/4w
         FzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233503; x=1794838303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZAb6lnBWKXnQecNrOS09cug5s14VwaaeGt2z/u1g1w=;
        b=xEXS0jHsE1b+I8gxwGlxA/Gnyvq4AiEAV4cqtmGVzn0DX0izDWaj66RnHb+EX15Dnr
         Ky1wDgk8I3UX2JEZ5d7P2fNnIA+Jq3cihTbs2QRLtQ35vUzNnZrGl0NxQSJt9W34y7Rd
         hH1WCaDdcaVZdynuW3HPVoL7Fj4QdiSlmp1OA/4ix7lm8RuNJrv3nwQ+pBOaVWR0NLlr
         YfSpVz9PhwEfq9Ridz4z5yAhs7FbsggB/7N2j992gBfmy4WcN1aqpVCqaBrMuYu74wpC
         Rmjoup2hwampEgUODfU2/IbY0soTKjnMiy/a12HH5PMSN3bCgdoLJzCLKDsJHvErMDQe
         lbBw==
X-Gm-Message-State: APuU4Z9syh6NFglF2wUA9t4XdzilVTOP+15UywDMy6X4+uDCgGYN3QN4
	+sDTjYpHJM8nTQ7NHIlF+4fF9Ho3pxsVLOAC4FL6p0v+htuO1RwRO0Pm
X-Gm-Gg: AYBFou3TSOFxwJCCsvz38mPECN0Kl0yoQpAMKTqDqwY5TlWHLPH+pVCGTwikhEOpncV
	V24ys2u3J7fQO9urj521w9Cqv6wAPKlv1fszPuKAlDHtQdqA1DgZpWXPPjq7DDm6le7KltQ2fIh
	z+K78Zz3VCPyH/B9nH/pzAv49H51dHDiDYv6HsV+iX9C3mVGyj4UX6lIx1fV94XbGavFxmgM8ss
	SG6MMi1DoD/NY05dW8q/jr5KvmzplQ8Gr4A3X2XOjxiWuRwtZ7tkveaaAoTupEnfTZEaTAYJplZ
	sl6KP2A8BoCdASLDWBH39a1EVlcykW6HnbLFGbWRKM2iFOvg/TmF530oaHUTwJ0RpshEs0ufq/I
	EJGHptmROhAmvthsom4afCZ9eyy8zJKq0+lMHDDOAVQ8A4s4IUuv09T++m/DRA7ZtUnSDzw+PHa
	EHvy2xlJVe/pwEVBkz/UTOiIbTvJnNZSRZOQeRNP4MZQafeaiE9ghQEOIKKLoG3XrLpuhACRbPV
	B8vNgO2jtxZpivWqD7S4D+0ZL6jZm+XEl3g2XFxm4KZi/AuKuO1lZ5CTNkVkQ4QNcCl3T6DO/Vm
	mjLaBx3QySg6jDSnXntIke4xC3SdjU+dVWm2R133XxQq9XeBU4lkFnbXDrreEI4YjZUdb4EUnRr
	EMDSQlBwHJcEno2wECXNvmYIk4B8HfQHt
X-Received: by 2002:a05:7300:de4b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37256bf17d9mr7672054eec.25.1794233502484;
        Mon, 09 Nov 2026 06:11:42 -0800 (PST)
Received: from localhost.localdomain ([103.71.17.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16c49sm12727082eec.10.2026.11.09.06.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:11:42 -0800 (PST)
From: Varun Singh <varun.singh10011@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bigeasy@linutronix.de,
	syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com,
	Varun Singh <varun.singh10011@gmail.com>
Subject: [PATCH v3 1/2] usb: gadget: u_serial: serialise line setup against line teardown
Date: Mon,  9 Nov 2026 19:41:09 +0530
Message-Id: <20261109141110.3538-2-varun.singh10011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109141110.3538-1-varun.singh10011@gmail.com>
References: <20261109141110.3538-1-varun.singh10011@gmail.com>
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

Creating a u_serial gadget function can fail with -EEXIST for no reason:

  sysfs: cannot create duplicate filename '/devices/virtual/tty/ttyGS0'
  gserial_alloc_line_no_console: failed to register tty for port 0, err -17

ports[n].lock protects the ports[n].port slot, but the line's tty device
is registered and unregistered outside it, so the two can change
independently:

  gserial_alloc_line_no_console()        gserial_free_line()
    gs_port_alloc()
      mutex_lock(ports[n].lock)
                                           mutex_lock(ports[n].lock)
                                           ports[n].port = NULL
                                           mutex_unlock(ports[n].lock)
      ports[n].port = new
      mutex_unlock(ports[n].lock)
    tty_port_register_device(n)            <- device for n still there
                                           tty_unregister_device(n)

The allocator claims a slot whose old device is still registered, which
is the -EEXIST above. The reverse order leaves a slot with no device
node.

Hold ports[n].lock across slot assignment and device registration, and
across slot clearing and unregistration, so a concurrent caller sees
either both or neither. gs_port_alloc() is now called with the lock
held. Neither tty_port_register_device() nor tty_unregister_device()
takes tty_lock or ports[n].lock, and gserial_free_line() already slept
under this mutex, so this adds no new lock dependency.

With two gadgets racing for line 0, 25 of 383 function creations failed
on an unpatched kernel; 0 of 530 with this patch.

Found with the assistance of Claude Opus 5.

Signed-off-by: Varun Singh <varun.singh10011@gmail.com>
---
 drivers/usb/gadget/function/u_serial.c | 54 ++++++++++++++------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..e172050f1392 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1203,23 +1203,18 @@ static void gs_console_exit(struct gs_port *port)
 
 #endif
 
+/* Caller must hold ports[port_num].lock. */
 static int
 gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 {
 	struct gs_port	*port;
-	int		ret = 0;
 
-	mutex_lock(&ports[port_num].lock);
-	if (ports[port_num].port) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (ports[port_num].port)
+		return -EBUSY;
 
 	port = kzalloc_obj(struct gs_port);
-	if (port == NULL) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!port)
+		return -ENOMEM;
 
 	tty_port_init(&port->port);
 	spin_lock_init(&port->port_lock);
@@ -1236,9 +1231,8 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	port->port_line_coding = *coding;
 
 	ports[port_num].port = port;
-out:
-	mutex_unlock(&ports[port_num].lock);
-	return ret;
+
+	return 0;
 }
 
 static int gs_closed(struct gs_port *port)
@@ -1267,17 +1261,23 @@ void gserial_free_line(unsigned char port_num)
 	struct gs_port	*port;
 
 	mutex_lock(&ports[port_num].lock);
-	if (!ports[port_num].port) {
+	port = ports[port_num].port;
+	if (!port) {
 		mutex_unlock(&ports[port_num].lock);
 		return;
 	}
-	port = ports[port_num].port;
 	gs_console_exit(port);
 	ports[port_num].port = NULL;
+
+	/*
+	 * Unregister under the lock, so the device cannot outlive its slot:
+	 * otherwise a concurrent gserial_alloc_line() could claim the line
+	 * and register a device that this unregister would tear down.
+	 */
+	tty_unregister_device(gs_tty_driver, port_num);
 	mutex_unlock(&ports[port_num].lock);
 
 	gserial_free_port(port);
-	tty_unregister_device(gs_tty_driver, port_num);
 }
 EXPORT_SYMBOL_GPL(gserial_free_line);
 
@@ -1294,13 +1294,18 @@ int gserial_alloc_line_no_console(unsigned char *line_num)
 	coding.bParityType = USB_CDC_NO_PARITY;
 	coding.bDataBits = USB_CDC_1_STOP_BITS;
 
+	/*
+	 * Hold the line's lock across both, so a concurrent
+	 * gserial_free_line() sees the slot and the device together.
+	 */
 	for (port_num = 0; port_num < MAX_U_SERIAL_PORTS; port_num++) {
+		mutex_lock(&ports[port_num].lock);
 		ret = gs_port_alloc(port_num, &coding);
-		if (ret == -EBUSY)
-			continue;
-		if (ret)
+		if (!ret)
+			break;
+		mutex_unlock(&ports[port_num].lock);
+		if (ret != -EBUSY)
 			return ret;
-		break;
 	}
 	if (ret)
 		return ret;
@@ -1315,15 +1320,16 @@ int gserial_alloc_line_no_console(unsigned char *line_num)
 				__func__, port_num, PTR_ERR(tty_dev));
 
 		ret = PTR_ERR(tty_dev);
-		mutex_lock(&ports[port_num].lock);
 		ports[port_num].port = NULL;
 		mutex_unlock(&ports[port_num].lock);
 		gserial_free_port(port);
-		goto err;
+		return ret;
 	}
+	mutex_unlock(&ports[port_num].lock);
+
 	*line_num = port_num;
-err:
-	return ret;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(gserial_alloc_line_no_console);
 
-- 
2.34.1

