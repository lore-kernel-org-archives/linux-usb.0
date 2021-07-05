Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F571C07E99
	for <linux-usb@archiver.kernel.org>; Mon,  5 Jul 2021 10:24:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AFC0613E7
	for <linux-usb@archiver.kernel.org>; Mon,  5 Jul 2021 10:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhGEK13 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 5 Jul 2021 06:27:29 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:32342 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbhGEK13 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jul 2021 06:27:29 -0400
IronPort-SDR: x19yaK8FMMXdYeV1+rulOYinKUQYSerLHBbMLwZWLjGeiakKNX+rpghPmVQbddxZH6aeFfCrde
 nIY1uwZJthurM6LAekkrj6EoiCCnxGj2iT6WsL46LMLZ7qFhb7ZIsKT0S27k2b42Go63nDBQkY
 CQMH0QWmBvXnj6tq1XKLh8GKJgUCDL8gmXmb+fuWj3Coahzg4g78FfberLEgvhta/vhdUhSB9z
 puhk87FOZRdRkKeQMefCZxNq/0lsZJ6gvuwDMjErDwqiXn+ZmDlFwaLDht0QL/uLsRgEf3K20n
 VyM=
X-IronPort-AV: E=Sophos;i="5.83,325,1616486400"; 
   d="scan'208";a="63323899"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 05 Jul 2021 02:24:52 -0800
IronPort-SDR: haRR03jtahUrQIuvRKMhvKdXpNT0JW6p+VmoLXe7rTcXIAmV54oYszJxU/ykcAm+2SSXUkPO+O
 zSJ4Ql9AAD4qzAKHfOdGsgAO3yzuHDm3cpmyUDmUQYkVVfrO/kiThKW3D0ep7oLewWYJjthArd
 eMLIAFtHcSSSRt3Bi/LDEl/U42dW6BZirc593WNgL76rB7JwKnFZItpH9i3QEfOCRDJPtNMyFq
 sEI8vlc0KpzI0WHp4qkWPqqxpwODeXWeRWi9ydhrfHMMyPCI/l8RP1gDKq7GtOMl+0VPanNg7X
 hyQ=
From:   Andrew Gabbasov <andrew_gabbasov@mentor.com>
To:     'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
CC:     Macpaul Lin <macpaul.lin@mediatek.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eddie Hung <eddie.hung@mediatek.com>
References: <20210603171507.22514-1-andrew_gabbasov@mentor.com> <20210604110503.GA23002@vmlxhi-102.adit-jv.com> <CACCg+XO+D+2SWJq0C=_sWXj53L1fh-wra8dmCb3VQ4bYCZQryA@mail.gmail.com> <20210702184957.4479-1-andrew_gabbasov@mentor.com> <20210702184957.4479-2-andrew_gabbasov@mentor.com> <YOKvz2WzYuV0PaXD@kroah.com>
In-Reply-To: <YOKvz2WzYuV0PaXD@kroah.com>
Subject: RE: [PATCH v4.14] usb: gadget: f_fs: Fix setting of device and driver data cross-references
Date:   Mon, 5 Jul 2021 13:24:10 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000001d77187$e9782dd0$bc688970$@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHXb3MiK5x8JbQzK0Wthg8LyVovu6sz6U+AgABFBzA=
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Greg,

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Monday, July 05, 2021 10:08 AM
> To: Gabbasov, Andrew <Andrew_Gabbasov@mentor.com>
> Cc: Macpaul Lin <macpaul.lin@mediatek.com>; Eugeniu Rosca <erosca@de.adit-jv.com>; linux-usb@vger.kernel.org;
> linux-kernel@vger.kernel.org; stable@vger.kernel.org; Felipe Balbi <balbi@kernel.org>; Eugeniu Rosca
> <roscaeugeniu@gmail.com>; Eddie Hung <eddie.hung@mediatek.com>
> Subject: Re: [PATCH v4.14] usb: gadget: f_fs: Fix setting of device and driver data cross-references
> 
> On Fri, Jul 02, 2021 at 01:49:57PM -0500, Andrew Gabbasov wrote:
> > Fixes: 4b187fceec3c ("usb: gadget: FunctionFS: add devices management code")
> > Fixes: 3262ad824307 ("usb: gadget: f_fs: Stop ffs_closed NULL pointer dereference")
> > Fixes: cdafb6d8b8da ("usb: gadget: f_fs: Fix use-after-free in ffs_free_inst")
> > Reported-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
> > Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > Link: https://lore.kernel.org/r/20210603171507.22514-1-andrew_gabbasov@mentor.com
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > (cherry-picked from commit ecfbd7b9054bddb12cea07fda41bb3a79a7b0149)
> 
> There is no such commit id in Linus's tree :(
> 
> Please resubmit with the correct id.

This commit is not yet included to the mainline, it only exists in linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ecfbd7b9054bddb12cea07fda41bb3a79a7b0149

Could you please advise if I need to somehow denote the linux-next repo in the "cherry picked from" line,
or just remove this line, or so far wait and re-submit the patch after the original commit is merged to Linus' tree?
BTW, I just noticed that the line contains incorrect "cherry-picked" instead of "cherry picked",
so I'll have to re-submit the patch anyway 😉

Thanks!

Best regards,
Andrew

