Return-Path: <SRS0=x550=TC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C6EC43219
	for <linux-usb@archiver.kernel.org>; Thu,  2 May 2019 19:46:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14CDB205F4
	for <linux-usb@archiver.kernel.org>; Thu,  2 May 2019 19:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556826408;
	bh=xK5bZWOIY+4p6HFga9TE/W0ZKphdcwg4d6ApZDjnpk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KKJLLXHxNbwMafi96ez2ZZNdwREEyeUJzWnKRXT+L9NrfIUyity2WpFWf3roIuX0U
	 VvXDFgB3SjKXm0h88vuArYabg/1QOp9wXyzHNgR7v50taCekHZLHRaFNNC0Nhm5FmB
	 TTiNzYeqprptjlNKR23Fi/3fEywSfooiCfGd8FTI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfEBTqr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 2 May 2019 15:46:47 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38906 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBTqr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 May 2019 15:46:47 -0400
Received: by mail-oi1-f193.google.com with SMTP id t70so2702400oif.5;
        Thu, 02 May 2019 12:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ukaD/e1wsPHZwUHYPs4ExgkkIgYCdRZ6nP5LebCyPy8=;
        b=DQND3BzHwLBNbmP5T3WL+7CW+Pf8jCTPHE7eNl2GNmfYBEdjM8wEycHLp80J04vWFB
         uOv6vQvVZ7WNRIePs+E7Ut6YCtNONZ2XU0IqsmT1/4BuF3W/3cdt/3QGFKevXFT0IkYI
         uFTFosKf7/msqBGG5CXRw8Yq78nHz2zcMm8RgPj3icjruYHh3P43/aJ3ouZmMaZ30jIw
         NDlCG+s+YQBCkbKgOFNO7P3v1P1M7W1wt8FLw0CI+b3VXGKhq+XjLcQ7Cp8X+yXCOKP/
         yhVrPrrUBj/q8IzDo8T6AXgmkCUqqFJ0/z2v8Tq8gQ1t9K2+DKSQSkI+Y8cCYsvSL13O
         Cmuw==
X-Gm-Message-State: APjAAAU2crEBGzNvd6SHZL9Gi7HCvQVtl4FFLhro3FZrHTIWkBgF02vX
        d/QAGe+V8Nbzt6xdaf1EQA==
X-Google-Smtp-Source: APXvYqzTtIOd2V14edKEnwXIDHP7nUB9TRcwqMxGmBTCC92ozeHhdBjGJlpAXqibAAn3eR5CtlYwIQ==
X-Received: by 2002:aca:5809:: with SMTP id m9mr3685987oib.88.1556826406198;
        Thu, 02 May 2019 12:46:46 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r65sm85515oif.47.2019.05.02.12.46.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 12:46:45 -0700 (PDT)
Date:   Thu, 2 May 2019 14:46:44 -0500
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
Subject: Re: [PATCH 4/7] doc: dt-binding: usbmisc-imx: add compatible string
 for  imx7ulp
Message-ID: <20190502194644.GA20807@bogus>
References: <20190428024847.5046-1-peter.chen@nxp.com>
 <20190428024847.5046-5-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190428024847.5046-5-peter.chen@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190502194644.ojeg_7nzF01Ql2c8BVuIYjftKWg9CzazPqIQYIEQ4t0@z>

On Sun, 28 Apr 2019 02:51:23 +0000, Peter Chen wrote:
> Add compatible string for imx7ulp
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/usbmisc-imx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
