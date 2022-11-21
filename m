Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B6DC433FE
	for <linux-usb@archiver.kernel.org>; Mon, 21 Nov 2022 21:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbiKUVeG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Nov 2022 16:34:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbiKUVdy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 16:33:54 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A962EF5C;
        Mon, 21 Nov 2022 13:33:53 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E45565CC;
        Mon, 21 Nov 2022 21:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E45565CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1669066433; bh=ubC8lLc4vIlF1RDveQOCoM2b/dIY3+5By8hL1AWNshM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=f2polWjiysByCJf45XTIs6+R7jlp0IbGowMac+GkjCYwoVgAOUAGkQLOy3jKuyEUw
         6puLKE3ywJDcFhU2NaHXeoK9+2nooi105RwhL22GUfWb/zSJJaYePAKNY6V6HEcnNX
         l+WIMKFGhgxIvOPuk2ngXIGIdMDy1rKEXv8AKUTiuG+AGwxIa4pUNobHPPm46zo2+q
         IWUk2ohHSk9q+tLLPBihxHg4NdWgdCfsmx81vG+hFOeRcraGnSuHMJ9UUYZ+bPThSn
         purECy9YjKbge8qGoWhtIHs9mjHkdypcLpSDd5c6yP+iok4kukF+DbP0ErMyye2IO4
         p8K85XrkZFK0A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: USB: correct possessive "its" usage
In-Reply-To: <20221118231422.14076-1-rdunlap@infradead.org>
References: <20221118231422.14076-1-rdunlap@infradead.org>
Date:   Mon, 21 Nov 2022 14:33:52 -0700
Message-ID: <87sfic801r.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Correct uses of "it's" to possessive "its" or "its" to "it's" as needed.
> Correct associated grammar in one location.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> ---
> v2: use "his" instead of "its" in CREDITS (Alan)
>     Also correct one use of "its" to "it's".
>
>  Documentation/usb/CREDITS          |    6 +++---
>  Documentation/usb/functionfs.rst   |    2 +-
>  Documentation/usb/gadget_multi.rst |    2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

jon
