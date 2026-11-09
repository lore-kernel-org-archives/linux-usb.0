Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233508;
	b=g8uehhEz5j2+X/6Ld1Ax4GRf2jDSBULLXG/9R7zy4n868WuFJ51XqK9MVG8MTLvZ8XOj
	 RbAOvD+99NyqH0EFfv27mpDItOgv6adDY1GdMMuWEbRaDwIPd0CYVrW8tudBsDO/L5dfl
	 hAiQmtrUbJHSC03zrSedtg0d7rQjWFekjILzctp/KxbMWGRMgYm7hHQjYLl7v415qHHvr
	 BTPXA3rTtA90uknPdsYsG2+BAb/BJt0Sh/OYJvRB5SMfT4H99g0LqK3D0jWFqcuxkUo3I
	 //eRLPpGWPx6ky+jBn1mJiGm0Bm08BosxWjRs2+PT7UM6LyHbyrlEoWzUzopD5Wuu1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3AfDa9PrmKFOUuLwYXr48+FwSVAThPKzPqwShk2NnLU=;
	b=bpPu2M+Ouv/eUmeu+AxwrDupoqS4KZo0vgXwgSrD7xFhOYCl2H132i3VIK67TZBTd8nM
	 ypjmBJJAXOhT8jnlV9oXVrs3sz/wdG74oG9eALe/81q767SzdTjzahu6xMvv2hOD7g+p/
	 RsbNR95y1/R5R2Y8hn5HABgvdipsGYSv8FZ5/HsE5P/fuHSacxFuE/coPy75rSa8yQJB+
	 UMX0/y/Wbs2JJ7l3+acbadI9Bdfchx9Nplu9kjm0ve6YceRptoN8LkNJFpXbtLuhqOQV8
	 cAoGmH8yzcfz9bWWMVr8efNzS3gVhHwOwK0qJxUyZuoGdxEiLDS0NF9Ep0cNIM2H3Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvunSNdO;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE191606EE94
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 14:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE191606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvunSNdO
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1536410eec.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 06:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794233507; x=1794838307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AfDa9PrmKFOUuLwYXr48+FwSVAThPKzPqwShk2NnLU=;
        b=fvunSNdOWof62LwI8mk0lZVJWc/xyH/geslsGUaHejny8KpR6x9nME1aevP8HjJW+j
         1VTlQ+gp8hS0y031k+l06G07gUyvSMNy3S0nip9gtdIShDdZD7DRU7X557s8odlZaQMX
         QzrjomNFoZCYOcHk3fN4gWQdwd/6glWVDKNIkXw3Poll3Tty248SNkmrVP13HfBdG9A8
         8pSiue1dcN6ONRITiQFCxf5/zSJ+sBpcr7xWy4aBjRTrcBhLaVXuXSPdeKFZjxLTUAMS
         165pQQi03aop4LOvkH6L0ktPJZMkJ68QY+wVzGiddxJky1fVuXkUfgXbhYmUwsTF79ja
         7WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233507; x=1794838307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AfDa9PrmKFOUuLwYXr48+FwSVAThPKzPqwShk2NnLU=;
        b=FhYzE62xB7Hb3vdbLX5SlnBu/DlP40OnQmEO7MErD5pYwudjzcsOJrgFtn4a0+5iYL
         5RAXzTlY84++UsEtfHxAMj/I/zqqln/mWY1o7LVpdx55zAh4Our9w1MivbgaACEolIzl
         9sRFFslGCtvrfZJV7D01PNMVF2dCGThs76z/OSrDr3w/73ztubEmX4CBhRBJ5Acl5Van
         P7N7kmrp8MSD4ky6oDmpxiPGTP0kHdkEoq3qXrJyFmf/vcyMj5S34A7HCeeCJdnHWFV6
         TXMCRA4XJX0yj85wUqvYJdy3srReY+L80xDil+uCdFhR+KOCggY3OpcvrsZj6OKuS6ZH
         8DAA==
X-Gm-Message-State: APuU4Z9y7xiB+GiTKLZ/c7VyA8uot0kkP1Zs/kcLarwSwE0wLWPnLNCb
	c+cvpE68sNxa+OzqL32htby7+Mllf+l1iCz/QGSHWxTzhgjnmJRGjNRewRIla41t
X-Gm-Gg: AYBFou2184tpB3Bb902gsujHF4U3RQUK2w6N5DlkiBKsvOE5DS0AnuaPznwFBnTOopW
	3svFpXuJ45A1dv5YxUdfoJiLBwsxl49VkbBXol4e+EfMeLGe82aIE32kM8hjmkcO0wo4tevN9qV
	TF29ZhAK/+F633/3QDuTDrugp2LxVJQdQ5HZcAbI03sPe+QgqaodCoOYXvSPFVn7/qWf8QkgarE
	7WNxALxT3fFqHPDun86vXrcuzLVD+0INd4H2gJqddTjPlfRtQ525TSaKgz5UpoHXRcF05R3qKvN
	DVfeKKzH0BkDxpbF2U6/QQFvpLXL1uu/MtQFSPK8hvChuBy/ShfzqOr8/ZkXbH5YHMW7Vlik8iv
	aP6PLCPig88Pz2WuktejLx3LUaRZxSKq47rOvLzJnnYntjFkM+UfTmzg90VOGCwooDA2jFapJEj
	xzdGDtZszbt46QELfHHnj6WO+95ToOQ5Ou5QkzqUPxRRRX1nQ+dC9VPkgUACxZSbSNupS+g3OYk
	+lQuAGcq6bjGwnDb6A3p0FkMiI5WGQj2epFs2lnpAwJdJA2+OOkazF1arsTg7p/OpRBUYBLEuwS
	DX/GAMr0IfDMGq4sHcXC/RWyJBgW2BYnCzvx8nQUh/jbdo4WrNXWUbZ7njmlx5lz7RDgCiJIalz
	d6PLE4zwwus8Lhs21XBuPTGeuCv7cZnti
X-Received: by 2002:a05:7301:c83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-372566144c7mr6838219eec.10.1794233506564;
        Mon, 09 Nov 2026 06:11:46 -0800 (PST)
Received: from localhost.localdomain ([103.71.17.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16c49sm12727082eec.10.2026.11.09.06.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:11:46 -0800 (PST)
From: Varun Singh <varun.singh10011@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bigeasy@linutronix.de,
	syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com,
	Varun Singh <varun.singh10011@gmail.com>
Subject: [PATCH v3 2/2] usb: gadget: u_serial: fix gs_port use-after-free on open/unbind race
Date: Mon,  9 Nov 2026 19:41:10 +0530
Message-Id: <20261109141110.3538-3-varun.singh10011@gmail.com>
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

syzbot reports a use-after-free when a gadget serial function is removed
through configfs while /dev/ttyGS* is being opened:

  BUG: KASAN: slab-use-after-free in check_tty_count+0x134/0x2b0
   tty_release+0x95/0x1300 drivers/tty/tty_io.c:1728

gs_port embeds a tty_port, which the TTY core stores in tty->port without
taking a reference, so the driver must keep it alive. u_serial instead
waited for port.count to reach zero in gserial_free_port() and then freed
the port. That never worked: once gserial_free_line() has cleared the
ports[] slot, gs_open() returns -ENODEV without incrementing the count, so
the wait completes immediately, the port is freed, and tty_release() reads
it.

Use the tty_port kref. gs_install() runs before the core publishes
tty->port, so it looks the port up under ports[].lock, takes a reference
and stores it in tty->driver_data; .cleanup drops it, .destruct frees the
port, and gserial_free_port() drops the allocation reference rather than
calling kfree().

The close_wait/gs_closed() handshake is then redundant, and once the count
is correct it blocks rmdir until userspace closes /dev/ttyGS*, which syzbot
saw as a hung task, so drop it. Keep cancel_delayed_work_sync(): cancelling
from .destruct instead leaves a use-after-free in the work cancellation
path.

Without the handshake a line can be freed and reallocated while an old
tty_struct is still in gs_tty_driver->ttys[], which only release_tty()
clears. A new open would find it via tty_driver_lookup_tty(), take
tty_reopen() instead of gs_install(), and run gs_open() against the
orphaned port. So gserial_free_line() now hangs up any tty still on the
line, as usb_serial_disconnect() does, and gs_open() rechecks that
tty->driver_data is still the port registered for the line.

gs_close() also no longer warns on a zero port.count: tty->driver_data is
now set before gs_open() runs, so tty_release() legitimately calls
->close() with a zero count after a failed open.

Reproduce by racing repeated open() of /dev/ttyGS0 against rmdir of a
u_serial gadget function, with some opens held so they overlap. An
unpatched KASAN kernel reports the use-after-free within a few thousand
rounds.

Found with the assistance of Claude Opus 5.

Fixes: 19b10a8828a6 ("usb: gadget: allocate & giveback serial ports instead hard code them")
Reported-by: syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=39a2135de1558208d3b3
Tested-by: syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com
Signed-off-by: Varun Singh <varun.singh10011@gmail.com>
---
 drivers/usb/gadget/function/u_serial.c | 80 ++++++++++++++++++--------
 1 file changed, 56 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index e172050f1392..f279a2c6507c 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -125,7 +125,6 @@ struct gs_port {
 	struct kfifo		port_write_buf;
 	wait_queue_head_t	drain_wait;	/* wait while writes drain */
 	bool                    write_busy;
-	wait_queue_head_t	close_wait;
 	bool			suspended;	/* port suspended */
 	bool			start_delayed;	/* delay start when suspended */
 	struct async_icount	icount;
@@ -615,8 +614,9 @@ static int gs_open(struct tty_struct *tty, struct file *file)
 	int		status = 0;
 
 	mutex_lock(&ports[port_num].lock);
+	/* Reject opens on a removed port, or a stale tty after line reuse. */
 	port = ports[port_num].port;
-	if (!port) {
+	if (!port || port != tty->driver_data) {
 		status = -ENODEV;
 		goto out;
 	}
@@ -648,7 +648,6 @@ static int gs_open(struct tty_struct *tty, struct file *file)
 	if (port->port.count++)
 		goto exit_unlock_port;
 
-	tty->driver_data = port;
 	port->port.tty = tty;
 
 	/* if connected, start the I/O stream */
@@ -693,15 +692,14 @@ static int gs_close_flush_done(struct gs_port *p)
 static void gs_close(struct tty_struct *tty, struct file *file)
 {
 	struct gs_port *port = tty->driver_data;
-	struct gserial	*gser;
+	struct gserial *gser;
 
 	spin_lock_irq(&port->port_lock);
 
 	if (port->port.count != 1) {
 raced_with_open:
-		if (port->port.count == 0)
-			WARN_ON(1);
-		else
+		/* A failed open can still reach ->close() with a zero count. */
+		if (port->port.count)
 			--port->port.count;
 		goto exit;
 	}
@@ -744,7 +742,6 @@ static void gs_close(struct tty_struct *tty, struct file *file)
 	pr_debug("gs_close: ttyGS%d (%p,%p) done!\n",
 			port->port_num, tty, file);
 
-	wake_up(&port->close_wait);
 exit:
 	spin_unlock_irq(&port->port_lock);
 }
@@ -908,7 +905,40 @@ static int gs_get_icount(struct tty_struct *tty,
 	return 0;
 }
 
+static int gs_install(struct tty_driver *driver, struct tty_struct *tty)
+{
+	int port_num = tty->index;
+	struct gs_port *port;
+	int status;
+
+	mutex_lock(&ports[port_num].lock);
+	port = ports[port_num].port;
+	if (!port) {
+		mutex_unlock(&ports[port_num].lock);
+		return -ENODEV;
+	}
+	tty_port_get(&port->port);
+	mutex_unlock(&ports[port_num].lock);
+
+	status = tty_port_install(&port->port, driver, tty);
+	if (status) {
+		tty_port_put(&port->port);
+		return status;
+	}
+
+	tty->driver_data = port;
+
+	return 0;
+}
+
+static void gs_cleanup(struct tty_struct *tty)
+{
+	tty_port_put(tty->port);
+}
+
 static const struct tty_operations gs_tty_ops = {
+	.install =		gs_install,
+	.cleanup =		gs_cleanup,
 	.open =			gs_open,
 	.close =		gs_close,
 	.write =		gs_write,
@@ -1203,6 +1233,15 @@ static void gs_console_exit(struct gs_port *port)
 
 #endif
 
+static void gs_destruct_port(struct tty_port *port)
+{
+	kfree(container_of(port, struct gs_port, port));
+}
+
+static const struct tty_port_operations gs_port_ops = {
+	.destruct = gs_destruct_port,
+};
+
 /* Caller must hold ports[port_num].lock. */
 static int
 gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
@@ -1217,9 +1256,9 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 		return -ENOMEM;
 
 	tty_port_init(&port->port);
+	port->port.ops = &gs_port_ops;
 	spin_lock_init(&port->port_lock);
 	init_waitqueue_head(&port->drain_wait);
-	init_waitqueue_head(&port->close_wait);
 
 	INIT_DELAYED_WORK(&port->push, gs_rx_push);
 
@@ -1235,25 +1274,11 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	return 0;
 }
 
-static int gs_closed(struct gs_port *port)
-{
-	int cond;
-
-	spin_lock_irq(&port->port_lock);
-	cond = port->port.count == 0;
-	spin_unlock_irq(&port->port_lock);
-
-	return cond;
-}
-
 static void gserial_free_port(struct gs_port *port)
 {
 	cancel_delayed_work_sync(&port->push);
-	/* wait for old opens to finish */
-	wait_event(port->close_wait, gs_closed(port));
 	WARN_ON(port->port_usb != NULL);
-	tty_port_destroy(&port->port);
-	kfree(port);
+	tty_port_put(&port->port);
 }
 
 void gserial_free_line(unsigned char port_num)
@@ -1277,6 +1302,13 @@ void gserial_free_line(unsigned char port_num)
 	tty_unregister_device(gs_tty_driver, port_num);
 	mutex_unlock(&ports[port_num].lock);
 
+	/*
+	 * Hang up the tty before the line can be reused. Drop
+	 * ports[port_num].lock first: it takes tty_lock, which gs_install()
+	 * already holds when it acquires that mutex.
+	 */
+	tty_port_tty_vhangup(&port->port);
+
 	gserial_free_port(port);
 }
 EXPORT_SYMBOL_GPL(gserial_free_line);
-- 
2.34.1

