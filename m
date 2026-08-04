Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1028F4949E0;
	Tue,  4 Aug 2026 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865404; cv=none; b=ksW2GqkSrh+Yd+sXKYDvhEYwoXbL/gogs2xL8MXvFTK1QixxeZp9wZSpe2qtxRlCc4R3qx584j40bnQOvI67cqclL2UViGgxyUSPpWOy4IPcqJL0oy/MGkv2uGBq2RsXeFX5oh/hPgg2SogYgmlr+hDvEMqR77Mw5un+YvURX2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865404; c=relaxed/simple;
	bh=OqfU1cetu2PV0guIGKHE6M9WH7KOauzBBcurUh/WLUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uBd9V3h6PoY0CQDX04U9mAe2k3q0X5FvJTwPHOz7Fno+ylDlpSMpKTEA6VHoqvE24OW4+57UswJT2PEfdtxGa053qrYsF0oVbqx3rlcUq3j+z9GC0mWkD5v44Ys4rvnrynq4ObDmMV7UqDrNcPhIZ9W30l8BFeWL0qdALKSrCNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+MMn1iS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+MMn1iS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B27C3C2BCFA;
	Tue,  4 Aug 2026 17:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785865403;
	bh=OqfU1cetu2PV0guIGKHE6M9WH7KOauzBBcurUh/WLUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T+MMn1iSBg52OnspWEyMeMGpMejwwRjSgO/btYjlnIF9Sio+qVSCZf5WcfHf4ug6+
	 a/gnYlkpG9lo5fmSSe3efHhEXb2N/hZf7ZxCbW55ztLrs/eA8jVJF8k7k8pnpeyfN0
	 4CIWLm9eEhvx6CJ7Ja6vYghv0JD8qQd21oTxeLGobb122P3cTtlo4v694Zyh66aUXf
	 fIIPRG0HkjYsbbkcVlWr58B+LkDzFLTdHcg98pRL32aay4o/XoVda1COUZgQ4UoDVy
	 m6MRORzupKpQfSTitLjoWFniZsWThipXuRODzkwErNDYAGUPsr6w5T1Y2XKG3X34HR
	 xnCjd/Srnrzjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91ECBC55184;
	Tue,  4 Aug 2026 17:43:23 +0000 (UTC)
From: Anuj Bolewar via B4 Relay <devnull+bolewara.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 23:13:23 +0530
Subject: [PATCH 1/2] usb: gadget: f_uac2: fix invalid-free in srate
 configfs store
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-f-uac-srate-invalid-free-v1-1-2c980378cdf5@gmail.com>
References: <20260804-f-uac-srate-invalid-free-v1-0-2c980378cdf5@gmail.com>
In-Reply-To: <20260804-f-uac-srate-invalid-free-v1-0-2c980378cdf5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Anuj Bolewar <bolewara@gmail.com>, 
 syzbot+38bab69d2760cc99cfbe@syzkaller.appspotmail.com, 
 syzbot+a4f65284f1451010b0a8@syzkaller.appspotmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785865402; l=2146;
 i=bolewara@gmail.com; s=20260802; h=from:subject:message-id;
 bh=h3b3cUpt9LNSykl6ZTC6+F63cumiiyAJh4aXLLAwcDA=;
 b=WC4mjhIguPighvd51eNzBqB5v8kUH9yBvAF+q+Xt2NcT/Z3eLs5rXwoc9fIsUjUlsLBqoVRdu
 Y8qWyWDmYiNASsl1oA88Ul3BkxlxIvVudvxUcW01VCRqS6lTKDSrJ7i
X-Developer-Key: i=bolewara@gmail.com; a=ed25519;
 pk=XxcXxqFWk9xQziyNEfhS6NRJQR1shqHRRYzkbaYamm0=
X-Endpoint-Received: by B4 Relay for bolewara@gmail.com/20260802 with
 auth_id=907
X-Original-From: Anuj Bolewar <bolewara@gmail.com>
Reply-To: bolewara@gmail.com

From: Anuj Bolewar <bolewara@gmail.com>

The store path for the p_srate/c_srate attributes calls kfree() on
split_page after it has been advanced by strsep(). When the first
token fails to parse, strsep() leaves split_page pointing into the
middle of the kstrdup()'d buffer and the subsequent kfree() triggers
a KASAN invalid-free.

Keep the original pointer returned by kstrdup() and free that
instead.

Reported-by: syzbot+38bab69d2760cc99cfbe@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=38bab69d2760cc99cfbe
Reported-by: syzbot+a4f65284f1451010b0a8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a4f65284f1451010b0a8
Fixes: a7339e4f5788 ("usb: gadget: f_uac2: Support multiple sampling rates")
Assisted-by: deepseek:v4-pro
Signed-off-by: Anuj Bolewar <bolewara@gmail.com>
---
 drivers/usb/gadget/function/f_uac2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 897787d0803..1ea1bedef9a 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -2013,6 +2013,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 {									\
 	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
 	char *split_page = NULL;					\
+	char *split_page_orig = NULL;					\
 	int ret = -EINVAL;						\
 	char *token;							\
 	u32 num;							\
@@ -2026,7 +2027,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 									\
 	i = 0;								\
 	memset(opts->name##s, 0x00, sizeof(opts->name##s));		\
-	split_page = kstrdup(page, GFP_KERNEL);				\
+	split_page_orig = split_page = kstrdup(page, GFP_KERNEL);      \
 	while ((token = strsep(&split_page, ",")) != NULL) {		\
 		ret = kstrtou32(token, 0, &num);			\
 		if (ret)						\
@@ -2037,7 +2038,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 	};								\
 									\
 end:									\
-	kfree(split_page);						\
+	kfree(split_page_orig);						\
 	mutex_unlock(&opts->lock);					\
 	return ret;							\
 }									\

-- 
2.53.0


