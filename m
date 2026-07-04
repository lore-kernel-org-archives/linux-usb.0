Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8BF3BCD2A
	for <linux-usb@vger.kernel.org>; Sat,  4 Jul 2026 23:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783206912; cv=none; b=fWr6BPf6+nzKJEK18XeP4lhH2uKK9KhlNMHJxjzNTQY57FATTu5msyQTwRhs1TGto558yROp3OcuY5SPcZmxMhylKHKr1OdZ9AOGd1mFuUlb1ZfV+HlZ4I61blYW2H/PAbn1mytppx/iia4yPT+RTslni2v8CYssS1jil78Q5IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783206912; c=relaxed/simple;
	bh=e2BPamJm7+oCvVkOZXZ7WWzDD6bJtBXALaaIxF5F7ig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ws4s2PnshTStScGTN+xtnM/UI636QWHyJLkf4s6Ofu1lf/SMwEu7n7fqR/Fixn0t5ZSsMjy0B+xapvyEf5suKZL+wJehPqu+49H0WUSIPpIwskfruAqR7rZC8ptjXRwMbjguPx1CioOsAzyCrKCp9uDxD4nKsV9MPc6QE+g2tnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ay6V5xgf; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ay6V5xgf"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e99ef0902so50756285a.2
        for <linux-usb@vger.kernel.org>; Sat, 04 Jul 2026 16:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783206908; x=1783811708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMpBVokVvC5Invbvqmg58wmiCwFqIiE4NTIeLL0hDKo=;
        b=Ay6V5xgfXffFyf/x7ugdMzpTXbbQ79FB0b4qPW73ULS64HTgYJCgZV4oop0Q6QS89z
         356zNjp6qgYHD9YTFmgnHygODEXtFw0SJlzQ6aPmAMOjBdyadN8nLuY8niF52rGEdFgn
         EmW02I+6llNC8DXh/RqpLYPQn+vp0/gO+Tfkx/2FjUTW6v6QXIsME03EcDPOrGjRaXaA
         KmcB3/FiBIIavxie6Yz1K54U1ogiK41p8592oIdP+LOocXrQIDldt+JjAUCmoqU/J8L6
         taQnc50kgbwY8Xx4fMz34Lr1tE8nTiyuCfSUxIV+PHrtkMyjlP+N5m11bScMKa9RpIKS
         xQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783206908; x=1783811708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMpBVokVvC5Invbvqmg58wmiCwFqIiE4NTIeLL0hDKo=;
        b=Tj297ZQGAchZZ+yILMrP87XqLyZPy0UCeNnsIgplT5Y9yRLVU67pNff3fiwUd51vzx
         YtBFaD8rO++d4coK+7Cblgyiyd1l90hfmIZv2jIJf2juV2tgpyxLCYHs6jsbqrl8TNN9
         T8hNsFHU03csYhwYCYB4iIpt0HlfGMgcUv/pk9OX4dKVBSMNopNDQ8C5D6/qHOCk2NGK
         KTw/608FWI9mn/OmNfe4O7Pr66pCJq8n56HabinFPZ9irFwjSQBpkppAYDlxINmAWJrp
         IwNQWZN8or8Wy0q5HJn8EJzKx0Kne49gWbVoVVP42LRbMPPfc8rgIIrMHxOxdIeWNnY7
         6JHw==
X-Forwarded-Encrypted: i=1; AFNElJ8oYVA7i/QR9SeZU3jEFnoNVq+/bvhgqo8qJRu8qDFPs3oWyk4BdmAy9ciG6E76AXAgqtU3QKJcbuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeMB2UfK6Gmn53dDrh1vYapEFDjofgPxX5xKG5d6mrYUGk3iBB
	nCT+m0zjaokR9LTRQGVSwT0w4BWIx1u2gWcqFg3PSjMuEHy6GChmaice3lvlxg==
X-Gm-Gg: AfdE7cm41VeWGVvtUQhT5MetPvF1n4ipExHOJlvWf98AubKRuBauxGwLJ8HuWTrdUlg
	1fHIhVDcT3+WO8Sobr/FE1AOPswGCJbkbtEwJH/5YAr25JvqELG+mQ/CkZyxfl86HoJROv3WFBX
	hV8P/dc3eLGvYauY9NMh40Bd6JUJtRYkb+FOEthsZVHIOZc1MUzbl/87YKs/hj2rO6bmuq5Y2if
	bXZbKz+b9B3+c66OFoSKThgYh9YTV4+JOSD0yYgisVvT/APXtL6KqXuLwQPMnVQuxNIuPdf6yqP
	mmGm7vSUqsiSACbdgQP4yreYj57lsyWM/CXRBVKnLnafpxohS+/wndMczt0FLg003I8GHaWMBmC
	9UIvay7aEIbbJepV6M0ZRUIQtvwjoFrW7fcdTQ2QFiiA2lLfyDDLSRu7a4/3evvjsLms3KR31wv
	KByT/5DODlhE6WeiEcRHr+pGf1WloKn+ykt+BYmXkbkiDZH+jTY6LB
X-Received: by 2002:a05:620a:1708:b0:92e:6858:2ed1 with SMTP id af79cd13be357-92e9a4cb049mr704080685a.53.1783206908591;
        Sat, 04 Jul 2026 16:15:08 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90c92662sm500407385a.30.2026.07.04.16.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 16:15:08 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Subject: [PATCH v2] usb: typec: class: drop PD lookup reference
Date: Sat,  4 Jul 2026 19:14:36 -0400
Message-ID: <20260704231436.4060902-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_power_delivery_find() wraps class_find_device_by_name(). That helper
returns a device reference that must be released by the caller.

select_usb_power_delivery_store() only needs this reference while calling
the pd_set callback. Drop it once the callback returns. Otherwise the sysfs
write can pin the selected USB Power Delivery object and prevent it from
being released on unregister.

Fixes: a7cff92f0635 ("usb: typec: USB Power Delivery helpers for ports and partners")
Cc: stable@vger.kernel.org
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
v2:
- Cc stable@vger.kernel.org as requested.

 drivers/usb/typec/class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 0977581ad1b6..0595e8cb83aa 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1619,6 +1619,7 @@ static ssize_t select_usb_power_delivery_store(struct device *dev,
 		return -EINVAL;
 
 	ret = port->ops->pd_set(port, pd);
+	put_device(&pd->dev);
 	if (ret)
 		return ret;
 
-- 
2.43.0
