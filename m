Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EF5C4360F
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 06:16:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BEBA4217D7
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 06:16:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jBQUC76l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbfDEGQ0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 02:16:26 -0400
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:40902 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfDEGQ0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Apr 2019 02:16:26 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id E0B9524E3AA2;
        Thu,  4 Apr 2019 23:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1554444985; bh=tvcdVnIPXCvWNi3/ZLDDMV1oDIp+uHJGjpqAnh3t5v8=;
        h=From:To:CC:Subject:Date:References:From;
        b=jBQUC76lCIMsZdiyduDusGSVcWxMYaSXMPYdfqcOd1QjCzO/qM3+C9+gpFA3JW/t6
         nTa3nrkvj8eDV0FpbChEhQvevb3hwxyrN6D/ng4ORitPPWSt6avFBCZyqrZYi9u7V7
         nIsF4ESX5E/PsmZ/3iUf3kMMjYdhD41dY8Cuk6VdqCAgEqC7r1ayKfjS5EcFKLyMAU
         c/M7kHReHPkiCffxCubSNWJwALvkfM3u/+LX9XXt33dVOVd3vOyJjoclz/GAfGo1Lz
         yO2j5P/SSyREc19V4YTgS1Nku2S0Rs94ccWbYRqiNpBFn4SLtllAd6q2/nF78rJqUa
         XDjIcAa380z+Q==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id AC4E8A009B;
        Fri,  5 Apr 2019 06:16:25 +0000 (UTC)
Received: from AM04WEHTCB.internal.synopsys.com (10.116.16.192) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 4 Apr 2019 23:16:25 -0700
Received: from AM04WEMBXB.internal.synopsys.com ([fe80::1006:bcdd:1b7:579b])
 by am04wehtcb.internal.synopsys.com ([::1]) with mapi id 14.03.0415.000; Fri,
 5 Apr 2019 10:16:21 +0400
From:   Minas Harutyunyan <minas.harutyunyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <john.youn@synopsys.com>
Subject: dwc2 patches
Thread-Topic: dwc2 patches
Thread-Index: AQHU63cVxtheKvwPOkKj72/iYojtkQ==
Date:   Fri, 5 Apr 2019 06:16:20 +0000
Message-ID:
 <410670D7E743164D87FA6160E7907A56013A80C9B5@am04wembxb.internal.synopsys.com>
References: <28990c019bfb4a16ca992df625a1df040c164321.1552376546.git.hminas@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.116.70.132]
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190405061620.SbjzEJf2e7zT3X2uGU83jVY91dLybnfYOYi-AdRxOkE@z>

Hi Felipe,=0A=
=0A=
When you plan to merge my follow patches:=0A=
=0A=
[PATCH] dwc2: gadget: Fix completed transfer size calculation in DDMA=0A=
[PATCH] usb: dwc2: Set lpm mode parameters depend on HW configuration=0A=
[PATCH] usb: dwc2: Fix channel disable flow=0A=
[PATCH] usb: dwc2: Delayed status support=0A=
[PATCH] usb: dwc2: Set actual frame number for completed ISOC transfer=0A=
[PATCH] usb: dwc2: gadget: Increase descriptors count for ISOC's=0A=
=0A=
Additionally need to merge patch for fixing scatter-gather mode from =0A=
Andrzej Pietrasiewicz <andrzej.p@collabora.com>:=0A=
=0A=
[PATCH] usb: gadget: dwc2: fix zlp handling=0A=
=0A=
Thanks,=0A=
Minas=0A=
=0A=
=0A=
=0A=
