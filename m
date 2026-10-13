Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B5748EC77
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 06:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872509; cv=none; b=MXyrCks27iO1bj1tk1yJV17vB1ddcUF81UvH5hrR9u1lkl86RjuTWblh2457TYfLWyTcXh8r7P2iNva5A43UWYo20op7ap4ccB9nk3Z+lEFqJpIliSYqtM6RkLLKjtuT0BSDXxl+2xF3GdQkfj9CLKj+OoeDpc7XL0z/Qk4Xe5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872509; c=relaxed/simple;
	bh=yKooLcN7CHgsaZDkbyO505c2en4X/luvbmOSMQrltvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X67kk2AAFOpAfXFBZRS2L1yS74JG2U91kfLZdCxqlj7Skm/VX0EtrZMwF5aDj/bzD/58HJ2EaqYvjTiW8QJzpsyZWR3gvjsX4KBM7o4XssIQs0Kr9Rjihme5dOwkFEfQVIeUFkAsrzNc0dC/B4IP+e9L9OWFP+MyncywLCQckGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=OJD/rVKN; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="OJD/rVKN"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso1224311a91.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 23:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791872507; x=1792477307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwgbOTwZS+Wdyws/KBJ7MPJ9pBsymYg2xZOg5DiPzmg=;
        b=OJD/rVKNCkUPvfK2qDMpJo0Npj7pS36O0z7bxReh/mqmV+syp0FBKLFVKn2RBfUcIG
         mPv4P1wKXSGmXsBvHIbvt/v9C98Xn5g5J03nRbPM1zhjIRT7FoLZZ/pCsiYC7HAo8+rA
         KxcSy7DsauY5PB3TFCcN9NtZBYzAKxDq/hHyYxn1sA1rqU+G0Y2NhYJ5ld1ihI2bZ5Sq
         mGvGDTp4tpO0pcKxSL0Jg5ByqtsPgA7NpY0castUHSu6TMhJLeaJLNnyqXjKf+MD0UYH
         XUh49PCXPGKEVgUFtbGSo4n5xtjDzDvAl9q+iNkfA0IKr1D/dxjQJsUio4D6BtiR9MmR
         jwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791872507; x=1792477307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwgbOTwZS+Wdyws/KBJ7MPJ9pBsymYg2xZOg5DiPzmg=;
        b=y3jNglitIiNcUtvMRIJVXFegJBG0HS103jpY7SWIJHlMKR43iRMLCmyn3SEXWIfBGA
         Uf7ZvfRpAkheMBjPFBZlPPQB8NHpgkHJmKasalcjN/oXAj+OTd3s4w0qFLAUaQgK0mIg
         /BXlbEfVsi/3sYH/ytDBQbzvCx5ymMrKv0coUCIBvVmR62uTd3nGD9Q3LISPZOCNM3ve
         hjcqwSXzwBHMUmqm3vcVkXWwxFoh3JhlkW0IUgTns/hPM/SqZH/iiZy8GqVG5kdUFNo9
         j2dPKi/x9nmKl7NPAIFD+NR992fGJyt8JH0m1+N6V9jWe9Gkri4+6Pu0AoYQxlp5v/jk
         OsWA==
X-Forwarded-Encrypted: i=1; AKwUvBxFa5Pm52VHeExwZSRl+vZzAMMjFpwX0lKrr7xPI7z3NHP/j8ERPFvYkoIA8NaZldU2l5I5OpJjbuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUZesBjdQtOyldeLvsiF65cmoQJOO8MSiS+SvMQAFn8S290T5a
	9rusRjst2ONV4q54FMrmbN+ILoNCgfIrZz37fB00RIq/kkrkf+p6W2dOMUC/0IPc8pDT4OsSyr8
	I0HsWO5xGuA==
X-Gm-Gg: AYBFou3bmBFzyR0fxEW0kP5i5FonNASVE7boJ1CLX3HyCY/2Dv6CJbkS1RXVoY80MM7
	qcholSuCnhFLnQiXZUT0QHX9ixMDeyw7LD0eWBqJvsIiC/WyTj7/YkK+hV2167seerPAtncrxc7
	9XBnxwIkB+MNneoh3AHX4hhQiNwWDxCDzc7rs/Sm1P20W82/V9sv0x78TFjDKmkJTYpthXN/l4U
	+2b/Ab3xFLHonSrxbaAWyy3c34k8iIf7O0jg4MlOfo6djIF6jv+uLHZgZmMXqmE8rOtLErtRv9E
	4s8akd4MRs29AKTKJ4QxNK+W5HfeaVy2gPS9XvY/bS9jZOEU3Pcl9od6LrNV7jhSVOCZ5r2CXe+
	5Y6F5YQSviO7DoIw6pNBsj/Gczgsk09b8oQe6pt24HAwijk/AYYBA+MuqRPnq63s6VL8PytG9NT
	DlILuA6JHGSm4zp3YuCO3UHKIQgO3fTxagaRYPxIJuMU4rbiuQdrK8Y9yrki8/DPINhWhk+gBWx
	6GdgA==
X-Received: by 2002:a17:90a:d450:b0:3ab:364a:951f with SMTP id 98e67ed59e1d1-3ab3a3593dbmr7775494a91.6.1791872507175;
        Mon, 12 Oct 2026 23:21:47 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d3b4f7sm9253553a91.0.2026.10.12.23.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:21:46 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 1/2] usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
Date: Tue, 13 Oct 2026 15:21:28 +0900
Message-ID: <20261013062129.2568405-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
References: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bot_send_bad_status() and bot_send_status() run from endpoint completion
callbacks - bot_send_bad_status() via usbg_data_write_cmpl()'s cleanup
path, and both of them via bot_read_compl() after a BOT read.  Those
callbacks are called with interrupts disabled and must not sleep, but both
functions queue the status or drain request with GFP_KERNEL, which can.

Queue with GFP_ATOMIC, like the other usb_ep_queue() calls reached from the
same callbacks (bot_enqueue_sense_code() and bot_err_compl()).

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a2..12e2b20e33b92 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -139,7 +139,7 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 		req->complete = bot_err_compl;
 		req->context = cmd;
 		req->buf = fu->cmd[0].buf;
-		usb_ep_queue(ep, req, GFP_KERNEL);
+		usb_ep_queue(ep, req, GFP_ATOMIC);
 	} else {
 		bot_enqueue_sense_code(fu, cmd);
 	}
@@ -167,7 +167,7 @@ static int bot_send_status(struct usbg_cmd *cmd, bool moved_data)
 		csw->Status = US_BULK_STAT_OK;
 		fu->bot_status.req->context = cmd;
 
-		ret = usb_ep_queue(fu->ep_in, fu->bot_status.req, GFP_KERNEL);
+		ret = usb_ep_queue(fu->ep_in, fu->bot_status.req, GFP_ATOMIC);
 		if (ret)
 			pr_err("%s(%d) ERR: %d\n", __func__, __LINE__, ret);
 	} else {
-- 
2.43.0

