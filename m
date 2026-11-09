Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204675;
	b=GblVNkUFZAEfUWvnZbG6eXY4zZK6gCK3t+nC0poxFpILgddkBW1QND9EEaFL0DEnNv5u
	 1YdHOt/T1fobPinktOEkSGd952Nuw9kLalnKQoVrl+1v7w4MxhE5FdRfKllNIIWSkrU7P
	 mQtWr/y986hH85gdCtkdR4J7rosMoLn5ex3LHAcKFWjfrULrFwDS1PZW3Vug4+Bwag+EB
	 /n6N7lG5ULLInE6PHNDbbmw5/9QRVHjSttonDzydGoJB5tflYrnOXU/Pv5l1OAm4iiWTA
	 S/R0qP9SSs3LUl+Dt9AU5CwftKrRjrLQFmqJ7b1S7ZY02NEK4MlJkJRRF60xGdMVfPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VK23kdoiXM00kINqQ8TnOTuQlGrAahz8GOHBdkyawfw=;
	b=MHCRYXUnJHQQpdcvE6KEblb1rychgf1ravN+MKdGG8zcpF4PGES/QqKC5M2qWxDawObb
	 qIFR/Nhd/SnL0doy9CRZcSNlOEviD8iyxDABDWJp7kII7fcFCWl/HM1xqlLY/j3dX7rCa
	 Z3gtOlEffqIVMDsPJU+2kXnQNWHkMqLKhHEsgKYO8j/mYtojaoo/LoUQCJI7gVv/lGJhe
	 EH7Iz8AGikqgPTr2uFlzbOUZTRDmn/ytU/N48WNHUBZ43cHBwTJHtizb2wH1rOLRKjBk2
	 +nReA/izazBQ4dSocmnqlIUxs9bA67A22a3dT/y4dIgIM9BhJEmEodTkDHfW1aVh7tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1QAFeYn;
	arc=none smtp.remote-ip=74.125.224.132
Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C72606D803
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 06:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C72606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1QAFeYn
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-679a254a724so401036d50.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 22:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204674; x=1794809474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VK23kdoiXM00kINqQ8TnOTuQlGrAahz8GOHBdkyawfw=;
        b=L1QAFeYnMMDzXx7wkd8cNEbCum97AHJd2IgVHO+1lvx5pv3mjHsAVdXNuc3cGEeBY7
         0f9kGK/254NHsvjpu61tzj5I8+P0tMR0ay+reDpuxvT5FVhJlHHW5U5VSzdsf4VWSe/8
         wXOk5WXIkDcq2jb6WfPRh1sIzudTKwkQeKYohWWwrHk2o4Q1Z1K7VoaX1Xw70F0pqXTR
         ThPjxis0wRj3PXj5tPrMEtCFki0T/PT5H7+xoqAK+wN3BIYfCh8qx5CjBaxQHaJlelFf
         GK69hSsNWXlwC7Kv1zlw6suKnAJhxCXnAqGeQglBlnt2ke/phVjVLdJFCNn9vUUFTGxY
         K0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204674; x=1794809474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK23kdoiXM00kINqQ8TnOTuQlGrAahz8GOHBdkyawfw=;
        b=pOkO26dtbuSYG7O9ToG+PCtLlxLnZgEheM5nuu0fdZmqwW8LQHXBAkDoez0tWxtjIQ
         O4PyJrkUyMyRLpU5MpOHECz1X8/FSaPbuPcdkiqOJ6gl7kTESoPAVAUt2ppK//NR1TPY
         yjzHjYV8hbYu+rkPb9cyfK6zvGR37wWhzrCckTOzt4JwHW1+VKxXlT0fzH9OnZ1vkMAD
         /Eu9GlFF7u2kXO3NLqt7DmRBVfaePoYrCsMIBFJn9/YawUNc6lSSbdTT6WsIWixKov2u
         HpT4L1HP3VEB93KqdGl2RuxXwcSKFJ+AAJg9VKcKUYxx1B4du0UmUeU/gSgKtM5kAIii
         HsSQ==
X-Gm-Message-State: APuU4Z/FX2CVl1OnVntRNybndffCrEK45+sgJxvxjktGZk7CySpFqxSY
	+2WUgKo6oY+4ZEocZlHskTYLG6B0ZQIE+FHO2rLaJkmqFJyS1KQajXCWb8rvGRi0
X-Gm-Gg: AYBFou2k+BM9ZAlh7gP/4pbF4QSQ6vlExREuQZywAVt1QZ7Py2Gink2+uJsvZUhCITB
	U5z32JFmXqU7w/wWwbjl04v8VWeJxKAAGOK5vu/UF3SEU9AhiX+lIxtbbZoC7hi3jTw9IzPt1ZF
	hsnK2IdrCRkvSuNQmZVbce3o7yfpvHXUW/c17H2fCZjUi3iVPoZyugYO/I/IA6hQ4GJWab4a5o7
	dgJVRjaPLtsjRblW0y2LF5rnTxjicZ+9ob4l9LgAUi6bJT2fS2Lyl7w+ndj6MmU+fvXsY04zeMm
	Mb1k/heuvNgLfbR+FLBf5TfUwGLjjkUsQie0UpyCbDxshqJ6v+TH+LZ5lBDnUqJNqLWskDEM1f1
	0tjVYAG711Kx9cJIIaaKqFq4BCb52oDIaBYtXTFbPyT6rUV/iCo2EVE9yp5e0F5d56iSutqbdZl
	FDI70tI6PTrGF7w+Nn52r59ZBJ/0dk9iI1KrpVqONYt/df6nNHa5Dp0+AlPeKiUk3oKqaxEbNwL
	pWSF74ulqMnY6A2Irpw8UtmqKKUzLONXtkPnzsiI17FkjEPfcanFFfksON1WksSd6aXQTBqDtNd
	PwqLmhdMGfbFcGH2hz2eC9HhY6heslRkMk32kchRSxPZstn5c31m76/94PC4KfPc3eWu6zjWf7L
	Jyk+TFQ==
X-Received: by 2002:a05:690e:11c2:b0:677:c8f6:8d6b with SMTP id 956f58d0204a3-67c3d9e381fmr1922614d50.50.1794204674168;
        Sun, 08 Nov 2026 22:11:14 -0800 (PST)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:f9f3:ca9:791a:3a8d])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b97e6a3sm3255092d50.22.2026.11.08.22.11.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 22:11:13 -0800 (PST)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	nkapron@google.com,
	gregkh@linuxfoundation.org,
	khtsai@google.com
Subject: [PATCH usb-next v2] usb: gadget: f_ncm: prevent double-free of OS descriptor table
Date: Mon,  9 Nov 2026 01:11:10 -0500
Message-ID: <20261109061110.80422-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ncm_bind() allocates an OS descriptor table only when
cdev->use_os_string is enabled. However, ncm_unbind() frees the
table and resets f->os_desc_n without clearing f->os_desc_table,
leaving a dangling pointer.

When a ConfigFS gadget is unbound, the function object can be reused
for a subsequent bind. The OS descriptor support can be toggled
through the ConfigFS os_desc/use attribute, which determines
cdev->use_os_string on the next bind. If this flag changes from true
to false between binds, ncm_bind() skips the allocation and leaves
f->os_desc_table pointing to the previously freed memory.

A subsequent unbind may therefore free the stale pointer again,
resulting in a double-free.

Set f->os_desc_table to NULL after freeing it to prevent the stale
pointer from being reused across bind/unbind cycles.

Fixes: 793409292382 ("usb: gadget: f_ncm: Add OS descriptor support")
Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
Changes in v2:
- Add Fixes tag.

v1: https://lore.kernel.org/r/20261109053440.49156-1-xinsheng.zhu.ny@gmail.com

 drivers/usb/gadget/function/f_ncm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 500c9c19c78b..685152ec9a5d 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1741,6 +1741,7 @@ static void ncm_unbind(struct usb_configuration *c, struct usb_function *f)
 	hrtimer_cancel(&ncm->task_timer);
 
 	kfree(f->os_desc_table);
+	f->os_desc_table = NULL;
 	f->os_desc_n = 0;
 
 	ncm_string_defs[0].id = 0;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0 (Apple Git-157)

