Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884893E00A0
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 13:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345250; cv=none; b=EAkJsm7umkBaluceObc8LhWDclSPhfXAqzKzwbO0g0zni68nMx3vDk5X+5og3ntA8iQoSxXXP4Fqnpbnw5238PMXeWYjYuKgkt2UjXguLmUQJHtjg4stUFMM/cF98zf6T1ugEcgjh7V2jrbBrZOApB4UIr/niGSQ5yer0QDK9zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345250; c=relaxed/simple;
	bh=2viZWvH6/+46Pl78pc14Y4zP+oD7vA7rv2Yat9sU6W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d2pznPxjcGWI0cUWADEOIWoBeQd569in8ExTlYcJMSRs7kv1KB8wTPT36HIx2OUz3E6RSTp0DUyEvtsyqSCvEXAtM7Q9DS3AsUSW73qM3G4mxNM971hyRRpBhJsT8cFal5VJZXczk4EF+i1dyE4T/uI7LhmG2yXe71n4P2s+w4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P5zsbP1R; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P5zsbP1R"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso12272955e9.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783345247; x=1783950047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAtyS+TPO1WR/0zgU9PmtjKVpg47XvcTOZ7PAzXPVhc=;
        b=P5zsbP1RmXMQZnFuOjKlFxnOj4MiKe8c3H5tJ/SU2VYnNwRNoXbhoFJcMNSSyWUdTd
         qAmi02P7MFCe8gRBzYsmI9DJt+wDp/GKRD58yGm/oZDj9IRI2tcvdkH/poG0TYPeFEwx
         xu49ARapyE9Ep1adV4HC93x7+mS/tIXOvQs02ZOUT92GbtSR7jSqXS20VqFkJ+sW7+22
         9ocZIIQYkjD9yYKZZ2xdgxEkEnVyaLwa/Ofc58WJRhldFTXj7EDhsCwj5gPpdXwoBrEY
         EM9kaNFQFImhpliGjtgvCbvDSX9A/hvIBrDATWY4NtRR8ZU+N9j96r2Gxryi2mvIOyE2
         fWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345247; x=1783950047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hAtyS+TPO1WR/0zgU9PmtjKVpg47XvcTOZ7PAzXPVhc=;
        b=px/oJBfmz/GOTDkYqAup+zKs+6GlcbjMnRvpEXk1miApWgG0iHVw34NwBzmL3CKHVf
         CP2B8DlR+fixrgsejczOGxxKTqdBkuTlJFsTe1mo7ZEb534N/gRmY8M3QLY5GyUt7l9V
         yCBZKuuHVJFJlGEmZHj6J/1PJfc7kfd+w4HqZGou8gip/1k57d7gkC5rhy7ToOzJg8MZ
         TDvEyeBtwtB0nftq0A6Px9C/8dfh5A1VahiyLQTx3LfwOWyOX35e5su1p+2hy4WeQZL4
         lzj8KlDnJeqwWf+ZZpK6IUt+IOmE5qBUCdIQuV+Si7OKkns16zVsAJQTXjrSAWefU9NL
         ugCw==
X-Forwarded-Encrypted: i=1; AHgh+Rr42Zbd+Qs/150kF+JPg7iMuCEphtNMGl8TwVf1EjJuxw5CDJBpUQN4JEEFmJ68epP6bE3cDtquul4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+7diDww0vYXXix86XoMRrWsmjRtNez5ieZtwGkv1ZjcciiC7
	8o63+t/LqY0IdtB+9ZtEA0SBx95OKQBDWE8HdNepY9An5PFKDy3SRB0KX4jKqG1GD8g=
X-Gm-Gg: AfdE7cnnl4jPtmIsPdMjSnlTSchHBNugKK/D/MxpSCsTPokniDmj5zHzyW76QvRUcyk
	exgKq3ciyLnP1ybQ+DcnYqqlZUQAuzrHf0jaNisefLDHByHf5yrNT2HsWjMUkR8kH6gbsnQCQVu
	J4qdW7GNNr16tSXhxgr/zM1WbteilksLJRBL3KMcs5tduIFQ8gnLWl2+fMmufKsQwNtqr8Wyp3k
	VLzGFMYjoBuFwBiBA2kQx6VbhOzot0e7wMOVKSgXcF6exMeD2h+5t6LZQs/UlyDbjSlryU3eTma
	lLfZl5C9F52g3tO02tiYZwahVG+v5+pUWDaeegJM/vROcZH11nhWW6aYY6+5Q/rX3QT5h+jk4DO
	zkFVJSRT3n50JLrGOWDQ9UmTzdoTvvJBjYklbfhZrdKlXX3r75fKkxdbWZlV01KXsPfo0Dt5FAQ
	SEzcRzYISa3t+ZhN0miPmIZTHiXIuZhkAV3OBram8uoUZIxg==
X-Received: by 2002:a05:600c:1909:b0:493:cfe8:5b36 with SMTP id 5b1f17b1804b1-493df062b57mr7704775e9.8.1783345246965;
        Mon, 06 Jul 2026 06:40:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm24424868f8f.33.2026.07.06.06.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:40:46 -0700 (PDT)
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
Subject: [PATCH net-next v2 5/5] net: usb: r8152: Move long delayed work on system_dfl_long_wq
Date: Mon,  6 Jul 2026 15:40:28 +0200
Message-ID: <20260706134033.244295-6-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706134033.244295-1-marco.crivellari@suse.com>
References: <20260706134033.244295-1-marco.crivellari@suse.com>
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

