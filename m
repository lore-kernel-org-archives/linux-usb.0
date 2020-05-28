Return-Path: <SRS0=u9El=7K=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18FBC433DF
	for <linux-usb@archiver.kernel.org>; Thu, 28 May 2020 04:49:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67750207D3
	for <linux-usb@archiver.kernel.org>; Thu, 28 May 2020 04:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b="XVxd9wZ6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgE1Et4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 28 May 2020 00:49:56 -0400
Received: from mail.codeweavers.com ([50.203.203.244]:55672 "EHLO
        mail.codeweavers.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgE1Et4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 00:49:56 -0400
X-Greylist: delayed 984 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 May 2020 00:49:56 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vemHJ1ofMEjf4BkGKBqYn/ibfSlLxPKA4jDOogwFvAk=; b=XVxd9wZ6dEbJINO0ouPyv158+R
        0+b3yyAwB5jyaiQaKSGm6Lmto0QDmstj27EYdc45s/LKqn6/1If/Iw/OAwapDUy5Fb9MuHFy+eAfd
        6TJG18yVgpWWL3k8nON6PAf8om1TTu40zkN7j99A/CBdDSW8XOad38uZo68gJRlDYyIQ=;
Received: from [64.191.7.9] (helo=[192.168.1.115])
        by mail.codeweavers.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <zfigura@codeweavers.com>)
        id 1jeAEU-0007cg-Ie; Wed, 27 May 2020 23:33:31 -0500
To:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org
From:   Zebediah Figura <zfigura@codeweavers.com>
Subject: Bug 207877: ASMedia drive (174c:55aa) hangs in ioctl
 CDROM_DRIVE_STATUS when mounting a DVD
Message-ID: <7d0b20b9-4735-bbed-bb50-72764aefd6d8@codeweavers.com>
Date:   Wed, 27 May 2020 23:23:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all,

I was asked to report this bug here. There's more details in the bug 
report, but it's been proposed that there's a deadlock between 
device_reset() in scsiglue.c and usb_stor_control_thread().

I haven't examined the code in detail, but is this plausible? 
Alternatively, is there something else clearer that the backtrace shows?

ἔρρωσθε,
Zebediah
