Return-Path: <SRS0=W/rD=DC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA29FC4363D
	for <linux-usb@archiver.kernel.org>; Fri, 25 Sep 2020 16:05:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57DB920702
	for <linux-usb@archiver.kernel.org>; Fri, 25 Sep 2020 16:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nucleusys.com header.i=@nucleusys.com header.b="rjRLkX6U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbgIYQFj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 25 Sep 2020 12:05:39 -0400
Received: from lan.nucleusys.com ([92.247.61.126]:33482 "EHLO
        zztop.nucleusys.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727151AbgIYQFj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 12:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=nucleusys.com; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZggEUJLaBIkbKzlcInEoNerQZx3vpTsJWg5G6+7d+Es=; b=rjRLkX6ULJ2aP2WAPEjDr3bAWs
        KpxzHgTEgx8RCedk6RijGEO+MKlYGmzbY2Ge7n4keXGUYetyKWLpTyzvBMO6n8SSCQQzZbcoKAFMr
        0FFcHie8UDndtnhZUqAEwD4l9VuzXUIpj62LE91BKhO9GL98keWfqF730+ybu3JnuQV4=;
Received: from [94.26.108.4] (helo=carbon.lan)
        by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <petkan@nucleusys.com>)
        id 1kLqE4-00025X-EJ; Fri, 25 Sep 2020 19:05:36 +0300
Date:   Fri, 25 Sep 2020 19:05:37 +0300
From:   Petko Manolov <petkan@nucleusys.com>
To:     Greg KH <gregKH@linuxfoundation.org>
Cc:     oneukum@suse.com, linux-usb@vger.kernel.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: Re: [PATCH 1/2] net: pegasus: convert control messages to the new
 send/recv scheme.
Message-ID: <20200925160537.GA2128@carbon.lan>
References: <20200923134348.23862-9-oneukum@suse.com>
 <20200925093124.22483-1-petkan@nucleusys.com>
 <20200925093124.22483-2-petkan@nucleusys.com>
 <20200925143730.GA3111407@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925143730.GA3111407@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-09-25 16:37:30, Greg KH wrote:
> On Fri, Sep 25, 2020 at 12:31:23PM +0300, Petko Manolov wrote:
> > From: Petko Manolov <petko.manolov@konsulko.com>
> > 
> > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> 
> I really do not like to take patches without any changelog text at all
> :(
> 
> Can you fix this up?

I am sorry about this.  Hope v2 is better.


cheers,
Petko
