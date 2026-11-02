Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617049;
	b=rAJBn8qGPcbghmppPC9IwvypfVC6DSuuSBGiz6eh0xK1z+Eryf7GTNx8ma4F+t0dcPSQ
	 71BIfQ6cSc5whnRVEUerB9e1GRkWX6nX/s4X7bDBsKS3CHVe3k4T8clmbxdLHbhdAvF3A
	 8uDBqd6NROfCKpVue8k0OTcBjExhBU1uXxYTz/DwLMt1wO7XMZCM/OtLJNJlWMPiKmpuD
	 ZOuRGA7s5I5qAvm57+hBQj5aCZnab3bgyUsUB3KGgiI1mNgsVryvtLvppMdld15Z8yluS
	 RchKsMB0aw3/Qqqy1dm+fSUyi+D974j0+UCD+qt/REvkrGltKep8xVKGkgbaDJXiutQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VTSGFL/OuCHUOn2dSnsPuxyMOhqVaXG6DpAGnPdCD68=;
	b=DhYPOC/i1ubR81tWb5OelTAFgLTj9ZrqR+uzGhO4x0JgjsnzlbrRa05n9SCFtdl5lKO/
	 WCzKoeaSDKZ4odytROm5bkxZqJ7R4JYCvMIWwZY1+vEbRqzdc6ldJvl+IS8LXWWx9kQG7
	 Do/UvpZsacheI0RQjt2H95KzfavhUMgDZ6jL1Wp1nIuVx4ARLMV6ccWukliHftpkNN16T
	 l5PondEiInL6+VPKKnrqVPiW4E4uENPMxuKpejzKezA/HIZ6Ox1MK9j6bxXB7NiysLwy1
	 5gz+LgPQCDM6M7bdcMhj/hJBETfyDYmexJ+ZxvZjo1tHLSnE4F2sUfIrjxpOFZRepvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FJMqbfoH;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571A460A380B
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 10:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 571A460A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FJMqbfoH
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so28966485e9.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 02:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793617047; x=1794221847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VTSGFL/OuCHUOn2dSnsPuxyMOhqVaXG6DpAGnPdCD68=;
        b=FJMqbfoHzmU9NBD5OFazlCTtXApiZl2pCDBFkJYEeWZp2zNjHrL8hIA+ErSrHlYIy3
         gPGruyieOAD6LhqwXujERZqWZBVFYI+UvIEOgn6cWVZbYyuuflU6FCmFyU1yzWUPK9F8
         k/638ZQuZvZ5yq9olZUMdCnfGbk4kN9pWZTyHVG1M3FzWjkjd8MXGQbAlNrpNkMzLkUe
         ExCh65HdON6dE/sKFRPxj88eHxM14/RiFdxDQ3UJDBTcccbtUquX1eBIQp6YsA2FkvVE
         jszA64F8slwC9nnNstEkvqCpiDgI/0l7pAZ5OtgdjF9wJO1Dg4uE51CBNQHYVaXtjutg
         EbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617047; x=1794221847;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTSGFL/OuCHUOn2dSnsPuxyMOhqVaXG6DpAGnPdCD68=;
        b=Vkh2i0WPr6oZXVJ6pa/rfofxY7VyjStBT6VfwjHKjNZlTdfIesBjODJrAPIbq+1o2z
         bIQhZjh+4gRcQTUGLN9G0Yt547CGn7Fh1EfVK5u2KClsuCJFgGQKQFL+Ol+6kpFgS876
         Ip7CHxkjW5+H9xhwCWzMuMohbQnz2quDxtCFmSixyV30BjiijpMjJ8qlMmqomNlWv1Hw
         UMkUaQreKWuH77jYgkZtaNRdiFbVcGh9BDMr9pFZ4ioP0+4sSxwE5+rE1q7p5VbgzReB
         CcMtIV+FKRok6xg/R1PZFdfxF5FvhZeHvfWkta7APIjGlr5EgoziJpFyCigDwGwOcE4E
         CGEA==
X-Forwarded-Encrypted: i=1; AKwUvBytkTTfFbYCImTqheOP81jwmGh37+4k7kLztNTFyHPSNzc7ogidwwub+O6r1hpXBd1cWZsJ+3HTeRQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ82xj4qn77Oa+8xjrQu+g9K0xiTFUV+lwdR3K2vl6WPuaZV+oZ
	0nzpvsgcNvM6FZQctel5F4pfru2KsssUXPjE9mQKEsW7XjzTNjXSLX8IjUHbe/QdG/w=
X-Gm-Gg: AYBFou28uRifccYX6d1WEKTC4T0ZV0pnhcOtHDCR+uw0Ih6i7p/kbcK9Ac/cjKZSdwI
	ucdFQruC9dtGhzOmTFpkGLaA1nWLV/ZBBJQ8k086V2qs0CQEDLrkvBbwLyKyrP7Sko4iJX/R2eH
	hehBFXN3j8KIS8JgkLjKBCyBL7xlKdnjzoZ2qhUfcfo9S5b6TH5urLczwnXo+za7jY7buWyllCM
	F9dr2yGznE1rIXfHDLnsR6iIBMcieoHIwIHNiWMtKx5CRofx6uJCAR/VvzjWg0VW21xlB4y4aSv
	hf+EiKYbAqJ0FYO1qWhJtWMYfossyvgS+8On+gJsqO1vA7vyNuWNsuQ6WbyxSu565zZxwcHxr6m
	aqYYuYQx2uIrVQy/cR26uecPMOU96iDKk8Z1lEY/NE7mfpI8qCNR0ys2UxqzttnCCl0CgWxu6u3
	15tWvgCKxeL0HNVbIFxYNxHOO05c2h8GfnwWNaF5Bvu9rcNk2NfbmoKHSTTKngL/nTtToqq8Rux
	YcgJnBcu6xAuDF0uPmoEIxHXd7yVXkdJMFj/paC1dfCxQxsAorE/YihHc10VF2rzvjkMannVcp8
	ObIbh2KbjAct5FHv02wizGxvMQ7lpj+sC7bBoJGZkF0eskkE6yHa
X-Received: by 2002:a05:600c:a4d:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4ac18c7388dmr247349255e9.25.1793617046786;
        Mon, 02 Nov 2026 02:57:26 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm363171175e9.1.2026.11.02.02.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:57:26 -0800 (PST)
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
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH net-next v5 6/6] net: usb: r8152: Move long delayed work on system_dfl_long_wq
Date: Mon,  2 Nov 2026 11:56:56 +0100
Message-ID: <20261102105703.111844-7-marco.crivellari@suse.com>
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

Currently the code enqueue work items using {queue|mod}_delayed_work(),
using system_long_wq. This workqueue should be used when long works are
expected and it is a per-cpu workqueue.

The function(s) end up calling __queue_delayed_work(), which set a global
timer that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/net/usb/r8152.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index d3bb7ee9c9bf..4815235e8e73 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -7053,7 +7053,8 @@ static void rtl_hw_phy_work_func_t(struct work_struct *work)
 
 		/* Delay execution in case request_firmware() is not ready yet.
 		 */
-		queue_delayed_work(system_long_wq, &tp->hw_phy_work, HZ * 10);
+		queue_delayed_work(system_dfl_long_wq, &tp->hw_phy_work,
+				   HZ * 10);
 		goto ignore_once;
 	}
 
@@ -8821,7 +8822,7 @@ static int rtl8152_reset_resume(struct usb_interface *intf)
 	clear_bit(SELECTIVE_SUSPEND, &tp->flags);
 	rtl_reset_ocp_base(tp);
 	tp->rtl_ops.init(tp);
-	queue_delayed_work(system_long_wq, &tp->hw_phy_work, 0);
+	queue_delayed_work(system_dfl_long_wq, &tp->hw_phy_work, 0);
 	set_ethernet_addr(tp, true);
 	return rtl8152_resume(intf);
 }
@@ -10276,7 +10277,7 @@ static int rtl8152_probe_once(struct usb_interface *intf,
 	/* Retry in case request_firmware() is not ready yet. */
 	tp->rtl_fw.retry = true;
 #endif
-	queue_delayed_work(system_long_wq, &tp->hw_phy_work, 0);
+	queue_delayed_work(system_dfl_long_wq, &tp->hw_phy_work, 0);
 	set_ethernet_addr(tp, false);
 
 	usb_set_intfdata(intf, tp);
-- 
2.56.0

