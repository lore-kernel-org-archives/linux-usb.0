Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7D43C76BC
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 21:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618525; cv=none; b=S8x4pah0CB7j3Ka/i/zh2HgXO804ldRtS50OVva4HvuGmjtGmTWWGD81dWmU098Lc5v6K4RxOtiKDeZvOXcWDhe6+RHxfZInuZVcxZYL6kr23jWXEf/lfjSpi4gnt9MkCFIpo5N0mrNpnpZ67/0nlTe7uVOaykrNSIgMj0sDtJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618525; c=relaxed/simple;
	bh=ytW2dzrwseQLWF/FfUI5A1bEPtqQGxGAOw5QiXc0dgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZvlbcVX2SYDNGPgmMI3Yh4t+9ZgMt5M7ZtFbvcCEVwOSaCLuJUUIHZD/UlLNim+RH7dbJrOMor6q6rDHFRbJ6dW1MowC0r0W2zHBCJH/aRwK0Ip2oUu+WDw97xHT6jl5T7xbMXOpwO4dKfndTCSbuwB+zHdCsAER3V3JJE+xE0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=la2XzSGG; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="la2XzSGG"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1543333a91.2
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 14:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785618523; x=1786223323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MogQwrslHLi5jGDDwOYk2l2MGGMGY183USKXP4UGByU=;
        b=la2XzSGGpJDQg7edaBVTmQdfD9cbu4V+glMMYhx6SGFjKLdb2XkUTUTN4fNt1uUG+E
         YynusAutyN/xDCJa6ZOeMZfBhQFNgZlBxgUAelQxyw1fek5R6PvvM/VJh6q45PaXVbcu
         D0eXoFg9yuxm+dRCJMDDtC75u/+XMuV9Nz4QyqumUIqx24EWvtx66acxyW6qyyPqytEn
         4+SNC9VRMPIpEtjMi3wQ1trvqsAmh5oVOunH3JsdBQMU1zdhcRxyIMntP589soppn7t2
         G1N9ZbusspkxKR9+OSafCd29Iz2uXUTn3UO1J9Afl/qXU2L9owBH1q+UqGye/H6/mvtd
         rJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618523; x=1786223323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MogQwrslHLi5jGDDwOYk2l2MGGMGY183USKXP4UGByU=;
        b=dK9O5k5Sgq4ExNKVqqvfxR0RSI152gcThS0u8cM5BWHqzLQtsGBy7N0w6acpz24GWf
         0ES5hOKzekT5Ei8oWeR7XMRervOd2wSXyZ4+bSAySDZpIhbrArAveTd9S0KwnQiDHujW
         rCBEhG8my0t7PLjxKzREfPcT2DWgzjNMV6rI9FCbGcAuq4Nikr1bcTd7wpa4YLWwLI4R
         sTbmtP6kEeHYdJECyzJx/l+tmRwRK0BRsErg2cxCeWXomjGTFksnLurVhjQgnNgkLN8u
         KCAe4NTQEV0PFM8ZU8RPW6SWMfdLBqV0DckxwuQkcD/p0foyH5VBWKJP/sIMflOiIEK1
         Mlyg==
X-Gm-Message-State: AOJu0YwHTm7sGzUc47Cl3LdHqo1YBO1dXcd+IA9gGB5fSszJQJAVqdxp
	kDCn6w33r5iGq3isKLC9G2izcjVVW6Lecphhy5NNoZulYw5LXrSqyZQq/VAYzA==
X-Gm-Gg: AR+sD12PwHLorBhN/22DltwEGiF5PBvlJHZBJ+tgb/VFuyKroYE9fV34tHAtCwZ8lEq
	gOUf5wmmVKVnRIygf3UDQjYZXzEx34EHfjCjcEhqV7+4MrNmbDfL0sZ+5FMkui8Itz89j0jIThi
	qg+2QdZM5MwYdzpqtnsQL+mydLNBRA5BBtp0pRVPAktWRW4VShPrLpSxf/RZc8Znoc+3B1KVkzY
	Nhb9jr17hvrSg/EI8hCrinaeXLl40aYTTMV3AS/qeEtsPH1L8AyfkxgegORe2JAIOIHUTFXJP3l
	RBNhL2FSlIHyj9P0K2i4PYa8pgWDLY/robXlfye0RNfedK7FRAtRGNqaShSv/9VlHADFQwJ3+wQ
	kwT2iQa3sMcdxpV2NY9xhtC7O5XxsAsyZ17Y0yaDc8X+WWxlLnamiFHa7e5CQA+Do8SXO2cj7KG
	TVKmGmT5My8xfNnusxRrQayOj/ABcfb2ldWr8dXE5Dx+2NBa0nFCiDWFrR7U0gO1yL
X-Received: by 2002:a17:90b:2242:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-38fbc3f0a61mr3977549a91.3.1785618522996;
        Sat, 01 Aug 2026 14:08:42 -0700 (PDT)
Received: from amd.com ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm28260781eec.16.2026.08.01.14.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:08:42 -0700 (PDT)
From: Paritosh Potukuchi <paritoshpotukuchi@gmail.com>
X-Google-Original-From: Paritosh Potukuchi <paritosh.potukuchi@amd.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Paritosh Potukuchi <paritosh.potukuchi@amd.com>,
	syzbot+debc5c305403f180c01c@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_uac1: fix ac_header_desc in SS descriptor list
Date: Sat,  1 Aug 2026 21:08:34 +0000
Message-ID: <20260801210834.3809187-1-paritosh.potukuchi@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ac_header_desc is a pointer to a dynamically allocated
uac1_ac_header_descriptor. The SS descriptor list
incorrectly stores &ac_header_desc, which is the address of
the pointer variable rather than the descriptor itself.

usb_copy_descriptors() interprets the entry as a USB
descriptor header, which can lead to a global-out-of-bounds
read.

Store ac_header_desc instead of &ac_header_desc.

Fixes: 0591bc236015 ("usb: gadget: add f_uac1 variant based on a new u_audio api")
Reported-by: syzbot+debc5c305403f180c01c@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6a68b182.4c659fcc.19cd90.0021.GAE@google.com/T/
Signed-off-by: Paritosh Potukuchi <paritosh.potukuchi@amd.com>
---
 drivers/usb/gadget/function/f_uac1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 85c502e98f57..95d53ac8cedb 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -332,7 +332,7 @@ static struct usb_ss_ep_comp_descriptor ss_as_in_ep_desc_comp = {
 
 static struct usb_descriptor_header *f_audio_ss_desc[] = {
 	(struct usb_descriptor_header *)&ac_interface_desc,
-	(struct usb_descriptor_header *)&ac_header_desc,
+	(struct usb_descriptor_header *)ac_header_desc,
 
 	(struct usb_descriptor_header *)&usb_out_it_desc,
 	(struct usb_descriptor_header *)&io_out_ot_desc,
-- 
2.54.0

