Return-Path: <SRS0=qLpr=EG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58658C388F9
	for <linux-usb@archiver.kernel.org>; Sat, 31 Oct 2020 21:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F46A206E5
	for <linux-usb@archiver.kernel.org>; Sat, 31 Oct 2020 21:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604178724;
	bh=/n7GcZkKh2Cn3Xja7buA2Kw26IBBbLvl3qnt/m9wt7c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=XJh1PbO2Ci29M+wEV1nFj2LnVT5xGO9TFyqYsOKlEWtfNrsMxmrwoIrkCcIrKMHi4
	 o28yPDXbOYlMSL4UMQ7JV6mua2oiaAGch7cZ2IvHTe7BQU7KcOxm/txD7+xxdc5GRo
	 bZiCoG8ZaqHVSAZ7wI+Le60QiuXUEt3lbX9+L2ko=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgJaVLo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 31 Oct 2020 17:11:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:54390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726254AbgJaVLo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 31 Oct 2020 17:11:44 -0400
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (c-67-180-217-166.hsd1.ca.comcast.net [67.180.217.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C736F206E3;
        Sat, 31 Oct 2020 21:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604178704;
        bh=/n7GcZkKh2Cn3Xja7buA2Kw26IBBbLvl3qnt/m9wt7c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UTJ4kkt1ZrXqAU7w2+a49fGppyIzhPa80qudwSIYiHTyjDgHCCsdKtlAlcDHQh19T
         GW5VENjJuQsLLOzLVv/ZhOdEc64GLbWVxUELEFYMaRgHSSYnOHyKjGublbk6xYtwBt
         XeIPxSukF1X3I0GXMu6GzwMyFbKx+kDj9cglA93U=
Date:   Sat, 31 Oct 2020 14:11:43 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Anant Thazhemadam <anant.thazhemadam@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] net: usb: usbnet: update __usbnet_{read|write}_cmd()
 to use new API
Message-ID: <20201031141143.5c8463e1@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201029132256.11793-1-anant.thazhemadam@gmail.com>
References: <20201010065623.10189-1-anant.thazhemadam@gmail.com>
        <20201029132256.11793-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 29 Oct 2020 18:52:56 +0530 Anant Thazhemadam wrote:
> +	return usb_control_msg_recv(dev->udev, 0,
> +			      cmd, reqtype, value, index, data, size,
> +			      USB_CTRL_GET_TIMEOUT, GFP_KERNEL);

Please align continuation lines after the opening bracket.
