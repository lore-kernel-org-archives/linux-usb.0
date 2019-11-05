Return-Path: <SRS0=HTkx=Y5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4597C010A3
	for <linux-usb@archiver.kernel.org>; Tue,  5 Nov 2019 10:36:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A04E21929
	for <linux-usb@archiver.kernel.org>; Tue,  5 Nov 2019 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572950206;
	bh=z19oj0t+4uZcDCb8j+VtifkxS7pmCGLncoLyg/NsgII=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=xvxdqa55yXZe+CBKIdWepWPXEuiBOKaBdCfSEZX2SDhf+dXZnDmGlW+r3X6+a8Nkj
	 bn5sqQSMiEV1cPL+GJFHOWeluNLC2QXsx/XkitOQ6hSiWDVKU2Elq+Jzskie5aSEVY
	 kBI+E3y8hkynO2FDtIdL8BFuLn8IDdoJdddiX0rg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388678AbfKEKgp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 5 Nov 2019 05:36:45 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45040 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388203AbfKEKgp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 05:36:45 -0500
Received: by mail-lj1-f195.google.com with SMTP id g3so15076184ljl.11
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 02:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ydLjAWBF6V+A2VIqnfIc4EtaKUZe6lESHxOMV7Pbm8=;
        b=sXoh5J2CJS8i3MRVwi6z5kE0NuK8LQn9uE22gDOLBN5uHnkfJVBRDai/n3JdlHJopq
         /GGyB2OjHvPrzBTcdtAUOtymWLPNjBDIVP21/Ki5FTBt645RLBBnGd4O9AQ08EMrMARl
         yX2G93vDA1xzdAsM3RwdYMub1Fya1r4/o++S3zSriWJnyaTSDyTBnR4sCRnFdOlWRx16
         HGKL2IThkb2h3ADXl649ecXfq1eJJ1j0DqoeiRUEch2FgYN+FhebOd1LPDaFDRxqZEV4
         EOv+7zeSM04eo/tATdSIxK8wxCuEIGyly/nzeHYx/6hyAtGYNUv6Ouu19v+mI8GgNNwK
         2cbQ==
X-Gm-Message-State: APjAAAVc52Ac8U29RAIp9x7SmG5KAbkjxyBNK2s3S0kOT148+kHanJ+7
        +g+bwGGqXyw3sjjLx5UdRPw=
X-Google-Smtp-Source: APXvYqwJ6QOeUhfmJhKkxqwAXm0bM6srDGULLda+U/z06kcUSdwA6jTVtEZIJk1hz2txk3Ux4VGLgg==
X-Received: by 2002:a2e:b5b7:: with SMTP id f23mr22545746ljn.236.1572950203985;
        Tue, 05 Nov 2019 02:36:43 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id n5sm9938013ljh.54.2019.11.05.02.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:36:43 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRwCZ-0001IH-0U; Tue, 05 Nov 2019 11:36:43 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/3] USB: idmouse: disconnect clean ups
Date:   Tue,  5 Nov 2019 11:36:35 +0100
Message-Id: <20191105103638.4929-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The idmouse driver does not suffer from the disconnect-related bugs
recently fixed in the other misc drivers. It does however have some
redundant constructs in place to manage the open-disconnect race, which
is already taken care of by USB core.

Johan


Johan Hovold (3):
  USB: idmouse: simplify disconnect handling
  USB: idmouse: drop redundant open-count check from release
  USB: idmouse: clean up runaway white space

 drivers/usb/misc/idmouse.c | 36 +++++++-----------------------------
 1 file changed, 7 insertions(+), 29 deletions(-)

-- 
2.23.0

