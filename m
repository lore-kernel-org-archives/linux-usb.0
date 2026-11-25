Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795619274;
	b=5rAo/OApf5wVwvBL/E56UFl8yWEoSAz0f3ao8ixZ5GyE8NYuaE2Fx/L+G5jN98nfeIwf
	 kd6gC6gI48Pih+hZKduSJNtM2W4rcNVsyj/SIt7zjgh/pQushEkXR+gnS6UHYvuoXfJEe
	 CivvPDgX+i3Ks1cpYuuzu6zteXkMScmXqmzJjXj+A9gboTQ3RMm0jve+1hfn3va/GHm4l
	 t6IFYFoDpVcAoahpa0rbbrnjhBljGjjA3D0hpE9OCimvD9fCBESWx13/yxO1kknCb5o7e
	 SBuKgd3WVMLnRmJ03b/SdBv6IbW2S+F84pwy/M3mrthRbNqxbcGiQnbiJyI2iRr9fTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619274;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FTzAjKQSHxlNRWgx/yZCGJcmPJ5L7IOVnJKBdJAxvyo=;
	b=2NqHs3aJvSwxMPD1T5Nz1WJPsPdtGgJgnyq1bA+LVNomX0sdn3A7HJ5hBHOxNajInqzu
	 sNhCNLWsCUlkCgXgRMB+L0Qb5kZZamFtzRQPda/FqwrTQ8CSg4lk1fOWNmY9fR/1F7gEW
	 HTc0pAcBCrX/BZpbkHJ1sbgZtmHfxchyaTduQnp/Yl/PD3zo1s7g5sDUkpDG1YFTeGCtc
	 G15BQhVcuPVyxQ+67d0njXkn2eWQXAFAVsc4JQU0OGZobZecC7rFVrWwd0bkwVS/s7a/j
	 cVSGQaTI6QqRs3d0ac7G2dO/fS5FXMFVIrndlsItabISsdB+ki2c0JdiorbaKk0h90w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8a5myX8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5132606A323;
	Wed, 25 Nov 2026 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8a5myX8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795619274;
	b=mCqIXExm4RBSn6yj1L7XkDvnGT32+IfLFyAbBuOVeh2UriIc3xuOjSGByguC4R/qlcoO
	 Z1JmwT0JsBke9pFQB8E8h7D9X8XKHpJeKVjLaWLVnuOeReEQd6YdUODTejKq6SyGYnS0t
	 XT/cO1jj9MGL9xSUePTMS5HYJLByKdBLv/3Qq6Ybn6C4GNrsxhoGFt5j82+UW8F5Ql51H
	 63zyarj5oKHtyL1GqQ3XGT+ePGT+yaUvuJsSI3zoa2Wl2KeWdov5yLuux1m/NZ/jh2L1X
	 heCujUG/zjVGgqnsuLkl5gNKygj8yqSEEbPqAtATQvjOGPaRR/4YHoo9RICwc6vmv2g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795619274;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FTzAjKQSHxlNRWgx/yZCGJcmPJ5L7IOVnJKBdJAxvyo=;
	b=M+GKaG2bixGAdtJxEOiNj1rnHBYBQBO7YdZ7YcKv4h1Lveyc4mqzs/6Ral52e5byQMky
	 bG3myVa8RttMFcplnZsReDknE79SYmJ93JWLXnCY8h/kEA/S3rl53IPbmoz/rWmyOpMYL
	 CUMPLOwS3zCmTtFTLR7lo7Eut+ceW66BHferu04MypATsrHhpCdXGHMu7kzMHFUlJaLv6
	 k+SlNvp0l1OASpavNX79JHRRgJ4cPTRkI0lKK1IlfcaBoRfc3BR/GN94K4qO9w4psMeYS
	 OU6lMfCggc+9kaDSh4g6jwCyK1NGLvAoFVRLLauuVHgd1S7+3xnj2/7Rak6WmiKglnA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 472E61F000CA;
	Wed, 25 Nov 2026 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619274;
	bh=FTzAjKQSHxlNRWgx/yZCGJcmPJ5L7IOVnJKBdJAxvyo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=k8a5myX82b8HaqyrPgm7DfV1TbpTWEpgF5wa+my07BlNVli1+NENA3HzvPUyHZZVI
	 tKJGeFYSk3hSuSeVB+YRalP5JkJ+x2Z5sxYKQtSZeslWp/Wv5EYThYOMIIs2ofcyNj
	 ITdCmToKV15C57NIDFKV0OasqWzVYeS5VTXJyxwlvOZqHFpp29EQxPitzp2WL1BJge
	 79HsFoJh/+WD6NPMGR04Oqu3imjUbiTjwzh/3+i/CvIKoGfxwvuxblVHu6PpxiUIO2
	 1dH7Upa9+xcydDHVJ1iZbJfCeb7iE2+PDZSsDTTKvztjKG2V07Nl42dv9WBsCA25NV
	 vj6dJZKV3Fk3w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BD22F4CF06;
	Wed, 25 Nov 2026 15:07:41 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 12:05:26 -0300
Subject: [PATCH v3 1/2] usb: gadget: u_serial: Publish the console only
 under port_lock
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
Message-Id: <20261125-u-serial-console-dequeue-v3-1-b47f6e401dc1@gmail.com>
References: <20261125-u-serial-console-dequeue-v3-0-b47f6e401dc1@gmail.com>
In-Reply-To: <20261125-u-serial-console-dequeue-v3-0-b47f6e401dc1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neill Kapron <nkapron@google.com>
Cc: Krystian Kaniewski <krystianmkaniewski@gmail.com>, 
 Brian Ellis <brianellis@gotenna.com>, Ai Chao <aichao@kylinos.cn>, 
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, 
 Prashanth K <prashanth.k@oss.qualcomm.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795619260; l=1827;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=bQFCDRqy5e6noIavX7zwxVbe546YTjkWtU7/BccXBn0=;
 b=PLGYVwp0s0vOzq8X3Ea/x0TZMfN/5m1fismv0n4lDEyqd8lMw8YseLRQtcIEQLBLsk3maYolP
 P3Lyn8NsjBoDoZBMJk0tlM6P2H3P40HqATOAeBbGVCA2Wg6XtFaXRXd
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com
Content-Transfer-Encoding: 7bit

From: Fabricio Akio <fabricioakio@gmail.com>

gserial_connect() and gserial_disconnect() find the console through
port->console under port_lock, but gs_console_init() sets it before
taking the lock, and gs_console_exit() clears it after dropping it.
A host connect while the console is being turned on through configfs
can then connect it twice, leaking the first request. While it is
being turned off, a connect can attach a request to the console being
freed and schedule its work after cancel_work_sync().

Set and clear port->console under port_lock, together with connecting
and disconnecting the console.

Fixes: d7cb8fb7aa7d ("usb: gadget: u_serial: allow more console gadget ports")
Cc: stable@vger.kernel.org
Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
 drivers/usb/gadget/function/u_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 0a304f508bc3..1f0110ea7f6a 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1173,10 +1173,10 @@ static int gs_console_init(struct gs_port *port)
 		return err;
 	}
 
-	port->console = cons;
 	register_console(&cons->console);
 
 	spin_lock_irq(&port->port_lock);
+	port->console = cons;
 	if (port->port_usb)
 		gs_console_connect(port);
 	spin_unlock_irq(&port->port_lock);
@@ -1196,12 +1196,12 @@ static void gs_console_exit(struct gs_port *port)
 	spin_lock_irq(&port->port_lock);
 	if (cons->req)
 		gs_console_disconnect(port);
+	port->console = NULL;
 	spin_unlock_irq(&port->port_lock);
 
 	cancel_work_sync(&cons->work);
 	kfifo_free(&cons->buf);
 	kfree(cons);
-	port->console = NULL;
 }
 
 ssize_t gserial_set_console(unsigned char port_num, const char *page, size_t count)

-- 
2.56.1


