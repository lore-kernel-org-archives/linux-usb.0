Return-Path: <SRS0=JLdt=A3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8C1C433E2
	for <linux-usb@archiver.kernel.org>; Thu, 16 Jul 2020 08:32:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59E1A2064C
	for <linux-usb@archiver.kernel.org>; Thu, 16 Jul 2020 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594888334;
	bh=YQdq29AZJ9CKv5o9VykimYx8tQ4v5Q4xqESoN229LVU=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=gjmZh9Ie6vDBotzBA0YtfxB5fpbDhqgA2QxhX0/2pHo07IoHvAOs3VwJrpK6Jhjwv
	 Yv8tlB3E6D3z8wFLpjCkYIi9dQzbINgCYtVfeMtTpda05YdLjq7VR7FUoSJkVkzSQl
	 MEdFF4HPvZUR0HAaAaYfnGseaJdP/g7lBvcCNjsU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgGPIcN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 16 Jul 2020 04:32:13 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34534 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgGPIcN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 04:32:13 -0400
Received: by mail-lj1-f195.google.com with SMTP id q7so6233566ljm.1
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2020 01:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=rwzhtqtjzpycPNdfJSvE0JwSP/0ugmgIfYcFeosUKYg=;
        b=R/BQ6jslMjrGtjxH/33QDzozBgsXhvOVgVytNe9V2i1io8kq9qhLN00zh6Qsq+wec4
         OcYnHzR6JKxctHYfwEW9zBGUMzzIIeSvz1SNFIQpHrIwnQa5FfBxxfPa/8PIl7BqBzIV
         zshwEvmA1rcG+3EXlB8oGhCmpooghLZxvMef2JuF5iDn42Yh+N+0ftxhnjhSnpwN1ANW
         FqfzS8nSY6CUXOr7F80QCtFLHk4WnzsxUCfbPsPwWOpkax5Q73CBnuRVTU/Pd5wCgkV2
         ++a79sM9UtRO+FD1RJ6pIcTzljTb9oWnFfHquU2ReoZyBUVueAuBaqZlracI4R+NreGO
         MSDg==
X-Gm-Message-State: AOAM531VPrEpX0DjzzbbNKSEseu257+eJMsXB6K+cJ+5eCL0iTR4GBV0
        ceBnO7LbQpqRJxspxk7hd+p96bTfp1k=
X-Google-Smtp-Source: ABdhPJzCdWTQmPQaBlso4WkBDKc/Gy+dhKATetC79PYH8egUE+vgk/2sEESfA2zDjeiKVLkqWurXJw==
X-Received: by 2002:a2e:a173:: with SMTP id u19mr1586260ljl.263.1594888331163;
        Thu, 16 Jul 2020 01:32:11 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id p4sm176870lfk.0.2020.07.16.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 01:32:10 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jvzJa-00052r-ER; Thu, 16 Jul 2020 10:32:26 +0200
Date:   Thu, 16 Jul 2020 10:32:26 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] USB-serial fixes for 5.8-rc6
Message-ID: <20200716083226.GA19339@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here's a fix for 5.8 that should go to Linus this week.

Johan


The following changes since commit da6902e5b6dbca9081e3d377f9802d4fd0c5ea59:

  USB: serial: option: add Quectel EG95 LTE modem (2020-07-07 17:40:52 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.8-rc6

for you to fetch changes up to e7b931bee739e8a77ae216e613d3b99342b6dec0:

  USB: serial: iuu_phoenix: fix memory corruption (2020-07-16 10:20:21 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.8-rc6

Here's a fix for 5.8 addressing a long-standing bug in iuu_phoenix.

----------------------------------------------------------------
Johan Hovold (1):
      USB: serial: iuu_phoenix: fix memory corruption

 drivers/usb/serial/iuu_phoenix.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
