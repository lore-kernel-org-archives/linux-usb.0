Return-Path: <SRS0=dHoi=YR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EDECA9EBB
	for <linux-usb@archiver.kernel.org>; Thu, 24 Oct 2019 07:57:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77EDC2084C
	for <linux-usb@archiver.kernel.org>; Thu, 24 Oct 2019 07:57:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="bzZWVk1x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408772AbfJXH5F (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 24 Oct 2019 03:57:05 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38395 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408769AbfJXH5F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 03:57:05 -0400
Received: by mail-lf1-f68.google.com with SMTP id q28so15059076lfa.5
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2019 00:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k3oPwwXbd7aVpRc6mBG49c0derbL+ABsS83WbajBnnw=;
        b=bzZWVk1xf3C9Ge+H3fkjakaR/mYMcxx2L27X/iVa2ADAj8YO0NmKGyQENunfk67bSo
         A/Im4Lh6qWQl5euFpS1xIDgwzN1hBwLC6m3nD4Ra9JQaXHtEY8zHvRjrexwE3tFOS4QE
         zrI7roAbGySgX/PGnKZNHY7qZ6M6BwFbTLwec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k3oPwwXbd7aVpRc6mBG49c0derbL+ABsS83WbajBnnw=;
        b=uPDUniUayemiavQpfTHPFwylUfz5JIdDQClJ9VZte5vqlyODMRGLYYv30aihYorFQT
         k1YCfGsbaT8pLiiILJAii11R4Nuredo3ab4RH0/jfz/24kJzKjlodYmlRdzySUH7dv+r
         U5d8PsBe3w05oIfoLfyCO9GnA3yNdd2Liprfkqe6Rj5FV2MXydflqKONXieRAsAM9FTK
         rtG6Cmj6SvlrX1JgAM7pP+gcq2pRmgcHmpS5wTGr0YiHT77TE14ul8R+FjLNpWvT5lwL
         SnanKUq02MPGnb6KnyxEYWNGixhKipzwyTSk7ygWN4ZKfPcnOghdMSSKYI02dfObEyuJ
         CLsg==
X-Gm-Message-State: APjAAAUL5APmxPpL6Cj2lhUVdbixRTqHqIbOOQkEok/2OI61i9mrdWXi
        T+D7k58CDExie2Gb76LTQd6Avw==
X-Google-Smtp-Source: APXvYqyDWxfhIyP/h3s0Oi6ErhsqhkZHAZBagsFf5qH/cpxvtKTTFtgwYnDOPtqZTw3woyGFBLgpuw==
X-Received: by 2002:ac2:5ec2:: with SMTP id d2mr9235070lfq.112.1571903822235;
        Thu, 24 Oct 2019 00:57:02 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id e8sm8739712ljf.1.2019.10.24.00.57.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 00:57:01 -0700 (PDT)
Subject: Re: [PATCH v4] string-choice: add yesno(), onoff(),
 enableddisabled(), plural() helpers
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jani Nikula <jani.nikula@intel.com>
Cc:     linux-kernel@vger.kernel.org,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        intel-gfx@lists.freedesktop.org,
        Vishal Kulkarni <vishal@chelsio.com>, netdev@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
References: <20191023131308.9420-1-jani.nikula@intel.com>
 <20191023155619.43e0013f0c8c673a5c508c1e@linux-foundation.org>
 <18589470-c428-f4c8-6e3e-c8cfed3ad6e0@rasmusvillemoes.dk>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <26bc9c97-363b-2a07-8338-e3fdc576ce68@rasmusvillemoes.dk>
Date:   Thu, 24 Oct 2019 09:57:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <18589470-c428-f4c8-6e3e-c8cfed3ad6e0@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24/10/2019 09.40, Rasmus Villemoes wrote:

> column. Maybe your compiler doesn't do string literal merging (since the
> linker does it anyway), so your .rodata.str1.1 might contain several
> copies of "yes" and "no", but they shouldn't really be counted.

Sorry, that's of course nonsense - the strings only appear once in the
TU (inside the static inline function), so gcc must treat them all as
the same object - as opposed to the case where the implementation was

#define yesno(x) ((x) ? "yes" : "no")

So that can't explain why you saw a smaller text segment using the OOL
version.

Rasmus
