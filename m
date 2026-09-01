Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ACB3CB579
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 03:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234603; cv=none; b=hj9G6eZ/iQF+2ap/tJtJNlSCTkPG3INbhjB+HnTM2jMNcYS4TdX3VaSVBNN+g1Em9DVZRHG+81XusyARmzO1ZzU+iQfuiYyxzlsL1by5jzc5jjadC/MBXxrQGVOtdd3j1jQTuLVjObYOejmqzsJaomF/jQ780016WnWCpXyU+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234603; c=relaxed/simple;
	bh=YmwOuT1FgL+BphyzZUen6ctS0zKE0YRbKJdmUVSmUXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IAuBNSF8jMEc+z8lPGnEUkyoHfSqmhOq6if+iQFhSZwMV1+E6/dVBAOB12BkddSCaOYJ83wEOdx3X1Ts1KaBth48K+WPOUqlj5UxWvrpZqC5xbbgsDNCuyvJdJsb8XXsakF2VI0Sivwy6stjSlILeTBsAQTWD8GdFGgOhtGu6zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oes.ch; spf=pass smtp.mailfrom=oes.ch; dkim=pass (2048-bit key) header.d=oes.ch header.i=@oes.ch header.b=0JkDRtQT; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oes.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oes.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oes.ch header.i=@oes.ch header.b="0JkDRtQT"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so406577a12.1
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 20:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oes.ch; s=google; t=1788234599; x=1788839399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLYavENkufFn+d9s6Ylxmw+aj30ZRl5nyaxU5Mv735k=;
        b=0JkDRtQTIQXZh7NDPS8G5UfEBbQjaHnrC+jPuhXkq1w0pbrWqZHPaQmbw0VhwVvcLx
         a4wWcQCUOhYObtS8lvC/tyuDapettXm9cIqgmOCqVS1w4qVjeFaPAVzOVg48glMkwT7T
         SZxFkJCi+iwNuzYu21+KDk0VbXk/mXt0KIfmcgdAV1GZ/eyx3w2MgiLKX1hxQHGid7l5
         AVN3SXOvlcNJIdVGdbZAktndMsdDyKJmgsyaWROrDCQC5RbKvEZCmuvD+lj+oQ07QNIv
         YJzQyFauxqyx6ixc9T/2NfSHWXWSrlBGe2VDrNq+zl2wBkW3LUypJ5LEvsia2GlLNaXw
         JtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234599; x=1788839399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLYavENkufFn+d9s6Ylxmw+aj30ZRl5nyaxU5Mv735k=;
        b=Z3PQDWq8zhU5UyacpJ2Ehw8QeOUUVvqRK/SSENHxP6R/uuCSqGYXg6WlMuAY/XcLBy
         wM+5UccRxl2M+W/wU3YirxwW8duaA14i+EqPD0zPGj/cusLcNO8ovxN8tptGMwC63b82
         4oVuTKb4Vdp7XpE08keCBTvqSHcAq8VEjyOFvgA/9ocuiWUmNzO7V6KUF1sR7+HBvajt
         u4t3XRBthFEkRIFVrLsgTGOpqwnowyPYQp0rIitAoS+06f0jqjStUlSJCdH33WPX8fia
         4OZrH5tK2XPmhu1XaFvVaUeVbOriAvWdZ/YBhDL0Lwm20/Sf5n3J4z8bFcQbAePa1hAh
         vfqw==
X-Forwarded-Encrypted: i=1; AKwUvBwdMDUE4MBsUQfag1ULxjhjbNB2CW2+83lCLfo7qjJUCmG9iIH0EcyGeIQ+B/TuhoG+exNouqHamD4=@vger.kernel.org
X-Gm-Message-State: AFuF++mT8EdB+mGQkL86qVCwGZwylWjOm4D/nA8pbqIy0HCnsHYltck8
	p0Vl4kJyW4AX70/jugvu0ajgGOS5G5hzq1/x0twQbSjYuaJ2f8aK2oq4YowNYKK/PQ==
X-Gm-Gg: AYBFou21GKnfzkvV0PEu9dMuZrIyuacgOwUbsNx17Nl6rLvuNDMJwJWdmvm1qETeDY0
	54TEI4V2avxMeu4Np1B4nj55t0lkjkp3f5lOEPitLFShcHGxsHbCifoLWqhHqInXQ8c4Hqv9q+5
	fYVtBfrumw23UhR5sSkpUSLgWWy1f+2QTLWsuUfyGCgKnZczdv4YXxesToDHxBUJ27POHAf1rJU
	uF74m7RGeEEWhPuWbDjo4/C8nShbA4mIJBaiYsXEHaXIDZJ2FP8GpDG9Gh+dNxxWcsd2ZTiD0wd
	kKF5tZQeI9GjdQOHr/arsMAWsUUHMgRoS03oqR4EOphsDnSZI9b+POtsuy8YsWycg1ixic1NWj+
	iVXx+xw9D23eauFNA4F/FRD3Gjf6UUx1ehAdTlZGRwvVOeXLHGqoeBGKSxi+2a1G31yNhyZcetf
	TnZSc225qzFEhqzXXuKwJzTnNalNgbWPm2ZztP/9HKTpopVdspSk/timXoJGAoRKtR/iS2ClbhW
	qV5Uc5e5V5t5Z7RhTTGvvLwQo4iLer0NWipFiPEv8jcl9NQNyvCRDJMcE8ihURWogD7FHoVBgDy
	4iqLAXYhjDlDEg==
X-Received: by 2002:a17:90b:2fcc:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-3989be9aca2mr34957123a91.20.1788234599069;
        Mon, 31 Aug 2026 20:49:59 -0700 (PDT)
Received: from cosinus.tail5d817.ts.net ([118.148.155.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4637a3sm2978029a91.5.2026.08.31.20.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:49:58 -0700 (PDT)
From: Julian Oes <julian@oes.ch>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Oes <julian@oes.ch>
Subject: [PATCH v2] USB: serial: generic: recover from a stalled bulk-in endpoint
Date: Tue,  1 Sep 2026 15:49:49 +1200
Message-ID: <20260901034949.118739-1-julian@oes.ch>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A USB serial port can go permanently silent when its bulk-in endpoint is
halted: the read URBs complete with -EPIPE, which the generic read
callback has always treated as fatal, and no further data arrives until
user space closes and reopens the tty.

Recovery from a halted bulk endpoint is CLEAR_FEATURE(ENDPOINT_HALT)
followed by resubmission of the reads. That needs a control transfer, so
defer it to a work item as cdc-acm already does.

Use a dedicated work item rather than the existing per-port work. The
latter is scheduled from every write completion and must not be
cancelled on close, as the line discipline depends on it. Stall
recovery resubmits the read URBs and must therefore be cancelled
wherever the reads are stopped, that is, on close, suspend and
disconnect.

Schedule the recovery with a short cooldown. The stall can persist for a
few milliseconds, during which the resubmitted URBs stall again as soon
as they are queued; without a delay the recovery becomes a busy loop of
control transfers. Rate-limit the stall message for the same reason, as
a stall is now a recurring condition rather than a terminal one.

I ran into this with an FTDI FT231X behind a hub that halts the
adapter's bulk-in endpoint whenever an unrelated CDC ACM device on a
sibling port is disconnected. With this change the FTDI port keeps
receiving data across such an event.

Signed-off-by: Julian Oes <julian@oes.ch>
Assisted-by: LLM
---
v1: https://lore.kernel.org/linux-usb/20260513023728.55557-1-julian@oes.ch/
    (no replies)

Changes since v1:
 - Use a dedicated delayed work instead of port->work. port->work is
   scheduled from every write completion and must not be cancelled on
   close, which stall recovery has to be.
 - Cancel the recovery in close, suspend and disconnect. v1 cancelled it
   only in disconnect, so a stall reported just before close could
   resubmit the read URBs on a closed port.
 - Add a 10 ms cooldown and rate-limit the stall message. Retrying
   immediately, as cdc-acm does, turned recovery into a busy loop here:
   six attempts in six milliseconds, each clearing the halt and
   resubmitting only to stall again, until the fault cleared on its own.
 - Bail out if usb_clear_halt() fails rather than resubmitting anyway,
   and skip the reads if the port is throttled.
 - Drop the Fixes tag. fc11efe2800f only made the existing -EPIPE
   handling explicit; the preceding "if (urb->status) return;" treated a
   stall as fatal too, so this is a missing feature, not a regression.
 - Drop my redundant Tested-by, add Assisted-by (see below).
 - Rebase onto v7.3-rc1.

Testing: the trigger is racy, about one unplug in ten, and only with both
devices on the same internal hub controller and the FTDI port open with
data flowing. With the patch the halt is cleared and the reads resume; I
confirmed data keeps arriving by holding the port open with screen and
watching the arriving bytes across the event, where before it stopped dead.

Not tested: the close-during-recovery and suspend-with-recovery-pending
paths.

An LLM (Claude Code) assisted throughout: narrowing the problem down from
usbmon traces, drafting the patch, and writing this changelog.

Hardware: SiK telemetry radio (FTDI FT231X, 0403:6015) and a PX4 FMU v6C
(3185:0038) on a j5create JUH377 hub, internally two chained Genesys
Logic GL3523 controllers. The hub is what halts the endpoint; the adapter
itself is innocent. I can capture usbmon traces if that would help.

 drivers/usb/serial/generic.c    | 87 +++++++++++++++++++++++++++++++--
 drivers/usb/serial/usb-serial.c | 12 ++++-
 include/linux/usb/serial.h      |  4 ++
 3 files changed, 98 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index 6eaf74930aa3..be3c29defb01 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -114,6 +114,22 @@ int usb_serial_generic_open(struct tty_struct *tty, struct usb_serial_port *port
 }
 EXPORT_SYMBOL_GPL(usb_serial_generic_open);
 
+/*
+ * Cooldown between attempts to recover a stalled bulk-in endpoint. A stall
+ * caused by a transient fault can persist for a few milliseconds, during which
+ * the resubmitted URBs stall again immediately. Back off a little so that a
+ * persistently halted endpoint is not hammered with control transfers.
+ */
+#define USB_SERIAL_STALL_COOLDOWN	msecs_to_jiffies(10)
+
+static void usb_serial_generic_kill_read_urbs(struct usb_serial_port *port)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(port->read_urbs); ++i)
+		usb_kill_urb(port->read_urbs[i]);
+}
+
 void usb_serial_generic_close(struct usb_serial_port *port)
 {
 	unsigned long flags;
@@ -128,8 +144,16 @@ void usb_serial_generic_close(struct usb_serial_port *port)
 		spin_unlock_irqrestore(&port->lock, flags);
 	}
 	if (port->bulk_in_size) {
-		for (i = 0; i < ARRAY_SIZE(port->read_urbs); ++i)
-			usb_kill_urb(port->read_urbs[i]);
+		usb_serial_generic_kill_read_urbs(port);
+		/*
+		 * The read URBs are dead now so no further stall can be
+		 * reported, but stall recovery may already be running and may
+		 * have resubmitted them. Wait for it to finish before killing
+		 * the URBs for good.
+		 */
+		cancel_delayed_work_sync(&port->stall_work);
+		usb_serial_generic_kill_read_urbs(port);
+		clear_bit(USB_SERIAL_RX_STALLED, &port->flags);
 	}
 }
 EXPORT_SYMBOL_GPL(usb_serial_generic_close);
@@ -370,6 +394,7 @@ void usb_serial_generic_read_bulk_callback(struct urb *urb)
 	struct usb_serial_port *port = urb->context;
 	unsigned char *data = urb->transfer_buffer;
 	bool stopped = false;
+	bool stalled = false;
 	int status = urb->status;
 	int i;
 
@@ -394,9 +419,10 @@ void usb_serial_generic_read_bulk_callback(struct urb *urb)
 		stopped = true;
 		break;
 	case -EPIPE:
-		dev_err(&port->dev, "%s - urb stopped: %d\n",
+		dev_err_ratelimited(&port->dev, "%s - urb stalled: %d\n",
 							__func__, status);
-		stopped = true;
+		set_bit(USB_SERIAL_RX_STALLED, &port->flags);
+		stalled = true;
 		break;
 	default:
 		dev_dbg(&port->dev, "%s - nonzero urb status: %d\n",
@@ -419,6 +445,16 @@ void usb_serial_generic_read_bulk_callback(struct urb *urb)
 	 */
 	smp_mb__after_atomic();
 
+	/*
+	 * Defer stall recovery to a work item as clearing the halt condition
+	 * requires a control transfer, which cannot be issued from here.
+	 */
+	if (stalled) {
+		schedule_delayed_work(&port->stall_work,
+				      USB_SERIAL_STALL_COOLDOWN);
+		return;
+	}
+
 	if (stopped)
 		return;
 
@@ -429,6 +465,49 @@ void usb_serial_generic_read_bulk_callback(struct urb *urb)
 }
 EXPORT_SYMBOL_GPL(usb_serial_generic_read_bulk_callback);
 
+/*
+ * Recover from a halted bulk-in endpoint by clearing the halt condition and
+ * restarting the reads.
+ *
+ * Note that this runs from a dedicated work item rather than from port->work,
+ * which must not be cancelled on close as the line discipline depends on it.
+ */
+void usb_serial_generic_stall_work(struct work_struct *work)
+{
+	struct usb_serial_port *port;
+	struct usb_serial *serial;
+	int ret;
+
+	port = container_of(to_delayed_work(work), struct usb_serial_port,
+			    stall_work);
+	serial = port->serial;
+
+	if (!test_and_clear_bit(USB_SERIAL_RX_STALLED, &port->flags))
+		return;
+
+	/*
+	 * The sibling URB may still be queued on the halted pipe, or may have
+	 * been resubmitted before the stall was noticed, so drop both before
+	 * clearing the halt condition.
+	 */
+	usb_serial_generic_kill_read_urbs(port);
+
+	ret = usb_clear_halt(serial->dev,
+			     usb_rcvbulkpipe(serial->dev,
+					     port->bulk_in_endpointAddress));
+	if (ret) {
+		if (ret != -ENODEV && ret != -ESHUTDOWN)
+			dev_err(&port->dev, "failed to clear bulk-in halt: %d\n",
+				ret);
+		return;
+	}
+
+	if (test_bit(USB_SERIAL_THROTTLED, &port->flags))
+		return;
+
+	usb_serial_generic_submit_read_urbs(port, GFP_KERNEL);
+}
+
 void usb_serial_generic_write_bulk_callback(struct urb *urb)
 {
 	unsigned long flags;
diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 17edc057a311..a9a22b749b60 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -1068,6 +1068,8 @@ static int usb_serial_probe(struct usb_interface *interface,
 		/* Keep this for private driver use for the moment but
 		   should probably go away */
 		INIT_WORK(&port->work, usb_serial_port_work);
+		INIT_DELAYED_WORK(&port->stall_work,
+				  usb_serial_generic_stall_work);
 		serial->port[i] = port;
 		port->dev.parent = &interface->dev;
 		port->dev.driver = NULL;
@@ -1191,6 +1193,7 @@ static void usb_serial_disconnect(struct usb_interface *interface)
 		usb_serial_port_poison_urbs(port);
 		wake_up_interruptible(&port->port.delta_msr_wait);
 		cancel_work_sync(&port->work);
+		cancel_delayed_work_sync(&port->stall_work);
 		if (device_is_registered(&port->dev))
 			device_del(&port->dev);
 	}
@@ -1226,8 +1229,15 @@ int usb_serial_suspend(struct usb_interface *intf, pm_message_t message)
 		}
 	}
 
-	for (i = 0; i < serial->num_ports; ++i)
+	/*
+	 * The URBs are poisoned first so that no further stall can be reported
+	 * before stall recovery, which needs to talk to the device, is
+	 * cancelled.
+	 */
+	for (i = 0; i < serial->num_ports; ++i) {
 		usb_serial_port_poison_urbs(serial->port[i]);
+		cancel_delayed_work_sync(&serial->port[i]->stall_work);
+	}
 
 	return 0;
 }
diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 534e6650e2aa..0cd3e2ae772f 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -21,6 +21,7 @@
 /* USB serial flags */
 #define USB_SERIAL_WRITE_BUSY	0
 #define USB_SERIAL_THROTTLED	1
+#define USB_SERIAL_RX_STALLED	2
 
 /**
  * usb_serial_port: structure for the specific ports of a device.
@@ -59,6 +60,7 @@
  *	port.
  * @flags: usb serial port flags
  * @work: work queue entry for the line discipline waking up.
+ * @stall_work: delayed work entry for bulk-in endpoint stall recovery.
  * @dev: pointer to the serial device
  *
  * This structure is used by the usb-serial core and drivers for the specific
@@ -104,6 +106,7 @@ struct usb_serial_port {
 
 	unsigned long		flags;
 	struct work_struct	work;
+	struct delayed_work	stall_work;
 	unsigned long		sysrq; /* sysrq timeout */
 	struct device		dev;
 };
@@ -350,6 +353,7 @@ unsigned int usb_serial_generic_write_room(struct tty_struct *tty);
 unsigned int usb_serial_generic_chars_in_buffer(struct tty_struct *tty);
 void usb_serial_generic_wait_until_sent(struct tty_struct *tty, long timeout);
 void usb_serial_generic_read_bulk_callback(struct urb *urb);
+void usb_serial_generic_stall_work(struct work_struct *work);
 void usb_serial_generic_write_bulk_callback(struct urb *urb);
 void usb_serial_generic_throttle(struct tty_struct *tty);
 void usb_serial_generic_unthrottle(struct tty_struct *tty);
-- 
2.43.0

