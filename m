Return-Path: <SRS0=N1Cw=C3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MIME_BASE64_TEXT,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5835FC43468
	for <linux-usb@archiver.kernel.org>; Fri, 18 Sep 2020 02:29:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19A7023718
	for <linux-usb@archiver.kernel.org>; Fri, 18 Sep 2020 02:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bluowxCv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbgIRC3f (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Sep 2020 22:29:35 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:3650 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729864AbgIRC3d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 22:29:33 -0400
X-UUID: 65020b24bdb147dabbfcab4b5f7b95e0-20200918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID; bh=iyKrp7I82f3wYzsbQR/1Jeu1cFgJoa6hSbBVeuarAhw=;
        b=bluowxCv6NNXOPtRxFZ0jPFmxO6NgbwOnU9Y5AcD2mhyQ8mJws0WElOP6YDsRL0TX273k+bz3fo4daxkyJSqiKad6OB45xNxudIPu94abavUadx7WKiVNQm8gygtMvjR8L9GYSSf7IsXAK3M2dA7UylGdVqTrzzCkr+aHDIHk5M=;
X-UUID: 65020b24bdb147dabbfcab4b5f7b95e0-20200918
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 411913070; Fri, 18 Sep 2020 10:29:27 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Sep
 2020 10:29:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Sep 2020 10:29:26 +0800
Message-ID: <1600396036.20109.19.camel@mhfsdcap03>
Subject: test
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     <min.guo@mediatek.com>
CC:     <linux-usb@vger.kernel.org>
Date:   Fri, 18 Sep 2020 10:27:16 +0800
Content-Type: text/plain
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 99E84671E18A1003175709D932CEC58D9D8A174DD884C7E6453AB8F95DC054922000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQo=

