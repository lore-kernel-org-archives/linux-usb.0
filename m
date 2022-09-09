Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DDCECAAA1
	for <linux-usb@archiver.kernel.org>; Fri,  9 Sep 2022 05:27:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbiIIF16 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 9 Sep 2022 01:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiIIF15 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Sep 2022 01:27:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45DD125B0A;
        Thu,  8 Sep 2022 22:27:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 883BC61E8F;
        Fri,  9 Sep 2022 05:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A25EC433D6;
        Fri,  9 Sep 2022 05:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662701276;
        bh=aJi6kD7CroSMwq0qBAS7SzFUnHhyRakwLscMPvg06Bs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kRawzbBkowL+S5NLoA0/VB/FSmoFW2l88GlR08PRUL2IieiPt67uQXKrLFlnQHhrQ
         KTgFOmQdfi5x3FndeGMT49A9p7Oyx9+OIBOml3AAHgt6XyKlaDoIm0hW0YZ2osSgWW
         CnGFSqs/Ju0rCRaKcH+N2vQHPbOMub6vzmN2LAHg=
Date:   Fri, 9 Sep 2022 07:27:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Li Zhong <floridsleeves@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        heghedus.razvan@gmail.com, evgreen@chromium.org,
        yuanjilin@cdjrlc.com, stern@rowland.harvard.edu,
        jj251510319013@gmail.com
Subject: Re: [PATCH v1] drivers/usb/core/driver: check return value of
 usb_set_interface()
Message-ID: <YxrO2Wji2UJJs/eg@kroah.com>
References: <20220909044215.2620024-1-floridsleeves@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909044215.2620024-1-floridsleeves@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 08, 2022 at 09:42:14PM -0700, Li Zhong wrote:
> This flaw was found using an experimental static analysis tool we are
> developing. Report warnings when the function usb_set_interface() fails
> can increase the dianosability.

Please read Documentation/process/researcher-guidelines.rst for how to
properly submit such things.  Until that is followed, we can not accept
stuff from you, sorry.

greg k-h
