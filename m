Return-Path: <SRS0=WBK0=DA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BC0C2D0A8
	for <linux-usb@archiver.kernel.org>; Wed, 23 Sep 2020 17:20:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45BF4206E5
	for <linux-usb@archiver.kernel.org>; Wed, 23 Sep 2020 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600881650;
	bh=pYzjYTyEE/U6+o0XDuGep2gsCUUrz3OKDRMmvAf4wBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=oaXRYH0IBsdvFewJ07sV4hcEVkchOHKPaq8gogNb1O2oOfKfsNP4e/rdJGY4NK594
	 RqdwRqrcg2Xt/WgNFojn6AxbhJa5qdQvUlIZJDI5Ir24XDOYouz3c6I3ZhuCsFfr8z
	 +9D1by8ivJi9oq9kze6TkMkNILyjaN3jWikQnG9g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgIWRUt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Sep 2020 13:20:49 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:58923 "EHLO
        forward1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726360AbgIWRUt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Sep 2020 13:20:49 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.nyi.internal (Postfix) with ESMTP id ABD3C1940114;
        Wed, 23 Sep 2020 13:20:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 23 Sep 2020 13:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3PkXBj
        qI6oJdD2+SaZ3zxAqdHTZNvP5tcE+YzyS0eqI=; b=Cwj4aHo5AWKVERJueCJxyY
        /P1aBvMwrvFbMEIRzi5D9ZQJC+jt/30ERlK54e9PL/QsUKoq8ybbCZ29LDLpdtrB
        Bdx87aeeP40+2oKI9+oMlXDqo31f+9SP4k3g4c5iOQgHPuoSsN2dtjcDQl8PJ0ZB
        yktjjn3k9mVzwUxDwRCXK9fe30t35q3kdzHBVVtNn9/oo44xHglSctCM3y69Syhh
        4OtQ54ipvZj0R0HqbVskpS/EBEWZdw3MsUmlfpuNJh4kWZ+uR158J1NzZPr1NjGE
        p1EQXmngDbTxGazuqY3iues02Jy5f5mzN6f0wPUnBrACXeGordpJti4C6D06JBqw
        ==
X-ME-Sender: <xms:74NrX2F8dZai5wAQV2ng2UPHmvOPv15AAgf8MxIcVuiFGYYG4fG0GA>
    <xme:74NrX3U3J635SXxd7K8d4T0R4N234POOMY7B4MvvpiRJj1h-r41ww4ASaAIMIaVML
    XDdJAAwKyZK9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgmffjsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgqeenucggtf
    frrghtthgvrhhnpeetvdelgeffgfdutdelvddvtdetffejtefgveevueeggfellefhveev
    feduueduvdenucfkphepkeefrdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:74NrXwITwoLsrcWmX9vS3AetcgYR2GoIh5Yy_p1L9E8p2nAANKlKZQ>
    <xmx:74NrXwFQcZAPKXDWKkGkUl9_klQKiKYyRH9svuXpoTDb-YucHKzrrA>
    <xmx:74NrX8W6TynoOp-h6zib5z_aeO-g8Mag4Py1WteACG-rIOzemg6f1A>
    <xmx:74NrX3f6x0nvHgB0baXN6Ni39RdYlAWitgZlvl6AyN2lhFAi7z2-gg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 04320328005D;
        Wed, 23 Sep 2020 13:20:46 -0400 (EDT)
Date:   Wed, 23 Sep 2020 19:21:03 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     himadrispandya@gmail.com, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Subject: Re: [RFC] change the new message to provide for memory allocations
Message-ID: <20200923172103.GC3732240@kroah.com>
References: <20200923134348.23862-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923134348.23862-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 23, 2020 at 03:43:34PM +0200, Oliver Neukum wrote:
> Control messages have to work in situtaions where you need to
> use GFP_NOIO. Hence wrappers for them that allocate memory must have
> an API that allows for that.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> 

So you unwind my mess and then fix it back up, nice, no objections from
me, thanks for doing this.

You sent this as "RFC", but it seems sane, want me to take this as-is or
do you want to wait to send a "real" set of patches?

thanks,

greg k-h
