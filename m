Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793937464;
	b=Y5/A8IS0XQ7xmiJMoGb9Ea+b2q2HGFT0PuJEyAGzCqBpO0S+p/h9reLZcLZdS/5hu1p3
	 FwBZJl/BZQnDAcpOx83yr3EewuOQrxrjwZ3rY2RVGIbzOhuXkBzi/wWUkedjFMHN4N3K2
	 pUXomJn+S7FYp2ILvrL9rQa4oOzIrqO/3pdKGwV3/4ag2AQzMaY9+VovENsvUiERAEszY
	 GAMgEH69LvxqtKD+vb1DYYCG1wHoU7uZCYkR6DaYTAVM2qxTjgCerjJjFtHS5Obx4jwfQ
	 TQQvz6IafdKkrMDmjPkNLxxvX9TwwtUG1YhOu6hFKIpBpU+DnJ4ufbwUKbumYBODMIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793937464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dOJu8GZJcUYklktZdoXLPEXPzyF/sRTQsdB9v1BWoPE=;
	b=Fpr24RhJxuCwffqn/Sp5ZkUJZy+IWDGK2Ekf69xIZlKcufDjIB3Oj76BkhZ28Sf39H17
	 rKRFya4bS+F6Gff7+HNIKkZdzmi9+LKTFnRN6axlTefC38SLQAzz029t6Fj1y88zWYea4
	 nKb/qQ+54C2iFhMBQr1O6bFLSpFNyrL4p0eaTV1X+HVob5szhq6ewMkoUHyuZdLD2ptRD
	 XvZ0FG4dqAd+3vkLmqMA68fvndT7oauHa+26lIGcaDlCs4SmrRMOLJjcuDpqoXbj2hyQ7
	 0DR5BXnkkTCgAZmda3lVJmc/VLFs6sdeAtvNDvRUxA8AyrWuXOBTjCRkZ3uLS+0VGPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPfnuZee;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B623E606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 03:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B623E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPfnuZee
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1adbf62dd31so388999c88.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 19:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793937458; x=1794542258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOJu8GZJcUYklktZdoXLPEXPzyF/sRTQsdB9v1BWoPE=;
        b=UPfnuZeebbSfeuLdlfkdoMpYu0m2MdHwBGnynVnGKW9pitbugFXHetY+9D6s/gUWut
         GrgtztZhQpb+3+H0Ci82u2Rv7T2Wre7g47346rN/v1xa+VLtosv+gP9W0HntKTMBrNNJ
         2uMzVd5rl8DGesxu4Lmd01PiWIyAJX7cq4zoY2zTmJy3jzNw6bSx8Mbnwdfkehd6NvUy
         gKe6PsEl5fvmxP/J+laIoLm8h7RmK4Rn0OPMblGFnJtkm+dsYZFBaf3vSWopcyu8MtLr
         oeFZuqkBeGI43bydQ5AWGZ8bOh2ExSpsk5EmpANzqHKYYXJC9jjUMZMWz7rnskqyfpV9
         fmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793937458; x=1794542258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dOJu8GZJcUYklktZdoXLPEXPzyF/sRTQsdB9v1BWoPE=;
        b=RJSkLFNyIzCAnuxNu5Ib+RtKBkUKog+eKgoLKWytVQhl0fsXu7amCa0q8mbhRbsbbb
         hAgdd13pDPwlQazNLnDopoPHLwg1JGqqBK8l0SKmIvT1CfA4woDBMdG3sVdWTOhdvWnY
         nbrPnXkpX4e20uWxE7ti/yBgh4zLhKrAX1MbygopmI347NV6NkHf6lzln5ARqC0OtS3+
         vBrFVRwgO2BMSgYKdF4DNXyfn0yX3S4X9XciPibK2btSoqi/ZH6TRqg8jj535B/8v/v4
         mxAJKXxztTr/szG5VRjq7SQXJCMoCYW6RP5NxuTxKVRdCh0jROoVhbNu1DuSNhGy1qwG
         bcTA==
X-Gm-Message-State: APuU4Z9U4hsP7/WxNLk7834fEsInkivVK4gv31u2Oicmio13z95p8MIu
	uDwxIl2xy+wMKKH/17lYQORvFunWLwq8O1qf1dWdnalfRS47AnYM+eifEa54aqdw
X-Gm-Gg: AYBFou0hX+eIsImvyZIx/iKDl8a99Q6saLXb9VxnY3sAG/1oDPL5xDohz8VZm7/OY05
	E3CgmRD+tuAE2mNMRMjZlgo+J0hhAewcfhVQ8YWWA5gFKExul7pYNhYHooG8F7jrKWGHhEW8/7x
	5M0dEkM0lVHRyFq5i0oGv03VqfsotcpcmX8nRrwb1T5ntZXRdKXVS1CcWT+PD2vyhmRmhyzhlrH
	dtibhmO6ccJce4/SJSa0r7sOK+/A+hJWkIh30wiTKH1Bn7fWo/8CUB2nSSdG+8Rcy5CTFIP7dve
	R+XeIlzyaCzyo/xEfWY1luKEKTgCVtN8pnkUZKakDUrLInLyrQsB5LN4Qfq+d3P3KgimJ7oyk39
	0kTVJilU8SRsgxpJK0P7fFeoorF+iFiaEDKgByAkdNS6/qBEHAklpnajqxyYdkVM4Lg25exVCaz
	PsNOL6MG4znHl8MkcHul7O0DWd/xTYWH0Cuf0Di3nRioOb1YoNPepiyj1TV09CrJzBjo1etW1EN
	+/QBs+OyH9ELc6T4IM+xSxQvsO/ct9FTzkipBrk3EUV7Y8SzySt8LTBz6q6SV/NDDy2nKC5Cb9r
	9dr98Oe6vP945luTD4BuBO6BKf6+cnGE6kGeFqxxwWBU92dyeKzVxM+LCrsJgCDyeLnsAWvay9g
	TWg+f74VLYl07YUVYN9Su6InWJ6g=
X-Received: by 2002:a05:7022:170a:b0:169:3706:d61b with SMTP id a92af1059eb24-1b25d32e62amr1373607c88.16.1793937457464;
        Thu, 05 Nov 2026 19:57:37 -0800 (PST)
Received: from localhost.localdomain (c-73-158-21-37.hsd1.ca.comcast.net. [73.158.21.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e407bb5sm1844829c88.1.2026.11.05.19.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:57:37 -0800 (PST)
From: Saad Varshani <varshanisaad@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saad Varshani <varshanisaad@gmail.com>,
	syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Subject: [PATCH v4] usb: gadget: uvc: Fix deadlocks in uvcg_configfs attribute callbacks
Date: Thu,  5 Nov 2026 19:57:32 -0800
Message-ID: <20261106035732.27338-1-varshanisaad@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106020727.6055-1-varshanisaad@gmail.com>
References: <20261106020727.6055-1-varshanisaad@gmail.com>
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

Removed su_mutex locking in the function uvcg_extension_bm_controls_store.
Done this due to the deadlock caused by the mutex conflict in
fs/configfs_write_iter. Validated commit with the C repro provided by
syzbot. No other conficts observed.

Also removed the su_mutex in the other attribute extension functions.
Such as uvcg_extension_b_control_size_store. This applies to all
uvcg_configfs attribute store/show functions.

The deadlock was happening due to a circular mutex dependency between
configfs (frag_sem) and uvcg_extension su_mutex. The reason it is safe
to traverse item->ci_parent without su_mutex is because
configfs_write_iter() calls flush_write_buffer() which calls the
attribute function, holding frag_sem. Which prevents configfs_rmdir()
from unlinking the item or its ci_parent hierarchy

Also reordered fmt->linked in uvcg_frame_b_frame_index_show() to be
under the &opts->lock. As well as reorder refcnt in uvcg_color_matching
store to be under &opts->lock.

---
v4 changes:
	- Forgot to properly commit the codebase, and thus resent old
	  patch

Reported-by: syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=300213c2b5b55c0244f4
Signed-off-by: Saad Varshani <varshanisaad@gmail.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 254 ++-------------------
 1 file changed, 13 insertions(+), 241 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 70a1415ea401..606c02214c8c 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -191,11 +191,8 @@ static ssize_t uvcg_control_header_##cname##_show(			\
 	struct uvcg_control_header *ch = to_uvcg_control_header(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &ch->item.ci_group->cg_subsys->su_mutex;\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = ch->item.ci_parent->ci_parent->ci_parent;		\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -203,7 +200,6 @@ static ssize_t uvcg_control_header_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(ch->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -214,12 +210,9 @@ uvcg_control_header_##cname##_store(struct config_item *item,		\
 	struct uvcg_control_header *ch = to_uvcg_control_header(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &ch->item.ci_group->cg_subsys->su_mutex;\
 	int ret;							\
 	u##bits num;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = ch->item.ci_parent->ci_parent->ci_parent;		\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -241,7 +234,6 @@ uvcg_control_header_##cname##_store(struct config_item *item,		\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -309,12 +301,9 @@ static ssize_t uvcg_default_processing_##cname##_show(			\
 	struct config_group *group = to_config_group(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvc_processing_unit_descriptor *pd;			\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 	pd = &opts->uvc_processing;					\
@@ -323,7 +312,6 @@ static ssize_t uvcg_default_processing_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(pd->aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -340,7 +328,6 @@ static ssize_t uvcg_default_processing_bm_controls_store(
 	struct config_item *item, const char *page, size_t len)
 {
 	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_processing_unit_descriptor *pd;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -348,8 +335,6 @@ static ssize_t uvcg_default_processing_bm_controls_store(
 	unsigned int i;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 	pd = &opts->uvc_processing;
@@ -390,7 +375,6 @@ static ssize_t uvcg_default_processing_bm_controls_store(
 	kfree(bm_controls);
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -400,13 +384,10 @@ static ssize_t uvcg_default_processing_bm_controls_show(
 	struct config_group *group = to_config_group(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_processing_unit_descriptor *pd;
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 	pd = &opts->uvc_processing;
@@ -418,8 +399,6 @@ static ssize_t uvcg_default_processing_bm_controls_show(
 	}
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -470,12 +449,9 @@ static ssize_t uvcg_default_camera_##cname##_show(			\
 	struct config_group *group = to_config_group(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvc_camera_terminal_descriptor *cd;			\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->	\
 			ci_parent;					\
 	opts = to_f_uvc_opts(opts_item);				\
@@ -485,8 +461,6 @@ static ssize_t uvcg_default_camera_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(cd->aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
-									\
 	return result;							\
 }									\
 									\
@@ -509,7 +483,6 @@ static ssize_t uvcg_default_camera_bm_controls_store(
 	struct config_item *item, const char *page, size_t len)
 {
 	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_camera_terminal_descriptor *cd;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -517,8 +490,6 @@ static ssize_t uvcg_default_camera_bm_controls_store(
 	unsigned int i;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->
 			ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -560,7 +531,6 @@ static ssize_t uvcg_default_camera_bm_controls_store(
 	kfree(bm_controls);
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -570,13 +540,10 @@ static ssize_t uvcg_default_camera_bm_controls_show(
 	struct config_group *group = to_config_group(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_camera_terminal_descriptor *cd;
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent->
 			ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -588,8 +555,6 @@ static ssize_t uvcg_default_camera_bm_controls_show(
 		pg = page + result;
 	}
 	mutex_unlock(&opts->lock);
-
-	mutex_unlock(su_mutex);
 	return result;
 }
 
@@ -643,12 +608,9 @@ static ssize_t uvcg_default_output_##cname##_show(			\
 	struct config_group *group = to_config_group(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvc_output_terminal_descriptor *cd;			\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->		\
 			ci_parent->ci_parent;				\
 	opts = to_f_uvc_opts(opts_item);				\
@@ -658,8 +620,6 @@ static ssize_t uvcg_default_output_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(cd->aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
-									\
 	return result;							\
 }									\
 									\
@@ -678,12 +638,9 @@ static ssize_t uvcg_default_output_b_source_id_show(struct config_item *item,
 	struct config_group *group = to_config_group(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_output_terminal_descriptor *cd;
 	int result;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = group->cg_item.ci_parent->ci_parent->
 			ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -693,8 +650,6 @@ static ssize_t uvcg_default_output_b_source_id_show(struct config_item *item,
 	result = sprintf(page, "%u\n", le8_to_cpu(cd->bSourceID));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -704,7 +659,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	struct config_group *group = to_config_group(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvc_output_terminal_descriptor *cd;
 	int result;
 	u8 num;
@@ -713,8 +667,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	if (result)
 		return result;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = group->cg_item.ci_parent->ci_parent->
 			ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -724,8 +676,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	cd->bSourceID = num;
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return len;
 }
 UVC_ATTR(uvcg_default_output_, b_source_id, bSourceID);
@@ -789,15 +739,11 @@ static const struct uvcg_config_group_type uvcg_terminal_grp_type = {
 static ssize_t uvcg_extension_##cname##_show(struct config_item *item,	\
 					     char *page)		\
 {									\
-	struct config_group *group = to_config_group(item->ci_parent);	\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvcg_extension *xu = to_uvcg_extension(item);		\
 	struct config_item *opts_item;					\
 	struct f_uvc_opts *opts;					\
 	int ret;							\
 									\
-	mutex_lock(su_mutex);						\
-									\
 	opts_item = item->ci_parent->ci_parent->ci_parent;		\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -805,8 +751,6 @@ static ssize_t uvcg_extension_##cname##_show(struct config_item *item,	\
 	ret = sprintf(page, "%u\n", xu->desc.aname);			\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
-									\
 	return ret;							\
 }									\
 UVC_ATTR##ro(uvcg_extension_, cname, aname)
@@ -818,8 +762,6 @@ UVCG_EXTENSION_ATTR(i_extension, iExtension, _RO);
 static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 						   const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -830,8 +772,6 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -839,8 +779,6 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 	xu->desc.bNumControls = num;
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return len;
 }
 UVCG_EXTENSION_ATTR(b_num_controls, bNumControls);
@@ -852,8 +790,6 @@ UVCG_EXTENSION_ATTR(b_num_controls, bNumControls);
 static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 						 const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -865,8 +801,6 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -893,7 +827,6 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 UVCG_EXTENSION_ATTR(b_nr_in_pins, bNrInPins);
@@ -905,8 +838,6 @@ UVCG_EXTENSION_ATTR(b_nr_in_pins, bNrInPins);
 static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 						   const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
@@ -918,8 +849,6 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -946,7 +875,6 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -955,14 +883,10 @@ UVCG_EXTENSION_ATTR(b_control_size, bControlSize);
 static ssize_t uvcg_extension_guid_extension_code_show(struct config_item *item,
 						       char *page)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -970,23 +894,17 @@ static ssize_t uvcg_extension_guid_extension_code_show(struct config_item *item,
 	memcpy(page, xu->desc.guidExtensionCode, sizeof(xu->desc.guidExtensionCode));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return sizeof(xu->desc.guidExtensionCode);
 }
 
 static ssize_t uvcg_extension_guid_extension_code_store(struct config_item *item,
 							const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	int ret;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -995,8 +913,6 @@ static ssize_t uvcg_extension_guid_extension_code_store(struct config_item *item
 	       min(sizeof(xu->desc.guidExtensionCode), len));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	ret = sizeof(xu->desc.guidExtensionCode);
 
 	return ret;
@@ -1007,16 +923,12 @@ UVC_ATTR(uvcg_extension_, guid_extension_code, guidExtensionCode);
 static ssize_t uvcg_extension_ba_source_id_show(struct config_item *item,
 						char *page)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	char *pg = page;
 	int ret, i;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1027,24 +939,18 @@ static ssize_t uvcg_extension_ba_source_id_show(struct config_item *item,
 	}
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return ret;
 }
 
 static ssize_t uvcg_extension_ba_source_id_store(struct config_item *item,
 						 const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	u8 *source_ids, *iter;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1078,7 +984,6 @@ static ssize_t uvcg_extension_ba_source_id_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 UVC_ATTR(uvcg_extension_, ba_source_id, baSourceID);
@@ -1086,16 +991,12 @@ UVC_ATTR(uvcg_extension_, ba_source_id, baSourceID);
 static ssize_t uvcg_extension_bm_controls_show(struct config_item *item,
 					       char *page)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	char *pg = page;
 	int ret, i;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1106,24 +1007,18 @@ static ssize_t uvcg_extension_bm_controls_show(struct config_item *item,
 	}
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return ret;
 }
 
 static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 						const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	u8 *bm_controls, *iter;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1157,7 +1052,6 @@ static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -1467,14 +1361,10 @@ static const struct uvcg_config_group_type uvcg_control_class_grp_type = {
 static ssize_t uvcg_default_control_b_interface_number_show(
 	struct config_item *item, char *page)
 {
-	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	int result = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1482,8 +1372,6 @@ static ssize_t uvcg_default_control_b_interface_number_show(
 	result += sprintf(page, "%u\n", opts->control_interface);
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -1492,14 +1380,10 @@ UVC_ATTR_RO(uvcg_default_control_, b_interface_number, bInterfaceNumber);
 static ssize_t uvcg_default_control_enable_interrupt_ep_show(
 	struct config_item *item, char *page)
 {
-	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	int result = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1507,16 +1391,12 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_show(
 	result += sprintf(page, "%u\n", opts->enable_interrupt_ep);
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
 static ssize_t uvcg_default_control_enable_interrupt_ep_store(
 	struct config_item *item, const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	ssize_t ret;
@@ -1526,8 +1406,6 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_store(
 	if (ret)
 		return ret;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1535,8 +1413,6 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_store(
 	opts->enable_interrupt_ep = num;
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return len;
 }
 UVC_ATTR(uvcg_default_control_, enable_interrupt_ep, enable_interrupt_ep);
@@ -1674,12 +1550,9 @@ static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
 {
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &f->group.cg_subsys->su_mutex;
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = f->group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1691,8 +1564,6 @@ static ssize_t uvcg_format_bma_controls_show(struct uvcg_format *f, char *page)
 		pg = page + result;
 	}
 	mutex_unlock(&opts->lock);
-
-	mutex_unlock(su_mutex);
 	return result;
 }
 
@@ -1701,11 +1572,8 @@ static ssize_t uvcg_format_bma_controls_store(struct uvcg_format *ch,
 {
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->group.cg_subsys->su_mutex;
 	int ret = -EINVAL;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1724,7 +1592,6 @@ static ssize_t uvcg_format_bma_controls_store(struct uvcg_format *ch,
 	ret = len;
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -1853,19 +1720,14 @@ static ssize_t uvcg_streaming_header_##cname##_show(			\
 	struct uvcg_streaming_header *sh = to_uvcg_streaming_header(item); \
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &sh->item.ci_group->cg_subsys->su_mutex;\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = sh->item.ci_parent->ci_parent->ci_parent;		\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
 	mutex_lock(&opts->lock);					\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(sh->desc.aname));\
 	mutex_unlock(&opts->lock);					\
-									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -1937,11 +1799,8 @@ static ssize_t uvcg_frame_##cname##_show(struct config_item *item, char *page)\
 	struct uvcg_frame *f = to_uvcg_frame(item);			\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = f->item.ci_parent->ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -1949,7 +1808,6 @@ static ssize_t uvcg_frame_##cname##_show(struct config_item *item, char *page)\
 	result = sprintf(page, "%u\n", f->frame.cname);			\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -1960,7 +1818,6 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
 	struct uvcg_format *fmt;					\
-	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;\
 	typeof(f->frame.cname) num;					\
 	int ret;							\
 									\
@@ -1968,8 +1825,6 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	if (ret)							\
 		return ret;						\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = f->item.ci_parent->ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 	fmt = to_uvcg_format(f->item.ci_parent);			\
@@ -1984,7 +1839,6 @@ static ssize_t  uvcg_frame_##cname##_store(struct config_item *item,	\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -1998,28 +1852,25 @@ static ssize_t uvcg_frame_b_frame_index_show(struct config_item *item,
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
 	struct config_item *fmt_item;
-	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;
 	int result;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	fmt_item = f->item.ci_parent;
 	fmt = to_uvcg_format(fmt_item);
 
+	opts_item = fmt_item->ci_parent->ci_parent->ci_parent;
+	opts = to_f_uvc_opts(opts_item);
+
+	mutex_lock(&opts->lock);
+
 	if (!fmt->linked) {
 		result = -EBUSY;
 		goto out;
 	}
 
-	opts_item = fmt_item->ci_parent->ci_parent->ci_parent;
-	opts = to_f_uvc_opts(opts_item);
-
-	mutex_lock(&opts->lock);
 	result = sprintf(page, "%u\n", f->frame.b_frame_index);
-	mutex_unlock(&opts->lock);
 
 out:
-	mutex_unlock(su_mutex);
+	mutex_unlock(&opts->lock);
 	return result;
 }
 
@@ -2042,12 +1893,9 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
 	struct uvcg_frame *frm = to_uvcg_frame(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &frm->item.ci_group->cg_subsys->su_mutex;
 	int result, i;
 	char *pg = page;
 
-	mutex_lock(su_mutex);	/* for navigating configfs hierarchy */
-
 	opts_item = frm->item.ci_parent->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -2057,8 +1905,6 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
 		pg = page + result;
 	}
 	mutex_unlock(&opts->lock);
-
-	mutex_unlock(su_mutex);
 	return result;
 }
 
@@ -2069,12 +1915,9 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
 	struct uvcg_format *fmt;
-	struct mutex *su_mutex = &ch->item.ci_group->cg_subsys->su_mutex;
 	int ret = 0, n = 0;
 	u32 *frm_intrv, *tmp;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->item.ci_parent->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 	fmt = to_uvcg_format(ch->item.ci_parent);
@@ -2110,7 +1953,6 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -2272,9 +2114,6 @@ static ssize_t uvcg_uncompressed_guid_format_show(struct config_item *item,
 	struct uvcg_uncompressed *ch = to_uvcg_uncompressed(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
-
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -2283,8 +2122,6 @@ static ssize_t uvcg_uncompressed_guid_format_show(struct config_item *item,
 	memcpy(page, ch->desc.guidFormat, sizeof(ch->desc.guidFormat));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return sizeof(ch->desc.guidFormat);
 }
 
@@ -2294,13 +2131,10 @@ static ssize_t uvcg_uncompressed_guid_format_store(struct config_item *item,
 	struct uvcg_uncompressed *ch = to_uvcg_uncompressed(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
 	const struct uvc_format_desc *format;
 	u8 tmpguidFormat[sizeof(ch->desc.guidFormat)];
 	int ret;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -2325,7 +2159,6 @@ static ssize_t uvcg_uncompressed_guid_format_store(struct config_item *item,
 
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -2338,11 +2171,8 @@ static ssize_t uvcg_uncompressed_##cname##_show(			\
 	struct uvcg_uncompressed *u = to_uvcg_uncompressed(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2350,7 +2180,6 @@ static ssize_t uvcg_uncompressed_##cname##_show(			\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2363,19 +2192,14 @@ static ssize_t uvcg_uncompressed_##cname##_show(			\
 	struct uvcg_uncompressed *u = to_uvcg_uncompressed(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
 	mutex_lock(&opts->lock);					\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
-									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2386,12 +2210,9 @@ uvcg_uncompressed_##cname##_store(struct config_item *item,		\
 	struct uvcg_uncompressed *u = to_uvcg_uncompressed(item);	\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int ret;							\
 	u8 num;								\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2415,7 +2236,6 @@ uvcg_uncompressed_##cname##_store(struct config_item *item,		\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -2536,19 +2356,14 @@ static ssize_t uvcg_mjpeg_##cname##_show(struct config_item *item, char *page)\
 	struct uvcg_mjpeg *u = to_uvcg_mjpeg(item);			\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
 	mutex_lock(&opts->lock);					\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
-									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2560,11 +2375,8 @@ static ssize_t uvcg_mjpeg_##cname##_show(struct config_item *item, char *page)\
 	struct uvcg_mjpeg *u = to_uvcg_mjpeg(item);			\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2572,7 +2384,6 @@ static ssize_t uvcg_mjpeg_##cname##_show(struct config_item *item, char *page)\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2583,12 +2394,9 @@ uvcg_mjpeg_##cname##_store(struct config_item *item,			\
 	struct uvcg_mjpeg *u = to_uvcg_mjpeg(item);			\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int ret;							\
 	u8 num;								\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2612,7 +2420,6 @@ uvcg_mjpeg_##cname##_store(struct config_item *item,			\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -2727,11 +2534,8 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	struct uvcg_framebased *u = to_uvcg_framebased(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2739,7 +2543,6 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2752,11 +2555,8 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	struct uvcg_framebased *u = to_uvcg_framebased(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2764,7 +2564,6 @@ static ssize_t uvcg_framebased_##cname##_show(struct config_item *item,	\
 	result = sprintf(page, "%u\n", le##bits##_to_cpu(u->desc.aname));\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -2775,12 +2574,9 @@ uvcg_framebased_##cname##_store(struct config_item *item,		\
 	struct uvcg_framebased *u = to_uvcg_framebased(item);		\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &u->fmt.group.cg_subsys->su_mutex;	\
 	int ret;							\
 	u8 num;								\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = u->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2802,7 +2598,6 @@ uvcg_framebased_##cname##_store(struct config_item *item,		\
 	ret = len;							\
 end:									\
 	mutex_unlock(&opts->lock);					\
-	mutex_unlock(su_mutex);						\
 	return ret;							\
 }									\
 									\
@@ -2824,9 +2619,6 @@ static ssize_t uvcg_framebased_guid_format_show(struct config_item *item,
 	struct uvcg_framebased *ch = to_uvcg_framebased(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
-
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
@@ -2835,8 +2627,6 @@ static ssize_t uvcg_framebased_guid_format_show(struct config_item *item,
 	memcpy(page, ch->desc.guidFormat, sizeof(ch->desc.guidFormat));
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return sizeof(ch->desc.guidFormat);
 }
 
@@ -2846,11 +2636,8 @@ static ssize_t uvcg_framebased_guid_format_store(struct config_item *item,
 	struct uvcg_framebased *ch = to_uvcg_framebased(item);
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
-	struct mutex *su_mutex = &ch->fmt.group.cg_subsys->su_mutex;
 	int ret;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = ch->fmt.group.cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -2866,7 +2653,6 @@ static ssize_t uvcg_framebased_guid_format_store(struct config_item *item,
 
 end:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
@@ -2979,11 +2765,8 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
 		to_uvcg_color_matching(group);				\
 	struct f_uvc_opts *opts;					\
 	struct config_item *opts_item;					\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	int result;							\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
-									\
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
 	opts = to_f_uvc_opts(opts_item);				\
 									\
@@ -2992,7 +2775,6 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
 			 le##bits##_to_cpu(color_match->desc.aname));	\
 	mutex_unlock(&opts->lock);					\
 									\
-	mutex_unlock(su_mutex);						\
 	return result;							\
 }									\
 									\
@@ -3000,7 +2782,6 @@ static ssize_t uvcg_color_matching_##cname##_store(			\
 	struct config_item *item, const char *page, size_t len)		\
 {									\
 	struct config_group *group = to_config_group(item);		\
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
 	struct uvcg_color_matching *color_match =			\
 		to_uvcg_color_matching(group);				\
 	struct f_uvc_opts *opts;					\
@@ -3012,25 +2793,21 @@ static ssize_t uvcg_color_matching_##cname##_store(			\
 	if (ret)							\
 		return ret;						\
 									\
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
+	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
+	opts = to_f_uvc_opts(opts_item);				\
+									\
+	mutex_lock(&opts->lock);					\
 									\
 	if (color_match->refcnt) {					\
 		ret = -EBUSY;						\
 		goto unlock_su;						\
 	}								\
 									\
-	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
-	opts = to_f_uvc_opts(opts_item);				\
-									\
-	mutex_lock(&opts->lock);					\
-									\
 	color_match->desc.aname = num;					\
 	ret = len;							\
 									\
-	mutex_unlock(&opts->lock);					\
 unlock_su:								\
-	mutex_unlock(su_mutex);						\
-									\
+	mutex_unlock(&opts->lock);					\
 	return ret;							\
 }									\
 UVC_ATTR(uvcg_color_matching_, cname, aname)
@@ -3583,14 +3360,10 @@ static const struct uvcg_config_group_type uvcg_streaming_class_grp_type = {
 static ssize_t uvcg_default_streaming_b_interface_number_show(
 	struct config_item *item, char *page)
 {
-	struct config_group *group = to_config_group(item);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	int result = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
-
 	opts_item = item->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -3598,8 +3371,6 @@ static ssize_t uvcg_default_streaming_b_interface_number_show(
 	result += sprintf(page, "%u\n", opts->streaming_interface);
 	mutex_unlock(&opts->lock);
 
-	mutex_unlock(su_mutex);
-
 	return result;
 }
 
@@ -3648,7 +3419,7 @@ static int uvc_func_allow_link(struct config_item *src, struct config_item *tgt)
 	struct f_uvc_opts *opts;
 	int ret = 0;
 
-	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
+	mutex_lock(su_mutex);
 
 	/* Validate that the target is an entry in strings/<langid> */
 	strings = config_group_find_item(to_config_group(src->ci_parent->ci_parent),
@@ -3676,6 +3447,7 @@ static int uvc_func_allow_link(struct config_item *src, struct config_item *tgt)
 
 put_strings:
 	config_item_put(strings);
+
 	mutex_unlock(su_mutex);
 
 	return ret;
-- 
2.55.0

