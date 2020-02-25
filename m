Return-Path: <SRS0=xlHB=4N=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1C8C35DF5
	for <linux-usb@archiver.kernel.org>; Tue, 25 Feb 2020 10:25:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84FD321927
	for <linux-usb@archiver.kernel.org>; Tue, 25 Feb 2020 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582626301;
	bh=906Tpa6OY3wwKVg120cN8WHJX4kfu67gINHTChR+yUc=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=IHoxof5K4pcQleji+Ay8GV5PVhuuQLY7KKcuDcfoKn9IzKHdj4fn3c3pYMF3jyHPh
	 0inJbl0ck5sbxd7M7gqs1bozbBPqYCCMa2cjz0kbyzOUKygu1Hy9bg52epg1mTmJb3
	 YvClpGoCuirELMR33i60AAOcPTUjaSyIMDk3BQ/8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730163AbgBYKZB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 25 Feb 2020 05:25:01 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37521 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730126AbgBYKZA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Feb 2020 05:25:00 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so9364167lfc.4
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2020 02:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8QiD9OhAUrbr+Iz2zuq6rPI1ZLtdVDFmT4bROEKkwXc=;
        b=G44tbYVLBViZTLozjfgibdGS+8d5J7hLAEQ5rKXSWjrFrkmXJzCWZoDz52TbPIZkWz
         Xhmxgt0LrlgDrnA9iQ+g2wW1iGTBVsaLqzZ/SAoS++5scQffyAjt5c65tvgsIqyOt7cJ
         kwu+KSQHWDXA2YBXU9qGpjSX3wvd9lk6iV/9KLUKT2WwOm3Nq+d0kzdm6ehJiK3fU9oV
         b8q/eJopoy1f7eliVNgIZX+AasB3JNMBubObvHGFF7rGUz7V+GhPhwCmivNVtuVchdvv
         0/AoWdxf3ISjIKp7x4Iv7itDbBE3+gFKuRHjHNZfjovdPeE9opFaoCXjc8fDCI3LAXUu
         1C/A==
X-Gm-Message-State: APjAAAVjJ9w35f44SCLIYHm1tDr0fhfNytTNphh0C6PO1T5Bda6Yku4y
        8IokDYRVQQ0sRLGShssIuF8=
X-Google-Smtp-Source: APXvYqycPO40aGCmQxRX/wjKcRlJGxvQz4FBLBGnCGmdW0EpOB49zDn29pzIGftHWPzOxv/yZqcDIA==
X-Received: by 2002:a05:6512:203c:: with SMTP id s28mr605051lfs.117.1582626299055;
        Tue, 25 Feb 2020 02:24:59 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id q10sm7468589ljm.87.2020.02.25.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 02:24:58 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1j6XOY-0004oh-Jm; Tue, 25 Feb 2020 11:24:54 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 0/2] USB: serial: clean up some kernel doc
Date:   Tue, 25 Feb 2020 11:24:19 +0100
Message-Id: <20200225102421.18262-1-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix up a couple of kernel doc comments that used the wrong parameter
names.

Johan


Johan Hovold (2):
  USB: serial: clean up carrier-detect helper
  USB: serial: fix tty cleanup op kernel-doc

 drivers/usb/serial/generic.c    | 8 +++-----
 drivers/usb/serial/usb-serial.c | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.24.1

