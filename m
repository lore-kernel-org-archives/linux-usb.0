Return-Path: <SRS0=TW+4=EF=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFA7C4741F
	for <linux-usb@archiver.kernel.org>; Fri, 30 Oct 2020 15:44:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E212320936
	for <linux-usb@archiver.kernel.org>; Fri, 30 Oct 2020 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604072672;
	bh=JDEnMmpGHWZVoMMUaKIqF5ZNG7Cpxy19AfHydToiu2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=lmenCckufjjgkRDdsyYR8N4m088IQrtPcrmdZ2RTw6FlUfXwEXIfIvcalo+NgPE8i
	 GJJHak/lAiG/3bWSvD0ATob1a8AO1ci18q+KUogB8T2BAzZ432GdTm7gErtpDpsQGW
	 vmtIUNK58+sixJFP+cvd5+CKyTxdeLw4CAUijMiM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgJ3Pob (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 30 Oct 2020 11:44:31 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39561 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgJ3Poa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Oct 2020 11:44:30 -0400
Received: by mail-lf1-f65.google.com with SMTP id 184so8455975lfd.6
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2020 08:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JDEnMmpGHWZVoMMUaKIqF5ZNG7Cpxy19AfHydToiu2k=;
        b=J7+iV+v+SFllPOzIl2KmjTfhykcd16O16zXcaI/LdLlGRFcd/IzjzIcBJa3Ylf741j
         MASWWKi5ynzA6BrzAMgMEWpBWTaFBl/NuK70766O8ygHa/3JJEfVPw1mIz9JCX7tCcQX
         gtavqlvob8qEqHfbfpkmZTyhzNpgVza3J9ZeiF2vbx8hZzOdvES9Z3OtXlWrBrRqGXsn
         P95ww+SQ7iTejYi+Zt0CKNnLTL2xx67UcnJw9/uNaUS9pkdHN8oaDJ9KNSVUDl46obZh
         3bl9IXIkKc1sogAlkxLK74WsYU+Yg+T6+n6tVse3GhsDnOstB5FninhL+JXFem3mhLcB
         u4aA==
X-Gm-Message-State: AOAM532041bSRpNVqAJnAnSLN+PfnGlX7Q40vWpA7xLN8r1o7b8PsrJD
        90zl8yA5MYhyrg1nexA3WnqB/CPyShCKug==
X-Google-Smtp-Source: ABdhPJz7Yj2VGI2ZgfqFdujfKXWngA4Y7YjumGPzfC0MqFk6kG3NMQx7GImvQyf/CLncJjdNRsiW3A==
X-Received: by 2002:ac2:5e72:: with SMTP id a18mr1127090lfr.343.1604072667400;
        Fri, 30 Oct 2020 08:44:27 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id l16sm670453lfp.250.2020.10.30.08.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 08:44:26 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kYWZr-0004Sc-LO; Fri, 30 Oct 2020 16:44:31 +0100
Date:   Fri, 30 Oct 2020 16:44:31 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Yann GARRAS <yann.garras@y3s.fr>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: creating of the missings constants
 for Telit products
Message-ID: <20201030154431.GM4085@localhost>
References: <20201030153927.20795-1-yann.garras@y3s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030153927.20795-1-yann.garras@y3s.fr>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 30, 2020 at 04:39:27PM +0100, Yann GARRAS wrote:
> Replace hard-coded product id values by constants for Telit Products

The defines don't add anything of value, so I've been trying to move
away from using them. We should probably do the opposite conversion and
ditch the remaining defines at some point instead.

Johan
