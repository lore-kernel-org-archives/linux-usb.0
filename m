Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5C7ECAAD8
	for <linux-usb@archiver.kernel.org>; Fri, 16 Sep 2022 22:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiIPWrz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 16 Sep 2022 18:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiIPWry (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Sep 2022 18:47:54 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D1ABC12D
        for <linux-usb@vger.kernel.org>; Fri, 16 Sep 2022 15:47:52 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id s18so16776868plr.4
        for <linux-usb@vger.kernel.org>; Fri, 16 Sep 2022 15:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=c89JKkdRXbwFjls77Y11MxHABtglHoBtI7LAoKFa4Ow=;
        b=szvi0AoJ0tGZ4QBkw1z5evgF4Tfts5PdyVDiQuws8/FRnmYMXyByUHV5kNf1SdLUyf
         molQgP7432gPgX4sONlHtYvXQOvpxHK+YC6LWOdJOnRuHTqYZOCaVhpOtaoUNyjdiXL8
         hhd4CtVn8DfSrnEQxnwYOYK3rsMkZDOF0K/qcDCd5DCjXdntjiHAKugY9PrFQAzSI+C+
         t5kuztNO7RIfO8AfnpqqoqRdQRWJYO9/2ONefOmHF0LjWsc2vEla+fnYkZKcHJ5hglNN
         nGJY4L3UfFg7qYFMq1ADXCa414p0oArZP55t52IHlKalmW650Rlx6S1143rq7ZidUsmH
         rjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=c89JKkdRXbwFjls77Y11MxHABtglHoBtI7LAoKFa4Ow=;
        b=Qjf2S1wgJBtGJsJjfBfalVEMaYnou7/L5SJ3erceP2fDrw504tBCi3W4AoBkq0I4rI
         zA98zZGQefFtJk4xS8yN/6VGe+Pi7lXOoZdgICsNv76D7kZY8fOQQ6wR8OlFFwQNVF+p
         SXF2RTCapJMwSrmi+GVLNk7t9th9fNrt5w6fOL5f341IuoO8G9tvxMNJHpvW4ydFZMrL
         1DFvppvm4ktbJaKKLuaZqPnWB3Cuw771GcBV1D7OytYl3TJhyxNhUEBiroNgk7U2c0jN
         3apVbViYTp7k8PdjHS2b2KOMq1RPGs5IQx9kDNnFfG2rqeQSDJFd75l/5VoK1EArEa89
         j6lw==
X-Gm-Message-State: ACrzQf0n7jd9ujFx5lITGEA5ILmVZgkrrT3okLLFzYX7uiIbw07XEtfn
        RyD+YPVAlf28tNXMYf5dDNm4vhWdGieHeA==
X-Google-Smtp-Source: AMsMyM40py878s6ovcGYryBV3pRkgTzsf5bZWIYu27RHBJ4iLgrRBE6jFf3t0AdZAOjU1uThs//I5A==
X-Received: by 2002:a17:903:2595:b0:178:6b71:2eea with SMTP id jb21-20020a170903259500b001786b712eeamr1967185plb.143.1663368471970;
        Fri, 16 Sep 2022 15:47:51 -0700 (PDT)
Received: from desktop.hsd1.or.comcast.net ([2601:1c0:4c81:c480:feaa:14ff:fe3a:b225])
        by smtp.gmail.com with ESMTPSA id k5-20020aa79d05000000b0053725e331a1sm14999663pfp.82.2022.09.16.15.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 15:47:51 -0700 (PDT)
From:   Tadeusz Struk <tadeusz.struk@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tadeusz Struk <tadeusz.struk@linaro.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH] usb: mon: make mmapped memory read only
Date:   Fri, 16 Sep 2022 15:47:41 -0700
Message-Id: <20220916224741.2269649-1-tadeusz.struk@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Syzbot found an issue in usbmon where it can corrupt monitor
internal memory causing the usbmon to crash with segfault,
UAF, etc. The reproducer mmaps the /dev/usbmon memory to userspace
and overwrites it with arbitrary data, which causes the issues.
To prevent that explicitly clear the VM_WRITE flag in mon_bin_mmap().

Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Fixes: 6f23ee1fefdc ("USB: add binary API to usbmon")
Link: https://syzkaller.appspot.com/bug?id=2eb1f35d6525fa4a74d75b4244971e5b1411c95a
Signed-off-by: Tadeusz Struk <tadeusz.struk@linaro.org>
---
 drivers/usb/mon/mon_bin.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
index f48a23adbc35..f452fc03093c 100644
--- a/drivers/usb/mon/mon_bin.c
+++ b/drivers/usb/mon/mon_bin.c
@@ -1268,6 +1268,7 @@ static int mon_bin_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	/* don't do anything here: "fault" will set up page table entries */
 	vma->vm_ops = &mon_bin_vm_ops;
+	vma->vm_flags &= ~VM_WRITE;
 	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
 	vma->vm_private_data = filp->private_data;
 	mon_bin_vma_open(vma);
-- 
2.37.3
