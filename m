Return-Path: <SRS0=j0NE=XV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B393EC432C2
	for <linux-usb@archiver.kernel.org>; Thu, 26 Sep 2019 09:17:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81A16222C5
	for <linux-usb@archiver.kernel.org>; Thu, 26 Sep 2019 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569489467;
	bh=0u6rrDRUIsJUjxZzWMSPecOLQLJ1MnJXdNIrR7lLXrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=N37GQdQAMMhhFTvYp/6D/CUHVM0LPbiDQdMGnsnVxmHRtznV583zC9F2ow9qgmc5R
	 /FI9nqryBjc+j31+kNPOcFzBnORdOJoLYdD6zxvbh4rCY61Z12V7WhD73BJZ6kc4cG
	 vMh4vlg1FVpyFXmHa1bfO+afyt+CuoaCfDITwLhk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730348AbfIZJRr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Sep 2019 05:17:47 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43175 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730335AbfIZJRq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 05:17:46 -0400
Received: by mail-lj1-f196.google.com with SMTP id n14so1358482ljj.10
        for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2019 02:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0u6rrDRUIsJUjxZzWMSPecOLQLJ1MnJXdNIrR7lLXrQ=;
        b=f9K0vEzjO5SNk4LXtTrwI3wbY6O3IRCqocM7KSEo4wcITCJe46dQbDoscE60lEoQ0a
         lVffirN4ODimAtYxOsMfP/Nx/Petq+OeSnaPePK5N3Gw6mwI8QznCRzCVA4L22fAG/py
         laMC51hM9H0792psoTDeZyMhquCFk6MPDHEN14vUz265G+xqdNElo+Ki6/imryeHLGqF
         uoe+GmtzsDIAOSeiJ2eaBE49ltg9/WbQ0Gt4SKIUhLgkD09s9UG8ltsYICai4xK+9AL9
         rhTX8SX0ZSbly5GmjDIQSwQwk/62g7sHZaKWA+cpQAzt6LZfVye+6fF8K00fbylFK1p0
         qX1Q==
X-Gm-Message-State: APjAAAVxFvVCgZ9w76oHgm02ymKSeurOG4G4WhyJhv8Bn1aBpJ3ZuXBi
        oIhrUmD8CsraJxrmCnxCE4CdNaV9
X-Google-Smtp-Source: APXvYqwIArtIS2M82ResGuQ2BAmpiA207SHW4kfZEGqZvseuS9QNkoxWOdFvHjPx79jvzHNEswsewQ==
X-Received: by 2002:a2e:1246:: with SMTP id t67mr1875615lje.174.1569489464989;
        Thu, 26 Sep 2019 02:17:44 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id 4sm376750ljv.87.2019.09.26.02.17.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 02:17:44 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iDPuI-0006XX-Ba; Thu, 26 Sep 2019 11:17:50 +0200
Date:   Thu, 26 Sep 2019 11:17:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/4] USB: usblcd: disconnect fix and locking clean ups
Message-ID: <20190926091750.GJ14159@localhost>
References: <20190926091228.24634-1-johan@kernel.org>
 <20190926091228.24634-6-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190926091228.24634-6-johan@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 26, 2019 at 11:12:24AM +0200, Johan Hovold wrote:
> This series fixes a failure to stop I/O on disconnect() in the usblcd
> driver. Turns out there was a lot of legacy cruft in this driver which
> could simply be removed.

My apologies for the double post.

Johan
