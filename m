Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C93944AB77
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 16:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982983; cv=none; b=FrjyKWS1pwd9jcb7IfQUS087Czs5iI5n4upgXpjbQPZywfrEgJSTG+w1Vbl0sQsMrqXSeqHofF0QSIrP7efXApoUuHsiXhSFA0/D0xZG4Y+3lPP+ZX+jVX0Q8n2IhuUbyW47xGVrzCpods+hbweOWhwYMpam0Hx7bwNiJ4MoKhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982983; c=relaxed/simple;
	bh=3ioQTCR6NPmKcAUQa+YGkAxDVioWSRJMHck+2juAYqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9y0aq1I2YuGsJNNHDfhkc2DrBFgS496zAmc2HSjC4DQDo97hPVZFpLkaChIOg96tBpxLgnsFI6bkyVisax6nVbL7NlSUGiaKmafiLbwTUKY61qF3xXGaK9z1LHY/LXAb8TZx/qC5bKOStT6wA3eVpuv4ac7QtJ0SV/TIpRZkS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1Cs/tck; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1Cs/tck"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8485b358552so786041b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786982978; x=1787587778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC5+Xv8TC0JCUAachW4xnIwZrYhT5/dH1idLAYXXfSU=;
        b=b1Cs/tckyThGTz57h0yhpG5rYibcPz649vkLjnKqEY5xmCicrGBtI5GueaiL0CHqDn
         GqlDPPC0QWAJmXOqGlWkBH37HTt0PvcqO6OyUYVlE/z+4mJ+0KofNft0vanxOF0RyyDP
         jqOrFed8NDGBUye6f7Ph73KcSwkQtAnN/ieXKaaXQC2/Un9eYkdY9TSjCOF38aCvDZbe
         ZmneUQf9YVQ3AI97Sm4LTdINC9aWiFgRytxms2fh1TxkQj1HWn6z2OthC9p9ehJTj5eF
         kLBsTrXc78dYYeB5WYmAp/fUWrEv7GHXlyFwQDaEzS3C+6Ku1BSgAwnm0bJnAG2gzsm4
         7pnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982978; x=1787587778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WC5+Xv8TC0JCUAachW4xnIwZrYhT5/dH1idLAYXXfSU=;
        b=U34qjuOOOXJ3NEPO/p4XBxvftifnEygUz5jRmLcO4QTSxiYKEyKWLkudncnw7X6AB/
         FrN3abttetnTCxjCroumhyOMpaoXN8FmaUOOfNtbwv0fi1ITbEbUmB80kYa4gWLG2M3A
         LtF3IhvK8CeKLF8zU9ZG79EIrFHU0pzfW/92yNRChJ6zmsySuSOHC39RCPhoCnFF0vbg
         q85IIau92Tt9y/57pmAbn0+fANdeuKhytJGMbynqFf7D9uw6UV0YAvJY0M+0/bVNI5/r
         ycJSQ9lhStbnT37yeozuHx6ijylDlBZh0CeHxR9yYwqsp357SLkwSaVTSBsGJT76XFMt
         Tiiw==
X-Forwarded-Encrypted: i=1; AHgh+RpiwMhe2znBbOZGjBHZJ7aodXp/fnfwtesuIE9K5SWyY2nlNyfgcBHGoyXMpzSvZUN78yEdlF1XvxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Pwh51CkkCPNaHqNMLuUabMsptea/t9f8tqgZGfOmKFN0xmJ3
	TZ2C5cLv9zsuASKX1gLX74ZZU0ao0+TZbSQch/2Mel9JiwvWV5QA9EuB
X-Gm-Gg: AR+sD10+x2heeVscVQfUuAYc2FnJgrVOBQRmrOTgojE+RBxsaVlxIrfOJRf7mHr1JsU
	khxK9kt0MOX49jA46hBmlEEmWE65wdLANaXuox0oKCzStP4w3lzP85uVsO3AgJLIHk6nodfMFQh
	Z1OkeF96WDTMA0GfWL6+vL5Uf6ZZvylHnd4Jx6rJi4JQxNiC1shRL5np7QN1jzJVJmYY3w7f8Xk
	3Bl39QufJZvJO/ZV0OElmJC20qYEsUiYj5IgvjXcv3JiODlgcAAcQT98zGFgkDQ1HzC78wBPk0k
	iKW1PpQKEsp/yumDC0dlYV5kp2sQ1lWE0OgpLiYVuZWV0lc/pe06ICht3HQ/62BTS6I0R3Wlnnz
	e28LaBZsOq2milQ4mmJ9kW5kDqjEiew0QK4hGrtO+hGiCLpJ531wIYhzEgoRq8wktQ1tzqRiEF1
	3ndDK3o/CiqcECTEWE3QDmQpRznlpa+WEJ9M9uSnd0xb4iLJhfbfR4YvApaOx4iJjH993phCaWL
	lJg
X-Received: by 2002:a05:6a00:4186:b0:847:82db:9046 with SMTP id d2e1a72fcca58-851b885b6f0mr1776047b3a.26.1786982977545;
        Mon, 17 Aug 2026 09:09:37 -0700 (PDT)
Received: from Default ([2409:40f4:103f:ca54:3a70:ebd6:25c9:29fd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b4074d41sm818063b3a.27.2026.08.17.09.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:09:36 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: jeffinphilip14@gmail.com
Cc: christophe.jaillet@wanadoo.fr,
	felipe.balbi@linux.intel.com,
	gregkh@linuxfoundation.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	stern@rowland.harvard.edu,
	syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_mass_storage: fix null pointer dereference in fsg_common_set_num_buffers()
Date: Mon, 17 Aug 2026 21:39:16 +0530
Message-ID: <20260817160916.28523-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817160319.28251-1-jeffinphilip14@gmail.com>
References: <20260817160319.28251-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 17 Aug 2026 21:33:19 +0530, Jeffin Philip wrote:
>Kconfig currently sets the limit from 2 to 256 with default as 2. However,
>we use that only at build time. So, if we enter during runtime via configfs,
>we set page content to 0\0 and get the null pointer dereference. So we will
>need to add the check for num < 2 in fsg_opts_num_buffers_store() and return
>EINVAL? Upper bound is 256 which is below what kstrtou8() can return anyway.

Correction on the last sentence: Upper bound is 256 which is _above_ what 
kstrtou8() can return anyway.
