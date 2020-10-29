Return-Path: <SRS0=RaDd=EE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BE9C4363A
	for <linux-usb@archiver.kernel.org>; Thu, 29 Oct 2020 14:59:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5DC52072D
	for <linux-usb@archiver.kernel.org>; Thu, 29 Oct 2020 14:59:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgJ2O66 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 29 Oct 2020 10:58:58 -0400
Received: from muru.com ([72.249.23.125]:47154 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727839AbgJ2O66 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 10:58:58 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 599A1807E;
        Thu, 29 Oct 2020 14:59:02 +0000 (UTC)
Date:   Thu, 29 Oct 2020 16:58:53 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, od@zcrc.me,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maarten ter Huurne <maarten@treewalker.org>
Subject: Re: [RESEND PATCH 2/4] usb: musb: Fix NULL check on struct
 musb_request field
Message-ID: <20201029145853.GK5639@atomide.com>
References: <20201027164200.18602-1-paul@crapouillou.net>
 <20201027164200.18602-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027164200.18602-3-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

* Paul Cercueil <paul@crapouillou.net> [201027 16:42]:
> The 'request' variable is a pointer to the 'request' field of the
> struct musb_request 'req' pointer. It only worked until now because
> the 'request' field is the first one in the musb_request structure, but
> as soon as that changes, the check will be invalid.
> 
> Fix it preventively by doing the NULL-check on the 'req' pointer
> instead.

Acked-by: Tony Lindgren <tony@atomide.com>
