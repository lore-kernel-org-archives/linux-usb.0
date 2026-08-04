Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10491494A0B;
	Tue,  4 Aug 2026 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865404; cv=none; b=FCCv9PPLWdCcj82irXr5YkvboFAqAwazgj73XnVPop5kmezqXc/k2YMwZDfEnvdKHhv6iyqSqcJTks9ajh85u/h62R5kokZcTqH04HmGzRJE1ZI3nuP5iGC1Y2PgPhU2Ao/8pknR0fnXLeVuFwe+h9leeQ8JVAPqr1Z/ZZFmknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865404; c=relaxed/simple;
	bh=pvXYC4+wXV2EqbA0W4r62nr3YgAZVgf8G/taz/H9h90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KW5/THRIegVVG4yADtUvz311FbL+xtqXN3/9EglOkkxEdMJFVXAVggujTTfd1azISmBdZq40R7bTfpztHkNmjsFnKebthIop/Bgpwf5e5dzyMCpcwpDCMgfb2hgMn3eZx25o6YD9WulntPtCmOf+pRV2AEFoQVjN4YbJioS4ED4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQCQq3qe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQCQq3qe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC088C2BCFB;
	Tue,  4 Aug 2026 17:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785865403;
	bh=pvXYC4+wXV2EqbA0W4r62nr3YgAZVgf8G/taz/H9h90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nQCQq3qeqh+z9ozqq2x3wMuz6QH/O5nzfZD+tvKZmS3vao9JiGXIV4z2fGgV2Ag+3
	 xX4y2odkJnr3GX+RjzTYV2bs71xvy8b8R8ZjD7kixPvX11V3+dQFrhoQHr4Kkg8Yuh
	 5JPMj2+CopgKnGeTtEnhBDZENb2iIKLpJmAxdZftsbIoAlSLfe9w+o08ifg1xwSSo0
	 UdoIoQtePlnN0tgvjAMPXoK9n2LH+1gKA2XECeAAOBSp28TNZo8K1h4VPWXGDKCTAr
	 1zjpQgh1rZ2df9tDF5uTr0fb6/XyZovFcCga5JUpG/KL3trOdDgRIvQUlvmkoNkGBN
	 nQpPs6B2CdQng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1846C55822;
	Tue,  4 Aug 2026 17:43:23 +0000 (UTC)
From: Anuj Bolewar via B4 Relay <devnull+bolewara.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 23:13:24 +0530
Subject: [PATCH 2/2] usb: gadget: f_uac1: fix invalid-free in srate
 configfs store
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-f-uac-srate-invalid-free-v1-2-2c980378cdf5@gmail.com>
References: <20260804-f-uac-srate-invalid-free-v1-0-2c980378cdf5@gmail.com>
In-Reply-To: <20260804-f-uac-srate-invalid-free-v1-0-2c980378cdf5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Anuj Bolewar <bolewara@gmail.com>, 
 syzbot+2532c7901f590afd0c3a@syzkaller.appspotmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785865402; l=2017;
 i=bolewara@gmail.com; s=20260802; h=from:subject:message-id;
 bh=usMCQequLk+4yrdjg1stFDJGlIssLlABJud84TcvNlE=;
 b=fbwM61x+ajgIkSNjGJdsGMSfnuR/DqGZkIbPZ+8UMpNE0JoLPYYdO5kYOR+P+pSz+hLOOj9YU
 dpS4Owd1HTDB8dziPStP7k/pJ3+wWKkNgHjtGOiczdk1efjk+fxc2z0
X-Developer-Key: i=bolewara@gmail.com; a=ed25519;
 pk=XxcXxqFWk9xQziyNEfhS6NRJQR1shqHRRYzkbaYamm0=
X-Endpoint-Received: by B4 Relay for bolewara@gmail.com/20260802 with
 auth_id=907
X-Original-From: Anuj Bolewar <bolewara@gmail.com>
Reply-To: bolewara@gmail.com

From: Anuj Bolewar <bolewara@gmail.com>

Same bug as f_uac2: the store path for the p_srate/c_srate
attributes frees split_page after strsep() has advanced it into the
middle of the kstrdup()'d buffer. A non-numeric first token makes
kstrtou32() fail and kfree() is called on a pointer into the slab
object, triggering a KASAN invalid-free.

Keep the original pointer returned by kstrdup() and free that
instead.

Reported-by: syzbot+2532c7901f590afd0c3a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2532c7901f590afd0c3a
Fixes: 695d39ffc2b5 ("usb: gadget: f_uac1: Support multiple sampling rates")
Assisted-by: deepseek:v4-pro
Signed-off-by: Anuj Bolewar <bolewara@gmail.com>
---
 drivers/usb/gadget/function/f_uac1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 85c502e98f5..94c716d72c6 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1595,6 +1595,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 {									\
 	struct f_uac1_opts *opts = to_f_uac1_opts(item);		\
 	char *split_page = NULL;					\
+	char *split_page_orig = NULL;					\
 	int ret = -EINVAL;						\
 	char *token;							\
 	u32 num;							\
@@ -1608,7 +1609,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 									\
 	i = 0;								\
 	memset(opts->name##s, 0x00, sizeof(opts->name##s));		\
-	split_page = kstrdup(page, GFP_KERNEL);				\
+	split_page_orig = split_page = kstrdup(page, GFP_KERNEL);      \
 	while ((token = strsep(&split_page, ",")) != NULL) {		\
 		ret = kstrtou32(token, 0, &num);			\
 		if (ret)						\
@@ -1619,7 +1620,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
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


