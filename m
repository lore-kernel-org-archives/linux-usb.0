Return-Path: <SRS0=YZLH=DT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BCBC433DF
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 11:23:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE7652076E
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602501783;
	bh=XgXSNNUMpfUAQPLw1kN/jtl/+9MkscA0E/JrFCWmtO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=u5J8PV9LSdKt8Rcv2hvL6xwd0swb8yfYVoWG6eTWEL/64Dm9R4BOVYcBwsY+jSgLT
	 tg+Q9KOVNv/MK6zH5VFqT0Qn7orHEKEYRpEuq0nDWq+P/v4sUbuDTFJngp/3ZABq7K
	 HnptuXyn5r/iCAd1VSQKDzW/vWJrLukv0hNusLNo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387986AbgJLLW7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 12 Oct 2020 07:22:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387635AbgJLLW7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 07:22:59 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 066962076E;
        Mon, 12 Oct 2020 11:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602501778;
        bh=XgXSNNUMpfUAQPLw1kN/jtl/+9MkscA0E/JrFCWmtO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J2jeq5EuuA733R7WVxWBuQg8YQMeA6prOxrpkJnByNjvBjm7u/BJLd+rOnoGE2N6e
         jDuRDnTeFmWQIM2HV9AMogURh66bOZyro025gWT5ntfScogt8KOXIAaWXVzQfVXisD
         U4Tvb7CXHOyiOBj9nQLUDACPqnOqtOJofmfIcZCI=
Date:   Mon, 12 Oct 2020 13:23:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     rickyniu <rickyniu@google.com>
Cc:     balbi@kernel.org, astrachan@google.com, amit.pundir@linaro.org,
        lockwood@android.com, benoit@android.com, jackp@codeaurora.org,
        vvreddy@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, kyletso@google.com
Subject: Re: [PATCH 3/3] ANDROID: usb: f_accessory: send uevent for 51,52
 requests
Message-ID: <20201012112337.GA356911@kroah.com>
References: <20201012111024.2259162-1-rickyniu@google.com>
 <20201012111024.2259162-4-rickyniu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012111024.2259162-4-rickyniu@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 12, 2020 at 07:10:24PM +0800, rickyniu wrote:
> Add more log between accessory device and host to help debug.
> Send the uevent when the host gets ctrl_request 51 and 52 to user space.
> Let user space know the current connect status.
> 
> Signed-off-by: rickyniu <rickyniu@google.com>

Is this how you sign legal documents?  If so, fine, but no upper case?
If not, please fix this series up and resend.

thanks,

greg k-h
