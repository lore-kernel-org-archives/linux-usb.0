Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617047;
	b=vqCldroeyQmc+ADMo5+fG6pGZT0U3VMDz64QACFv86Wk60d5DBwlBjEM3FEEfBbLs+6N
	 ERcbJrx4mmAMhP+a4ZEqfq89Loe0AdB24Y73EfXvJknlUMuajB7cvZjq/AboePi1U6qP3
	 5CLfEGx7CQlcgGEpVXDL4Jlm46+PILJ6KMnbzIknhTgZf78ZCK4XOUW/cd8wTVdS3Cnkb
	 esV67173kiP8/1unw933nIc+j1naEikWfgPlbEIHg5RYxXYKBYI8r2qI5sYZqmXHl69LO
	 Xdkq7QdH/c3ukiLjK2jltCJI4ZLIpFBYL0Fwlf88o8mDrikPdv3lROsx6SWydnHAdRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MEFT/ALM9DZEMfY5C0sSExRjEKJeRSawG9RBT+Nn+N0=;
	b=go406vHWaq3xX+YEzaxEVSByZngEqUUgV6oB9L4wr0dp7t4pbQ2yohHKCH40VOzIeTty
	 +4jr/3fuPW7Pkid89KLoHotIxtCOCcEtob2T6P1qBDn28TcsSLkUoC16NOQx1KObWXLTy
	 PdfneiVrAgdhDmubZR1mnXugh0Plk4xgOYd7EPP/XADInhJ4Gn7tosUCLiXedDjlTQxiT
	 m0vK6606LTclw3EU2Q+frFOOOLbxrh8To+8YktSwOMJx5xcJ7AcrtR7yRrRNRKm/pi58/
	 cy6Ls0KLaZdFSeFpS/N1h4qKbMsvS9CK7hXkXIQ1j4hOewuiX/p2YGR0SJfJyn3MEWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GjvqH4h9;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D64760A263C
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 10:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D64760A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GjvqH4h9
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so17858175e9.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 02:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793617046; x=1794221846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MEFT/ALM9DZEMfY5C0sSExRjEKJeRSawG9RBT+Nn+N0=;
        b=GjvqH4h9aGhgAoSu7Hb2JUpF6QSASqEQeq+hwqNF8rAdi4B1RGuYmTBOGlZaFM5lbb
         eZFlEKQ/Qc1bcKDNlP2XZ4KuWSH1kJJNmz3SJ0QbRgZ07MSeI9XX5vBeaxXV654ohujB
         B9C+DZ7RmSPqHVbWhoLWUJfcNThQnV/zCNq83jMLQXrhcI7+HmBeTuJ2onsCu/EvcfzV
         ZCdvzy1/n2iXENo9S7ydG3iGzMFSm0hC+p0++qyHZpXvYtvzLHYZ700+VMdttyQzDYFg
         KEflxHKonheMJhbqaiaAdaWrnEwK1hTdkgPSMJpfrvB7VV4kR6/6SIyh87R8AQPyFQFE
         ceYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617046; x=1794221846;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEFT/ALM9DZEMfY5C0sSExRjEKJeRSawG9RBT+Nn+N0=;
        b=XTTjdyhic6XrJwtCeB1IMNKxZ+3nHq8078LSKcoRcSaX+TTJhh8Mu3sEcJt2jg9VGF
         pUqKo2uwfJAae7QXd8SsqetSSdpGhUSn6ET0lAC1UfkCmJHgfmVpIQcaDQ6Og7h+RLdz
         12N+Ymml8C4VQTeKm5nwHp8MgIbsMkd2R1WQyL20SxrJw926FS/7/an68ygyeSd4WRqA
         NDLFAV48KQiIbC7Kg9zK7U2rTnvReV0F1qBdF4cP2uP7H8YDowKGcucWk5G9S517LLf1
         tnz3iBp1ROQZoQJC54DK/1HER2LZRa7+r15OR1fxEIUGunlSnZThTK+lDKmiaBWcFJ1V
         rPlQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5iHzQtMfnFlAxBEact2jkOzWJLslEyBqk1iFLpZJXBB4U8byP1weacS3xDaRwBW9mZ0z5pmUazI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLArvraTCZGvg81NUy0BZnf9KhkBh3gVao8PcR7GBHZmYfhP65a
	zx50D66CgeWg/uWF4Yn5/RZ7dja4MGF4tPjatFg/uVFFFGfGCZDom1mYLurPe8Fogqk=
X-Gm-Gg: AYBFou1R92fnkZeGvI3kY4ZtQM5wIxmqCSHcYLMOxiyPYio0+IIjqrdvAqbbo/xYhiE
	T8gwycpZRSwEUlNZP1zacjG6aPReq6nbeMiBtODq5UsgFOM8RjHaBRu8YEyVviyDrj4uLLT0S0o
	gjJ66BDbPhiDFt05rItkNN8MtAFhT2G34qeKKYSkMEqw6qVfOHa6weEznWk0496zC5HjJZZQTQu
	TgROgPFXeA9S6ejhT2vFTFq2061DamgenRrPm/bZYVzoxN9oCucrpg+04rAqZ2T4Vu+TBy4wDlg
	sIRCNMrSqndGZzxX8Q0pU0xrbutHvgA+kIltJ/MbCfgMdqNxZEwZOA4f8CsFb7HBMl3EdXIk8D/
	i0VM2AuHn1v3rlO25alng0YfDTQN6Zo00p41vaY/w/nw8tWG6uz7OJS8fxGIKEE1yN5W/TNZ6GL
	K7dR3s12Xd5GSO7vtBudII9teysnez4JLTDwSD1npvoK6gdixWO4DUvo9cbKEW8itFqTQ2fqdat
	YeXsuTGga/v+vhdJyzou6XH5hjlz9cb/6PqJjjI1xK7/dUfvuFRZP15Yt8ZQyVxycowOPR53DTA
	9uUKKNCS3qC8+SUpqfS4D5vu0grUBADTmJY3qTJyy6Rtldb4VpFT
X-Received: by 2002:a05:600c:8b01:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ac16fa4f73mr235301845e9.8.1793617045755;
        Mon, 02 Nov 2026 02:57:25 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm363171175e9.1.2026.11.02.02.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:57:25 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Petko Manolov <petkan@nucleusys.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH net-next v5 5/6] net: usb: pegasus: Move long delayed work on system_dfl_long_wq
Date: Mon,  2 Nov 2026 11:56:55 +0100
Message-ID: <20261102105703.111844-6-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102105703.111844-1-marco.crivellari@suse.com>
References: <20261102105703.111844-1-marco.crivellari@suse.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the code enqueues the carrier_check delayed work using
queue_delayed_work(), on system_long_wq. This workqueue should be used
when long works are expected and it is a per-cpu workqueue.

queue_delayed_work() ends up calling __queue_delayed_work(), which, since
the work is always queued with CARRIER_CHECK_DELAY, sets a global timer
that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since carrier_check doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Cc: Petko Manolov <petkan@nucleusys.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/net/usb/pegasus.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index 68e4b6658dd2..a4ecfec290b6 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -1126,8 +1126,9 @@ static void check_carrier(struct work_struct *work)
 	pegasus_t *pegasus = container_of(work, pegasus_t, carrier_check.work);
 	set_carrier(pegasus->net);
 	if (!(pegasus->flags & PEGASUS_UNPLUG)) {
-		queue_delayed_work(system_long_wq, &pegasus->carrier_check,
-			CARRIER_CHECK_DELAY);
+		queue_delayed_work(system_dfl_long_wq,
+				   &pegasus->carrier_check,
+				   CARRIER_CHECK_DELAY);
 	}
 }
 
@@ -1231,7 +1232,7 @@ static int pegasus_probe(struct usb_interface *intf,
 	res = register_netdev(net);
 	if (res)
 		goto out3;
-	queue_delayed_work(system_long_wq, &pegasus->carrier_check,
+	queue_delayed_work(system_dfl_long_wq, &pegasus->carrier_check,
 			   CARRIER_CHECK_DELAY);
 	dev_info(&intf->dev, "%s, %s, %pM\n", net->name,
 		 info ? info->name : "(unknown)", net->dev_addr);
@@ -1296,7 +1297,7 @@ static int pegasus_resume(struct usb_interface *intf)
 		pegasus->intr_urb->actual_length = 0;
 		intr_callback(pegasus->intr_urb);
 	}
-	queue_delayed_work(system_long_wq, &pegasus->carrier_check,
+	queue_delayed_work(system_dfl_long_wq, &pegasus->carrier_check,
 				CARRIER_CHECK_DELAY);
 	return 0;
 }
-- 
2.56.0

