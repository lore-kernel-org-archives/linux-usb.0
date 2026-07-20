Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CA83E1701
	for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542165; cv=none; b=qybMnHZblK4j6FsVLrn/TmErHWpJo2Hykg1JKeoGPcIT7w4o5kSXjFS1FjF4GHcYmTTVRfUDpoFWLK9MNFb6SY3W2TyqY2PFSmvTCk3mTGFw+S+Mv2AclGit35A27ptw1I14wBNNBORqJc+ArYiV8m0bIZB7hvhTg9arNujL1jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542165; c=relaxed/simple;
	bh=2viZWvH6/+46Pl78pc14Y4zP+oD7vA7rv2Yat9sU6W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nrpjjqj6h8qh5jeEI/zJbHs+/+iZw8BiI/OuGVFcKMDi5T7y4TJYuqEheWanLA1P2BpTotRpx9qg4UL9TZTUv2I9azsGRi/BjSDFlxJq8XCkXcqoQPk624I4QFjBdINjyfc0KbSVObdJ5p32/We7bh7bqt5n3HzLqMA6C3azKMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FogLk1Om; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FogLk1Om"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954dff6536so15839295e9.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 03:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784542157; x=1785146957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hAtyS+TPO1WR/0zgU9PmtjKVpg47XvcTOZ7PAzXPVhc=;
        b=FogLk1OmRUsLrFOvjzDodFQLXATR0T2TFEd0uiEbDu9uijhojWT4rjEqaqsdgEA2zR
         nyYmNcawuYDSh7B/pzBUTas+Zp6rK7QJxLUkKzXDEtd0eiKgobKK6cZhCXuWMVUS1mgn
         HwRSd+itzttpprUGqWGntLjxB9W4CcIszoYzMxtp58jvwXkZaqw+X3705ws3w5gSdj0E
         ha3mknb26ekaWg+FDGp8AvzpSlpw98yNx3bKv/YRL32x1m/DBXC4jDzWH+6lm9pfrQqT
         CyunIe/H/W7acj5vy093k8pdlJN/+KtS8lvdwdzFQE/4HnCJSaZhCMPJXwXBjLJrSoqg
         0GFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542157; x=1785146957;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAtyS+TPO1WR/0zgU9PmtjKVpg47XvcTOZ7PAzXPVhc=;
        b=b18uj3CL53d/qA5YSzYOgCRnz7xWoDeR5NKkp0Ew/WHiThbOceFiE+xxWmtj124QI7
         7nj2sXOw8d2LAdYJ7hUAZ7eg2ELqCeNAKtxpK4bUBUn0USo3+73o1O3CdeQNFpLmnQHh
         tfxHAap7FL0R3vStZPw43c92BaSH4NQS3tWd3AxIJgmhneFV5fdiDWHumYFe138qzJtS
         Wss/6t2j21IkZt/etXdTTWJealt1Zp+ufXnAKSir2QKBEZGdFcWXuRVSFxVVbTA9nQ3V
         qpN6rN/wkr/m12nthqcPFwLaCFpou0jvD2iDZtzMXpPMv2w+7knprbYSUiQPWmoHniaa
         Hcdw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5TYMTaJi/MdvIVH8wfFhCaVC439jTPHhXvsd2Ui5I6ffLtC2Q6QjxfZurV9znGp11Gt0H3WRJQg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaveBlVCLG0N4Sqjm9xawDWx9uSUXaSzj2cR9uD2d0yDpG/RYW
	1VkWIM8sb6pk5XkG3zb0wwlVkoTYXc8s1mhb7HXVhDR2h7blbBDa+qvqLUF0PaZdciU=
X-Gm-Gg: AfdE7clcbAR5c++lMQFXMrOAC5wqwjmIV2W3KBgw2PPKLet7QOSmqSF7+ycXv3j+oz1
	An0qoknR0vjqWLlq9K0lHyBOb45PHGDY1clkjBoAcwvtXrLzbT20zZKLTHXME+ZNR4e76IY+SCz
	3td4EdcJyKbN0cQ6zvzxUNZ8G/D73nhbmrWcRXkspSE8HJKJXILU9ZvdFl6ifLiiiJvFdTCB7NB
	mt7NcpW4ksy3il8ZIiglXtmoq3ZD0to4ZVGy9ZS0ptYjydqICjwgRfaOpaH8atRFMDLWBBCIpTN
	lN0C3BY0sCp40LUAy9vKPhof5Jhp7dPZvse0Br6UEv6pJRKggYPLTaUQdUrx0CYJ/VpmbghTZDE
	6l+pkagzeAoJxLZ5mHIf+jhR9nU4lpE2Dxr54Oqtq39pgDkIU0lpFT+iIg6Cmxw1rRwGpGA+mjX
	RukuX38LS0sqHBw2Rij59Z/bsA+w==
X-Received: by 2002:a05:600c:19cc:b0:493:b877:fbc with SMTP id 5b1f17b1804b1-4954a402fcdmr171968805e9.21.1784542157209;
        Mon, 20 Jul 2026 03:09:17 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm294792995e9.2.2026.07.20.03.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:09:16 -0700 (PDT)
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
Subject: [PATCH v3 net-next 6/6] net: usb: r8152: Move long delayed work on system_dfl_long_wq
Date: Mon, 20 Jul 2026 12:08:56 +0200
Message-ID: <20260720100902.155605-7-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260720100902.155605-1-marco.crivellari@suse.com>
References: <20260720100902.155605-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
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
index f61686433031..f6af66f294db 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -7072,7 +7072,8 @@ static void rtl_hw_phy_work_func_t(struct work_struct *work)
 
 		/* Delay execution in case request_firmware() is not ready yet.
 		 */
-		queue_delayed_work(system_long_wq, &tp->hw_phy_work, HZ * 10);
+		queue_delayed_work(system_dfl_long_wq, &tp->hw_phy_work,
+				   HZ * 10);
 		goto ignore_once;
 	}
 
@@ -8840,7 +8841,7 @@ static int rtl8152_reset_resume(struct usb_interface *intf)
 	clear_bit(SELECTIVE_SUSPEND, &tp->flags);
 	rtl_reset_ocp_base(tp);
 	tp->rtl_ops.init(tp);
-	queue_delayed_work(system_long_wq, &tp->hw_phy_work, 0);
+	queue_delayed_work(system_dfl_long_wq, &tp->hw_phy_work, 0);
 	set_ethernet_addr(tp, true);
 	return rtl8152_resume(intf);
 }
@@ -10295,7 +10296,7 @@ static int rtl8152_probe_once(struct usb_interface *intf,
 	/* Retry in case request_firmware() is not ready yet. */
 	tp->rtl_fw.retry = true;
 #endif
-	queue_delayed_work(system_long_wq, &tp->hw_phy_work, 0);
+	queue_delayed_work(system_dfl_long_wq, &tp->hw_phy_work, 0);
 	set_ethernet_addr(tp, false);
 
 	usb_set_intfdata(intf, tp);
-- 
2.54.0

