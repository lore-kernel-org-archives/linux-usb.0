Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59988C433E1
	for <linux-usb@archiver.kernel.org>; Tue, 23 Mar 2021 12:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0919F619C5
	for <linux-usb@archiver.kernel.org>; Tue, 23 Mar 2021 12:11:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhCWMKl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Mar 2021 08:10:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231311AbhCWMK1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 08:10:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B39B261974;
        Tue, 23 Mar 2021 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616501426;
        bh=IUmPwQSntL+a4RECUURdxb9RWWyu7oNPHfxpcTmX8/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zDAWhbVqw073SI9mc+Ok3/HheShYVB5LxiOkdecY9yUU6Rr/Gh3m0PAD4kMG/DGaS
         wmm9c9wNyiNaLynSPJMQkyW7En8KPVXhXnOSrjJyIZ2LtcNo57edO7gAaN72eBYn+s
         ekywlS9W+odJKog2bT6c+ej6miEyMmK/qtIe1Tzw=
Date:   Tue, 23 Mar 2021 13:10:23 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v5 1/4] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YFnary7nLGoS7zSn@kroah.com>
References: <1616434280-32635-1-git-send-email-sanm@codeaurora.org>
 <1616434280-32635-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616434280-32635-2-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 22, 2021 at 11:01:17PM +0530, Sandeep Maheswaram wrote:
> Avoiding phy powerdown when wakeup capable devices are connected.

That says "what" (in a very abbreviated way), but not _WHY_ you want to
do this.  Please fix this up.

thanks,

greg k-h
