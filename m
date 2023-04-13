Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5357C77B61
	for <linux-usb@archiver.kernel.org>; Thu, 13 Apr 2023 13:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjDMNqf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 Apr 2023 09:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjDMNqa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 09:46:30 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0425993
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 06:46:27 -0700 (PDT)
Received: (qmail 254603 invoked by uid 1000); 13 Apr 2023 09:46:26 -0400
Date:   Thu, 13 Apr 2023 09:46:26 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     qianfan <qianfanguijin@163.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Bin Liu <b-liu@ti.com>
Subject: Re: BUG: linux 5.15.0 hang on usb_wwan_indat_callback
Message-ID: <9a64f19c-c8c6-4e42-b226-717b1983693b@rowland.harvard.edu>
References: <580d8541-1eca-e7b1-ccf5-66eda3e88761@163.com>
 <2023041257-campfire-squeamish-75a4@gregkh>
 <de92552a-3148-03c0-5b4b-94040d8d7969@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de92552a-3148-03c0-5b4b-94040d8d7969@163.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 13, 2023 at 12:50:12PM +0800, qianfan wrote:
> The resubmit logic in usb_wwan_indat_callback semms need improve:
> 
> if (status) {
>     dev_dbg(dev, "%s: nonzero status: %d on endpoint %02x.\n",
>         __func__, status, endpoint);
> 
>     /* don't resubmit on fatal errors */
>     if (status == -ESHUTDOWN || status == -ENOENT)
>         return;
> }
> 
> maybe this patch is better?
> 
> switch (status) {
> case -ESHOTDOWN:
> case -ENOENT:
> case -ECONNRESET:
> case -EOVERFLOW:
> case -EPROTO:
>     reutrn;
> }

In fact, it would be better to treat any error you don't recognize as a 
fatal error.

Alan Stern
