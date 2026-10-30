Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341296;
	b=1Sy4sED7cBsh5nv+ihUG/AFiciqPLpBuNI8yR+c4uXIwARECsR4bwViJm3l6EvULNxmG
	 amEUYTuhro5xxtdM8O4hlTn4e5u0fc03rVylSDxtDBSDlhSUMxZgK62v6qSYiHIrO6gjO
	 b6Sz05LaiJQgXcmm18/95It7FKitvPB4JK+HvbEHPXFbiZWgxJ78x1U19xGWWAxF6lgyN
	 T96lj9/LxH9m927SxaQgST3my8h4EHfJgnSj3KTEfljbKnKYgbYGV1/ZMZZsLQoe6KtRP
	 ej2lmG/5Rnd5cDuV9R3ilceMVuQY8XEkmhkR+sH8VHuHIIrP34JppRv1Shjt7EMqb5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5+qO4e9aoObV5kHfUDxwiB5My/f+mDNdyNiwUBLcB90=;
	b=oLwVJP/qTXDmpbr6EQtHoN2pFqnZ3vYtCLuaTaQaKY6GBEMpKQna1tLcVo/KEUfL4N/k
	 Neh3gVboo/ZetP/KfVtmLEsYzAcG1rb3Olng9Cs0/8lomlOZQLhC894WqUEmeHwua24EZ
	 WoYouJH6lsJmyFI7UE2M8d22cHDajn8QsGi51r4ApPnwspoyAn4lLjPIJnhqH7WucyYWl
	 8T3ypHd0+HU6TuYX4kihKddaCMvniH7y2c/+hI1TYCAoCatfrzkZLVGYRWRg5AWI3rv6K
	 rsZDWbBg9PfUqCxSNz9Yo1ibf2M8LZD2RsiT4rI6D1eTUm6C8ZqlFYZupPEQgyasKnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwioNr5g;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D240606A32A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 06:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D240606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwioNr5g
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df8fe8513so292329f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 23:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793341294; x=1793946094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+qO4e9aoObV5kHfUDxwiB5My/f+mDNdyNiwUBLcB90=;
        b=WwioNr5g0fkNHOfXoIjb6acMGFhGrQGJR1BAJxXRmb1p3QzoQyB3jZ9tAnUwLHnJt2
         uP5MGO4BJbsgdm2jHS3ekAJ/N8JoS72Y8Sje9ag9QDi1unxLIWETHevcNmsk8zW9bHcq
         kjBYarALxYbQD62IC/0RBapHeUJVzjsM/3EN3fPj533HjeDBsfpTQKzZam/7UPckW9Pv
         FOQp/68zb6xlmIQXyqwc77hFrdotL1xXqazXftWgsFWk/LOKVG9GskvYwTUMyGup4hR8
         khb+geC4lq2kqtATn7jWGvf8H1vzqmuYrUJF2+FB4+tqooNKPqWU3FZ8pAJva6eUsmTr
         1qXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341294; x=1793946094;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5+qO4e9aoObV5kHfUDxwiB5My/f+mDNdyNiwUBLcB90=;
        b=013a9akHPalY+Ht8VCiY5NlRmD/BZtql0Bd8I2v9Gsf7R6kUidckX+XGJM8aBGAsiI
         beX2I9seOx8e2YiIMWc+1ihSFjfrqCo/TJUYT3xMmJhadbCJ6AYKfVZE0YBRiF6Oz0kW
         AtKf2WxD8h7n3SSKULf3xmUixiJBEdJ+zQ0wB7ysPsVgtUosj+u6zm9W8YhKpCJW/Vc3
         1CPTi5UDLLQJtZ3hcPWOdpxSxy/y0WLBl7/SBGuyWzNup0YhaU2UFPa/g7mxlaEi2Zqw
         oF1JoCa5Iu06TgFAI/KrZkVUbt7ZLcplvqzRCn/3HNOAVKGdrslOMC+G71KuytZNvdRV
         X3Dg==
X-Gm-Message-State: AFq9FYK3UboRS+J8XpmntWKoMDaMeAC9sYo+xUJUJ7TIwMoctNNRBRYh
	phYeext1a/6wku7Gq6h/AwJr4+aFPr9emPEjE6S7FXR/A/yBsiRC0QPM
X-Gm-Gg: AYBFou09wPYaWLCrvCZw7TcYFiQ18sPf5V1LdQ5183lAMrgpusINorcfa4MnGuS0FBm
	MHK/7+2xRs2/RAQbeVeFURy2DnP7IhLnMFoKJz8m6tndaW7YURwk98F8SJEIsc1Es+Ou26TTNwr
	9fZ9c3B+zm9SyABQbjag/XckhK89UqWEaNqZmgOecfxdMtsatQeSBMriO7fAMvF1cgo4U0FyK77
	ds5Ljhv30LQVZL7u7ggwUTuAcSnd9o+cMOqQ+otx7OOMIin6xoAuhN+9BirY5+8Gqe7C/JQ4lgD
	1OyW9kw6ySLG67asQYrh0h1CNPSr5yjM7zXMUIGAvAPfT7e2tyuWyPbyRDWeCTvAwQ3i68UM62Z
	mHcc1NCDZ/3HSHncHFJvFYWBZtwsJeef3CLsxcYAmpEi9yo4ky0BQsGy6dL9Fs3sxlB0asL4QiO
	fjtnuksIXy77qp4EolseJpjgKWt/1Ha8NBWbSsQuPA08zjeDuIXSJiUVvferMr3mN97HoL66haD
	KTID9l8lLGYKxQ7zc6hU6wtL3Uglcd4mmORdrxPpaaDoUnF58wSUq9Z/Dzz3uXTMvR+l/Qy5BJH
	VzVePl6iX5auVOSmbvkgjcdjjyt5pU/aRoasxA==
X-Received: by 2002:a5d:588e:0:b0:48e:6652:fdc9 with SMTP id ffacd0b85a97d-48e6e4f54f1mr2944668f8f.17.1793341294267;
        Thu, 29 Oct 2026 23:21:34 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bab1a8sm1391597f8f.57.2026.10.29.23.21.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 29 Oct 2026 23:21:33 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:21:29 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: hcd: Cancel BH giveback works on removal
Message-ID: <20261030072129.40d0d89c.michal.pecio@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Turns out, we do actually need to flush them, because workers use the
'high_prio_bh' and 'low_prio_bh' members of 'usb_hcd' for a brief time
after all URBs are completed, to track pending completions and possibly
reschedule themselves - see usb_giveback_urb_bh() implementation.

Flushing would suffice if the works don't reschedule themselves, but
cancel_work_sync() is more robust against stray completions.

Syzbot hit this issues twice, but not reproducibly yet. I needed a 3ms
delay in usb_giveback_urb_bh() to get reliable UAF after unbinding an
HCD. The works run in soft IRQ, so they can be preempted by hard IRQs,
on PREEMPT_RT, or in a VM. The latter in particular seems to offer an
opportunity for "unlimited" delays and may have affected syzbot.

HCD unbinding can occur on hot removal of Thunderbolt peripherals like
docks and monitors which contain xHCI controllers.

Reported-by: syzbot+cade843a1e4af0651f5e@syzkaller.appspotmail.com
Link: https://lore.kernel.org/linux-usb/6a8a5047.dbb3a75c.13dd47.003e.GAE@google.com/
Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Link: https://lore.kernel.org/linux-usb/6abb3515.c6a7fab7.e5ea7.0459.GAE@google.com/
Fixes: 8fea0c8fda30129b ("usb: core: hcd: Convert from tasklet to BH workqueue")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

v2:
- changed "Fixes" as per Alan's suggestion
- clarified the comment as per Alan's suggestion in other thread,
  let's see if this will pacify the review bot
- another syzbot report
- more elaborate/plausible speculation on how syzbot hits this

v1:
https://lore.kernel.org/linux-usb/20260823125831.6ea35650.michal.pecio@gmail.com/

 drivers/usb/core/hcd.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index ee19628cd653..88f88e7ba464 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -3053,14 +3053,13 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 	mutex_unlock(&usb_bus_idr_lock);
 
 	/*
-	 * flush_work() isn't needed here because:
-	 * - driver's disconnect() called from usb_disconnect() should
-	 *   make sure its URBs are completed during the disconnect()
-	 *   callback
-	 *
-	 * - it is too late to run complete() here since driver may have
-	 *   been removed already now
+	 * Hopefully no complete() callbacks are running anymore; disconnect()
+	 * routines should have waited for them to prevent UAF of driver data.
+	 * But we must wait for workers to finish accessing the hcd which is
+	 * about to be freed (and shamelessly drop any remaining completions).
 	 */
+	cancel_work_sync(&hcd->high_prio_bh.bh);
+	cancel_work_sync(&hcd->low_prio_bh.bh);
 
 	/* Prevent any more root-hub status calls from the timer.
 	 * The HCD might still restart the timer (if a port status change
-- 
2.48.1
