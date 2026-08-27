Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D771383305
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 04:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805496; cv=none; b=GVlibUqTzF39Ulol/A8vDuKc2a+gBmyyoheXG5YC+XFu3w7gCxQ3g43lfshghVfKvopWNOEKD2em3+d8SRp2E5fdO5254AzsVfymTmnzWmNZtJaQx6mdXVqZe70W9P4eaOi0q5LKgzy6VX+53nl8EI0ludSfs9c1+5jDKnT29Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805496; c=relaxed/simple;
	bh=0P+Ppehm+2rMxkEV+1Euuypk94PflIXQ90MtgsW7QNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpVxAvtf/UfZJNlkhNr8kxiKx3p6FQ/VBANF7u4t6IUZnt1PUqQSKLddtCKPscPiNc6XMrdN3JNLYybUK76mMd8TWQyRsaHMH9peueefQSmMt8JBnTjWi0cNgoeipCy3CZ1GWjDfOIWH3S7oWosAwM1Wjg7t4QAh9+NDtSvFN9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANXRAwja; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANXRAwja"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-395cf2535acso790590a91.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 21:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805494; x=1788410294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0P+Ppehm+2rMxkEV+1Euuypk94PflIXQ90MtgsW7QNE=;
        b=ANXRAwja2tPvK/Lmozql6U9jtUI8WKVTpz5dr0cqfuy+MMN11iGJwcuhGk4hh/guma
         /8imGq/AfwincljYvn+NWp5QX6AoWJqoyMUMfNyXPVdRUWuXYEEwzDRx1E5xuIva79jR
         m2pTsYPeet7fSJAVAtBL+moHhDnMXu5+/HcINAzAohPeRaHZcReBN4/qSFSLY2/Ox8P1
         JaBC1cCF+J+LVlCUeLDn+LuYedX8cbfLE+00D4KDKnV2ZTm68UtjUIeDQAWgKi6Na/XW
         osYrWcy8AJx06h5OrNbEMqe9qrEZ5RvqDgB1eZuSRczHXo/YwXmperkDWAEW4oEm0gsM
         vS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805494; x=1788410294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0P+Ppehm+2rMxkEV+1Euuypk94PflIXQ90MtgsW7QNE=;
        b=BD8b3yb0l4+QfNtOuvy80vFCXEwifrWVYn3N1TUM+WI+xS8eqXObSSJYSl5WCSrxmg
         NUMdVPI03ON3vVVO/fewFlzlYjLSTZP4mgQ5uwoLIYcEUpn2/UwSdsVT4IxM39ntm597
         Ckbrhu9G8xkPCjNApZuBdQ1SosT9yfWtduvCoBJDsIUVWaSOna8lfb0R/h4HwHtPLrlc
         6lqoDXSUJgrWSrilVIQ1cspoc23AZSkC4pPohaLab8Mj9oEh3um6PaX9PYdSyjE/0bFX
         9wOZx+4Zm20WZl3N8+8HW1WY8QxME0oQ8X/5o39DUiKq3fcAKWYZz4hojNVLJ7mdd8nU
         ZLMA==
X-Forwarded-Encrypted: i=1; AHgh+RrbpUVL79N9oMFwaHFIf7LMCB+nw9OD4bzddxGxlMcO/dyrmuzZ/KNB/36AyHNdn5qjYaIGgujSYgQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n9KP3ncz4EPezfQT+VtyJJN9mAw9nvoe5GKLZUNOuWjq9Mml7U
	iPVDBO3+9V+or7ekTi31oNoKCxSdL6bHMOdvLurJhBLoKGxGMaD6XhhSK25m5w==
X-Gm-Gg: AR+sD123284CVjbAKppyGeAFVHvp3JwdZuHBZmMrje60oLhZHunvnrXxwVOXk6rCBMY
	r9b6BrSIhv6rrZPZllerkffzFE8Zt61tPVhnrRG/g15FeajDPcy2/+83+NlSVkm2emfsSEPc3yT
	SY/mbMAkzharfQ/Cyts/NIw52Z9nuKv2zvckCHpJ9mqAQqnZ2kGO0t2x4Iz6HO9zW0ANQtfuvtU
	DqDzMSdsxNHBMn8T9wNw4GfP814+GLHzHmXF+XsG7pm4xwPprXcSj/xS/M7g24+Jx4UErQDV+pB
	DGFr/uzC4u4fryfNi+MfAbf2bubxsppQnZxuxO7v3xMZGUk89OVgjpmBnDMNoa1wCDTWz8JHAi+
	ScNElWKl9UN0SSG5XxkEz183Igsqgek0cLhZufP9YsdScdsiB50WGMqGUc6jUxbk+KlLr6YMFNV
	F7rrkoyok1cLsaLB6BlH3ejPojVcLJDbexhlPM3L0jLHKUGN3daLbkvrpZ4qvMQ6VxCQ==
X-Received: by 2002:a17:90b:35d1:b0:396:65b3:c05e with SMTP id 98e67ed59e1d1-3969bb1e82bmr5197069a91.9.1787805494011;
        Wed, 26 Aug 2026 21:38:14 -0700 (PDT)
Received: from Default ([2409:40f4:1012:4330:756d:2890:a615:2db9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3285f3cd3b0sm118260eec.12.2026.08.26.21.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:38:13 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: jeffinphilip14@gmail.com
Cc: balbi@ti.com,
	bigeasy@linutronix.de,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+fd6ef980cf1c722be639@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: fix null pointer dereference in usb_put_function_instance()
Date: Thu, 27 Aug 2026 10:07:46 +0530
Message-ID: <20260827043746.13087-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816061712.15547-1-jeffinphilip14@gmail.com>
References: <20260816061712.15547-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 16 Aug 2026 11:47:12 +0530, Jeffin Philip wrote:

>usb_put_function_instance() attempts to dereference fd inside fi struct
>to get mod in uvc_alloc_inst() error path. However, fd is not allocated
>until later in try_get_usb_function_instance() after allocating fi in
>uvc_alloc_inst() and thus guranteed to be null in error path. Fix this
>by adding a null check for fi->fd that returns if fd is null.

Friendly ping, let me know if you want me to fix anything.

Thanks.
Jeffin.
