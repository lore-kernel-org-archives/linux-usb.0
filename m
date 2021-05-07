Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_NEW_HELO_USER,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E94C433ED
	for <linux-usb@archiver.kernel.org>; Fri,  7 May 2021 04:36:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39851613E9
	for <linux-usb@archiver.kernel.org>; Fri,  7 May 2021 04:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbhEGEh1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 7 May 2021 00:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbhEGEh0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 May 2021 00:37:26 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E94C061574
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 21:36:24 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id m190so6327544pga.2
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 21:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=MZ1uBRyGZplkTe0zodhfGumSQ7DRWR3co4K6eZ7JpWc=;
        b=BzgokLRvzcNDIbqF1mnTFPoJ6KdcTBJJLLisvPX0TFPSuKxBmCwf1wWmL3i0Tp8AaQ
         HWWiJ3dcwdeYaCZZ3db3iHMsFBvCu5/6jZ2StnnKa9bEIHVDco4scFfsGAOFsqstU5E3
         g1xaqbt0nMHXFB5i6SemfUqBLjDWHjwJZhytqGQOqx/z7UHG9Tpofxi2gZ4wC/HSMPP0
         +78iCifRY7L5M3FmIiIFtz16l+D7hNPlK+JC2jzeGdDN3uiKDWH7FaWWPpRRCk5ofK4/
         DVwdEb9OIvUCTetlNDM97+FPMUzF++pg3NyELH/ssmxJ9FclYJ9Kml/O9irNOOjzxGhd
         AJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=MZ1uBRyGZplkTe0zodhfGumSQ7DRWR3co4K6eZ7JpWc=;
        b=YEH1HRe+o6dsGFESUCStP28cS9sxFPJbr4/ncrVElR6IrlK0iT+1arOG4zRMr3D/IC
         rF1PXA9xFAz/VawZTw1rOXVjwMLzfU2P2FvthFllaINs9kvh2iEP3Up5rYk4TPsX9bwq
         DVA2ZSdvpGmCEXG2V7s1frMmuFjQD/LUaEwvXZOGHt4NLoNuLwqO1DAQepDhMCkp7qsr
         rZXd2HsOnVz9U++vS13yud7Zcd+VAHTCo+mhrqid7yBnG1/QRgJT7aRLuJWarDsiTTGE
         YiAPZIy5BWeNd8EdgKAhKl0cZd6+oinnMh5OP4s0SvgOHIoBx6HP/Jo+gky2IueorSE1
         VJPA==
X-Gm-Message-State: AOAM5337kXOKndQIxcgEUVMk79UJMoJ01oOt26QyEN01ITvd0qkDzox/
        MBqz97TRFmT/ZOaNnMOtwgI=
X-Google-Smtp-Source: ABdhPJwMb8W97L5wZ3rpD8vAxZg6iY+mpoPpHHUr3mAU7ShB++8aGDQMLuXe1bccFLj1s9ZN04oxhA==
X-Received: by 2002:aa7:904e:0:b029:28f:da01:1a5f with SMTP id n14-20020aa7904e0000b029028fda011a5fmr8196510pfo.67.1620362184062;
        Thu, 06 May 2021 21:36:24 -0700 (PDT)
Received: from user ([2001:4490:4409:2c26:38dc:7b11:ac4b:4ec7])
        by smtp.gmail.com with ESMTPSA id b6sm3645647pfb.27.2021.05.06.21.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 21:36:23 -0700 (PDT)
Date:   Fri, 7 May 2021 10:06:17 +0530
From:   Saurav Girepunje <saurav.girepunje@gmail.com>
To:     saurav.girepunje@hotmail.com
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 0/2] *** SUBJECT HERE ***
Message-ID: <cover.1620361861.git.saurav.girepunje@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

*** BLURB HERE ***

Saurav Girepunje (2):
  usb: musb: remove unused function argument
  usb: musb: Remove unused function argument

 drivers/usb/musb/musb_host.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

--
2.25.1

