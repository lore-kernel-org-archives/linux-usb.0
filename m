Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551686;
	b=zqhlki92I4JYVwC8xInsd7pXXfgP+RdQ6A7i5gLC99tOcUKT++zlfaCgXU/qpwQFgpLB
	 Gt6z9YUym2b7o4lkIkmfEe7A/7tV52xUBuFo21BP4MptGfgZS68Xjlh+wIlTmlYSH1lgI
	 UVOCYuDAqQqT/EC5V07QX9A9lqFDDYy2KUAChRhJgt2F5TiYq1I8yTQFCP64tD+Zr44vz
	 Ho1TSIq8/CoFgyLeapIMa7nQyYQ0ZU1HpHb12cRezxMreuoQ6WFYWk8I4IDo2+lkNbD96
	 U0FsD/oI5QLLLQtXFYZ3/Bce2CKZ3RBWFyH0Z69u8zJtxrQ63+nl3Vnf9YihXSjZ+iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n6vkIDMoqXBl2eKdspHtWw5uEM5j7saGuWr0jlVkPSY=;
	b=bDlOoGJupkRpveZbZY//tRGbP0RquX9g66UIKBXN/gS9MpkSb+mnqvr4QmbcV+Mdg5Zy
	 uf7+HWw1YGZT/neri6lX0HSeU9KQ4LnndrgyjxKCdzUnaoZwbl00MpUUotcd48qL4V0fI
	 BCl5kqI5FKXajiZfSXDaeNpNT38tnbxOgVUElsli16OeUhlnav174B79KzFxpxX0pwtGK
	 t6LKs97n2KWnAghd6I2N1ryte5TCq0qOrXFDtRqX51OazwSL0hKbOga5YnzA5XxAcFvdW
	 VoNx5XrINFL6qptaZXuJW77SGqKEyzOQbr+CsTRw38kFGtmR3ZsSvZVmpWXdxHGiogw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eqzg3eMS;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32E5606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F32E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eqzg3eMS
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36d1b3b9974so49395eec.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 22:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794551685; x=1795156485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6vkIDMoqXBl2eKdspHtWw5uEM5j7saGuWr0jlVkPSY=;
        b=Eqzg3eMSsfJXGVAIw4llXmb/7RLiL1jicPyXBM92BNvpUxYtNR7kNaLh3hPHWelN9u
         QFywE8bfOGCHpzAlOwj10TQAhpSme1U6ra5nSEblgyO0dcUx7bVPe+aQqH1a5sk2kvTy
         DZhDMnfxUldUHZ8pcxFmKwB/2H8lVc0DtYlJ3OZqEE/9SiWClMDgtuDV4ZByazQ+eQCJ
         IefsRrjSCDZkUKN4yWlQdGMlCcvpZikWEY81kSYEfN+2QNDgEQ2AXyS7Un+u/WJqIeuc
         FWN7AeVd8s9Az9/aaoPn+S93+2kxwfs9HIGoGHXBtK4Pg8WxyaS6yCtB9O91rrzKiJz2
         ixRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551685; x=1795156485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6vkIDMoqXBl2eKdspHtWw5uEM5j7saGuWr0jlVkPSY=;
        b=BAa6Aki8OKV3uKb8wSvQyY4XGpRriyT9VquxqQb0RnPUAnDiltrDVZqz6ld8DZfjgs
         y00GtPOH85wSWCx83+xFSQMKBjms7hIXpIdMBaJFe8RB5k7Xo00YzmSJrk7XSt7xZKSh
         wxnoiQGk2chU+I/1Jq3MugKwv9ktM4JD4BJntK602h6qcoL5G0AR665Gq6AGXei9/2s8
         zO9zxm0TpxZNPW34Q/9k8n0ZGoNjZ6+i2e4MAaNoXeB/g+8Isp71X9T4s9DPfe3U/h/+
         wRIAY8OJoj825M9yybonMP0H/5EV5hCWyCaJqCnkWhnEmOeAbKeHpDSw1Gb3u0g7x2cn
         gE8Q==
X-Gm-Message-State: APuU4Z8wC4FiXGyWEj+7qwcimsv/X/rRZij4HVWVkAyznnDMYveszuEJ
	vNQ3fNZnKwfYsezganfC1uBx5hXFOKCWLu/zwwzE8GAJAjj0PfpxYEBJW3KPxI6PqVo=
X-Gm-Gg: AYBFou2s9t5FfIEljlSwW5IindsNjrzoxnu2akfBCWvDf88jMdZthlV3ercww7+qWfT
	VJ6g1gRmpFQ3clOaolrs5YRJmmouJwYnFOcATydsJfg3eOXU73AzIQpl5810jhgaTcMuUqDe2MU
	qD6SxVSXfWPs62cv7VWuh+Yyo5cOJnXg+77Xb0ghY1gmUs0hutXXNBPHc++3ZfSJi/pUTFnJreK
	4tLEuEvNAAPZgHIUXAvUy+jB4c/hxxNZj1+Xi3xS8t2mQBZNToIcZY/0uBum5AY3+shQEGEPE5W
	hb6SZkajMAgxgmcZfYNkyasHyXBwHtSrBYerdeiNvuBjFxIwI3FtLR7ttR1uolwSOZEt45/VJvA
	dnTTJ5BSSyyfdK687JAx9FKs5AICz//HHkyZeCfqWju8skG6ysipgFyqM3+FKyhqYbYxWlvddQ/
	5mgBeUqp+9Yjyt2A4aGFeJBa5ttCUoovjcvO4RqaPQgwSuTwIvzmHOm4voAJMRxoUgqqy/rJeQU
	1K7RJBD+zQK/w5jRWoswL65ZCcN2RSLXcCEPSkZs77r0tbqdsanRUeXb8B/n/asEPPPQaezSDes
	t61KzjFJK61x34Iaq95iAnOl/L3I4C9OaHW/BMGeTw==
X-Received: by 2002:a05:7300:c00e:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-379651ecb3emr2445477eec.1.1794551684869;
        Thu, 12 Nov 2026 22:34:44 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm6745027eec.25.2026.11.12.22.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:34:44 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: linux-usb@vger.kernel.org
Cc: b-liu@ti.com,
	gregkh@linuxfoundation.org,
	nkapron@google.com,
	tony@atomide.com,
	bigeasy@linutronix.de,
	balbi@ti.com,
	shimoda.yoshihiro@renesas.com,
	robert.jarzmik@free.fr,
	Chengyu Liu <lui2012qwq@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] usb: phy: gpio-vbus: free the interrupt before cancelling the work
Date: Fri, 13 Nov 2026 14:34:09 +0800
Message-Id: <20261113063409.47485-5-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261113063409.47485-1-lui2012qwq@gmail.com>
References: <20261113063409.47485-1-lui2012qwq@gmail.com>
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

gpio_vbus_remove() cancels gpio_vbus->work while the VBUS sensing GPIO
interrupt is still live: it is devm-managed and freed only at detach,
and gpio_vbus_irq() schedules the work with a 100 ms debounce delay.
A plug event landing after the cancel re-arms the work, and its timer
then fires on the freed gpio_vbus_data.

Free the interrupt first, which also waits for any running handler,
so nothing can re-arm the work past the cancel.

Found by static analysis and confirmed with a KASAN reproducer:
slab-use-after-free write in __run_timer_base() within one debounce
interval of unregistering the device while its VBUS GPIO is toggled
(object allocated by gpio_vbus_probe() via devm_kmalloc(), freed by
devres_release_all() at unbind).

Fixes: c2344f13b59e ("USB: gpio_vbus: add delayed vbus_session calls")
Cc: stable@vger.kernel.org
Reviewed-by: Neill Kapron <nkapron@google.com>
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
v1 -> v2: no code change; collected Neill Kapron's Reviewed-by.

The reproducer instantiates the unmodified driver on a gpio-sim
chip in QEMU and toggles the line while the device is unregistered;
it widens the remove()-to-detach window with a 500 ms sleep, logic
otherwise unmodified.  Repeated runs: 5/5 KASAN splats without the
fix, 0/5 with it.  The KASAN report and the reproducer kit follow
in this thread.  Also build-tested on x86_64 (USB_GPIO_VBUS).
Fix written with AI assistance.

 drivers/usb/phy/phy-gpio-vbus-usb.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index 60b7c1219dd2..82d2301c3804 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -325,6 +325,14 @@ static void gpio_vbus_remove(struct platform_device *pdev)
 	struct gpio_vbus_data *gpio_vbus = platform_get_drvdata(pdev);
 
 	device_init_wakeup(&pdev->dev, 0);
+
+	/*
+	 * The VBUS sensing GPIO interrupt is devm-managed and freed only
+	 * at detach, and its handler schedules the work with a 100ms
+	 * delay; free the interrupt before cancelling the work so a
+	 * late plug event cannot re-arm it past the cancel.
+	 */
+	devm_free_irq(&pdev->dev, gpio_vbus->irq, pdev);
 	cancel_delayed_work_sync(&gpio_vbus->work);
 
 	usb_remove_phy(&gpio_vbus->phy);
-- 
2.25.1

