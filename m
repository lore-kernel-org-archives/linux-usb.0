Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416E1C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 15:48:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B3F5205ED
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 15:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b="Y3t97UHU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfDZPsf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 11:48:35 -0400
Received: from canardo.mork.no ([148.122.252.1]:50187 "EHLO canardo.mork.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbfDZPsf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Apr 2019 11:48:35 -0400
Received: from miraculix.mork.no (miraculix.mork.no [IPv6:2001:4641:0:2:7627:374e:db74:e353])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id x3QFmS3X004127
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 26 Apr 2019 17:48:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1556293709; bh=f0bKWCwyFKc4XZdGwLx2bpdy6A9OiDxv2OG9BV3zADU=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=Y3t97UHUZvpQhv+kwRaMFBsLrhAxv3D2foiIRR9tthrEoGd7k0bsxt69FWyZ0lQo6
         mI7+iQ1At1XO/4dn6SXS+DnbCBgGN9pIK1+Rvaa2jRmOzCO8uyM8uLh5H6zGQW/3N8
         i2CnCsrA63BtnW+Hshr+lzsf5EM1tXyMmfA/RWUA=
Received: from bjorn by miraculix.mork.no with local (Exim 4.89)
        (envelope-from <bjorn@mork.no>)
        id 1hK35Q-0000Q7-RN; Fri, 26 Apr 2019 17:48:28 +0200
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     David Miller <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        larsm17@gmail.com
Subject: Re: [PATCH net] qmi_wwan: new Wistron, ZTE and D-Link devices
Organization: m
References: <20190424171246.4589-1-bjorn@mork.no>
        <20190426.113130.120149435337896049.davem@davemloft.net>
Date:   Fri, 26 Apr 2019 17:48:28 +0200
In-Reply-To: <20190426.113130.120149435337896049.davem@davemloft.net> (David
        Miller's message of "Fri, 26 Apr 2019 11:31:30 -0400 (EDT)")
Message-ID: <871s1orcmr.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.100.3 at canardo
X-Virus-Status: Clean
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190426154828.hjEfISrHrqgPrDT7kXjgXlT5mB4g1qbEOoC7w7PDMr0@z>

David Miller <davem@davemloft.net> writes:
> From: Bj=C3=B8rn Mork <bjorn@mork.no>
> Date: Wed, 24 Apr 2019 19:12:46 +0200
>
>> Adding device entries found in vendor modified versions of this
>> driver.  Function maps for some of the devices follow:
> ...
>> Reported-by: Lars Melin <larsm17@gmail.com>
>> Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>
>
> Applied, thanks.
>
> Want me to queue this up for -stable too?

Yes, please.  Sorry I forgot to add the tag.


Bj=C3=B8rn
