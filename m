Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063037;
	b=oAPou1ApJ0YO2Gn5JqPOeTKuCK7m0Aag0O+uTjUzxsZW24GzqRzj1Dn1cw/oSX8MJERr
	 DFVhAnQ6TId2kpa9EzHjUuzaQX2LxuK5erA+nH4iC3vizntMBfySRlKpdcu19p5ogJxkE
	 s0bqrDEEPz5DzBe4fm3iyKoh89MElFQh7NBMde0v/jnf/DMLT6aglzeH3MIQVvNWxziXP
	 E8/f4OUWZE4mT+Dbkvaz4VL8OpYHSERSMeAGO1Ldh/rQGgCnMjaJaedkYTuXxDLB+A5oo
	 ypFSNMJZa0W2BvO2B1fZttoki3xX84J/3YjMw2S+BjA1FLGajAeNwqX+r/M1dIPGj9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wae4+lr9g9z2uadKIYhnawrpwms/uihzaKeb+1TSuHM=;
	b=1JuGakn9NPFU56Y7LBoUVJFuFTSmHeregt+9sIB4skszh6WjpM8al++WL5wh/9jhKBDp
	 qlmIcGTmI4HYGp8MR8JpUMBaY+tLx/uHOqWXF/IFURfvNd4AyASxYuIxxs7iWiBMiNEpX
	 Wu8nemA3WT+p8hGnMhpVkvM9oXn6OgqzVzBUnwe+DPqeLcyy6Q8l2eTC+rKU092K3Pjae
	 Y54Qr5REgSQPO85fZI8lFkOJHoOMmKKcVZWs29jTH7sHGAmno1FP8zr3tVELBrMNPcQsy
	 YL4bGBJjmpaHRU7d0V4RA3MQ0lHYNmJ8T48LYLQcah5xsF2IEqelx9n5cbMQVN/i1LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzW1D4rp;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964DF606EE84
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 14:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 964DF606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzW1D4rp
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2492602eec.0
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 06:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794063037; x=1794667837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wae4+lr9g9z2uadKIYhnawrpwms/uihzaKeb+1TSuHM=;
        b=bzW1D4rpqqnOrb3vsNFhb5DTW95O08SqswKmvfhfySuSdgX19/bskdFL2KSEVEWUWL
         80QLoZIPdsm8fy6NKgHVevW2gUd4K6uG3HdTzLvmW96pYBPcldWbXfVtcgYMbmKL6Q7E
         dXr9hb20mwtth71Z6mU4EQ5rwkxoLkOhcoluYH0ScgXwTqSfyHxt+qYOEVI3Wk90y/GS
         a9EagFB2gSQVh2UjPSpAadsXSenYmvn+RWIj3lRSo3Y/sF/Jp/el5lG4PV9/Ghw6EZIo
         6Hz1A+hG92rC4QbYrCLHV3U/PXa7205CEMNDv0kgXb+ZV8bMD1CUADKR7d1moDCPxS28
         DBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794063037; x=1794667837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wae4+lr9g9z2uadKIYhnawrpwms/uihzaKeb+1TSuHM=;
        b=f+W3/wclrjFST6ci+ovEUw4bGZ98At5G4cMEwhubS/MUSSm1Uf65D7PDC/sfyF4x7M
         fXMoPrtGn8IlSO4RVZZtiHBCYCFL/IIcqLEVIj2+m/8fhNBXoR2CMyDp4SBIua4mcuvr
         uNBpJwFwpBL0/2uBlBKGTD7w9gDcJRzmwb1oBATq8suIo6h90T85ezrlvbPCMpi64miJ
         Sp6p/I9SHhXpmL1Gzf05J+eePH3MCBz7UFZG4LE/ZmgtRHTfbzYedW+SBqqLlNFJ+MQh
         rI1pds9V90oIrpSAuDy+mI6JOASFE6jHyFLHn5d1oosS7oeCSo7gN0SyYrrK6gXVjf4G
         q/lg==
X-Forwarded-Encrypted: i=1; AL+hErGx/ARzgWIQa1XXvA5EhL/PZjm6pF8rjOcKh+FTLn5Wq+/0wf3hXmHNqiRf6MrxrpRdtDly9I2jA44=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TgrzbWGVZnCX1gYBDUjwp4hYgyZ1zZQ4jK5p9HJ4gXjuEGj1D
	kk1IR1ggmNiNCH57C93uZaLtzKZn+DIsZCm36Sv+5xt60rdCkgKF00zN
X-Gm-Gg: AYBFou1LFHZ0GjlQI/4RGFTiJkczOAo8PFv7Q4lbZ9EnL+Y/1P58AsaF6zuQ/RbRbo/
	Jdy8QpmcryQ0N4NRNBG5Qck1PD+Qkd9eSEXDJEDkoUdvCboszcRzjklKbOPyzVNWlMoLdQJzTQD
	ZY0Hw/EDl9he2GM9lHN462CXrZgoUVxKlmTNjSJgkOEjGGHaAHy8EjestXgBH2M+5fDOX2L9V84
	EV5hSbQFvLqZ8pIax6KhINlhxso7KcuFokUY0OPmELD6koRkoLx7gav4ZeL6DX0imCfF1ChyWMZ
	JwSZyCdJcivPvTn9BH4tEJJIpSJg/2x6TQNW8rtN55PDBWuuJXUVtw1DuD0IRVyktYffGRBMz70
	h1ao9nJqf2w721rS/E5HSxwdMb2A20TEZlTaOkdnsgxiXMCuFGvVnvBBC2+0J9rKCQ9RyTYze6T
	KcEmA5IThLp+BvIZYvUyqVJ9gPwt2Fh4+1NnEWkuwrnUckh0+DUC/HLcnZcMwGviwRuJIhimSvH
	xpwpYioqwQVSesRi+iRlwpyS0Cqob5Y0HSaTYEHpsyfigIx5cr4FXa23f7yPTMsZ3MNGFKMG/jA
	cH28MqNv5C27/d+FWtreEHzLZsiPRFWG3uAdLcrG/bNMaIUDQ3tkckQHONAqh1/CPNg3Xw==
X-Received: by 2002:a05:693c:68da:b0:36c:a0d7:e4ea with SMTP id 5a478bee46e88-36f729cff49mr7699920eec.1.1794063036532;
        Sat, 07 Nov 2026 06:50:36 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8c4f28dsm15787371eec.9.2026.11.07.06.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:50:36 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: sl811-hcd: delete the driver timer on stop to avoid use-after-free
Date: Sat,  7 Nov 2026 23:50:22 +0900
Message-ID: <20261107145022.3734911-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

sl811h_hub_control() and the transfer scheduler arm sl811->timer
(sl811h_timer) with mod_timer(); the timer callback dereferences the
hcd-private struct sl811 (sl811->ctrl1, sl811->lock, sl811->port1, and
register I/O via sl811).

sl811h_stop() deletes only the USB core's root-hub timer
(hcd->rh_timer); it never deletes sl811->timer, and nothing else does
either. struct sl811 lives in the HCD private area and is freed by
usb_put_hcd() after sl811h_remove() calls usb_remove_hcd(). If
sl811->timer is still pending when the controller is stopped and the
HCD is freed, sl811h_timer() runs against the freed struct sl811
(use-after-free).

Delete sl811->timer in sl811h_stop(), after the port is powered down so
it cannot be re-armed, mirroring the existing hcd->rh_timer teardown.
sl811h_timer() does not re-arm itself, so a single timer_delete_sync()
drains it.

Found by static analysis and code review; not tested on real hardware
(needs an SL811HS USB host controller).

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/host/sl811-hcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index b044977..53a0bc8 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1520,6 +1520,8 @@ sl811h_stop(struct usb_hcd *hcd)
 	spin_lock_irqsave(&sl811->lock, flags);
 	port_power(sl811, 0);
 	spin_unlock_irqrestore(&sl811->lock, flags);
+
+	timer_delete_sync(&sl811->timer);
 }
 
 static int
-- 
2.43.0

