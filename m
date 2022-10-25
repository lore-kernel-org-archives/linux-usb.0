Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E98C04A95
	for <linux-usb@archiver.kernel.org>; Tue, 25 Oct 2022 10:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbiJYKbr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 25 Oct 2022 06:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbiJYKbg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Oct 2022 06:31:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CC14F649;
        Tue, 25 Oct 2022 03:31:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A57C9618B3;
        Tue, 25 Oct 2022 10:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB94EC433C1;
        Tue, 25 Oct 2022 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666693895;
        bh=E446pRcH7GKyVPJ9UzZd9TXeoUiY0I704tpa1X7UTDo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OdtkuO1WzR/LDZk5qadjwOVOrBuMBLYEnwjOrfnpOShnlO91FwqMdWthhz+NAuPMo
         5XoQ6D0Bsqx3hPiqzepG/jygx977bUV9i6xlNm8mkheZCmjxoQmYWq8evgoalj7hyl
         TRT3zHi1FEfSmWMmCAgx7i9EmQ7bw/ONK+S4s1IU=
Date:   Tue, 25 Oct 2022 12:32:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     3090101217@zju.edu.cn
Cc:     balbi@kernel.org, bilbao@vt.edu, corbet@lwn.net,
        laurent.pinchart@ideasonboard.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab+huawei@kernel.org, rdunlap@infradead.org,
        Jing Leng <jleng@ambarella.com>
Subject: Re: [PATCH v4] usb: gadget: uvc: add bulk transfer support
Message-ID: <Y1e7OIppZeeEGxSp@kroah.com>
References: <20220513004201.25563-1-3090101217@zju.edu.cn>
 <20221025090501.3290-1-3090101217@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025090501.3290-1-3090101217@zju.edu.cn>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 25, 2022 at 05:05:01PM +0800, 3090101217@zju.edu.cn wrote:
> From: Jing Leng <jleng@ambarella.com>

This email address does not match your From: address on the email, _AND_
that email address does not validate as actually being from that
address.

So this really looks like a "fake" email sent to us.  How can we know
differently?

Please work with your company email admins to fix up their systems so
you can properly send from your domain.  Then we can take your patches.

thanks,

greg k-h
