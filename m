Return-Path: <SRS0=knN7=7Y=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB5FC433E0
	for <linux-usb@archiver.kernel.org>; Thu, 11 Jun 2020 22:35:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AE46206D7
	for <linux-usb@archiver.kernel.org>; Thu, 11 Jun 2020 22:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591914907;
	bh=gwbad36ci73nUilrGtt6jC6dYf8PIdwF48yaLdcVXm8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=0drhcf0dw/Eork56VDnimiltZO7qv5oLQ3r3lvxn2UwLN5LxN/C3PhoOvirnNig2o
	 SxMgWhFi2zjjnni3T8vw6aRCsjvXuOEb3smD6+SlphapXNwR5srWL5kNQY5VK2IcRZ
	 yvzqaBKHqwqDFHjPxI5qIAGDTRdNXWwZ4OWEKCbQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgFKWfD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Jun 2020 18:35:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:49166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbgFKWfD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jun 2020 18:35:03 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CD4762073E;
        Thu, 11 Jun 2020 22:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591914902;
        bh=gwbad36ci73nUilrGtt6jC6dYf8PIdwF48yaLdcVXm8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Od59i5ICuZ4toyiQOI1JXBRQzVaVaND+HwYd3buOOvnvaOaavpq1w51ldk/V8R2Cf
         liE/wpp7P4a2Yjvj/RNO+eC6t30ey6qGpxtlDMLRxY2A7Ipi1KxZ1aA2otP71FZO4i
         TerIPB4Qwd8OZdFbb7fICHsiRbF9mHGTbNxd7nUU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200611194738.1480393-1-robh@kernel.org>
References: <20200611194738.1480393-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Remove redundant 'maxItems'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Anson Huang <Anson.Huang@nxp.com>, linux-clk@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Date:   Thu, 11 Jun 2020 15:35:02 -0700
Message-ID: <159191490219.242598.961023303796459910@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Rob Herring (2020-06-11 12:47:38)
> There's no need to specify 'maxItems' with the same value as the number
> of entries in 'items'. A meta-schema update will catch future cases.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Anson Huang <Anson.Huang@nxp.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-pwm@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org> # clk
