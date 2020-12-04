Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FDFC433FE
	for <linux-usb@archiver.kernel.org>; Fri,  4 Dec 2020 09:47:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 658C8227BF
	for <linux-usb@archiver.kernel.org>; Fri,  4 Dec 2020 09:47:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387543AbgLDJrh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 4 Dec 2020 04:47:37 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:54559 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgLDJrh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 04:47:37 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 59ED0FF811;
        Fri,  4 Dec 2020 09:46:55 +0000 (UTC)
Message-ID: <9d9568fe9e1d5c00eab345c212ad0fa8cbcbc350.camel@hadess.net>
Subject: Re: [PATCH] USB: apple-mfi-fastcharge: Fix use after free in probe
From:   Bastien Nocera <hadess@hadess.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Lucas Tanure <tanure@linux.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Date:   Fri, 04 Dec 2020 10:46:54 +0100
In-Reply-To: <X8ik4j8yJitVUyfU@mwanda>
References: <X8ik4j8yJitVUyfU@mwanda>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-12-03 at 11:42 +0300, Dan Carpenter wrote:
> This code frees "mfi" and then derefences it on the next line to get
> the error code.
> 
> Fixes: b0eec52fbe63 ("USB: apple-mfi-fastcharge: Fix kfree after
> failed kzalloc")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for catching that.

Reviewed-by: Bastien Nocera <hadess@hadess.net>

