Return-Path: <SRS0=Q4mg=VC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA43C5B57D
	for <linux-usb@archiver.kernel.org>; Fri,  5 Jul 2019 05:20:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56D7B218A3
	for <linux-usb@archiver.kernel.org>; Fri,  5 Jul 2019 05:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562304049;
	bh=HA+KJYO57AKbSF4NhY15SbyqCtAeKE1/iTN+Qn9pNzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LGeFwUP8/ses9K53cCzc43X5y8wn6rHeI3K8cwsXgspvQRB1zH3pDrqaZsKn2DJV/
	 kCaERFdPklU16X8ItyzJ/+ka02OUTw/RIQJJHWCtYf7gk4kPvbl6gvTL+wJeaMespo
	 4q+uJvtzLY/t6xG43eVE2he/jPldkprX6pLY+sb0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbfGEFUs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Jul 2019 01:20:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:34414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbfGEFUs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 01:20:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E328218A0;
        Fri,  5 Jul 2019 05:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562304047;
        bh=HA+KJYO57AKbSF4NhY15SbyqCtAeKE1/iTN+Qn9pNzk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rcm4oSoFLEiFcyS1nlqHnT4DeIOI9KTeXX9n+a205eN/A0m1jPe3PX9Vv5MAuxxMt
         4bbpzqjp5+TL0PdsrZ93bVoycOXEqZcjOUCVh5TUxgMjsGxMTYVHZarDVSBW40rPi9
         yMLFCOgUbYfLQ2IdIcMCwcldf94lkQW5YJOO9sgE=
Date:   Fri, 5 Jul 2019 07:20:35 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: chipidea: changes for v5.3-rc1
Message-ID: <20190705052035.GC15821@kroah.com>
References: <AM0PR04MB5314EF9667220C996B5860378BF50@AM0PR04MB5314.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB5314EF9667220C996B5860378BF50@AM0PR04MB5314.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 05, 2019 at 03:32:40AM +0000, Peter Chen wrote:
> The following changes since commit 8ea5b2abd07e2280a332bd9c1a7f4dd15b9b6c13:
> 
>   Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs (2019-05-09 19:35:41 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-ci-v5.3-rc1

Pulled and pushed out, thanks.

greg k-h
