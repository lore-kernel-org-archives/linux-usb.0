Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BB1C433DB
	for <linux-usb@archiver.kernel.org>; Mon,  1 Feb 2021 10:36:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCB7A64DAE
	for <linux-usb@archiver.kernel.org>; Mon,  1 Feb 2021 10:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbhBAKfn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 1 Feb 2021 05:35:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:41896 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232392AbhBAKfl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 05:35:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1612175695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6DWo8lCATPJjkNA+YHuecggimFkY/EbbcxUyph2/vk0=;
        b=ixtJWxlWGJBi2MxcYMECSU4wyBPxCux8urCKinTJAN6NWlfj2fDtjf9YsBuOdgaJJadJbw
        phKMPWQfOGTa9+PE+aVxyZ+e9TvxARi6aJ8dC2e/SARcPBuYYmf/7Sey3eVksoG1WWsulL
        x1p63qWFGPthNzjFLAgpt96cM+gKXmA=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 53A32AD4E;
        Mon,  1 Feb 2021 10:34:55 +0000 (UTC)
Message-ID: <777b051a54acc3892b288969d9b75123fe71448e.camel@suse.com>
Subject: Re: [PATCH] usbnet: fix the indentation of one code snippet
From:   Oliver Neukum <oneukum@suse.com>
To:     Dongliang Mu <mudongliangabcd@gmail.com>, davem@davemloft.net,
        kuba@kernel.org
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 01 Feb 2021 11:34:47 +0100
In-Reply-To: <20210123051102.1091541-1-mudongliangabcd@gmail.com>
References: <20210123051102.1091541-1-mudongliangabcd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Samstag, den 23.01.2021, 13:11 +0800 schrieb Dongliang Mu:
> Every line of code should start with tab (8 characters)
> 
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
Acked-by: Oliver Neukum <oneukum@suse.com>

