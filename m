Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6301344DAE
	for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789815653; cv=none; b=AXU2o7ZdByyrDUQjHnCu8CHdN0W79Rv6y5JFwmVn/qsyxdKDSOnG69RR+Knjtuvr7XyoTq+6+EHbhN2E2cKl+CgyQnwtVLN9AlOuwLfhk4HlvymB0SDYNbJIegziXY0Ts/r5Fa1daSAJtUdFlR6XHssOe1PFa5QNFgsUAP6KniA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789815653; c=relaxed/simple;
	bh=GaNsUI6mLKnZnKPZDTu4pKadGE4T2gyK26dsZnV3ZqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hx7x1aAH1N2EylCsOWNcerS9BTS17BKtCOHNCSJhcVzFHKgU/q/SY0zerLFaE1uXVJokv4LsAUU11a1bkhkN9nUS0VyfvOYMQ7YB+OqYqlDKmMvZ+KyV6hPFaiaioOQ6mWf725l9aa6ozvKRp/erOx6kot56li92v8kmTcbxJcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oar8Zv3n; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oar8Zv3n"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1211859a91.3
        for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 04:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789815651; x=1790420451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mksE0wAvqIYvQmkvPZ3MVjaliUGSBIc9rXg00mvzn3o=;
        b=Oar8Zv3nf79P6rmHbd/Ge6B21eyTeEy1EYUlLAfVDdzlrX4PWVU8wzj10Rf0oVGN2m
         MHKest1NloP9zsU1g1UpN4atfC+SjlUh5qQsmuktckYCtguyMogHBEGCFLQyPFQ5p/3H
         Il8hWjKz0uRUjmUabcN6XzubTCJhDGJRPjapwD1EZ3+QMN+kkWP6ikljKs5ouWEIZEd5
         qOxY0jOWkp0luRNnPWRe70SFTL5RlJGZD2UhlYC8I3k2RpMOomPqRTdZv29w5AJHppjY
         JRPA+XjTwk1zO5uobHpqvSQk2aVxoP692hAtqSdauNS1KmLbEsVChfqrMalkh/uqV6MP
         FZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789815651; x=1790420451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mksE0wAvqIYvQmkvPZ3MVjaliUGSBIc9rXg00mvzn3o=;
        b=D5WzMB8QO+ZdzgNYX6jodEugTw42BdH4chcxzIkaH8Y2YIGbsHRJJ1o7c/WH0qQLx4
         MQ+P/qsHuJwvLs50dwQQVZuxSltM4vtp3awOYNt94CrG4IL4Ok+HTZbPX+qNb5TwZesG
         nDuO5eH6UinEt5+VuoGF4ckiO2fWg4zupNce3oUgCT/wxZK4CHlQ+RMKeN6nXAhYnuDc
         xyO5Z+elg9c49y8JrVIcMVU1uGesfuCgiRtCuaNF+YGv09jzUMRMmPwAi94ZSptOWCWV
         Pat8Vm42QtehVcHv8y7wvMq5bMwHTukiR2AHCXhm0FLY7vziPgee0kJtuQJs08wyHiwq
         VUWQ==
X-Gm-Message-State: AFuF++lqACf8Xp3zTPmEKHdKLhpdE8OJy9KzJFB/i8xZtshUf03r1VuL
	wHcjbh7ldYVg8cSF5mRYx7+2pjRZecum6JqBA+uawv7GjG8OJVMgsTI8iduwrdp0
X-Gm-Gg: AYBFou3XkTo+UyG9ch1gQvFn5+W7406VTDpk3Hpa5jKO+NhqZFwjdqLdoAzEkhKG/nt
	qlDZKQoK1SEus7TCn/KtGE33i+v/rE9eq4Fzv6mtblRri84nNudffb33vKMm2DJIAhrhD2mJaj2
	bUNLn4SavmqlbRxmoNOhXN0yXZHvs1gG7KkS4fGZtU2tu1VFgTyx5yK76+bxF+fApj5h/jPbidS
	G9cEXHp8uco71Ib7icK1gobDVib+WfDIOa3e9PL22IrS9VlQEvNbSQLYzF9qYHyYjxSyRDo1iJX
	M2cmwNhIcVvtfP8PMK4n3rUIGUAil7F5M0LZiMln6tpd/A+QKu4uLfHyTFP3GueBgr6Qbb8g9n/
	aLW1kzYljMrDgyzilPoF4EqCSHcxpbPaA5MxhudKvBSXWbaMfk9oeEF0bInmID/Nx+kt+5kMans
	x7B+mC3hmWu9xRmPKvW8EV50jzEu+5RgS4+CHlkHsY0Ly/FtlFpuUTqwK2+LyK6siSZzxwPJILk
	7vxhRqIzRnp32BJE0TDz42v8cDEy68zaexfIKKTlHZrOOQ+HLnM7bTZH/Zrk4WtnFh2huRKTdQw
	qWrOpBxmsw==
X-Received: by 2002:a17:90b:4a03:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39e54d38c48mr14713773a91.8.1789815650997;
        Sat, 19 Sep 2026 04:00:50 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb427casm4105972a91.17.2026.09.19.04.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:00:50 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	Chris.Wulff@biamp.com,
	david.sands@biamp.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] usb: gadget: f_hid: don't call copy_from_user() under get_report_spinlock
Date: Sat, 19 Sep 2026 11:00:49 +0000
Message-ID: <20260919110050.3764064-1-benquike@gmail.com>
In-Reply-To: <2026091905-humbling-swooned-c371@gregkh>
References: <2026091905-humbling-swooned-c371@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_hidg_get_report() already copies the incoming struct usb_hidg_report
from userspace into the freshly allocated 'entry' before acquiring
hidg->get_report_spinlock.

When a report with the same report_id is already present in
hidg->report_list, the update path copies from userspace a second time,
this time directly into ptr->report_data while the spinlock is held with
interrupts disabled:

	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
	ptr = f_hidg_search_for_report(hidg, report_id);
	if (ptr) {
		if (copy_from_user(&ptr->report_data, buffer,
				sizeof(struct usb_hidg_report))) {

copy_from_user() may fault and sleep, so this is a sleeping function
called from atomic context, reported by CONFIG_DEBUG_ATOMIC_SLEEP as
"BUG: sleeping function called from invalid context". Userspace can
reach it at will by issuing GADGET_HID_WRITE_GET_REPORT twice with the
same report_id on /dev/hidgN.

The second copy is also redundant: the same user buffer has already been
copied into entry->report_data a few lines above, and report_id was
derived from that copy. Assign from the already copied data instead,
which removes the fault from the critical section and makes the update
atomic with respect to the list lookup.

Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v2: Add the Fixes: tag Greg asked for.

    f_hidg_get_report(), the spinlock and the copy_from_user() call under
    it were all added together by a139c98f760e ("USB: gadget: f_hid: Add
    GET_REPORT via userspace IOCTL"), first released in v6.12, so that is
    where this starts. git blame on the removed lines agrees.

Found by inspection while investigating the use-after-free fixed in
patch 2/2, and build tested only; I do not have HID gadget hardware,
but the path is reachable from /dev/hidgN with dummy_hcd.

 drivers/usb/gadget/function/f_hid.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -668,13 +668,7 @@ static int f_hidg_get_report(struct file
 
 	if (ptr) {
 		/* Report already exists in list - update it */
-		if (copy_from_user(&ptr->report_data, buffer,
-				sizeof(struct usb_hidg_report))) {
-			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
-			ERROR(cdev, "copy_from_user error\n");
-			kfree(entry);
-			return -EINVAL;
-		}
+		ptr->report_data = entry->report_data;
 		kfree(entry);
 	} else {
 		/* Report does not exist in list - add it */
-- 
2.43.0
