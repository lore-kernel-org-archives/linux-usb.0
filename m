Return-Path: <SRS0=x550=TC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8917C43219
	for <linux-usb@archiver.kernel.org>; Thu,  2 May 2019 19:46:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86299205F4
	for <linux-usb@archiver.kernel.org>; Thu,  2 May 2019 19:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556826373;
	bh=AnLTBRh4hbl0iF0uymhieWvV4kIR2za92QCA2HQQ4yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=NLw53ncFpWexAxhb9XNSXSIpKmR1FHd3VYktjI8J9FQ9UdvGH6MVBjXdJuMnQhh5U
	 nlt13T58AqrMF7ESJGpRSzG/fzrewP92sBeHRWrMXdhmQCqFH/TPn6zCQUK/jWFng7
	 dBOB4zEj7DrMTG0EGVBpwmYQE8KcWLXSNgJKFL3Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfEBTqM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 2 May 2019 15:46:12 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45856 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBTqM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 May 2019 15:46:12 -0400
Received: by mail-ot1-f67.google.com with SMTP id a10so3196724otl.12;
        Thu, 02 May 2019 12:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1jwmrQ4Ign4Eu4VmWKSM4inkJafWEY/8lvzD6Hu6rBw=;
        b=srmgWaP7bUwW4CJ97AboEdCyHJ3qUIht7wESusD4BZZMqmtjki1mXlq+ishI0PYitX
         FT5Oe/mEClT3Jt5W5D0dj/AochrJV/UiRJ0lXFTSmHlfUT4ysaUvS9y87L54MKkShu6h
         TQlI98mfzM+ceDwpCnW0s4mZZJ+MkJ2daJPcypnIMmSirf2zgeD4oO6ydUHM4V4zB5S0
         sSivcUwittINv8TgOV9LmbfZy/Ymg1AT9O7IXzwlq5ynnsldIg5a3nbxXTuH+Wmz4y6m
         0X+MnLdtaUNfISvC9q+VIFqW5D97iPi/3yxsbHLtvKMsoqUIvFgFtHaFRskY2JyncQGM
         nKOw==
X-Gm-Message-State: APjAAAW4lWwfe3HjRY5jjrVv3TpCKQZhi3Snr+xujJ8eCmLCAWL/dY8f
        Z44fGtxqQY2VxGwGQbWJ+w==
X-Google-Smtp-Source: APXvYqwH+e5sOvu93B5wAZaUHHl7jghJLY2r0xqMCOopei/jf0g2Cyb888C9U37rbI1MYzmfSAZYzg==
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr4132106otn.71.1556826371390;
        Thu, 02 May 2019 12:46:11 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 31sm6169930oto.18.2019.05.02.12.46.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 12:46:10 -0700 (PDT)
Date:   Thu, 2 May 2019 14:46:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 1/7] doc: dt-binding: mxs-usb-phy: add compatible for 7ulp
Message-ID: <20190502194609.GA19646@bogus>
References: <20190428024847.5046-1-peter.chen@nxp.com>
 <20190428024847.5046-2-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190428024847.5046-2-peter.chen@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190502194609.U09M8KWXIXkuk5nOu9AZJgr-fIFBLlRYOZ9hBECZfV8@z>

On Sun, 28 Apr 2019 02:51:13 +0000, Peter Chen wrote:
> Add compatible for 7ulp USB PHY.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  Documentation/devicetree/bindings/phy/mxs-usb-phy.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
