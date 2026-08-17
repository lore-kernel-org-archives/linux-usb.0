Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A348E3F9F38
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964957; cv=none; b=VkV6KT8hOuxIWroZoGx+GG0CeNZuSvTxTRwnDXAosna1d7Nwh0X1vG7jNUYNEy80uNhVdhAAaUC+1gGCD4bsIrm1bKrjResd5ZNvUTQydElbCjhbw3pmDoiypGQKtpPt+rgcVLMr06qAsxI7Kfif5ddTpHaPZMOdkQyxVVvg0zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964957; c=relaxed/simple;
	bh=zQITEraiHsGpDDYt9Nt1jR8D0YOYzfn8aHodB9I1nps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RRDZoZmRaXH659HRXWUru2WbCIe9mrdMoDxBMGIJa8goF1C0d7p5arnOrxRS6jmgmBg1isGGQCD2iSrzNzGyBSEtnyaJ4sGztzJu3MDiuAQMfl3mpASAIsC/8mgO+IiLLBkynA3m2wXH2kvoIbzpVswsrGiVB8lh4jgZX+ElUaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bk/Qv4rs; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bk/Qv4rs"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbedf318752so2129309a12.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 04:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786964955; x=1787569755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbOXjIOE5eUZ77E2jan3Zky2z5kifDys7cgukCqXI+w=;
        b=bk/Qv4rsJKuR0lKES/Ci2m7JR9S86vVNBP31BLixS28E1NYeyQU9bGI+sI8Z71aUQg
         GlQz/ouBILSYBhy18AElqf66Fu9AcFn4NMNT3N/0wUZFoRNA/aLJoTXXojF7HiNQPpB/
         ahuLCn++7eMwG8mjs/wORExiKeUQX0uGlIgNCUwp+/us8W8bgMLIb1yFM1KZ7sI4Poe/
         RztxfGlprLGYQ5LxXnpi2eRLp1seTCPsBZiUab/GSwcXW8ZRv9hJ0RHyFQ+ExNTOZM/Q
         uXjg9RFlyhkys0welLXTUKfoDaMJiLUMHsDwTVVE3avSGlaaO1Q/EVhMVgTLk5YJmZU3
         SW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786964955; x=1787569755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbOXjIOE5eUZ77E2jan3Zky2z5kifDys7cgukCqXI+w=;
        b=CA9AZEn4tAw19hp3BHP2d9bXsjbepCzSfpsr+7y3KCNzW0YGcLPmM9yehDhiGlSe1c
         dXq0zlot/4pS/L5Q92yLc5RBY2e0+5/ieR5oPSX36XSLUXO0m7d/ll++ErfKLD2q8q3d
         +x36cy6dcgZ2GtHa+JCmoUeo4E3J7x/l0xq5HDBUUsJVv5hFyTzshWPN9sXjRvt7kZr5
         VwiGh7+O/h1KvW2B5wlHypBvoWe2BJLxtzkyhJZJzhBcfZxwmMMJ4U8T4AHfzWAg+D/B
         6DkuCwHHs7X8/HjW0Nv99DtOiWjmBMqQWzmEbhAEwC9zN4dH2tkfI4V+cpv9nb90IfAl
         GXXw==
X-Forwarded-Encrypted: i=1; AHgh+RpwJHXF5K+VUCH/sfwkmtrY+GgW/LJUqcu2uNs2Njb0x4xIBRz2PxeWGXoKWqAhY8h0d6+dmgB+x5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkfmzTmNfLsVEmwDrf6Tn37kBltQ9Mx+2F0GN0Gv5M3AYQZu5A
	WwHNzUx2sS7XlBn9LxbJ7x/yfPHLF5IIZiiwlO0AyXZTsy9/oOBS5pzZ
X-Gm-Gg: AR+sD134VtsKUCzhJG/V8auzyksWVyDWVBgxfVUYe9mCnGcDotSLW71N8fU5azzctRx
	JL1C1kS/thXg57BsWXY6XSa2au1BxpW6zImgsCJ+b/6pu7yobCYcWySrqDc7VObFNWQ4durGPEz
	yrITRB26MhYgP+w23B0p1qTHus2mCNEVs1jlseJQgYFHbx1Nz0PNerhnKIo8FTOG0hoOC2YJ7Zb
	LcLphoMZcrt78pNaiM/m2TKUFO1G4oLYg2dbeZSwU1J7qG3jpynqT7ZIVy7kdqrQttloo3sqPwT
	nX84y7gdIrK0ksMaP3owhiBDXiLZXCvQybYJqEqahJRfeBOHZkeuUNAfU8ghoRATc213aMyRext
	nRzxdwjztHusha1cfza2g8nRBzjPp7muKhvaWAk5KvFfpishJUlaW4Um0NOltrQq2MmCd/NZybh
	u/sEQgt98gOrOxypV4jJ+d28sbf4nB+NNpNnbLHORUMjJ6W9bOPYK0Au3RvhEyqAOnFQ==
X-Received: by 2002:a05:6a21:6110:b0:3cc:1d2b:2ac3 with SMTP id adf61e73a8af0-3cc71d195cdmr26060283637.26.1786964954730;
        Mon, 17 Aug 2026 04:09:14 -0700 (PDT)
Received: from Default ([2409:40f4:102a:23fd:2be3:947e:c2d2:30da])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1415305e48esm6077568c88.5.2026.08.17.04.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:09:13 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org,
	felipe.balbi@linux.intel.com
Cc: christophe.jaillet@wanadoo.fr,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: f_mass_storage: fix null pointer dereference in fsg_common_set_num_buffers()
Date: Mon, 17 Aug 2026 16:38:39 +0530
Message-ID: <20260817110839.8201-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fsg_common_set_num_buffers(), n can be 0 as conversion to u8
using kstrtou8() in fsg_opts_num_buffers_store() can return
values from _0_ to 255. When passing 0 as "n" value to kzalloc_objs,
it can return a ZERO_SIZE_PTR, which passes the null check for
buffhds. This leads to a null pointer dereference later in bh->next
in the do while loop. Fix this by adding a check for n = 0 case and
returning -EINVAL if n is 0.

Reported-by: syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=791be35f1fbcc85d06d7
Fixes: fe5a6c48fd95 ("usb: gadget: storage: get rid of fsg_num_buffers_validate()")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 drivers/usb/gadget/function/f_mass_storage.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index a50743caf083..640d3bcb7bf0 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -2747,6 +2747,9 @@ int fsg_common_set_num_buffers(struct fsg_common *common, unsigned int n)
 	struct fsg_buffhd *bh, *buffhds;
 	int i;
 
+	if (!n)
+		return -EINVAL;
+
 	buffhds = kzalloc_objs(*buffhds, n);
 	if (!buffhds)
 		return -ENOMEM;
-- 
2.55.0

