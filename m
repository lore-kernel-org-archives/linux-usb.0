Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0931AC433EF
	for <linux-usb@archiver.kernel.org>; Tue,  7 Sep 2021 08:37:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE78B6103E
	for <linux-usb@archiver.kernel.org>; Tue,  7 Sep 2021 08:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242286AbhIGIiY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 7 Sep 2021 04:38:24 -0400
Received: from mail.gamereactor.dk ([77.247.76.131]:60906 "EHLO
        mail.gamereactor.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242332AbhIGIiY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Sep 2021 04:38:24 -0400
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Sep 2021 04:38:23 EDT
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=gamereactor.dk; h=
        to:from:subject:message-id:date:mime-version:content-type
        :content-transfer-encoding; s=spf1; x=1631867836; bh=lhN8mOM7oW3
        8Xyd2FZIhAmhFX+M=; b=VDUGEM8hCbWfX1lbVt9wZlO5ggsAX4QDFGrUw1VU/13
        pFneS8sY0QvJYbWJtO/djtWjENaoVFLrL87J7rZFsNpH4jnmJAA3qAxzL11bbbs4
        CvRIsJrluldJo5iyqz76esfVrWJC4/DpesYxYpSb2CkeQcHgk7xwiOnJkavRdTr0
        =
Received: (qmail 11699 invoked by uid 89); 7 Sep 2021 10:30:35 +0200
Received: from unknown (HELO ?192.168.2.83?) (kim.bak@gamereactor.dk@192.168.2.83)
  by mail.gamereactor.dk with AES128-GCM-SHA256 encrypted SMTP; 7 Sep 2021 10:30:35 +0200
To:     linux-usb@vger.kernel.org
From:   Kim Bak <kim.bak@gamereactor.dk>
Subject: Using g_mass_storage for large drives (2Tb+)
Message-ID: <50e07dc1-721f-b7a6-d207-2904e9161054@gamereactor.dk>
Date:   Tue, 7 Sep 2021 10:30:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: da
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

This looks like a developer list I'm sorry to bother you here as I'm not 
a developer, I was looking for the linux-usb-user list but it seems to 
have merged with this so i will ask my question here.

I'm trying to get the g_mass_storage module to export an 8Tb storage 
device, either using a backing file or an iscsi mounted device, it seems 
to fail anything more than 2Tb. Is the module limited to 512 bytes 
blocks or is there a way to force larger blocks?


Kind regards

   Kim Bak




